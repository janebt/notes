#!/bin/bash 
# usrmnt.sh, 由Anthony Richardson编写
# 得到允许在此使用. 

# usage: usrmnt.sh 
# 描述: 挂载设备, 调用者必须列在/etc/sudoers文件的MNTUSERS组里
# 

# ---------------------------------------------------------- 
#  这是一个用户挂载设备的脚本,它用sudo来调用自己. 
#  只有拥有合适权限的用户才能用

#    usermount /dev/fd0 /mnt/floppy 

# 来代替

#    sudo usermount /dev/fd0 /mnt/floppy 

#  我使用相同的技术来处理我所有的sudo脚本, 
#+ 因为我觉得它很方便. 
# ---------------------------------------------------------- 

#  如果SUDO_COMMAND 变量没有设置,我们不能通过sudo来运行脚本本身. 
#+ 传递用户的真实ID和组ID . . . 

if [ -z "$SUDO_COMMAND" ] 
then 
mntusr=$(id -u) grpusr=$(id -g) sudo $0 $* 
exit 0 
fi 

# 如果我们以sudo来调用运行,就会运行这儿. 
/bin/mount $* -o uid=$mntusr,gid=$grpusr 

exit 0 

# 附注(由脚本作者加注): 
# ------------------------------------------------- 

# 1) Linux允许在/etc/fstab文件中使用"users"选项
#  以使任何用户能挂载可移动的介质. 
#  但是, 在一个服务器上, 
#  我只想有限的几个用户可以存取可移动介质. 
#  我发现使用sudo可以有更多的控制. 

# 2) 我也发现sudo能通过组更方便地达成目的. 
#  

# 3) 这个方法使给予任何想给合适权限的人使用mount命令
#  所以要小心使用. 
#  你也可以开发类似的脚本mntfloppy, mntcdrom,和mntsamba来使mount命令得到更
好的控制
#  
#  
54 # 
