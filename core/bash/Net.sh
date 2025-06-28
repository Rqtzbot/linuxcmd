#!/bin/bash
net_menu(){
 while true;do
        dialog --colors --menu "\Z1\Zb网络类" 15 38 8 1 "curl(数据传输工具HTTP/FTP等)" 2 "weget(下载文件)" 3 "ifconfig(查看/配置网络接口)" 4 "lsof(列出被进程打开的文件)" 5 "netstat(显示网络连接/路由表/接口统计)" 6 "ping(测试网络连通性)" 7 "route(查看/配置路由表)" 8 "scp(远程安全拷贝文件)" 9 "ss(查看网络连接)" 10 "ssh(远程登录安全协议)"  11 "traceroute(跟踪数据包路径)" 12 "ethtool(查看/配置网卡参数)" 13 "" 14 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1)
                option_usage curl Net;;
            2)
                option_usage weget Net;;
            3) 
                option_usage ifconfig Net;;
            4)
                option_usage lsof Net;;
            5)
                option_usage netstat Net;;
            6) 
                option_usage ping Net;;
            7)
                option_usage route Net;;
            8)
                option_usage scp Net;;
            9)
                option_usage ss Net;;
            10)
                option_usage ssh Net;;
            11)
                option_usage traceroute Net;;
            12)
                option_usage ethtool Net;;
            # 13)
            #     option_usage pkill Net;;
            14)
                return;;
        esac
        
done
}