#!/bin/sh
set -e

# Ensure dataprotection folder exists and is owned by appuser
DATA_DIR="/home/appuser/.aspnet/DataProtection-Keys"
mkdir -p "$DATA_DIR"
chown -R appuser:appuser "$DATA_DIR" || true
# Optional: set permissive permissions
chmod -R 700 "$DATA_DIR" || true

# Run the app as appuser
exec su-exec appuser dotnet ChatBot.dll
