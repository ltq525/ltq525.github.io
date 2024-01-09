# Thrift匹配机制
[Thrift官网](https://thrift.apache.org/)

## 创建thrift文件
```
mkdir match.thrift
```
编辑文件
``` cpp
namespace py match_service

service Match {
    i32 add_player(1: i32 score, 2: string uuid, 3: string username, 4: string photo, 5: string channel_name),
}
```

## 根据thrift文件创建代码
```
thrift --gen py match.thrift
```
修改gen-py -> match_server  
在match_server下创建main.py文件  
在官网channel教程里复制py server代码 <https://thrift.apache.org/tutorial/py.html>

编辑匹配系统的server服务
``` py
#! /usr/bin/env python3

import glob
import sys

# 引入项目的位置
sys.path.insert(0, glob.glob('../../')[0])

from match_server.match_service import Match

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

from queue import Queue
from time import sleep
from threading import Thread

from app.asgi import channel_layer
# 将并行线程，变成串行线程
from asgiref.sync import async_to_sync
from django.core.cache import cache

queue = Queue() # 消息队列

class Player:
    def __init__(self, score, uuid, username, photo, channel_name):
        self.score = score
        self.uuid = uuid
        self.username = username
        self.photo = photo
        self.channel_name = channel_name
        self.waiting_time = 0 # 等待时间

class Pool:
    def __init__(self):
        self.players = []

    def add_player(self, player):
        self.players.append(player)

    def check_match(self, a, b):
        dt = abs(a.score - b.score)
        a_max_dif = a.waiting_time * 50
        b_max_dif = b.waiting_time * 50
        return dt <= a_max_dif and dt <= b_max_dif

    def match_success(self, ps):
        print("Success: %s %s %s" % (ps[0].username, ps[1].username, ps[2].username))
        room_name = "room_%s_%s_%s" % (ps[0].uuid, ps[1].uuid, ps[2].uuid)
        players = []
        for p in ps:
            # 加入群连接
            async_to_sync(channel_layer.group_add)(room_name, p.channel_name)

            players.append({
                'uuid': p.uuid,
                'username': p.username,
                'photo': p.photo,
                'hp': 100,
            })

        cache.set(room_name, players, 3600) # 有效期1小时

        for p in ps:
            async_to_sync(channel_layer.group_send) (
                room_name, 
                {
                    'type': "group_send_event",
                    'event': "create_player",
                    'uuid': p.uuid,
                    'username': p.username,
                    'photo': p.photo,
                }
            )

    def increase_waiting_time(self):
        for player in self.players:
            player.waiting_time += 1

    def match(self):
        while len(self.players) >= 3:
            self.player = sorted(self.players, key=lambda p: p.score)
            flag = False
            for i in range(len(self.players) - 2):
                a, b, c = self.players[i], self.players[i + 1], self.players[i + 2]
                if self.check_match(a, b) and self.check_match(a, c) and self.check_match(b, c):
                    self.match_success([a, b, c])
                    self.players = self.players[:i] + self.players[i + 3:]
                    flag = True
                    break
            if not flag:
                break
        
        self.increase_waiting_time()

class MatchHandler:
    def add_player(self, score, uuid, username, photo, channel_name):
        print("Add player: %s %d" % (username, score))
        player = Player(score, uuid, username, photo, channel_name)
        queue.put(player)
        return 0

def get_player_from_queue():
    try:
        return queue.get_nowait()
    except:
        # 有空异常返回None
        return None

def worker():
    pool = Pool()

    while True:
        player = get_player_from_queue()
        if player:
            pool.add_player(player)
        else:
            pool.match()
            sleep(1)

if __name__ == '__main__':
    handler = MatchHandler()
    processor = Match.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    # 单线程服务
    # server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)

    # You could do one of these for a multithreaded server

    # 不限制多线程
    server = TServer.TThreadedServer(
        processor, transport, tfactory, pfactory)

    # 线程池，先预开，超过数量阻塞
    # server = TServer.TThreadPoolServer(
    #     processor, transport, tfactory, pfactory)

    Thread(target=worker, daemon=True).start()

    print('Starting the server...')
    server.serve()
    print('done.')
```

编辑匹配系统的client服务
``` py
from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

# import thrift生成的Match.py文件
from match_system.src.match_server.match_service import Match
from game.models.player.player import Player
from channels.db import database_sync_to_async

class MultiPlayer(AsyncWebsocketConsumer):
    
    async def create_player(self, data):

        self.room_name = None
        self.uuid = data['uuid']

        # Make socket
        transport = TSocket.TSocket('127.0.0.1', 9090)

        # Buffering is critical. Raw sockets are very slow
        transport = TTransport.TBufferedTransport(transport)

        # Wrap in a protocol
        protocol = TBinaryProtocol.TBinaryProtocol(transport)

        # Create a client to use the protocol encoder

        # 修改成自己import的
        client = Match.Client(protocol)

        def db_get_player():
            return Player.objects.get(user__username=data['username'])

        player = await database_sync_to_async(db_get_player)()

        # Connect!
        transport.open()

        # 这句话定向到server端的class MatchHandler: -> def add_player():
        client.add_player(player.score, data['uuid'], data['username'], data['photo'], self.channel_name)
        
        # Close!
        transport.close()

```

## 配置环境

在django项目中asgi.py中添加以下代码，作用是在server端能调用client端的函数, 实现进程间的通信
```
# 设置环境
django.setup()

# 实现外部调用内部channels函数
from channels.layers import get_channel_layer
channel_layer = get_channel_layer
```

## 设置默认战斗力
更新数据库，添加战斗力模块
修改game -> migrations -> models -> player -> player.py文件
``` py
from django.db import models
from django.contrib.auth.models import User

# 更新数据库存储
class Player(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE) # 级联删除
    photo = models.URLField(max_length = 256, blank = True)
    openid = models.CharField(default = "", max_length=50, blank=True, null=True)
    # 添加score模块
    score = models.IntegerField(default=150)
    def __str__(self):
        return str(self.user)

# 修改后运行以下命令
# python3 manage.py makemigrations
# python3 manage.py migrate
```