#!/bin/bash 
# ramdisk.sh 

# "ramdisk"是系统RAM内存的一段, 
#+ 它可以被当成是一个文件系统来操作. 
#  它的优点是存取速度非常快(包括读和写). 
#  缺点: 易失性, 当计算机重启或关机时会丢失数据. 
#+  会减少系统可用的RAM. 
# 
#  那么ramdisk有什么作用呢? 
#  保存一个较大的数据集在ramdisk, 比如一张表或字典, 
#+ 这样可以加速数据查询, 因为在内存里查找比在磁盘里查找快得多. 


E_NON_ROOT_USER=70 # 必须用root来运行. 
ROOTUSER_NAME=root 

MOUNTPT=/mnt/ramdisk 
SIZE=2000 # 2K 个块(可以合适的做修改) 
BLOCKSIZE=1024 # 每块有1K (1024 byte) 的大小
DEVICE=/dev/ram0 # 第一个ram 设备

username=`id -nu` 
if [ "$username" != "$ROOTUSER_NAME" ] 
then 
echo "Must be root to run \"`basename $0`\"." 
exit $E_NON_ROOT_USER 
fi 

if [ ! -d "$MOUNTPT" ]          #  测试挂载点是否已经存在了, 
then #+ 如果这个脚本已经运行了好几次了就不会再建这个目
录了
mkdir $MOUNTPT #+ 因为前面已经建立了. 
fi 

dd if=/dev/zero of=$DEVICEcount=$SIZE bs=$BLOCKSIZE # 把RAM设备的内容用零填
充. 
# 为何需要这么做? 
mke2fs $DEVICE # 在RAM设备上创建一个ext2文件系统. 
mount $DEVICE $MOUNTPT # 挂载设备. 
chmod 777 $MOUNTPT # 使普通用户也可以存取这个ramdisk. 
# 但是, 只能由root来缷载它. 

echo "\"$MOUNTPT\" now available for use." 
# 现在ramdisk 即使普通用户也可以用来存取文件了. 

#  注意, ramdisk是易失的, 所以当计算机系统重启或关机时ramdisk里的内容会消失. 
# 
#  拷贝所有你想保存文件到一个常规的磁盘目录下. 

# 重启之后, 运行这个脚本再次建立起一个ramdisk. 
# 仅重新加载/mnt/ramdisk 而没有其他的步骤将不会正确工作. 

#  如果加以改进, 这个脚本可以放在/etc/rc.d/rc.local, 
#+ 以使系统启动时能自动设立一个ramdisk. 
#  这样很合适速度要求高的数据库服务器. 
 55 
 56 exit 0 
