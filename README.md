# shell脚本学习记录
- filename.sh               输出$1文件的文件名和后缀
- find_rm.sh                查询$1目录下相关文件，删除之。
- foreach_dir.sh            查询$1路径下$2文件，然后执行相应逻辑操作。
- foreach_dir_parallel.sh   foreach_dir.sh的并发版本，通过令牌桶实现限流。
