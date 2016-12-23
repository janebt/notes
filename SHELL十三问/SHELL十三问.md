# SHELL十三问
##1.  为何叫做shell？
- 每次当我们完成系统登入(login)，我们就取得一个互动模式的shell，也称为login shell或prim ary shell 
- 我们在shell所下达的命令，均是shell所产生的子行程。
- 如果是执行脚本(shell script)的话， 脚本中的命令则是由另外一个非互动模式的子shell(sub shell)来执行的。
- /etc/shell s:列出不同的shell 
- 常见的shell主要分为两大主流：

        sh：
        burne shell  (sh)
        burne agai n shell  (bash)

        csh：
        c shell  (csh) 
        tc shell  (tcsh)
        korn shell  (ksh)

- 大部份的Linux系统的默认shell都是bash

##2.  shell prompt与Carriage Return的关系？
* 命令行读进(CR)字符
- 若从技术细节来看，shell会依据IFS(Internal Field Seperator)将command line 所输入的文字给拆解为"字段"。然后再针对特殊字符(meta)先作处理，最后再重组整行command line  。
* IFS是shell预设使用的字段分隔符，可以由一个及多个如下按键组成：

        空白鍵(White Space)
        表格鍵(Tab)
        回車鍵(Enter) 

##3.  別人echo、你也echo，是问echo知多少？
- echo在默认上，在显示完argument之后，还会送出一个换行符号
- 可利用echo的-n option取消这个换行符号
- echo常用项：

        -e：启用反斜杠控制字符的转换(参考下表)
        -E：关闭反斜杠控制字符的转换(预设如此)
        -n：取消行末之换行符号(与-e项下的\c字符同意)

- 关于echo命令所支持的反斜杠控制字符如下表：

        \a：ALERT/BELL(从系统喇叭送出铃声)
        \b：BACKSPACE，也就是向左删除键
        \c：取消行末之换行符号
        \E：ESCAPE，跳脱键
        \f：FORMFEED，换页字符
        \n：NEWLINE，换行字符
        \r：RETURN，回车键
        \t：TAB，表格跳位键
        \v：VERTICAL TAB，垂直表格跳位键
        \n：ASCII八进制编码(以x开首为十六进制)
        \\：反斜杠本身

##4.  " "（双引号）与''（单引号）差在哪？
- meta：对shell来说，具有特定功能的特殊保留字符：

        IFS：由<space>或<tab>或<enter>三者之一组成(我们常用space)。
        CR：由<enter>产生。

- IFS是用来拆解command line的每一个词(word)用的，因为shell command line 是按词来处理的。
- CR则是用来结束command line用的，这也是为何我们敲<enter>命令就会跑的原因。

- 除了IFS与CR，常用的meta还有：

        =   ：设定变量。
        $   ：作变量或运算替换(请不要与shell prompt搞混了)。
        >   ：重导向stdout。
        <   ：重导向stdin。
        |   ：命令管线。
        &   ：重导向file descriptor，或将命令置于背境执行。
        ()  ：将其内的命令置于nested subshell执行，或用于运算或命令替换。
        {}  ：将其内的命令置于non-named function中执行，或用在变量替换的界定范围。
        ;   ：在前一个命令结束时，而忽略其返回值，继续执行下一个命令。。
        &&  ：在前一个命令结束时，若返回值为true，继续执行下一个命令。。
        ||  ：在前一个命令结束时，若返回值为false，继续执行下一个命令。。
        !   ：执行history列表中的命令
        .... 

- 在bash中，常用的quoting有如下三种方法：

        hardquote   ：' '(单引号)，凡在hardquote中的所有meta均被关闭。
        softquote   ：" "(双引号)，在softquoe中大部份meta都会被关闭，但某些则保留(如$)。
        escape      ：\(反斜杠)，只有紧接在escape(跳脱字符)之后的单一meta才被关闭。

## 5.  var=value？export  前后差在哪？ ##
### 设定 ###
- 在设定变量的时侯，得遵守如下规则：

        等号左右两边不能使用区隔符号(IFS)，也应避免使用shell的保留字符(meta charactor)。
        变量名称不能使用$符号。
        变量名称的第一个字母不能是数字。
        变量名称长度不可超过256个字母。
        变量名称及变量值之大小写是有区别的。

### 变量替换 ###
###  export  ###
- 在当前shell中所定义的变量，均属于"本地变量"，只有经过export命令的"输出"处理，才能成为环境变量
- 在使用export的时侯，请别忘记shell在命令行对变量的"替换"处理    

### 取消变量 ###
- 要取消一个变量，在bash中可使用unset命令来处理

## 6.  exec跟source差在哪？ ##
- 环境变量只能从父行程到子行程单向继承。换句话说：在子行程中的环境如何变更，均不会影响父行程的环境
-  exec也是让script在同一个行程上执行，但是原有行程则被结束了。

## 7.  ( )与{ }差在哪？ ##
- 区别：

        ( )将command group置于sub-shell去执行，也称nested sub-shell 。
        { }则是在同一个shell内完成，也称为non-named command group。

### function ###
- 在bash中，function的定义方式有两种：

        方式一：
        function function_name {
        command1
        command2
        command3
        ....
        }
        方式二： 
        fuction_name () {
        command1
        command2
        command3
        ....
        }

## 8.  $(( ))  与  $( )  还有${ }  差在哪？ ##
- 在bash shell中，$( )与` `(反引号)都是用来做命令替换用的。
- ${ }  的一些特异功能：
假设我们定义了一个变量为：file=/dir1/dir2/dir3/my.file.txt

        ${file#*/}：拿掉第一条/及其左边的字符串：dir1/dir2/dir3/my.file.txt
        ${file##*/}：拿掉最后一条/及其左边的字符串：my.file.txt
        ${file#*.}：拿掉第一个.及其左边的字符串：file.txt
        ${file##*.}：拿掉最后一个.及其左边的字符串：txt
        ${file%/*}：拿掉最后条/及其右边的字符串：/dir1/dir2/dir3
        ${file%%/*}：拿掉第一条/及其右边的字符串：(空值)
        ${file%.*}：拿掉最后一个.及其右边的字符串：/dir1/dir2/dir3/my.file
        ${file%%.*}：拿掉第一个.及其右边的字符串：/dir1/dir2/dir3/my

        记忆的方法为：
        /# 是去掉左边(在鉴盘上 # 在 $ 之左边)
        % 是去掉右边(在鉴盘上 % 在 $ 之右边) 
        单一符号是最小匹配﹔两个符号是最大匹配。

        ${file:0:5}：提取最左边的5个字节：/dir1
        ${file:5:5}：提取第5个字节右边的连续5个字节：/dir2

        可以对变量值里的字符串作替换：
        ${file/dir/path}：将第一个dir提换为path：/path1/dir2/dir3/my.file.txt
        ${file//dir/path}：将全部dir提换为path：/path1/path2/path3/my.file.txt

        利用${ }还可针对不同的变量状态赋值(没设定、空值、非空值)：
        ${file-my.file.txt}：假如$file为空值，则使用my.file.txt作默认值。(保留没设定及非空值)
        ${file:-my.file.txt}：假如$file没有设定或为空值，则使用my.file.txt作默认值。(保留非空值)
        ${file+my.file.txt}：不管$file为何值，均使用my.file.txt作默认值。(不保留任何值)
        ${file:+my.file.txt}：除非$file为空值，否则使用my.file.txt作默认值。(保留空值)
        ${file=my.file.txt}：若$file没设定，则使用my.file.txt作默认值，同时将$file定义为非空值。(保留空值及非空值)
        ${file:=my.file.txt}：若$file没设定或为空值，则使用my.file.txt作默认值，同时将$file定义为非空值。(保留非空值)
        ${file?my.file.txt}：若$file没设定，则将my.file.txt输出至STDERR。(保留空值及非空值))
        ${file:?my.file.txt}：若$file没设定或为空值，则将my.file.txt输出至STDERR。(保留非空值)

        ${#var}可计算出变量值的长度：
        ${#file}可得到27，因为/dir1/dir2/dir3/my.file.txt刚好是27个字节...

        bash的组数(array)处理方法。
        一般而言，A="a b c def"这样的变量只是将$A替换为一个单一的字符串，但是改为A=(a b c def)，则是将$A定义为组数...
        bash的组数替换方法可参考如下方法：
        ${A[@]}或${A[*]}可得到a b c def(全部组数)
        ${A[0]}可得到a(第一个组数)，${A[1]}则为第二个组数...
        ${#A[@]}或${#A[*]}可得到4(全部组数数量)
        ${#A[0]}可得到1(即第一个组数(a)的长度)，${A[3]}可得到3(第一个组数(def)的长度)
        A[3]=xyz则是将第4个组数重新定义为xyz...

- 在$(( ))中的变量，可用$符号来替换，也可以不用
- $((  ))还可作不同进位(如二进制、八进制、十六进制)作运算呢，只是输出结果皆为十进制而已

## 9.  $@ 与 $* 差在哪？ ##
- 在shellscript中，可用$0,$1,$2,$3...$0就是代表shellscript名称(路径)本身，而$1就是其后的第一个参数
- $10 不是替换第10个参数，而是替换第一个参数($1)然后再补一个0于其后
- 如果要获取第10个参数：

        ${10} 
        shift

- 通俗来说，所谓的shift就是取消positional parameter中最左边的参数($0不受影响)。其默认值为1，也就是shift或 shift 1都是取消$1，而原本的$2则变成$1、$3变成$2...若shift 3则是取消前面三个参数，也就是原本的$4将变成$1...
- 精确来讲，$@与$*只有在softquote中才有差异，否则都表示"全部参数"($0除外)。

## 10.  &&  与  ||  差在哪？ ##
- 在shell下跑的每一个command或function，在结束的时候都会传回父行程一个值，称为return value
- 可用 $? 得到最新的一个return value
- return value取值在0-255之间

        若在script里，用 exit RV来指定其值，若没指定，在结束时以最后一道命令之 RV 为值。
        若在function里，则用 return RV 来代替 exit RV 即可。

- Return Value的作用，是用来判断行程的退出状态，只有两种：

        0     为"真"
        非0   为"假"

### test ###
- test命令是"专门"用来测试某一条件而送出 return value 以供 true 或 false 的判断
- test命令格式：

        test expression
        [ expression ](请务必注意[ ]之间的空格键﹗)

- bash的 test 目前支持的测试对像只有三种：

        string  ：字符串，也就是纯文本。
        integer ：整数( 0 或正整数，不含负数或小数点)。
        file    ：文件

        e.g.
        [ "$A" = 123 ]：是字符串的测试，以测试  $A  是否为1、2、3  这三个连续的"文字"。
        [ "$A" -eq 123 ]：是整数的测试，以测试  $A  是否等于"一百二十三"。
        [ -e "$A" ]：是关于文件的测试，以测试  123  这份"文件"是否存在。

- 当 expression 测试为"真"时，test 就送回0 (true) 的 return value，否则送出非0 (false)。
- test 允许多重的覆合测试:

        expression1 -a expression2 ：当两个exrepssion都为 true ，才送出 0 ，否则送出非 0 。
        expression1 -o expressi n2 ：只需其中一个exrepssion 为 true，就送出 0 ，只有两者都为 false 才送出非 0 。

- 在 commandline 中使用 test 时，请别忘记命令行的"重组"特性，也就是在碰到 meta 时会先处理 meta 再重新组建命令行。
-  所以，假如在 test 中碰到变量替换，用 soft quote 是最保险﹗

##11.  > 与 < 差在哪？ ##
- 在 shell 程序中，最常使用的 FD 大概有三个，分别为：

        0: Standard Input (STDIN)
        1: Standard Output (STDOUT)
        2: StandardError Output (STDERR)

- 在标准情况下，这些 FD 分别跟如下设备(device)关联：

        stdin(0)    : keyboard
        stdout(1)   : monitor
        stderr(2)   : monitor

- 可用  <  来改变读进的数据信道(stdin)，使之从指定的档案读进。
- 可用  >  来改变送出的数据信道(stdout, stderr)，使之输出到指定的档案。
- 因为  0  是  <  的默认值，因此  <  与  0<  是一样的
- << 是所谓的HERE Document ，它可以让我们输入一段文本，直到读到 << 后指定的字符串。
- 0<  是改变  stdin  的数据输入信道
- 1>  是改变  stdout  的数据输出信道
- 2>  是改变  stderr  的数据输出信道。

- file locking 的问题
`$ ls my.file no.such.file 1>file.both 2>file.both`     
从file system的角度来说，单一档案在单一时间内，只能被单一的 FD 作写入。假如 stdout(1) 与 stderr(2) 都同时在写入 file.both 的话，则要看它们在写入时否碰到同时竞争的情形了，基本上是"先抢先赢"的原则。         
改进方式：`$ ls my.file no.such.file 1>file.both 2>&1`   

若将 FD1 跟 FD2 转到 /dev/null 去，就可将 stdout 与 stderr 弄不见掉。
若将 FD0 接到 /dev/null 来，那就是读进 nothing 。
e.g. `$ ls my.file no.such.file &>/dev/null`

-  > 会覆盖之前的导入内容，换成  >>  被重导的目标档案之内容并不会失去， 而新的内容则一直增加在最后面去
- 解决 > "洗"掉旧的内容：

        取消-bash:file:cannot overwrite existing file限制
        $ set +o noclobber
        $ echo "5" > file.out
        $ cat file.out

        不取消而又"临时"盖写目标档案
        $ set -o noclobber
        $ echo "6" >| file.out
        $ cat file.out

- 在 IO Redirection 中，stdout 与 stderr 的管道会先准备好，才会从 stdin 读进资料。

### pipe line ###
- 上一个命令的 stdout 接到下一个命令的 stdin 
- 在 pipe line 之间，前一个命令的 stderr 是不会接进下一命令的 stdin；其输出若不用 2> 导到 file 去的话，它还是送到监视器上面来﹗

### tee命令 ###
- tee 命令是在不影响原本 I
- O 的情况下，将 stdout 复制一份到档案去
- 在默认上，tee 会改写目标档案，若你要改为增加内容的话，那可用 -a 参数达成。
- e.g.在  cm1 | cm2 | cm3 ... 這段 pipe line 中，若要將 cm2 的結果存到某一檔案：      
`cm1 | cm2 | tee file | cm3`

## 12.  你要 if 还是 case 呢？ ##
- 格式：

        if  comd1; then
                comd2
        elif  comd3; then
                comd4
        else
                comd5
        fi

- 若 then 后不想跑任何 command ，可用" ： "  这个 null command 代替。

## 13.  for what? while 与 until 差在哪？ ##
- bash shell 中常用的 loop 有如下三种：

        for
        while
        until

- while loop  的原理与  for l oop  稍有不同：
- 它不是逐次处理清单中的变量值，而是取决于 while 后面的命令行之 return value
- 与 while 相反，until 是在 return value 为 false 时进入循环，否则结束
- 若 break  后面指定一个数值 n 的话，则"从里向外"打断第 n 个循环，默认值为 break 1 ，也就是打断当前的循环。
- 在使用  break  时需要注意的是，  它与  return  及  exi t  是不同的：

        break  是结束  loop
        return  是结束  function
        exit  是结束  script/shell

- continue 后面也可指定一个数值n，以决定继续哪一层(从里向外计算)的循环，默认值为 continue 1，也就是继续当前的循环。