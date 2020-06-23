#! /bin/shell

#======================================================================
# 查询$1路径下$2文件，然后执行相应逻辑操作。
# 并发执行任务
# 可以使用：`echo "" &` 形式进行并发操作，但是并发数可能较大，容易让机器负载打满。
# 使用令牌控制并发数
#
#
# author: chenlong
# date: 2020-06-23
#======================================================================

# Step1 创建有名管道
[ -e ./fd1 ] || mkfifo ./fd1

# 创建文件描述符，以可读（<）可写（>）的方式关联管道文件，这时候文件描述符3就有了有名管道文件的所有特性
exec 3<> ./fd1

# 关联后的文件描述符拥有管道文件的所有特性,所以这时候管道文件可以删除，我们留下文件描述符来用就可以了
rm -rf ./fd1

# Step2 创建令牌
for i in `seq 1 10`;
do
    # echo 每次输出一个换行符,也就是一个令牌
    echo >&3
done

# Step3 拿出令牌，进行并发操作
function foreach_dir(){
  # find 查询所有目标文件
  files=`find $1 -iname $2`
  for file in $files
  do
    # read 命令每次读取一行，也就是拿到一个令牌
    read -u3
    {
      # 在此处处理文件
      echo "执行文件：$file"
      #echo `mvn -f $file clean package -Dmaven.test.skip=true`
      echo `mvn -f $file dependency:sources`
      # 执行完一条命令会将令牌放回管道
      echo >&3
    }&
  done
}

# 执行
foreach_dir $1 $2

wait

exec 3<&-                       # 关闭文件描述符的读
exec 3>&-                       # 关闭文件描述符的写