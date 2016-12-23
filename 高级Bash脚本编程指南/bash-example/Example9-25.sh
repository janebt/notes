#!/bin/bash 
# pick-card.sh 

# 这是一个从数组中取出随机元素的一个例子. 


# 取出一张牌,任何一张. 

Suites="Clubs 
 Diamonds 
 Hearts 
 Spades" 
 
 Denominations="2 
 3 
 4 
 5 
 6 
 7 
 8 
 9 
 10 
 Jack 
 Queen 
 King 
 Ace" 
 
 # 注意变量的多行展开. 
 
 
 suite=($Suites) # 读到数组变量中. 
 denomination=($Denominations) 
 
 num_suites=${#suite[*]} # 计算有多少个元素. 
 num_denominations=${#denomination[*]} 
 
 echo -n "${denomination[$((RANDOM%num_denominations))]} of " 
 echo ${suite[$((RANDOM%num_suites))]} 
 
 
 # $bozo sh pick-cards.sh 
 # Jack of Clubs 
 
 
 # Thank you, "jipe," for pointing out this use of $RANDOM. 
 exit 0
