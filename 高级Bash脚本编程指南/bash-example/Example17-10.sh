#!/bin/bash 

: <<TESTVARIABLES 
${HOSTNAME?}${USER?}${MAIL?}   # 如果其中一个变量没被设置, 那么就打印错误信息. 
TESTVARIABLES 

exit 0 
