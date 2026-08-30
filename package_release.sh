#!/usr/bin/env bash
# V-Max Package Release Script
# Copies the vibemax global skill and zips the entire distribution for Google Drive and GitHub

set -euo pipefail

RELEASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_SKILL_DIR="$HOME/.gemini/config/skills/vibemax"
TARGET_SKILL_DIR="$RELEASE_DIR/vibemax"
ZIP_OUTPUT="$RELEASE_DIR/vmax-skill-package.zip"

echo "📦 Packaging V-Max Release..."

# 1. Sync vibemax skill folder
rm -rf "$TARGET_SKILL_DIR"
cp -r "$GLOBAL_SKILL_DIR" "$TARGET_SKILL_DIR"
echo "✅ Copied latest global vibemax skill into release directory."

# 2. Make scripts executable
chmod +x "$TARGET_SKILL_DIR/install.sh"
chmod +x "$TARGET_SKILL_DIR/scripts/"*.py || true
chmod +x "$TARGET_SKILL_DIR/scripts/"*.sh || true

# 3. Create clean zip bundle
cd "$RELEASE_DIR"
rm -f "$ZIP_OUTPUT"
zip -r "$ZIP_OUTPUT" vibemax V-MAX_GUIDE.html README.md INSTAGRAM_REEL_LAUNCH_KIT.md -x "*.DS_Store" "*__pycache__*"
echo "🎉 Created $ZIP_OUTPUT successfully!"

echo "=================================================="
echo "✨ Public Release Bundle Ready at:"
echo "   $RELEASE_DIR"
echo "📦 ZIP file for Google Drive / GitHub Releases:"
echo "   $ZIP_OUTPUT"
echo "=================================================="
