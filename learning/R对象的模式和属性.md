# R对象的模式和属性

### R对象的模式和属性
##### 简介
常见的编程语言总是通过数据类型来约束变量，无论是强类型语言还是弱类型语言，变量都是有类型的。但是R语言并非如此，变量不会被声明为某些数据类型，而是被约束为对象，R中常见的R对象如下

+ 向量
+ 列表
+ 矩阵
+ 数组
+ 因子
+ 数据帧

而这些对象内部则是由类型的，常见的类型如下

|数据类型|示例|验证代码|输出结果|
|------|------|------|------|
|逻辑|TRUE, FALSE|v <- TRUE ; print(class(v));|[1] "logical"|
|数字值|12.3, 5, 999|v <- 23.5 ; print(class(v));|[1] "numeric"|
|整数|2L, 34L, 0L|v <- 2L; print(class(v));|[1] "integer"|
|复数|3 + 2i|v <- 2+5i|print(class(v));|[1] "complex"|
|字符|‘a’ , ‘“good”, “TRUE”, ‘23.4’|v <- "TRUE" ; print(class(v));|[1] "character"|
|原生|"Hello"存储值为： 48 65 6c 6c 6f|v <- charToRaw("Hello"); print(class(v));|[1] "raw"|

> 上表来源于：https://www.yiibai.com/r/r_data_types.html

所以在R语言中最基本的操作类型不是数据类型而是R对象

##### R对象的内在属性(模式和长度)和非内在属性
每个R对象都具有其属性，常用的为模式和长度，模式就是R对象内基本元素的类型，长度就是R对象的元素个数。

** 向量必须具有相同模式的值 **，即构成R对象——向量的基本元素的类型必须是相同的，如下

```
> v1 <- c(1, 2, 3)
> print(v1)
[1] 1 2 3
> mode(v1)
[1] "numeric"
> print(mode(v1))
[1] "numeric"
> v2 <- (TRUE,1,'A')
: ',' in "v2 <- (TRUE,"
> print(length(v1))
[1] 3
```

v1的模式均为numeric，而v2就是非法的，因为基本元素的模式不一致，可以通过`mode(object)`查看R对象的模式(就是基本元素的数据类型，入乡随俗，以后就称之为模式而非数据类型)，而通过`length(object)`函数可以查看R对象的长度.

欲获取当前为该R对象定义的所有非内在属性的列表，可以通过`attributes(object)`函数，我们先定义一个数据帧，然后获取其非内在属性，如下

```
> student <- data.frame(
+ name = c("Feily Zhang", "HaoyueLi", "Mingfeng He", "Xin Chen"),
+ sex = c("Male", "Female", "Male", "Male"),
+ age = c(21, 21, 20, 20),
+ Origin = c("Shannxi", "Shannxi", "Sichuan", "Zhejiang")
+ )
> print(student)
         name    sex age   Origin
1 Feily Zhang   Male  21  Shannxi
2    HaoyueLi Female  21  Shannxi
3 Mingfeng He   Male  20  Sichuan
4    Xin Chen   Male  20 Zhejiang
> print(attributes(student))
$names
[1] "name"   "sex"    "age"    "Origin"

$class
[1] "data.frame"

$row.names
[1] 1 2 3 4
```

可以看出，我们获取到的所有非内在属性包括names，class和row.names，并且列出了其值

** 列表可以具有任意模式 **，可以是几种基本模式，也可以是向量、函数、数据帧甚至是另一个列表等等，示例如下

```
> list1 <- list(TRUE, 1, 'A')
> list2 <- list(v1, list1, sin, c(4, 5, 9), student)
> print(list2)
[[1]]
[1] 1 2 3

[[2]]
[[2]][[1]]
[1] TRUE

[[2]][[2]]
[1] 1

[[2]][[3]]
[1] "A"


[[3]]
function (x)  .Primitive("sin")

[[4]]
[1] 4 5 9

[[5]]
         name    sex age   Origin
1 Feily Zhang   Male  21  Shannxi
2    HaoyueLi Female  21  Shannxi
3 Mingfeng He   Male  20  Sichuan
4    Xin Chen   Male  20 Zhejiang
```

##### R对象长度的定义、扩容与设置
在定义向量的时候可以为其指定长度(同时也就指定了某种模式)，如下

```
> e <- numeric(5)
> print(e)
[1] 0 0 0 0 0
```
我们将向量型R对象e指定为numberic模式，且长度为5，输出显示其初值均为0，那么我们就可以通过索引一一赋值，** 需要注意的是R语言的索引从1开始 **

```
> e[1] = 1
> e[2] = 2
> e[3] = 3
> e[4] = 4
> e[5] = 5
> print(e)
[1] 1 2 3 4 5
> e[6] = 6
> print(e)
[1] 1 2 3 4 5 6
```

我们分别为索引为1——5的元素赋值，并且为不存在的索引6赋值，且成功了，也就意味着其自动扩容。在定义了向量之后我们还可以为其再次设置长度，新长度比之前的长度大那么意味着扩容，小那么意味着会丢失掉一部分元素

```
> print(e)
[1] 1 2 3 4 5 6
> length(e) <- 3
> print(e)
[1] 1 2 3
> length(e) <- 10
> print(e)
 [1]  1  2  3 NA NA NA NA NA NA NA
```

##### R对象的类
R中的所有对象都有一个类，可以通过class(object)查看，对于简单的向量，其返回值仅仅是模式中的，例如 "numeric"，"logical"，"character"或"list"，但是矩阵、数组、因子、数据帧则返回自身对象类型。示例如下

```
> print(class(v1))
[1] "numeric"
> print(class(student))
[1] "data.frame"
> array1 <- array(c("hello", "world"), dim = c(3, 3, 2))
> print(class(array1))
[1] "array"
> m = matrix(c('a', 'b', 'c', 'd', 'e', 'f'), nrow = 2, ncol = 3, byrow = TRUE)
> print(m)
     [,1] [,2] [,3]
[1,] "a"  "b"  "c"
[2,] "d"  "e"  "f"
> print(class(m))
[1] "matrix"
```

##### 绘图函数与unclass函数

我们描述近一周的最高气温，先定义x与y向量，其中x表示从星期一到星期日，y表示星期一到星期日的最高气温，然后他就可以通过plot函数绘图，如下

```
> x <- c(1, 2, 3, 4, 5, 6, 7)
> y <- c(12, 12, 4, 0, 0, 0, 3)
> plot(x, y, main = "Weekly maximum temperature chart", xlab = "Week", ylab = "temperature", xlim = c(1, 7), ylim = c(-10, 15), col = "red", pch = 19)
```

然后既可以得到下图

![Weekly maximum temperature chart](https://cdn.nlark.com/yuque/0/2019/png/257195/1549437167767-11a79518-0c75-4d1f-941e-71fe3e3247a3.png)

还可以将x与y组织成数据帧形式，再绘图，如下

```
> framedata = data.frame(x, y)
> print(framedata)
  x  y
1 1 12
2 2 12
3 3  4
4 4  0
5 5  0
6 6  0
7 7  3
> plot(framedata)
```

绘制的图片如下

![Weekly maximum temperature chart](https://cdn.nlark.com/yuque/0/2019/png/257195/1549437167767-11a79518-0c75-4d1f-941e-71fe3e3247a3.png)

数据帧的原始输出像极了矩阵，而可以通过unclass函数将数据帧按列打印成列表，如下

```
> unclass(framedata)
$x
[1] 1 2 3 4 5 6 7

$y
[1] 12 12  4  0  0  0  3

attr(,"row.names")
[1] 1 2 3 4 5 6 7
```