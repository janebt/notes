true#true是shell内建命令,什么事都不做,就是shell返回
echo"exitstatusof\"true\"=$?"#

!true
echo"exitstatusof\"!true\"=$?"#
#注意:"!"需要一个空格
#!true将导致一个"commandnotfound"错误
#
#如果一个命令以'!'开头,那么将使用Bash的历史机制.就是显示这个命令被使用的历史.

true
!true
#这次就没有错误了.
#他不过是重复了之前的命令(true).
