#!/usr/bin/env bash
# Vibemax Memory Initializer
# Non-destructively merges living document instructions into GEMINI.md, CLAUDE.md, and .cursorrules

set -euo pipefail

BLOCK_START="<!-- BEGIN VIBEMAX LIVING DOCS -->"
BLOCK_END="<!-- END VIBEMAX LIVING DOCS -->"

MEMORY_CONTENT="${BLOCK_START}
## 📚 Living Documentation & Architectural Truth (Vibemax)
This repository maintains 6 living documents in \`docs/\` as the single source of truth:
- **Product Context**: \`docs/prd.md\`
- **Tech Stack & Guardrails**: \`docs/trd.md\`
- **Screen Navigation & User Flow**: \`docs/app-flow.md\`
- **UI/UX & Design Tokens**: \`docs/ui-ux-spec.md\`
- **Data Architecture & DB Schema**: \`docs/backend-schema.md\`
- **Living Roadmap & Sprints**: \`docs/implementation-plan.md\`

### ⚡ Mandatory Living Documentation Rules for AI Agents:
1. **Read First**: Before starting any task, read the corresponding doc in \`docs/\` to ensure full alignment with project architecture, design tokens, and route integrity.
2. **Update on Change**: Whenever you create or modify routes, database tables/columns, UI styles, or project dependencies, you MUST update the corresponding file in \`docs/\` before ending your turn.
3. **Roadmap Sync**: Mark completed tasks \`[x]\` in \`docs/implementation-plan.md\` and stage the next immediate task.
${BLOCK_END}"

merge_memory_file() {
    local target_file="$1"
    local file_label="$2"

    if [ -f "$target_file" ]; then
        if grep -q "$BLOCK_START" "$target_file"; then
            # Replace existing block cleanly
            python3 -c "
import sys
content = open('$target_file', 'r').read()
start_marker = '$BLOCK_START'
end_marker = '$BLOCK_END'
start_idx = content.find(start_marker)
end_idx = content.find(end_marker) + len(end_marker)
if start_idx != -1 and end_idx != -1:
    new_content = content[:start_idx] + '''$MEMORY_CONTENT''' + content[end_idx:]
    open('$target_file', 'w').write(new_content)
"
            echo "🔄 Updated Vibemax block in existing $file_label ($target_file)"
        else
            # Append block non-destructively
            printf "\n\n%s\n" "$MEMORY_CONTENT" >> "$target_file"
            echo "➕ Appended Vibemax living doc guidelines to existing $file_label ($target_file)"
        fi
    else
        # Create new file with block
        printf "# Project Instructions\n\n%s\n" "$MEMORY_CONTENT" > "$target_file"
        echo "✨ Created $file_label ($target_file)"
    fi
}

echo "=================================================="
echo "   VIBEMAX UNIVERSAL AI MEMORY INITIALIZER        "
echo "=================================================="

# 1. Update GEMINI.md
merge_memory_file "GEMINI.md" "GEMINI.md"

# 2. Update CLAUDE.md
merge_memory_file "CLAUDE.md" "CLAUDE.md"

# 3. Update .cursorrules
merge_memory_file ".cursorrules" ".cursorrules"

# 4. Create Antigravity Modular Project Rule
mkdir -p ".agents/rules"
cat << 'EOF' > ".agents/rules/vibe-docs.md"
---
name: vibe-docs
description: Enforces continuous synchronization of the 6 living docs in docs/ on every development turn.
trigger: always_on
---

# Living Documentation Rules
Always reference `docs/` before making architectural, UI, route, or database changes.
Update `docs/prd.md`, `docs/trd.md`, `docs/app-flow.md`, `docs/ui-ux-spec.md`, `docs/backend-schema.md`, or `docs/implementation-plan.md` whenever making corresponding codebase modifications.
EOF
echo "✨ Initialized Antigravity rule in .agents/rules/vibe-docs.md"

echo "=================================================="
echo "✅ Universal memory initialization complete!"
