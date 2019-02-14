# R语言函数与字符串操作
### R语言函数
R语言函数的定义，原型如下
```
function_name <- function(arg_1, arg_2, ...) {
   //Function body 
}
```
我们定义一个求均值的函数并测试，如下
```
> mymean <- function(vector) {
+     add <- 0
+     for (i in 1:length(vector)) {
+         add = add + vector[i]
+         i = i + 1
+     }
+     return (add / length(vector))
+ }
> mymean(1:5)
[1] 3
```
R语言函数的形参也可以指定初值，如下
```
> multiply <- function(a  = 1, b = 10) {
+     return (a * b)
+ }
> multiply()
[1] 10
```
我们也可以定义新的二元运算符
```
"%!%" <- function(vector1, vector2) {
    max <- c(1:length(vector1))
	for (i in 1:length(max)) {
	    if (vector1[i] < vector2[i]) {
		    max[i] <- vector2[i]
		} else {
		    max[i] <- vector1[i]
		}
		i = i + 1
	}
	return (max)
}
```
以上二元运算符求向量对应元素的最大值并返回，测试如下
```
> "%!%" <- function(vector1, vector2) {
+     max <- c(1:length(vector1))
+     for (i in 1:length(max)) {
+         if (vector1[i] < vector2[i]) {
+             max[i] <- vector2[i]
+         } else {
+             max[i] <- vector1[i]
+         }
+         i = i + 1
+     }
+     return (max)
+ }
> vct1 %!% vct2
[1] 5 3 8 6 7
> vct1 <- c(5, 2, 7, 6, 4)
> vct2 <- c(1, 3, 8, 2, 7)
> vct1 %!% vct2
[1] 5 3 8 6 7
```
### R中的字符串操作
#### paste()函数
其原型为
```
paste(..., sep = " ", collapse = NULL)
```
+ ...表示要组合的任何数量的参数
+ sep表示参数之间的任何分隔符，这是一个可选项
+ collapse用于消除两个字符串之间的空格，但不是一个字符串的两个单词之间的空格。

```
> a <- "Hello"
> b <- 'How'
> c <- "are you? "
> 
> print(paste(a,b,c))
[1] "Hello How are you? "
> 
> print(paste(a,b,c, sep = "-"))
[1] "Hello-How-are you? "
> 
> print(paste(a,b,c, sep = "", collapse = ""))
[1] "HelloHoware you? "
```
#### format()函数
该函数将数字和字符串格式化为特定样式。原型为
```
format(x, digits, nsmall, scientific, width, justify = c("left", "right", "centre", "none"))
```
各参数解释为
+ x是输入的向量
+ digits是显示的总数
+ nsmall是小数点右侧的最小位数
+ scientific设置为TRUE，以显示科学符号
+ width表示开始填充空白时要显示的最小宽度
+ justify是将字符串显示为左，右或中心。

```
> # Total number of digits displayed. Last digit rounded off.
> result <- format(23.123456789, digits = 9)
> print(result)
[1] "23.1234568"
> 
> # Display numbers in scientific notation.
> result <- format(c(6, 13.14521), scientific = TRUE)
> print(result)
[1] "6.000000e+00" "1.314521e+01"
> 
> # The minimum number of digits to the right of the decimal point.
> result <- format(23.47, nsmall = 5)
> print(result)
[1] "23.47000"
> 
> # Format treats everything as a string.
> result <- format(6)
> print(result)
[1] "6"
> 
> # Numbers are padded with blank in the beginning for width.
> result <- format(13.7, width = 6)
> print(result)
[1] "  13.7"
> 
> # Left justify strings.
> result <- format("Hello", width = 8, justify = "l")
> print(result)
[1] "Hello   "
> 
> # Justfy string with center.
> result <- format("Hello", width = 8, justify = "c")
> print(result)
[1] " Hello  "
```
#### nchar()函数
该函数计算字符串中的包含空格的字符数，如下
```
> nchar("Count the number of characters")
[1] 30
```
#### toupper()＆tolower()函数
这两个函数更改字符(串)的大小写
```
> # Changing to Upper case.
> result <- toupper("Changing To Upper")
> print(result)
[1] "CHANGING TO UPPER"
> 
> # Changing to lower case.
> result <- tolower("Changing To Lower")
> print(result)
[1] "changing to lower"
```
#### substring()
该函数截取字符串的指定部分
```
> # Extract characters from 5th to 7th position.
> result <- substring("Extract", 5, 7)
> print(result)
[1] "act"
```