#!/bin/bash
dir="/home/$USER/linuxcmd/core"
if [ -d "$dir" ]; then
	echo "正在安装图形依赖与网络下载工具........"
	sudo apt install dialog
	sudo apt install wget
	if [ $? -ne 0 ];then
		echo "图形依赖/网络下载工具安装失败，检查网络....."
		exit 0
	else
		echo "图形依赖安装完成........"
	fi
	sudo chmod +r $dir/bash/File.sh $dir/bash/System.sh $dir/bash/Text.sh /home/$USER/linuxcmd/core/bash/Zip.sh  
	sudo chmod 777 $dir/bash/lcmd.sh /home/$USER/linuxcmd/update.sh
	val=$dir/bash/lcmd.sh
	echo "alias lcmd='source $val'" >> ~/.bashrc
	source ~/.bashrc
	echo "--------------------------------------------------"
	echo "配置完成，重启终端后，输入lcmd执行linux命令学习脚本"
else
	echo "未在主目录检测到linuxcmd，请将其移动到主目录"
fi