#! /bin/shell

#======================================================================
# 查询目标文件夹下目标文件，并删除之。
#
# author: chenlong
# date: 2020-06-23
#======================================================================

find $1 \( -name "*.iml" -or -name ".flattened-pom.xml" -or -name ".DS_Store" -or -name ".idea" -or -name "target" -or -name "*.log" \) -print | xargs rm -r
