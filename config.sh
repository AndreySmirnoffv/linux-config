#!/bin/bash

# Список команд
commands=(
    "sudo apt update"
    "sudo apt upgrade -y"
    "sudo apt install nodejs npm git dkms -y"
    "echo 'deb http://developer.download.nvidia.com/compute/cuda/repos/debian$(lsb_release -rs)/x86_64 /' | sudo tee -a /etc/apt/sources.list"
    "sudo apt install nvidia-driver -y"
    "git clone https://github.com/morrownr/8812au-20210820"
    "cd 8812*"
    "sudo dkms make install"
    "sudo reboot"
)

for cmd in "${commands[@]}"; do
    echo "Выполняется: $cmd"
    eval "$cmd"

    if [ $? -eq 0 ]; then
        echo "Команда '$cmd' выполнена успешно!"
    else
        echo "Команда '$cmd' не выполнена. Выполните вручную."
        exit 1
    fi

    echo "--------------"
done
