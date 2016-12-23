#!/bin/bash 
# dialog.sh: 使用'gdialog' 窗口部件. 
# 必须在你的系统里安装'gdialog'才能运行此脚本. 
# 版本1.1 (04/05/05 修正) 

# 这个脚本的灵感源自下面的文章. 
#      "Scripting for X Productivity," by Marco Fioretti, 
#       LINUX JOURNAL, Issue 113, September 2003, pp. 86-9. 
# Thank you, all you good people at LJ. 


# 在窗口中的输入错误. 
E_INPUT=65 
# 输入窗口显示的尺寸. 
HEIGHT=50 
WIDTH=60 

# 输出文件名(由脚本名构建而来). 
OUTFILE=$0.output 

# 把这个脚本的内容显示在窗口中. 
gdialog --title "Displaying: $0" --textbox $0 $HEIGHT $WIDTH 



# 现在,保存输入到输出文件中. 
echo -n "VARIABLE=" > $OUTFILE 
gdialog --title "User Input" --inputbox "Enter variable, please:" \ 
$HEIGHT $WIDTH 2>> $OUTFILE 


if [ "$?" -eq 0 ] 
# 检查退出状态是一个好习惯. 
then 
echo "Executed \"dialog box\" without errors." 
else 
echo "Error(s) in \"dialog box\" execution." 
# 或者, 点击"Cancel", 而不是"OK" 按钮. 
rm $OUTFILE 
exit $E_INPUT 
fi 



# 现在,我们重新取得并显示保存的变量. 
. $OUTFILE # 'Source' 保存的文件(即执行). 
echo "The variable input in the \"input box\" was: "$VARIABLE"" 


rm $OUTFILE   # 清除临时文件. 
# 有些应用可能需要保留这些文件. 

exit $?
