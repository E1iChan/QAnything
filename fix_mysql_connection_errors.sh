#! /bin/bash

FILE_PATH="docker-compose-linux.yaml"
# 检查文件是否存在
if [ ! -f "$FILE_PATH" ]; then
    echo "Error: $FILE_PATH does not exist."
    exit 1
fi

# 使用awk和sed来插入--max-connections=10000到mysql服务定义中
awk '/^  mysql:/ {print; print "    command: --max-connections=10000"; next} {print}' $FILE_PATH > $FILE_PATH.tmp && mv $FILE_PATH.tmp $FILE_PATH

# 检查操作是否成功
if [ $? -eq 0 ]; then
    echo "--max-connections=10000 has been inserted into the mysql section of $FILE_PATH successfully."
else
    echo "Error: Failed to insert --max-connections=10000 into $FILE_PATH."
    exit 1
fi


