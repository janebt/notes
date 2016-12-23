#!bin/bash
#  在一个"tarball"中(经过tar和gzip处理过的文件) 
#+ 备份最后24小时当前目录下的所有修改的文件. 

BACKUPFILE=backup-$(date +%m-%d-%Y)
archive=${1:-$BACKUPFILE}
#果在命令行中没有指定备份文件的文件名, 
#+ 那么将默认使用"backup-MM-DD-YYYY.tar.gz".

#tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
#gzip $archive.tar
#echo "Directory $PWD backed up in archive file \"$archive.tar.gz\"."

find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"
exit 0
