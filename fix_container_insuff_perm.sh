#!/bin/bash

# ref https://github.com/NVIDIA/nvidia-docker/issues/1547
# 定义文件路径
FILE_PATH="/etc/nvidia-container-runtime/config.toml"

# 检查文件是否存在
if [ ! -f "$FILE_PATH" ]; then
    echo "Error: $FILE_PATH does not exist."
    exit 1
fi

# 使用sed命令注释掉所有包含"user = "的行，并在文件末尾添加新的user行
sed -i -e '/^user = "/ s/^/#/' -e '$a\user = "root:root"' "$FILE_PATH"

# 检查sed命令是否成功
if [ $? -eq 0 ]; then
    echo "Changes have been made to $FILE_PATH successfully."
else
    echo "Error: Failed to make changes to $FILE_PATH."
    exit 1
fi
