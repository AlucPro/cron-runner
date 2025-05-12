# cron-runner

A cron runner

## Dir

```Bash
local-cron-runner/
├── scripts/
│   ├── backup.sh            # 示例 shell 脚本任务
│   └── test.js              # 示例 Node.js 任务
├── run.sh                   # Shell 执行器（推荐使用）
├── run.js                   # Node.js 执行器（可选）
└── cron-logs/               # 日志目录（脚本自动创建）

```

## Guide

1. Add exe permission to all shell and js file (first time);

```Bash
chmod +x xxx.js
chmod +x xxx.sh
```

2. set repo path as `REPO_HOME`;

```Bash
./set-repo-home.sh
```

3. edit `scripts/backup.sh` to add your cron task here;

4. set system crontab to start this shell;

start cron;

```Bash
crontab -e
```

edit and add task;

```
# 每天 02:00 执行一次作为每日备份
0 2 * * * /bin/zsh -c "source $HOME/.zshrc && /bin/bash $REPO_HOME/cron-runner/run.sh 'Obsidian 每日备份' '$REPO_HOME/cron-runner/scripts/backup.sh'"
```

5. more

```shell
# view all crontab
crontabl -l

# cancel or edit task: -e into edit
crontab -e

# view log
tail -f $REPO_HOME/cron-runner/cron-logs/cron-$(date '+%Y-%m-%d').log
```
