#!/bin/bash 
# here-function.sh 

 GetPersonalData () 
{ 
read firstname 
read lastname 
read address 
read city 
 read state 
 read zipcode 
 } # 这个函数无疑的看起来就一个交互函数, 但是... 
 
 
 # 给上边的函数提供输入. 
 GetPersonalData <<RECORD001 
 Bozo 
 Bozeman 
 2726 Nondescript Dr. 
 Baltimore 
 MD 
 21226 
 RECORD001 
 
 
 echo 
 echo "$firstname $lastname" 
 echo "$address" 
 echo "$city, $state $zipcode" 
 echo 
 
 exit 0 
