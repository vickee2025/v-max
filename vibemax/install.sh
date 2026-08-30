#!/usr/bin/env bash
# Vibemax Global Installer for Google Antigravity & Gemini CLI
# Installs vibemax into ~/.gemini/config/skills/vibemax/ and registers it globally

set -euo pipefail

DEST_DIR="$HOME/.gemini/config/skills/vibemax"
CONFIG_DIR="$HOME/.gemini/config"
SKILLS_JSON="$CONFIG_DIR/skills.json"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Installing Vibemax Skill globally..."

# 1. Create target directories
mkdir -p "$HOME/.gemini/config/skills"

# 2. Copy files if installing from external folder
if [ "$SCRIPT_DIR" != "$DEST_DIR" ]; then
    echo "📦 Copying Vibemax package to $DEST_DIR..."
    rm -rf "$DEST_DIR"
    cp -r "$SCRIPT_DIR" "$DEST_DIR"
fi

# 3. Make scripts executable
chmod +x "$DEST_DIR/scripts/audit-docs.py"
chmod +x "$DEST_DIR/scripts/init-vibe-memory.sh"
chmod +x "$DEST_DIR/install.sh"

# 4. Register in skills.json if needed
if [ ! -f "$SKILLS_JSON" ]; then
    cat << 'EOF' > "$SKILLS_JSON"
{
  "entries": [
    {
      "path": "~/.gemini/config/skills"
    }
  ]
}
EOF
    echo "✨ Initialized $SKILLS_JSON"
else
    # Ensure ~/.gemini/config/skills is listed
    if ! grep -q "~/.gemini/config/skills" "$SKILLS_JSON"; then
        python3 -c "
import json
with open('$SKILLS_JSON', 'r') as f:
    data = json.load(f)
if 'entries' not in data:
    data['entries'] = []
data['entries'].append({'path': '~/.gemini/config/skills'})
with open('$SKILLS_JSON', 'w') as f:
    json.dump(data, f, indent=2)
"
        echo "🔄 Registered ~/.gemini/config/skills in $SKILLS_JSON"
    fi
fi

echo "=================================================="
echo "🎉 Vibemax successfully installed globally!"
echo "📍 Location: $DEST_DIR"
echo "💡 Usage in Antigravity / Gemini CLI: Simply mention /vibemax or ask to 'vibemax this project'!"
echo "=================================================="
