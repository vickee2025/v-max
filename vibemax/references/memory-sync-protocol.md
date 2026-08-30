# Universal Memory Sync Protocol for Multi-IDE AI Agents

This protocol defines the exact non-destructive instructions injected into repository AI memory files (`GEMINI.md`, `CLAUDE.md`, `.cursorrules`, `.agents/rules/vibe-docs.md`, and `.github/copilot-instructions.md`).

---

## The Master Injection Template

```markdown
<!-- BEGIN VIBEMAX LIVING DOCS -->
## 📚 Living Documentation & Architectural Truth (Vibemax)
This repository maintains 6 living documents in `docs/` as the single source of truth:
- **Product Context**: `docs/prd.md`
- **Tech Stack & Guardrails**: `docs/trd.md`
- **Screen Navigation & User Flow**: `docs/app-flow.md`
- **UI/UX & Design Tokens**: `docs/ui-ux-spec.md`
- **Data Architecture & DB Schema**: `docs/backend-schema.md`
- **Living Roadmap & Sprints**: `docs/implementation-plan.md`

### ⚡ Mandatory Living Documentation Rules for AI Agents:
1. **Read First**: Before starting any task, read the corresponding doc in `docs/` to ensure full alignment with project architecture, design tokens, and route integrity.
2. **Update on Change**: Whenever you create or modify routes, database tables/columns, UI styles, or project dependencies, you MUST update the corresponding file in `docs/` before ending your turn.
3. **Roadmap Sync**: Mark completed tasks `[x]` in `docs/implementation-plan.md` and stage the next immediate task.
<!-- END VIBEMAX LIVING DOCS -->
```

---

## File-Specific Adapter Targets

| File Target | AI Platform / Tool | Location | Merging Strategy |
| :--- | :--- | :--- | :--- |
| `GEMINI.md` | Google Antigravity & Gemini CLI | Project Root | Append or update between comment boundaries |
| `CLAUDE.md` | Anthropic Claude Code | Project Root | Append or update between comment boundaries |
| `.cursorrules` | Cursor IDE | Project Root | Append or update between comment boundaries |
| `.agents/rules/vibe-docs.md`| Antigravity Project Rule | Project `.agents/rules/` | Standalone modular rule file |
| `.github/copilot-instructions.md` | GitHub Copilot Workspace | `.github/` | Append or update between comment boundaries |
