#!/usr/bin/env node

const { exec } = require("child_process");
const fs = require("fs");
const path = require("path");

const logDir = path.join(process.env.HOME, "cron-logs");
if (!fs.existsSync(logDir)) fs.mkdirSync(logDir);

const timestamp = new Date().toISOString().replace("T", " ").substring(0, 19);
const logFile = path.join(
  logDir,
  `cron-${new Date().toISOString().slice(0, 10)}.log`
);

const desc = process.argv[2];
const cmd = process.argv.slice(3).join(" ");

fs.appendFileSync(logFile, `[${timestamp}] PID: ${process.pid}\n`);
fs.appendFileSync(logFile, `[${timestamp}] Executing: ${desc}\n`);
fs.appendFileSync(logFile, `--- Start Output ---\n`);

exec(cmd, (error, stdout, stderr) => {
  if (stdout) fs.appendFileSync(logFile, stdout);
  if (stderr) fs.appendFileSync(logFile, stderr);
  fs.appendFileSync(logFile, `--- End Output ---\n\n`);
});
