#! /bin/shell

#======================================================================
# 上传当前目录下所有jar到nexus
# 该脚本需要在目标目录下执行
# $1 nexus账号
# $2 nexus密码
# $3 nexus仓库url
# 例：`sh upload_nexus.sh chenlong chenlong http://0.0.0.0:8081/repository/my_repo/`
#
# author: chenlong
# date: 2020-06-23
#======================================================================

`find . -type f -not -path '*/\.*' | sed "s|^\./||" | xargs -I '{}' curl -u "$1:$2" -X PUT -v -T {} $3/{}`
