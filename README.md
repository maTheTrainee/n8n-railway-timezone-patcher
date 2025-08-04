# n8n Timezone Patcher for Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/5xpV_y?referralCode=LYVezg)

A lightweight Railway container that automatically updates the timezone setting of every workflow in your self-hosted n8n instance.

## ✨ Why?

By default, new workflows in n8n are set to `America/New_York`, which can lead to unexpected behavior for users in other regions. This patcher ensures all workflows use your preferred IANA timezone (e.g. `Europe/Stockholm`, `Asia/Tokyo`, `Etc/UTC`).

## 🔧 What it Does

- Uses the n8n REST API to scan all workflows
- Updates workflows where `settings.timezone` is missing or incorrect
- Runs automatically on a schedule (default: every 10 minutes)

---

## 🚀 How to Use

1. Click the **Deploy on Railway** button
2. Set the required environment variables:
   - `N8N_API_URL` – full URL to your n8n instance (e.g. `https://n8n.example.com` or internal hostname like `http://primary.railway.internal`)
   - `N8N_API_KEY` – your personal API key (from Settings → Personal Settings)
   - `TIMEZONE` – your preferred IANA timezone (e.g. `Europe/Berlin`)

> ✅ If your patcher and n8n instance are in the **same Railway project**, you can use the internal hostname (e.g. `http://primary.railway.internal`) **without specifying a port**. Railway will automatically route the request internally.

3. (Optional) Go to Railway’s **Settings → CRON** tab and add a schedule to run the patcher every 10 minutes:

```cron
*/10 * * * *
```

---

## 🌍 Supported Timezones

This patcher supports any [IANA timezone](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones) accepted by n8n/Node.js. Common examples include:

- `Europe/Stockholm`
- `America/New_York`
- `Asia/Tokyo`
- `Etc/UTC`
- `Pacific/Auckland`

---

## 🛡️ Secrets

Railway treats environment variables as secrets by default. Your `N8N_API_KEY` will never appear in logs or builds.

---

## 🧩 Common Use Cases

- Fix timezone mismatches in newly created workflows
- Avoid accidental scheduling errors
- Keep workflows consistent across teams and deployments

---

## 📦 Works Great With

- Railway CLI container deploys
- Dockerized n8n instances
- Self-hosted environments (behind proxies or domains)

---

## 🪪 License

MIT — use freely, improve, and contribute!

Maintained by: [maTheTrainee](https://github.com/maTheTrainee)
