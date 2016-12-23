 if [ -f ~/.netscape/cookies ]   # 如果存在则删除. 
 then 
 rm -f ~/.netscape/cookies 
 fi 
 
 ln -s /dev/null ~/.netscape/cookies 
 # 现在所有的cookies都会丢入黑洞而不会保存在磁盘上了. 
