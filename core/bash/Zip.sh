#!/bin/bash
zip_menu(){
 while true;do
        dialog --colors --menu "\Z1\Zb压缩与归档类" 15 38 8 1 "dpkg(安装/卸载.deb 格式软件包)" 2 "gzip(解压/生成.gz后缀压缩包)" 3 "unzip(解压 ZIP 格式文件)" 4 "zip(解压 ZIP 格式文件)" 5 "tar(打包 / 解包文件)" 6 "apt(Ubuntu/Debian系统的高级包管理器)" 7 "pip(Python 包管理器)" 8 "" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" 15 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1)
                option_usage dpkg zip;;
            2)
                option_usage gzip zip;;
            3) 
                option_usage unzip zip;;
            4)
                option_usage zip zip;;
            5)
                option_usage tar zip;;
            6) 
                option_usage apt zip;;
            7)
                option_usage pip zip;;
            # 8)
            #     option_usage scp zip;;
            # 9)
            #     option_usage ss zip;;
            # 10)
            #     option_usage ssh zip;;
            # 11)
            #     option_usage telnet zip;;
            # 12)
            #     option_usage traceroute zip;;
            # 13)
            #     option_usage ethtool zip;;
            # 14)
            #     option_usage pkill zip;;
            15)
                return;;
        esac
        
done
}