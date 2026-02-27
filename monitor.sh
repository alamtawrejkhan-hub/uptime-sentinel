#!/bin/bash

# --- CONFIGURATION ---
WEBHOOK_URL="https://discord.com/api/webhooks/1476869104810856448/xpHEhWOXvPDYDw68bMvFoeLjkm1eTuvF8htCBklV3z1r9pD5iehTeehwHekqKiAsNdUJ"
WEBSITES=("https://google.com" "https://github.com" "https://bing.com")
OUTPUT_FILE="index.html"

# --- DASHBOARD HEADER ---
cat <<EOF > $OUTPUT_FILE
<html>
<head>
    <title>DevOps Status Dashboard</title>
    <style>
        body { font-family: sans-serif; background: #121212; color: white; text-align: center; }
        .grid { display: flex; justify-content: center; gap: 20px; margin-top: 50px; }
        .card { padding: 20px; border-radius: 10px; width: 150px; font-weight: bold; }
        .up { background: #2ecc71; }
        .down { background: #e74c3c; }
    </style>
</head>
<body>
    <h1>🚀 Service Uptime Monitor</h1>
    <p>Last Checked: $(date)</p>
    <div class="grid">
EOF

# --- CHECKING LOGIC ---
for site in "${WEBSITES[@]}"; do
    # Check if site is up
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" "$site")

    if [ $STATUS -eq 200 ]; then
        COLOR="up"
        TEXT="ONLINE"
    else
        COLOR="down"
        TEXT="OFFLINE"
        # Discord notification
        curl -H "Content-Type: application/json" -X POST -d "{\"content\": \"🚨 ALERT: $site is DOWN (Status: $STATUS)\"}" $WEBHOOK_URL
    fi

    echo "<div class='card $COLOR'>$site<br>$TEXT</div>" >> $OUTPUT_FILE
done

# --- FOOTER ---
echo "</div></body></html>" >> $OUTPUT_FILE
echo "Done! Dashboard generated in index.html"
