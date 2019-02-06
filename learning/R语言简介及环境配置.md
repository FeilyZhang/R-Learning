# R语言简介及环境配置

### R语言简介
R is an integrated suite of software facilities for data manipulation, calculation and graphical display. Among other things it has

+ an effective data handling and storage facility,
+ a suite of operators for calculations on arrays, in particular matrices,
+ a large, coherent, integrated collection of intermediate tools for data analysis,
+ graphical facilities for data analysis and display either directly at the computer or on hardcopy, and
+ a well developed, simple and effective programming language (called ‘S’) which includes conditionals, loops, user defined recursive functions and input and output facilities. (Indeed most of the system supplied functions are themselves written in the S language.)

> From R development documentation: http://127.0.0.1:24224/doc/manual/R-intro.html

### R开发环境的安装与配置

R语言开发环境的安装与配置极其简单，首先下载R语言安装程序，中国大陆有以下镜像站点均可访问

+ [TUNA Team, Tsinghua University](https://mirrors.tuna.tsinghua.edu.cn/CRAN/)	
+ [TUNA Team, Tsinghua University](http://mirrors.tuna.tsinghua.edu.cn/CRAN/)	
+ [University of Science and Technology of China](https://mirrors.ustc.edu.cn/CRAN/)	
+ [University of Science and Technology of China](http://mirrors.ustc.edu.cn/CRAN/)	
+ [KoDDoS in Hong Kong](https://mirror-hk.koddos.net/CRAN/)	
+ [Elite Education](https://mirrors.eliteu.cn/CRAN/)	
+ [Lanzhou University Open Source Society](https://mirror.lzu.edu.cn/CRAN/)	
+ [Lanzhou University Open Source Society](http://mirror.lzu.edu.cn/CRAN/)	
+ [Tongji University](https://mirrors.tongji.edu.cn/CRAN/)	
+ [Shanghai University](https://mirrors.shu.edu.cn/CRAN/)

然后下载应用程序安装包，下载安装的时候对应自己的平台和位数即可。

如果安装程序没有将安装路径加入环境变量，那么你需要手动添加，假设R的安装路径为`C:\Program Files\R\R-3.5.2`
那么你只要需要在环境变量的系统变量中添加Path变量`C:\Program Files\R\R-3.5.2\bin\x64`即可

然后即可在终端输入R命令尽可进入R命令窗口，如下

```
C:\Users\Administrator>R

R version 3.5.2 (2018-12-20) -- "Eggshell Igloo"
Copyright (C) 2018 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R

'license()''licence()'

R.
'contributors()'
'citation()'RR

'demo()''help()'
'help.start()'HTML
'q()'R.

>
```