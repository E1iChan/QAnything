#! /bin/bash

do_cmd(){
    echo "$@"
    $@
    [[ $? -ne 0 ]] && echo "do_cmd failed" && exit 1
}

chat="MiniChat-2-3B"
model_dir="assets/custom_models"

[[ -d $model_dir/$chat ]] && echo "no need to add $model_dir/$chat" && exit 0
cd $model_dir
do_cmd git clone https://huggingface.co/GeneZC/$chat
[[ ! -d $chat ]] && echo "failed to add $model_dir/$chat" && exit 0

