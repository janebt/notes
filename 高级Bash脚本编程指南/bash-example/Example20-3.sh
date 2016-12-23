  (cat list1 list2 list3 | sort | uniq > list123) & 
   (cat list4 list5 list6 | sort | uniq > list456) & 
#列表的合并和排序同时进. 
#放到后台运行可以确保能够串行执行. 
# 
#和下面的有相同的作用：
   #    cat list1 list2 list3 | sort | uniq > list123 & 
   #    cat list4 list5 list6 | sort | uniq > list456 & 

 wait #在所有的子shell执行完成前不再执行后面的命令. 
 
   diff list123 list456 
