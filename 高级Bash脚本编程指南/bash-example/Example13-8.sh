SIZE=1000000 # 1M 

head -c $SIZE < /dev/zero > file   # 建立指定尺寸的文件. 
losetup /dev/loop0 file # 作为loopback 设备来建立. 
mke2fs /dev/loop0 # 创建文件系统. 
mount -o loop /dev/loop0 /mnt      # Mount它. 

# Thanks, S.C. 
