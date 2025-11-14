#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <profile>"
    exit 1
fi

PROFILE="profiles/$1"

if [ ! -d "$PROFILE" ]; then
    echo "Profile '$1' not found in profiles/"
    exit 1
fi

echo "Applying profile: $1"

# 1. Copy APT sources
if [ -f core/system-config/sources.list ]; then
    echo "Installing sources.list..."
    cp core/system-config/sources.list /etc/apt/sources.list
fi

# 2. Install base packages
if [ -f core/essential-packages/base.list ]; then
    echo "Installing base packages..."
    xargs -a core/essential-packages/base.list apt-get install -y
fi

# 3. Install profile packages
if [ -f "$PROFILE/packages.list" ]; then
    echo "Installing profile packages..."
    xargs -a "$PROFILE/packages.list" apt-get install -y
fi

# 4. Apply profile config overrides
if [ -d "$PROFILE/config" ]; then
    echo "Applying profile config..."
    cp -rT "$PROFILE/config" /
fi

# 5. Run hooks
if [ -d "$PROFILE/hooks" ]; then
    echo "Running profile hooks..."
    for hook in "$PROFILE/hooks"/*.sh; do
        if [ -x "$hook" ]; then
            echo "Executing hook: $(basename "$hook")"
            "$hook"
        fi
    done
fi

echo "Profile '$1' applied successfully."
