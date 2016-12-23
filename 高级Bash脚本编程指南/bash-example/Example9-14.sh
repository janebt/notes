#!/bin/bash 

#  检查一些系统的环境变量. 
#  这是个好习惯. 
#  比如,如果$USER(在console上的用户名)没被set, 
#+ 那么系统就不会认你. 

 : ${HOSTNAME?} ${USER?} ${HOME?} ${MAIL?} 
echo 
    echo "Name of the machine is $HOSTNAME." 
    echo "You are $USER." 
    echo "Your home directory is $HOME." 
    echo "Your mail INBOX is located in $MAIL." 
 echo 
    echo "If you are reading this message," 
    echo "critical environmental variables have been set." 
 echo 
 echo 
 
 # ------------------------------------------------------ 
 
 #   ${variablename?} 结果也可以用来
 #+ 在一个脚本中检查变量是否被set. 
 
 ThisVariable=Value-of-ThisVariable 
 #  注意,顺便提一下,这个字符串变量可能在它们的名字中会被设置
 #+ 非法字符
 : ${ThisVariable?} 
 echo "Value of ThisVariable is $ThisVariable". 
 echo 
 echo 
 
 
 : ${ZZXy23AB?"ZZXy23AB has not been set."} 
 #  如果ZZXy23AB没被set, 
 #+ 那么这个脚本将以一个error message终止. 
 
 # 你可以指定错误消息. 
 # : ${variablename?"ERROR MESSAGE"} 
 
 
 # 同样的结果: dummy_variable=${ZZXy23AB?} 
 # dummy_variable=${ZZXy23AB?"ZXy23AB has not been set."} 
 # 
 # echo ${ZZXy23AB?} >/dev/null 
 
 #  同"set -u"命令来比较这些检查变量是否被set的方法. 
 # 
 
 
 
 echo "You will not see this message, because script already terminated." 
 
 HERE=0 
 exit $HERE    # Will NOT exit here. 
 
 # 事实上,这个脚本将返回值1作为退出状态(echo $?). 
