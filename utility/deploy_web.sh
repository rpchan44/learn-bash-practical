#!/bin/bash

# Define the path to your Git repository
REPO_DIR="webapp"

# Change to the repository directory
cd "$REPO_DIR" || { echo "Repository not found!"; exit 1; }

# Fetch the latest changes from the remote
git fetch

# Check if there are any updates
if [ $(git rev-list HEAD...origin/main --count) -gt 0 ]; then
    echo "New version available. Checking out the latest version..."
    git checkout main
    git pull origin main
else
    echo "No new version available."
fi
