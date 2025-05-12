#!/bin/bash

# 设置环境变量（保险起见）
source "$HOME/.zshrc"

# 日志提示
echo "开始执行 Obsidian Digital Garden Push..."
echo "当前时间：$(date)"

# 执行同步命令
obsidian_digital_garden_push

# 结束提示
echo "任务完成"
