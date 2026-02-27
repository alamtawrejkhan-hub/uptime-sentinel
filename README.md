# 🚀 Uptime Sentinel: Automated Service Monitor

A lightweight, automated DevOps monitoring tool that tracks website health and generates a live status dashboard. Built to demonstrate **Infrastructure Monitoring** and **CI/CD Automation**.

## 🌐 [Live Dashboard Link]
> **Check the status here:** [https://alamtawrejkhan-hub.github.io/uptime-sentinel/](https://alamtawrejkhan-hub.github.io/uptime-sentinel/)

---

## ✨ Features
* **Real-time Monitoring:** Checks multiple URLs for HTTP 200 status codes.
* **Automated Dashboard:** Generates a clean, dark-themed HTML status page.
* **Instant Discord Alerts:** Sends 🚨 notifications via Webhooks if a service goes down.
* **Cloud Automation:** Powered by **GitHub Actions** to run hourly (24/7) without local machine dependency.

---

## 🛠️ Tech Stack
* **Scripting:** Bash (Shell Scripting)
* **Environment:** Ubuntu (WSL 1)
* **Automation:** GitHub Actions (Cron Jobs)
* **Version Control:** Git & GitHub
* **Alerts:** Discord Webhooks

---

## 🏗️ How it Works (The Workflow)
1.  **Trigger:** GitHub Actions runs the `monitor.sh` script every hour.
2.  **Execution:** The script uses `curl` to check website availability.
3.  **Alerting:** If a site fails, a POST request is sent to the Discord Webhook.
4.  **Deployment:** The script updates `index.html`, and GitHub Pages automatically hosts the latest version.



---

## 🚀 How to Set Up
1. Clone the repo: `git clone https://github.com/alamtawrejkhan-hub/uptime-sentinel.git`
2. Add your Discord Webhook in GitHub Secrets as `DISCORD_WEBHOOK`.
3. Enable **GitHub Pages** in settings pointing to the `main` branch.

---

### 👨‍💻 Author
**Alam**
*DevOps & Automation Enthusiast*
