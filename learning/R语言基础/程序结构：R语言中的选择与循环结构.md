# R语言中的选择与循环结构
### R语言中的选择结构
R语言中的选择结构与其余语言无异，主要是以下四种
+ if
+ if-else
+ if-else if-else if-else
+ switch

以上比较魔性的就是switch语句，其原型为
```
switch(EXPR, ...)
```
它根据表达式EXPR的值来决定执行第几个case，示例如下
```
> switch(
+     3,
+     "first",
+     "second",
+     "third",
+     "fourth",
+     "..."
+ )
[1] "third"
```
以上switch表达式传入的是常量3，所以直接输出third。我们不妨计算一下表达式的值然后再做决定
```
> switch(
+     2*2, 
+     mean(3:7), 
+     sum(2:10), 
+     min(1:15), 
+     sqrt(1:10),
+     max(2:0)
+ )
 [1] 1.000000 1.414214 1.732051 2.000000 2.236068 2.449490 2.645751 2.828427 3.000000
[10] 3.162278
```
### R语言中的循环结构
共包括一下三种
+ repeat
+ while
+ for
而中断包括
+ break
+ next：类似于continue
最熟悉的就是for和while循环了，而repeat循环相当于一个死循环一般配合if条件语句和循环中断语句使用。示例如下
```
> hello <- "say hello"
> num <- 0
> repeat {
+     print(hello)
+     num = num + 1
+     if (num > 6) {
+         break
+     }
+ }
[1] "say hello"
[1] "say hello"
[1] "say hello"
[1] "say hello"
[1] "say hello"
[1] "say hello"
[1] "say hello"
> print(num)
[1] 7
```
同样的程序，while示例为
```
> hello <- "say hello"
> num <- 0
> while (num < 6) {
+     print(hello)
+     num = num + 1
+ }
[1] "say hello"
[1] "say hello"
[1] "say hello"
[1] "say hello"
[1] "say hello"
[1] "say hello"
> print(num)
[1] 6
```
for循环的基本语法为
```
for (value in vector) {
   //statements
}
```
示例为
```
> for (i in 1:6) {
+     print("say, hello")
+     i = i + 1;
+ }
[1] "say, hello"
[1] "say, hello"
[1] "say, hello"
[1] "say, hello"
[1] "say, hello"
[1] "say, hello"
```