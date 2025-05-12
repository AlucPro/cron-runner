#!/bin/bash

# 时间戳
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG_DIR="$REPO_HOME/cron-runner/cron-logs"
LOG_FILE="$LOG_DIR/cron-$(date '+%Y-%m-%d').log"
CMD_DESC=$1
shift
CMD="$@"

mkdir -p "$LOG_DIR"

# 日志记录
{
  echo "[$TIMESTAMP] PID: $$"
  echo "[$TIMESTAMP] Executing: $CMD_DESC"
  echo "[$TIMESTAMP] --- Start Output ---"
  eval "$CMD"
  echo "[$TIMESTAMP] --- End Output ---"
  echo ""
} >> "$LOG_FILE" 2>&1
