#!/bin/bash
file_menu(){
 while true;do
        dialog --colors --menu "\Z1\Zb文件类" 15 38 8 1 "ls(列出目录内容)" 2 "pwd(显示当前目录)" 3 "mkdir(创建目录)" 4 "mv(移动/重命名文件)" 5 "find(查找文件)" 6 "rm(删除文件)" 7 "file(查看文件类型)" 8 "touch(创建空文件/更新时间)" 9 "cat(查看文件内容)" 10 "head(显示文件头部)" 11 "tail(显示文件尾部)" 12 "grep(文本搜索)" 13 "cp(复制文件)" 14 "rmdir(删除空目录)" 15 "tree(树状显示目录结构)" 16 "ldd(查看依赖库)" 17 "readelf(查看文件架构)" 18 "chmod(赋文件权限)" 19 "echo(打印到终端)" 20 "vim(文本编辑器)" 21 "\Z2\Zb返回上一级" 2> $temp
        if [ $? -ne 0 ];then
            clear
            break
        fi
        choice=$(cat $temp)
        case $choice in
            1)
                option_usage ls File;;
            2)
                option_usage pwd File;;
            3) 
                option_usage mkdir File;;
            4)
                option_usage mv File;;
            5)
                option_usage find File;;
            6) 
                option_usage rm File;;
            7)
                option_usage file File;;
            8)
                option_usage touch File;;
            9)
                option_usage cat File;;
            10)
                option_usage head File;;
            11)
                option_usage tail File;;
            12)
                option_usage grep File;;
            13)
                option_usage cp File;;
            14)
                option_usage rmdir File;;
            15)
                option_usage tree File;;
            16)
                option_usage ldd File;;
            17)
                option_usage readelf File;;
            18)
                option_usage chmod File;;
            19)
                option_usage echo File;;
            20)
                option_usage vim File;;
            21)
                return;;
        esac
        
done
}
