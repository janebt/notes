#!/bin/bash 
# 列出所有行星. 

 for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto 
do 
echo $planet # Each planet on a separate line. 
done 

echo 
 
 for planet in "Mercury Venus Earth MarsJupiter Saturn Uranus Neptune Pluto" 
 # 所有的行星都在同一行上. 
 # 完整的'list'作为一个变量都封在""中
 do 
 echo $planet 
 done 
 
 exit 0 
