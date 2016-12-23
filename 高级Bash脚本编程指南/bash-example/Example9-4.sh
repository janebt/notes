#!/bin/bash 
# t-out.sh 
 # "syngin seven"的一个很好的提议(thanks). 


TIMELIMIT=4 # 4 seconds 

 read -t $TIMELIMIT variable <&1 
# ^^^ 
 #  在这个例子中,对于Bash 1.x和2.x就需要使用"<&1" 
 #  但对于Bash 3.x就不需要. 
 
 echo 
 
 if [ -z "$variable" ]   # Is null? 
 then 
    echo "Timed out, variable still unset." 
 else   
    echo "variable = $variable" 
 fi 
 
 exit 0 
