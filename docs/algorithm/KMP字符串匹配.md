# KMP
next数组(坐标1开始)
``` c++
int i = 1, j = 0, ne[1] = 0;
while (i <= n)
{
    if (j == 0 || p[i] == p[j]) ne[++i] = ++j;
    else    j = ne[j];
}
```