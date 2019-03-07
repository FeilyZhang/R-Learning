# R数据源(二)
### 读取json格式数据
首先要下载`rjson`包，命令为
```
install.packages("rjson")
```
通过如下方式读取json数据
```
> library("rjson")
> result <- fromJSON(file = "C:\\Users\\Administrator\\Desktop\\jsontest.json")
> result
```
即可读取成功，result的类型为list，如果我们想将其转化为数据框，那么使用`as.data.frame()`函数即可，如下
```
> dataframe <- as.data.frame(result)
> nrow(dataframe)
[1] 1
> ncol(dataframe)
[1] 20
```
### 读取xml格式数据
首先要下载XML包，命令如下
```
install.packages("XML")
```
如下读取
```
> library("XML")
> result <- xmlParse(file = "C:\\Users\\Administrator\\Desktop\\jsontest.xml")
> result
```
需要注意的是，此时result中保存的是xml文档。若要统计xml文档中的节点个数，那么通过如下方式进行获取
```
# 先通过xmlRoot()函数获取根节点，代表整个xml文档
> rootnode <- xmlRoot(result)
# 再通过xmlSize()函数获取节点个数，一个整型值
> rootsize <- xmlSize(rootnode)
> print(rootsize)
[1] 8
```
如果要获取第n个结点，那么只需要在xmlRoot()函数的基础之上通过索引提取即可，我们不妨通过一个for循环，遍历输出所有节点
```
> for (i in 1:xmlSize(rootnode)) {
+     print(rootnode[i])
+ }
```
和json一样，xml也会被组织为list，同一个结点内部也会是一个list，那么我们同样可以提取到，再通过一个for循环
```
> for (i in 1:xmlSize(rootnode)) {
+     for (j in 1:xmlSize(rootnode[i])) {
+         print(rootnode[i][j])
+     }
+ }
```
对大量数据的有效处理，数据框是一个很好的数据对象，那么我们将的xml转化为数据框如何？直接使用`xmlToDataFrame()`函数即可
```
> result <- xmlToDataFrame("C:\\Users\\Administrator\\Desktop\\jsontest.xml")
> result
  ID     NAME SALARY  STARTDATE       DEPT
1  1     Rick  623.3   1/1/2012         IT
2  2      Dan  515.2  9/23/2013 Operations
3  3 Michelle    611 11/15/2014         IT
4  4     Ryan    729  5/11/2014         HR
5  5     Gary 843.25  3/27/2015    Finance
6  6     Nina    578  5/21/2013         IT
7  7    Simon  632.8  7/30/2013 Operations
8  8     Guru  722.5  6/17/2014    Finance
```
一目了然，再通过`summary`函数计算基本统计量
```
> summary(result)
       ID          NAME       SALARY       STARTDATE         DEPT  
 1      :1   Dan     :1   515.2  :1   1/1/2012  :1   Finance   :2  
 2      :1   Gary    :1   578    :1   11/15/2014:1   HR        :1  
 3      :1   Guru    :1   611    :1   3/27/2015 :1   IT        :3  
 4      :1   Michelle:1   623.3  :1   5/11/2014 :1   Operations:2  
 5      :1   Nina    :1   632.8  :1   5/21/2013 :1                 
 6      :1   Rick    :1   722.5  :1   6/17/2014 :1                 
 (Other):2   (Other) :2   (Other):2   (Other)   :2                 
 ```