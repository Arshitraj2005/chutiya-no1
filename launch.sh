#!/bin/bash

echo "🔍 Detecting Python interpreter..."
PYTHON=$(which python3)
echo "✅ Found Python: $PYTHON"

echo "📦 Installing requirements..."
$PYTHON -m pip install --upgrade pip
$PYTHON -m pip install -r requirements.txt

echo "🎬 Starting your streamer bot..."
SCRIPT_DIR=$(cd $(dirname "$0") && pwd)
$PYTHON "$SCRIPT_DIR/streamer/__main__.py" | tee logs.txt


echo "🕒 Syncing time..."
ntpdate -u time.cloudflare.com || echo "⚠️ Time sync failed"

