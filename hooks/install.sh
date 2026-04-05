#!/bin/bash

# Installation script for Claude Code git hooks
# Usage: ./install.sh [target-repo-path]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_REPO="${1:-.}"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Resolve to absolute path
TARGET_REPO=$(cd "$TARGET_REPO" && pwd)

# Check if target is a git repo
if [ ! -d "$TARGET_REPO/.git" ]; then
    echo -e "${RED}Error:${NC} $TARGET_REPO is not a git repository"
    exit 1
fi

HOOKS_DIR="$TARGET_REPO/.git/hooks"

echo "Installing Claude Code git hooks to: $TARGET_REPO"

# Install pre-push hook
if [ -f "$HOOKS_DIR/pre-push" ]; then
    echo "Backing up existing pre-push hook to pre-push.backup"
    mv "$HOOKS_DIR/pre-push" "$HOOKS_DIR/pre-push.backup"
fi

cp "$SCRIPT_DIR/pre-push" "$HOOKS_DIR/pre-push"
chmod +x "$HOOKS_DIR/pre-push"

echo -e "${GREEN}Successfully installed pre-push hook!${NC}"
echo ""
echo "The hook will:"
echo "  - Check for merge conflicts before pushing"
echo "  - Automatically spawn Claude to resolve conflicts if found"
echo ""
echo "To uninstall, run: rm $HOOKS_DIR/pre-push"
