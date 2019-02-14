# R数据源(一)
### 读取csv数据
有一个需要注意的就是有可能因为编码不对而产生读取失败的问题，解决办法是通过Notepad++新建文件并选择合适的编码然后将原内容复制进去保存，然后读取新文件。其结果为数据框
有两种办法，一种是直接输入全路径，另一种是设置当前文件所在文件夹为工作空间然后输入文件名，分别演示如下
```
> data <- read.csv("C:/Users/Administrator/Downloads/new18.csv")
> data
```
```
> print(getwd())
[1] "C:/Users/Administrator/Documents"
> setwd("C:/Users/Administrator/Downloads")
> data <- read.csv("new18.csv")
> data
> ncol(data)
[1] 48
> nrow(data)
[1] 103
```
### 读取伪csv数据
每行用固定字符分隔但是并不是逗号分隔符，我们不妨称之为伪csv，保存为csv文件(文件后缀不重要吧)，通过`read.table()`函数来读取，也会成为数据框
我们通过分号`;`将每行(每条记录)的每个字段分隔，然后通过`read.table()`来读取，该函数原型为
```
mydata1 <- read.table(file, header = FALSE, sep = ',')
```
最常用的参数就是
+ file：文件路径
+ header指明是否csv文件首行有字段名
+ sep为分隔符，那么这里就是';'

也可以设置工作空间，也可以用绝对路径，示例如下
```
> mydata1 <- read.table("C:/Users/Administrator/Downloads/duc1.csv", header = FALSE, sep = ';')
> nrow(mydata1)
[1] 104
> ncol(mydata1)
[1] 1
```
### readLines()函数
对于大文件，通过read.csv()和read.table()读取不太现实，而readLines()则是很好的办法，该函数支持从连接中读取部分或全部文本行。其原型为
```
readLines(con = stdin(), n = -1L, ok = TRUE, warn = TRUE,
    encoding = "unknown", skipNul = FALSE)
```
常用参数解释如下
con：一个连接对象或字符串
n：整数。要读取的（最大）行数。负值表示应该读取连接上的输入结束。即每次读取几行
encoding：用于设置编码
示例如下
```
con <- file("C:/Users/Administrator/Downloads/2075089_seg_1.csv", "r")
line=readLines(con,n=1)
while( length(line) != 0 ) {
    print(line)
    line=readLines(con,n=1)
}
close(con)
```
### 写入csv
通过`write.csv(data, file)`来写入，第一个参数是需要写入的数据框数据，第二个是文件，如下
```
> data <- read.csv("C:/Users/Administrator/Downloads/new18.csv")
> write.csv(data, "C:/Users/Administrator/Downloads/new19.csv")
```
该函数会自动创建一个文件并把数据写入
### Excel文件的读取
win下的读取需要使用`xlsx`软件包，可以通过以下命令安装
```
install.packages("xlsx")
```
但是也可以通过将excel文件输出为csv然后再用csv来处理