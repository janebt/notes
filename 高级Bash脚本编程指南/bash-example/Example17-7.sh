#!/bin/bash 
#  一个使用'cat'的here document, 但是禁用了参数替换. 

 NAME="John Doe" 
 RESPONDENT="the author of this fine script"   

cat <<'Endofmessage' 

 Hello, there, $NAME. 
 Greetings to you, $NAME, from $RESPONDENT. 
 
 Endofmessage 
 
 #  当"limit string"被引用或转义那么就禁用了参数替换. 
 #  下边的两种方式具有相同的效果. 
 #   cat <<"Endofmessage" 
 #   cat <<\Endofmessage 
 
 exit 0 
