#!/bin/bash

# Define the path to your Git repository
REPO_DIR="/path/to/your/repo"
# Telegram bot token and chat ID
TELEGRAM_BOT_TOKEN="YOUR_TELEGRAM_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"

# Function to send a message via Telegram
send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d "chat_id=$CHAT_ID&text=$message&parse_mode=Markdown"
}

# Change to the repository directory
cd "$REPO_DIR" || { echo "Repository not found!"; exit 1; }

# Fetch the latest changes from the remote
git fetch

# Check if there are any updates
if [ $(git rev-list HEAD...origin/main --count) -gt 0 ]; then
    echo "New version available. Checking out the latest version..."
    git checkout main
    git pull origin main
    send_telegram_message "New version deployed in the repository: $REPO_DIR"
else
    echo "No new version available."
fi
