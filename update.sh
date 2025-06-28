#!/bin/bash
dir1="/home/$USER/linuxcmd/core/"
if [ -d "$dir1" ]; then
    echo "命令目录存在............"
    #rm -vrf $dir1
    mv /home/$USER/linuxcmd/core/ /home/$USER/linuxcmd/core_old/
    cd /home/$USER/linuxcmd && wget -O core.zip https://gitee.com/rqtzbot/linuxcmd_/repository/archive/master.zip
    if [ $? -ne 0 ];then
        echo "下载命令更新库失败"
        mv /home/$USER/linuxcmd/core_old/ /home/$USER/linuxcmd/core/
        exit 0
    else
        echo "下载命令更新库成功"
        unzip /home/$USER/linuxcmd/core.zip
        if [ $? -ne 0 ];then
            echo "解压命令更新库失败"
        else 
            echo "解压命令更新库成功"
            echo "命令更新成功！"
        fi
        mv linuxcmd_-master/ core/
        rm core.zip 
    fi
    
    
else 
    echo "命令目录不存在，请linuxcmd包放在主目录" 
    exit 0
fi