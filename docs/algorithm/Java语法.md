# Java 语法

## 基本模板
``` java
import java.io.*; // 输入输出流数据包
import java.util.*; // Collection: Queue, List, Map, Stack, Set容器数据包
import java.lang.*; // Integer包装数据类型数据包
import java.math.*; // 数学函数数据包
    
public class Main {

    Scanner sin = new Scanner(System.in);
    BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
    StreamTokenizer cin = new StreamTokenizer(in);
    PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));
    
    final int N = 100010, mod = (int)(1e9+7), inf = 0x3f3f3f3f;
    
    int nextInt() throws Exception {
        cin.nextToken();
        return (int) cin.nval;
    }
    
    void solve() throws Exception {
        
        
        
    }

    public static void main(String[] args) throws Exception {
        Main cmd = new Main();
        cmd.solve();
        cmd.cout.close();
    }
}
```

### `static`值与`非static`值之间的关系
在`static`里不能直接调用`非static`的值，若要调用非`static`的值只能通过某个实例对象来调用  

**理解**：`static`类似于**公交车**，`非static`表示**个人自行车**   
**个人自行车**只能某个人来使用   
在**公交车**里不能骑**自行车**，而有**自行车**的可以乘**公交车**   

**总结**:   
`非static` —> `static`、`非static`  
`static` !-> `非static` 但 `static` -> `static`  


## 三种输入方式
1. `Scanner sin = new Scanner(System.in);`  

    * `System.in `为字节流输入  
    * `Scanner` 和 `System.out.print`在处理大数据输入时效率较低

2. `BufferedReader in = new BufferedReader(new InputStreamReader(System.in));`  

    * `System.in` 字节输入流
    * `new InputStreamReader` 将 字节流 转换为 字符流
    * `new BufferedReader` 将字符流放入字符流缓冲区之中

    * `in.read()` ：读取单个字符 Integer.parseInt(in.readLine()) 配合强转使用  
    * `in.readLine()` ：读取一行字符包括空格Integer.parseInt(in.readLine())

3. `StreamTokenizer cin = new StreamTokenizer(in);`

    * `cin.sval` 读取`String`类型字母与跟随字母后的数字，空格隔断，无法读取符号与开头数字。
    * `cin.nval` 读取`Double`类型数字 `(type)cin.nval`进行类型转换

**2与3适合大量读入数据, 效率较高, 但不能2和3同时在程序中使用**

## 输出方式
1. `System.out.println()`
2. `PrintWriter cout = new PrintWriter(new OutputStreamWriter(System.out));`  

    * cout.print()  
    * cout.println()  
    * cout.printf()  
    **三种输出方式，用法与Java标准输出一致**

## BigInteger
### 初始化
1. 
``` java
BigInteger a = new BigInteger(in.readLine());
BigInteger a = new BigInteger("12345678910"); // 默认十进制
cout.print(a)   // 12345678910
```
2. 
```java
BigInteger b = new BigInteger("1E", 16); // 16进制
cout.print(b)   // 30
```

### API

**基本运算**  

函数|功能|
:-:|:-:|
`abs()`|	返回 `this` 的绝对值  |
`negate()`|	返回 `-this`  |
`add(BigInteger val)`|	返回 `this + val`  |
`subtract(BigInteger val)`|	返回 `this - val`  |
`multiply(BigInteger val)`|	返回 `this * val`  |
`divide(BigInteger val)`|	返回 `this / val`  |
`remainder(BigInteger val)`|	返回 `this % val`  |
`mod(BigInteger val)`|	返回 `this mod val`  |
`pow(int e)`|	返回 `this^e`  |
`and(BigInteger val)`|	返回 `this & val`  |
`or(BigInteger val)`|	返回 `this | val`  |
`not()`|	返回 `~this`  |
`xor(BigInteger val)`|	返回 `this ^ val`  |
`shiftLeft(int n)`|	返回 `this << n` |
`shiftRight(int n)`|	返回 `this >> n`   |
`max(BigInteger val)`|	返回 `this` 与 `val` 的较大值  |
`min(BigInteger val)`|	返回 `this` 与 `val` 的较小值  |
`bitCount()`|	返回 `this` 的二进制中不包括符号位的 1 的个数  |
`bitLength()	`|返回 `this` 的二进制中不包括符号位的长度  |
`getLowestSetBit()`|	返回 `this` 的二进制中最右边的位置  |
`compareTo(BigInteger val)`|	比较 `this` 和 `val` 值大小  |
`toString()`|	返回 `this` 的 `10` 进制的字符串  |
`toString(int radix)`|	返回 `this` 的 `raidx` 进制的字符串  |

**数学运算**    

函数|功能|
:-:|:-:|
 `gcd(BigInteger val)`|	返回 `this` 的绝对值与 `val` 的绝对值的最大公约数  |
`isProbablePrime(int val)`|	返回一个表示 `this` 是否是素数的布尔值  |
`nextProbablePrime()`	|返回第一个大于 `this` 的素数  |
`modPow(BigInteger b, BigInteger p)`	|返回 `this ^ b mod p  `|
`modInverse(BigInteger p)`|	返回 `a mod p` 的乘法逆元  |

## 基本数据类型与包装数据类型

基本数据类型|包装数据类型|
:-: | :-: |
byte	|Byte|
short	|Short|
boolean	|Boolean|
char	|Character|
int|	Integer|
long|	Long|
float|	Float|
double|	Double|

## lambda表达式
> **`->`** 是一个推导符号，表示前面的括号接收到参数，推导后面的返回值，一般只能用于包装数据类型

* **常用形式**
```
// 1. 不需要参数，返回值为 5
() -> 5

// 2. 接收一个参数（数字类型），返回其 2 倍的值
x -> 2 * x

// 3. 接受 2 个参数（数字）并返回他们的差值
(x, y) -> x – y

// 4. 接收 2 个 int 类型整数并返回他们的和
(int x, int y) -> x + y

// 5. 接受一个 String 对象并在控制台打印，不返回任何值（看起来像是返回 void）
(String s) -> System.out.print(s)
```

**比较规则机制 x - y 为升序，y - x 为降序**

* **自定义`sort`**
``` java
Arrays.sort(a, 1, 1 + n, (x, y) -> {
    if(x.a != y.a)
        return x.a - y.a;
    else 
        return x.b - y.b;
});
```

* **自定义`priority`**
``` java
Queue<Integer> q2 = new PriorityQueue<>((x, y) -> {return y - x;}); // 大根堆
```

## Arrays
1. `Arrays.sort()` 
排序数组默认升序  

**排序规则机制, x - y 为升序, y - x 为降序**  

* `interface`接口`Comparator`自定义排序  
``` java
class node{
    int a, b, c;
    node(int a, int b, int c){
        this.a = a;
        this.b = b;
        this.c = c;
    }
}

class cmp implements Comparator<node>{
    public int compare(node x, node y){
        if(x.a != y.a)
            return x.a - y.a;
        else 
        {
            if(x.b != y.b)
                return x.b - y.b;
            else return x.c - y.c;
        }
    }
}

Arrays.sort(a, 1, 1 + n, new cmp());
```

* `lambda`表达式自定义排序  
``` java
Arrays.sort(a, 1, 1 + n, (x, y) -> {
    if(x.a != y.a)
            return x.a - y.a;
    else 
    {
        if(x.b != y.b)
            return x.b - y.b;
        else return x.c - y.c;
    }
});
```

## String

1. `String`: 不可变字符串  
```
string x;
```
2. `StringBuilder`: 可变字符串、效率高、线程不安全(单线程)  
``` 
StringBuilder s = new StringBuilder();  
```

3. `StringBuffer`: 可变字符串、效率低、线程安全(多线程)  
```
StringBuffer s = new StringBuffer();  
```

**String API**   

函数|功能|
:-:|:-:|
`length(): int` |返回长度  |
`CharAt(int index): char` |返回index索引的字符  |
`x.compareTo(y): int` |`x > y` 返回1, `x == y` 返回0, `x < y` 返回-1, 按字典序比较  |
`equals(): boolean` |比较两个字符串是否相等 相等返回`true`, 不相等返回`false  `|
`substring(): string` |返回区间内的字符串, 左闭右开  |
`toCharArray(): char[]` |转换成`char[]`数组  |

**StringBuilder API**  

函数|功能|
:-:|:-:|
`length(): int` |返回长度  |
`append()` |末尾添加字符  |
`reverse()` |反转字符串  |
`insert(int index, string value)` |在`index`索引处插入`value`字符  |
`delete(int start, int end)`| 删除区间内的字符串  |
`substring()` |返回区间内的字符串, 左闭右开  |
`setCharAt(int index, char c)` | 将`index`索引处的字符替换成`c`字符|
`replace(int start, int end, String str)`| 将区间内字符串替换成`str`, 也可理解为删除区间内的字符串然后再`start`索引添加`str`字符串  |


## Collection

### 1. List  
推荐使用ArrayList  

* **ArrayList**  
动态生长的数组, 如果超出当前长度便扩容 $\dfrac{3}{2}$。
``` java
List<Integer> list1 = new ArrayList<>();  // 创建一个名字为 list1 的可自增数组，初始长度为默认值（10）
List<Integer> list2 = new ArrayList<>(30);  // 创建一个名字为list2的可自增数组，初始长度为 30
List<Integer> list3 = new ArrayList<>(list2);  // 创建一个名字为 list3 的可自增数组，使用 list2 里的元素和 size 作为自己的初始值
```
* **LinkedList**  
双链表
``` java
List<Integer> list1 = new LinkedList<>();  // 创建一个名字为 list1 的双链表 
List<Integer> list2 = new LinkedList<>(list1);  // 创建一个名字为 list2 的双链表，将 list1 内所有元素加入进来
```
* **API**  

函数|功能|
:-:|:-:|
`size()`| 返回 `this` 的长度  |
`add(Integer val)`|	在 `this` 尾部插入一个元素  |
`add(int idx, Integer e)`|	在 `this` 指定位置插入一个元素  |
`get(int idx)`|	返回 `this` 中第 `idx` 位置的值，若越界则抛出异常  |
`set(int idx, Integer e)`|	修改 `this` 中第 `idx` 位置的值  |


### 2. Queue
队列容器接口，推荐使用`ArrayDeque`  

* **ArrayDeque**  
使用 `ArrayDeque` 实现普通队列，底层是数组模拟队列。  
``` java
Queue<Integer> q = new ArrayDeque<>();
```
* **LinkerList**  
使用 `LinkedList` 实现普通队列，底层是链表模拟队列  
``` java
Queue<Integer> q = new LinkedList<>();
```
* **PriorityQueue**  
`PriorityQueue` 是优先队列，默认是小根堆。  与`C++`相反
``` java
Queue<Integer> q1 = new PriorityQueue<>();  // 小根堆
Queue<Integer> q2 = new PriorityQueue<>((x, y) -> {return y - x;});  // 大根堆

class cmp implements Comparator<Integer>{
        public int compare(Integer x, Integer y){
            return - x.a + y.a;
        }
    }
Queue<Integer> q = new PriorityQueue<>(new cmp()); // 大根堆
```
* **API**  

函数|功能|
:-:|:-:|
`size()`|	返回 `this` 的长度  |
`add(Integer val)`	|入队  |
`isEmpty()`|	判断队列是否为空，为空则返回 `true ` |
`peek()`	|返回队头元素  |
`poll()`	|返回队头元素并删除  |

### 3. Stack

``` java
Stack<Integer> st = new Stack<Integer>();
```

**API**   

函数|功能|
:-:|:-:| 
`size()`|返回 `this` 的长度    |
`empty()` |判断堆栈是否为空，为空则返回 `true ` |
`peek()` |返回堆栈顶部的对象，但不从堆栈中移除它。  |
`pop()` |移除堆栈顶部的对象，并作为此函数的值返回该对象。  |
`push()`| 压入堆栈顶部。  |

### 4. Map  
Map 是维护键值对 `<Key, Value>` 的一种数据结构，其中 `Key` 唯一

* **HashMap**  
随机位置插入的 `Map`  
``` java
Map<Integer, Integer> map1 = new HashMap<>();
```
* **LinkedHashMap**  
保持插入顺序的 `Map`
``` java
Map<Integer, Integer> map2 = new LinkedHashMap<>();
```
* **TreeMap**  
保持 `key` 有序的 `Map`，默认升序
``` java
Map<Integer, Integer> map3 = new TreeMap<>();
Map<Integer, Integer> map4 = new TreeMap<>((x, y) -> {return y - x;});  // 降序
```
* **API**  

函数|功能|
:-:|:-:|
`put(Integer key, Integer value)`	|插入一个元素进 `this ` |
`size()`|	返回 `this` 的长度  |
`get(Integer key)`	|将 this 中对应的 `key` 的 `value` 返回 **空时返回|null，注意不是0**  
`keySet()`	|将 this 中所有元素的 `key` 作为集合返回 可搭配`foreach`使用 | 
`entrySet()`	|将 this 中所有元素的 `key`和`value` 作为集合返回 可搭配 `foreach`使用 其中`getKey()`获取`key`元素， `getValue()`获取对应的`value`元素 | 


### 5. Set  
`Set` 是保持容器中的元素不重复的一种数据结构  
**这里还是推荐使用`Map`来代替`Set`, 减少记忆**  

* **HashSet**  
随机位置插入的 `Set`。  
``` java
Set<Integer> s1 = new HashSet<>();
```
* **LinkedHashSet**  
保持插入顺序的 `Set`。  
``` java
Set<Integer> s2 = new LinkedHashSet<>();
```
* **TreeSet**  
保持容器中元素有序的 `Set`，默认为升序。
``` java
Set<Integer> s3 = new TreeSet<>();
Set<Integer> s4 = new TreeSet<>((x, y) -> {return y - x;});  // 降序 
```
* **API**

函数|功能|
:-:|:-:|
`size()`	|返回 `this` 的长度  |
`add(Integer val)`|	插入一个元素进 `this`  |
`contains(Integer val)`	|判断 `this` 中是否有元素 `val ` |
`addAll(Collection e)`	|将一个容器里的所有元素添加进 `this ` |
`retainAll(Collection e)`	|将 `this` 改为两个容器内相同的元素  |
`removeAll(Collection e)`	|将 `this` 中与 `e` 相同的元素删除  |

## 异常处理

**异常继承关系图**  
![java异常处理](https://ltq525.github.io/site/picture/java异常处理.png)


### 内置异常方法
方法|说明|
:-:|:-:|
`public String getMessage()`	|返回关于发生的异常的详细信息。这个消息在`Throwable` 类的构造函数中初始化了。|
`public Throwable getCause()`	|返回一个 `Throwable` 对象代表异常原因。|
`public String toString()`	|返回此 `Throwable` 的简短描述。|
`public void printStackTrace()`	|将此 `Throwable` 及其回溯打印到标准错误流|
`public StackTraceElement [] getStackTrace()`	|返回一个包含堆栈层次的数组。下标为0的元素代表栈顶，最后一个元素代表方法调用堆栈的栈底。|
`public Throwable fillInStackTrace()`	|用当前的调用栈层次填充`Throwable` 对象栈层次，添加到栈层次任何先前信息中。|

### 捕获异常
``` java
try {
    // 存在异常的语句 如 by zero
} catch (Exception e) {
    e.printStackTarce();
} finally {
    // 是否遇到异常都会执行的语句
}
```
**try-with-resources**  
`JDK7` 之后，`Java` 新增的 `try-with-resource` 语法来打开资源，并且可以在语句执行完毕后确保每个资源都被自动关闭 。
`try` 用于声明和实例化资源，`catch` 用于处理关闭资源时可能引发的所有异常。
``` java
String line;
try (
        BufferedReader br = new BufferedReader(new FileReader("input.txt"));
        BufferedWriter bw = new BufferedWriter(new FileWriter("output.txt"));
) {
    while ((line = br.readLine()) != null) {
        System.out.println("Line => " + line);
        bw.write("copy: " + line + "\n");
    }
    bw.flush();
} catch (IOException e) {
    System.out.println("IOException in try block =>" + e.getMessage());
}
```

### 抛出异常
1. `throw`: 在函数内抛出一个异常。  
例: `if (x == 0) throw new IOException();`  

2. `throws`: 在函数定义时抛出一些可能的异常。  
例: `public static void main(String[] args) throwns Exception {}`  
