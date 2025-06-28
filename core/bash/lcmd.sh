#!/bin/bash
temp=$(mktemp /tmp/dialog.XXXXXX)
source /home/$USER/linuxcmd/core/bash/File.sh 
source /home/$USER/linuxcmd/core/bash/Zip.sh 
source /home/$USER/linuxcmd/core/bash/Net.sh 
source /home/$USER/linuxcmd/core/bash/System.sh 
source /home/$USER/linuxcmd/core/bash/Text.sh

main_menu(){
    while true;do
        dialog --colors --menu "\Z1\ZbLinux命令中文解释" 11 30 4 1 "查询linux命令用法" 2 "更新linux命令用法" 3 "关于" 4 "\Z2\Zb退出" 2> $temp 
        choice=$(cat $temp)
        case $choice in
            1) 
                two_menu1
                ;;
            2)
                two_menu2
                ;;
            3)
                two_menu3
                ;;
            4)
                clear
                break
                ;;
        esac
done
}
two_menu1(){
    while true;do
        dialog  --colors --menu "\Z1\Zb查询linux命令用法" 14 30 9 1 "搜索" 2 "文件类" 3 "系统管理类" 4 "文本处理类" 5 "网络类" 6 "压缩与归档类" 7 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1) serach_menu;;
            2) file_menu;;
            3) system_menu;;
            4) text_menu;;
            5) net_menu;;
            6) zip_menu;;
            7) return ;;
        esac
done
    
}
two_menu2(){
    while true;do
        dialog --yesno "确定更新吗？" 10 40 
        if [ $? -ne 0 ];then
            clear
            break
        else 
          val="bash /home/$USER/linuxcmd/update.sh"
          mingling_output "$val" 25 66
          break
        fi
     
done
}
two_menu3(){
    while true;do
        dialog --title "命令输出" --msgbox "CSDN:https://blog.csdn.net/m0_75192474?type=blog\ngithup:https://www.githup.com/Rqtzbot" 7 55
        break
done
}
serach_menu(){
    while true;do
        dialog --title "搜索" --inputbox "请输入您要搜索的linux命令" 10 40 2>$temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        if [ -z "$choice" ];then
            dialog --title "警告" --msgbox "输入不能为空" 8 35 
        else
            cmd="find /home/$USER/linuxcmd/core/command -name $choice"
            #若变量中含有空格，必须要加引号来表示包含空格
            mingling_output "$cmd" 8 40 
        fi
done
}
mingling_output(){
    temp_file=$(mktemp)
    trm="$1"
    $trm > $temp_file 2>&1
    dialog --title "命令输出" --textbox "$temp_file" $2 $3
    rm -f "$temp_file"
}
spectic_usage(){
    list=()
    line=$(awk 'END {print NR}' /home/$USER/linuxcmd/core/command/$2/$1/2.txt)
    # echo $line
    for((i=1;i<=$line;i++));do
        list+=("$(sed -n "$i p" /home/$USER/linuxcmd/core/command/$2/$1/2.txt)")
        done
    # echo ${list[0]}
    # echo ${list[1]}
    while true;do
        # 提取每行字符数
        col_list=()
        for((k=0;k<5;k++));do
            tmp="${list[k]}"
            col_list+=("$(echo "$tmp" | wc -m )")
        done
        #擂台法比较出最大那一行字符数
        val="${col_list[0]}"
        for((k=0;k<4;k++));do
            if [  $val -lt "${col_list[k+1]}" ];then
                 val="${col_list[k+1]}"
            fi
        done
        # 按照字符数大小来选择窗口宽
        weight=$(($val * 2))
         #读取到数组中
        dialog --colors --menu "\Z1\Zb查询具体用法" 13 $weight 8 1 "${list[0]}" 2 "${list[1]}" 3 "${list[2]}" 4 "${list[3]}" 5 "${list[4]}" 6 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1)
                mingling_output "$(echo "${list[0]}" | cut -d "(" -f 1)" 25 66;;
            2)
                mingling_output "$(echo "${list[1]}" | cut -d "(" -f 1)" 25 66;;
            3)
                mingling_output "$(echo "${list[2]}" | cut -d "(" -f 1)" 25 66;;
            4)
                mingling_output "$(echo "${list[3]}" | cut -d "(" -f 1)" 25 66;;
            5)
                mingling_output "$(echo "${list[4]}" | cut -d "(" -f 1)"25 66;;
            6)
                break;;
        esac
    done
}
option_usage(){
    while true;do
        dialog --colors --menu "\Z1\Zb用法" 10 30 8 1 "查询选项用法" 2 "查询具体用法" 3 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1)
                dialog --title "$1 命令选项用法"  --textbox /home/$USER/linuxcmd/core/command/$2/$1/1.txt 18 45;;
            2)
                spectic_usage $1 $2;;
            3)
                return;;
        esac
    done
}
main_menu
rm -f /tmp/dialog.*
