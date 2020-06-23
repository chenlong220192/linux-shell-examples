#! /bin/shell

#======================================================================
# 查询$1路径下$2文件，然后执行相应逻辑操作。
#
# author: chenlong
# date: 2020-06-23
#======================================================================

function foreach_dir(){
  # find 查询所有目标文件
  files=`find $1 -iname $2`
  for file in $files
  do
    # 在此处处理文件
    # 获取目录 path=`dirname $file`
    echo "执行文件：$file"
    #echo `mvn -f $file clean package -Dmaven.test.skip=true`
    echo `mvn -f $file dependency:sources`
  done
}

# 执行
foreach_dir $1 $2
