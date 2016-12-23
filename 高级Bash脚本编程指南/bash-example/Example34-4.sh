#!/bin/bash 

# Cards: 
# 处理四人打牌. 

UNPICKED=0 
PICKED=1 

DUPE_CARD=99 

LOWER_LIMIT=0 
UPPER_LIMIT=51 
CARDS_IN_SUIT=13 
CARDS=52 

declare -a Deck 
declare -a Suits 
declare -a Cards 
#  用一个三维数据来描述数据会更容易实现也更明了一些. 
# 
#  可能Bash将来的版本会支持多维数组. 


initialize_Deck () 
{ 
i=$LOWER_LIMIT 
until [ "$i" -gt $UPPER_LIMIT ] 
do 
Deck[i]=$UNPICKED # 把整副牌的每张牌都设为没人持牌. 
let "i += 1" 
done 
echo 
} 

initialize_Suits () 
{ 
Suits[0]=C #梅花
Suits[1]=D #方块
Suits[2]=H #红心
Suits[3]=S #黑桃
} 

initialize_Cards () 
{ 
Cards=(2 3 4 5 6 7 8 9 10 J Q K A) 
# 另一种初始化数组的方法. 
} 

pick_a_card () 
{ 
card_number=$RANDOM 
let "card_number %= $CARDS" 
if [ "${Deck[card_number]}" -eq $UNPICKED ] 
then 
Deck[card_number]=$PICKED 
return $card_number 
else 
return $DUPE_CARD 
fi 
} 

parse_card () 
{ 
number=$1 
let "suit_number = number / CARDS_IN_SUIT" 
suit=${Suits[suit_number]} 
echo -n "$suit-" 
let "card_no = number % CARDS_IN_SUIT" 
Card=${Cards[card_no]} 
printf %-4s $Card 
# 优雅地打印各张牌. 
} 

seed_random () # 随机产生牌上数值的种子. 
{ # 如果你没有这么做会有什么发生? 
seed=`eval date +%s` 
let "seed %= 32766" 
RANDOM=$seed 
#  其他的产生随机用的种子的方法还有什么W? 
# 
} 

deal_cards () 
{ 
echo 

cards_picked=0 
while [ "$cards_picked" -le $UPPER_LIMIT ] 
do 
pick_a_card 
t=$? 

if [ "$t" -ne $DUPE_CARD ] 
then 
parse_card $t 

u=$cards_picked+1 
# 改回1步进的索引(临时的). 为什么? 
let "u %= $CARDS_IN_SUIT" 
if [ "$u" -eq 0 ] # 内嵌的if/then 条件测试. 
then 
echo 
echo 
fi 
# Separate hands. 

let "cards_picked += 1" 
fi 
done   

echo 

return 0 
} 


# 结构化编程: 
# 整个程序逻辑模块化. 

#================ 
seed_random 
initialize_Deck 
initialize_Suits 
initialize_Cards 
deal_cards 
#================ 

exit 0 



# 练习1: 
# 把这个脚本完整地做注释. 

# 练习2: 
# 增加一个处理例程(函数) 来以花色排序打印出每个人手中的牌. 
# 如果你高兴,可增加你喜欢的各种酷的代码. 

# 练习3: 
# 简化和理顺脚本的逻辑.
