#!/bin/bash
system_menu(){
 while true;do
        dialog --colors --menu "\Z1\Zb系统管理类" 15 38 8 1 "date(显示/设置系统时间)" 2 "df(显示磁盘空间)" 3 "du(磁盘使用情况)" 4 "free(显示内存使用)" 5 "kill(终止进程)" 6 "lscpu(显示CPU信息)" 7 "lsusb(显示USB设备)" 8 "top(动态显示进程)" 9 "systemctl(管理系统服务)" 10 "uname(显示系统信息)" 11 "ps(查看进程状态)" 12 "last(显示登录记录)" 13 "which(查找命令位置)" 14 "who(显示登录用户)" 15 "pkill(按名称终止进程)" 16 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1)
                option_usage date System;;
            2)
                option_usage df System;;
            3)
                option_usage du System;;
            4) 
                option_usage free System;;
            5)
                option_usage kill System;;
            6)
                option_usage lscpu System;;
            7) 
                option_usage lsusb System;;
            8)
                option_usage top System;;
            9)
                option_usage systemctl System;;
            10)
                option_usage uname System;;
            11)
                option_usage ps System;;
            12)
                option_usage last System;;
            13)
                option_usage which System;;
            14)
                option_usage who System;;
            15)
                option_usage pkill System;;
            16)
                return;;
        esac
        
done
}