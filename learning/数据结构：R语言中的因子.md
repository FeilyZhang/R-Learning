# R语言中的因子
个人觉得，因子一定是R中概念较为晦涩的类型了。
### 因子的含义
因子就是用于表示一组数据中的类别，可以记录这组数据中的类别名称及类别数目。
比如之前的数据框datafradme，数据如下
```
> datafradme
  No   NoName  NoSex NoMath NoEnglish
1  1 zhangsan   male    100        20
2  2     lisi   male     20        40
3  3   wangwu female     40        60
4  4  zhaoliu female     80        80
```
我们可以检查datafradme数据框各列的类型，如下
```
> datafradme$NoSex
[1] male   male   female female
Levels: female male
> class(datafradme$No)
[1] "numeric"
> class(datafradme$NoName)
[1] "factor"
> class(datafradme$NoSex)
[1] "factor"
> class(datafradme$NoMath)
[1] "numeric"
> class(datafradme$NoEnglish)
[1] "numeric"
```
发现NoName与NoSex列的类型就是因子
我们可以查看datafradme中因子NoSex的名称和数目，即
```
> levels(datafradme$NoSex)
[1] "female" "male"
> nlevels(datafradme$NoSex)
[1] 2
```
可以看出，该组数据(NoSex)的共有两类，分别是female与male，该组数据均由这两类基本元素组成，即
```
> datafradme$NoSex
[1] male   male   female female
Levels: female male
```

### 因子的创建
可以通过factor函数来创建，原型如下
```
factor(x = character(), levels, labels = levels,
    exclude = NA, ordered = is.ordered(x), nmax = NA)
```
参数解释如下
+ x是一组向量，为因子中的具体值
+ levels为因子的取值范围，如果以datafradme的NoSex因子来说的话就是male与female，也是向量
+ labels为因子水平levels的标签，可以理解为对因子水平的具体解释，比如datafradme的NoSex来说的话levels的对应标签就是“男性”“女性”，仍然是向量
+ exclude，要排除的字符
+ ordered，因子是否有序，值为TRUE表示有序，FALSE为无序，或者也可以通过ordered()函数将因子变有序
+ nmax，水平的上限数

以下创建一个因子
```
> fac <- c("male", "male", "female", "female")
> fact <- factor(fac)
> fact
[1] male   male   female female
Levels: female male
> fact <- factor(fac, levels = c("male", "female"))
> fact
[1] male   male   female female
Levels: male female
> fact <- factor(fac, levels = c("male", "female"), labels = c("nanxing", "nvxing"))
> fact
[1] nanxing nanxing nvxing  nvxing
Levels: nanxing nvxing
> ordered(fact)
[1] nanxing nanxing nvxing  nvxing
Levels: nanxing < nvxing
```
> 参考：[https://www.zhihu.com/question/48472404/answer/164790545](https://www.zhihu.com/question/48472404/answer/164790545)

### 函数str()
该函数可以供R对象的某些信息，如下
```
> str(fact)
 Factor w/ 2 levels "nanxing","nvxing": 1 1 2 2
> str(datafradme)
'data.frame':   4 obs. of  5 variables:
 $ No       : num  1 2 3 4
 $ NoName   : Factor w/ 4 levels "lisi","wangwu",..: 3 1 2 4
 $ NoSex    : Factor w/ 2 levels "female","male": 2 2 1 1
 $ NoMath   : num  100 20 40 80
 $ NoEnglish: num  20 40 60 80
```

### 函数summary()
该函数显示R对象的基本统计量，如最小值、最大值、均值和各四分位数，而对于类型型变量(就是因子)则显示其频数，如下
```
> summary(datafradme)
       No            NoName     NoSex       NoMath      NoEnglish
 Min.   :1.00   lisi    :1   female:2   Min.   : 20   Min.   :20
 1st Qu.:1.75   wangwu  :1   male  :2   1st Qu.: 35   1st Qu.:35
 Median :2.50   zhangsan:1              Median : 60   Median :50
 Mean   :2.50   zhaoliu :1              Mean   : 60   Mean   :50
 3rd Qu.:3.25                           3rd Qu.: 85   3rd Qu.:65
 Max.   :4.00                           Max.   :100   Max.   :80
```