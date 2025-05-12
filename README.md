# 🕒 Automate Your Local Tasks on macOS with `cron-runner`

> https://github.com/alucPro/cron-runner

Automating local scripts shouldn't feel like writing a rocket launch sequence. If you've ever felt that `cron` on macOS is powerful but clunky, this post is for you.

Let me walk you through how I set up a simple and clean local task automation system using `cron`, shell scripts, and a few helpful tricks — all wrapped into a project called [`cron-runner`](https://github.com/alucPro/cron-runner).

---

## 💡 Why `cron-runner`?

macOS comes with `cron`, a powerful task scheduler. Yet managing logs, environment variables, and task visibility can quickly become messy. That’s where `cron-runner` comes in:

- 🗓️ Schedule scripts easily (e.g., every 8 hours, daily)
- 📄 Log all outputs with timestamps
- 📂 Use a clean project structure
- 🧠 Define a global `$REPO_HOME` to avoid hardcoding paths
- 🛠️ Works with both Shell and Node.js

---

## 📦 Project Layout

```
$REPO_HOME/
└── cron-runner/
    ├── run.sh                 # Shell task runner with logging
    ├── run.js                 # Optional Node.js version
    ├── set-repo-home.sh       # Sets REPO_HOME in ~/.zshrc
    ├── cron-logs/             # Where logs live
    └── scripts/
        └── backup.sh          # Runs obsidian_digital_garden_push
```

---

## 🛠 Step-by-Step Setup

### 1. Clone the Repo

```bash
git clone https://github.com/alucPro/cron-runner.git
cd cron-runner
```

### 2. Set `$REPO_HOME`

This defines the parent directory of `cron-runner`.

```bash
./set-repo-home.sh
source ~/.zshrc
```

You can now reference your project with `$REPO_HOME/cron-runner` anywhere — including cron jobs.

---

### 3. Add Your Task Script

For example, the `backup.sh` script looks like this:

```bash
#!/bin/bash
source "$HOME/.zshrc"
echo "Running Obsidian Push at $(date)"
obsidian_digital_garden_push
```

Make it executable:

```bash
chmod +x scripts/backup.sh
```

---

### 4. Schedule It with Cron

To run every 8 hours and once daily at 2 AM, edit your crontab:

```bash
crontab -e
```

Add:

```cron
# Every 8 hours
0 */8 * * * /bin/zsh -c "source $HOME/.zshrc && /bin/bash $REPO_HOME/cron-runner/run.sh 'Obsidian Sync - 8h' '$REPO_HOME/cron-runner/scripts/backup.sh'"

# Daily at 2AM
0 2 * * * /bin/zsh -c "source $HOME/.zshrc && /bin/bash $REPO_HOME/cron-runner/run.sh 'Obsidian Daily Backup' '$REPO_HOME/cron-runner/scripts/backup.sh'"
```

---

## 📈 How to Monitor and Manage

### 🧾 View all cron jobs

```bash
crontab -l
```

### 🛑 Remove all cron jobs

```bash
crontab -r
```

### 🔍 See what’s running now

```bash
ps aux | grep backup.sh
```

### 📜 Check logs

```bash
tail -f $REPO_HOME/cron-runner/cron-logs/cron-$(date '+%Y-%m-%d').log
```

---

## 🚀 Why It Works

The `cron-runner` project simplifies your local job automation:

- No need to hardcode paths
- All logs are centralized
- Shell and Node.js support
- Easy to expand with more custom tasks

---

## 📎 Try It Yourself

If you want a clean and extensible way to run local cron jobs with full control and visibility, check out [`cron-runner`](https://github.com/alucPro/cron-runner).

Let automation work for you — not the other way around.

---

✍️ Written by a developer who wanted to stop debugging cron in the dark.

Happy hacking!
