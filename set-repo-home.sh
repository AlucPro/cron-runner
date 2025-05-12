#!/bin/bash

# 获取当前脚本所在的目录（即 local-cron-runner 目录）
PROJECT_DIR="$(cd "$(dirname "$0")"; pwd)"

# 获取它的上一级目录，作为 REPO_HOME
REPO_HOME="$(dirname "$PROJECT_DIR")"

# 要写入的环境变量行
EXPORT_LINE="export REPO_HOME=\"$REPO_HOME\""

# 写入目标文件
ZSHRC="$HOME/.zshrc"

# 检查是否已经存在 REPO_HOME 定义
if grep -q "REPO_HOME=" "$ZSHRC"; then
  echo "❗ 检测到 REPO_HOME 已存在，正在替换..."
  sed -i '' "s|^export REPO_HOME=.*|$EXPORT_LINE|" "$ZSHRC"
else
  echo "✅ 添加 REPO_HOME 到 $ZSHRC"
  echo -e "\n# 设置项目上级目录为 REPO_HOME\n$EXPORT_LINE" >> "$ZSHRC"
fi

echo "🎉 设置完成！REPO_HOME = $REPO_HOME"
echo "👉 请执行：source ~/.zshrc 以使变量生效"
