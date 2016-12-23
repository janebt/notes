#!/bin/bash 
# agram.sh: 用anagrams玩游戏. 

# 寻找anagrams ... 
LETTERSET=etaoinshrdlu 
FILTER='.......' # 最小有多少个字母? 
# 1234567 

anagram "$LETTERSET" | # 找出这串字符中所有的anagrams ... 
grep "$FILTER" | # 至少7个字符, 
grep '^is' | # 以'is'开头
grep -v 's$' | # 不是复数的(指英文单词复数) 
grep -v 'ed$' # 不是过去式的(当然也是英文单词) 
# 可以加许多组合条件和过滤器. 

#  使用"anagram" 软件
#+ 它是作者"yawl" 单词列表软件包的一部分. 
#   http://ibiblio.org/pub/Linux/libs/yawl-0.3.2.tar.gz 
#   http://personal.riverusers.com/~thegrendel/yawl-0.3.2.tar.gz 

exit 0 # 代码结束. 


bash$ sh agram.sh 
islander 
isolate 
isolead 
isotheral 



#  练习: 
#   --------- 
#  修改这个脚本使LETTERSET 能作为命令行参数来接受. 
#  能够传递参数给第 11 - 13 行的过滤器(就像$FILTER), 
#+ 以便能靠传递参数来指定一种功能. 

#  参考agram2.sh了解些微不同的anagram的一种方法
# 
