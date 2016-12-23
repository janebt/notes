#!/bin/bash 

# Shell 命令可以包含Perl 脚本. 
echo "This precedes the embedded Perl script within \"$0\"." 
echo 
"============================================================
===" 

perl -e 'print "This is an embedded Perl script.\n";' 
# 像sed脚本, Perl 也使用"-e"选项. 

echo 
"============================================================
   ===" 
echo "However, the script may also contain shell and system commands." 

exit 0
