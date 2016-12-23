# 以root身份... 

mkdir /mnt/cdtest   # 如果没有的话,准备一个mount点. 

mount -r -t iso9660 -o loop cd-image.iso /mnt/cdtest    # mount这个镜像. 
# "-o loop" option equivalent to "losetup /dev/loop0" 
cd /mnt/cdtest # 现在检查这个镜像. 
ls -alR # 列出目录树中的文件. 
# 等等. 
