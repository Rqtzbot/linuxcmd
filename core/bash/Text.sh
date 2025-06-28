#!/bin/bash
text_menu(){
 while true;do
        dialog --colors --menu "\Z1\Zb文本处理类" 15 38 8 1 "awk(文本分析处理)" 2 "cut(按列提取文本)" 3 "diff(比较文件差异)" 4 "pr(格式化打印文本)" 5 "sed(流编辑器)" 6 "sort(排序文本)" 7 "wc(统计文本数量)" 8 "" 9 "" 10 "" 11 "" 12 "" 13 "" 14 "" 15 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1)
                option_usage awk Text;;
            2)
                option_usage cut Text;;
            3) 
                option_usage diff Text;;
            4)
                option_usage pr Text;;
            5)
                option_usage sed Text;;
            6) 
                option_usage sort Text;;
            7)
                option_usage wc Text;;
            # 8)
            #     option_usage systemctl System;;
            # 9)
            #     option_usage uname System;;
            # 10)
            #     option_usage ps System;;
            # 11)
            #     option_usage last System;;
            # 12)
            #     option_usage which System;;
            # 13)
            #     option_usage who System;;
            # 14)
            #     option_usage pkill System;;
            15)
                return;;
        esac
        
done
}