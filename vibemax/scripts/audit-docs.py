#!/usr/bin/env python3
"""
Vibemax Documentation Audit & Drift Detector
Analyzes git status / diff against docs/ to ensure the 6 living documents are fresh.
"""

import os
import sys
import subprocess

REQUIRED_DOCS = [
    "docs/prd.md",
    "docs/trd.md",
    "docs/app-flow.md",
    "docs/ui-ux-spec.md",
    "docs/backend-schema.md",
    "docs/implementation-plan.md"
]

MAPPINGS = [
    (["app/api", "server/", "prisma/", "db/", "models/", "migrations/"], "docs/backend-schema.md", "Backend/DB Schema"),
    (["app/", "pages/", "routes/", "navigation"], "docs/app-flow.md", "App Flow / Routes"),
    (["components/ui", "styles/", "globals.css", "tailwind.config"], "docs/ui-ux-spec.md", "UI/UX Design Tokens"),
    (["package.json", "requirements.txt", "Cargo.toml", "go.mod", ".env"], "docs/trd.md", "Tech Stack & TRD")
]

def run_cmd(cmd):
    try:
        res = subprocess.run(cmd, shell=True, capture_output=True, text=True, check=False)
        return res.stdout.strip()
    except Exception as e:
        return ""

def main():
    print("==================================================")
    print("   VIBEMAX LIVING DOCUMENTATION AUDIT REPORT      ")
    print("==================================================")

    # Check existence of 6 docs
    missing_docs = []
    for doc in REQUIRED_DOCS:
        if not os.path.exists(doc):
            missing_docs.append(doc)

    if missing_docs:
        print("\n❌ MISSING LIVING DOCUMENTS:")
        for m in missing_docs:
            print(f"   - {m}")
        print("\n💡 Run Vibemax to initialize all 6 documents.")
    else:
        print("\n✅ All 6 living documents exist in docs/.")

    # Check Git Diff & Drift
    git_status = run_cmd("git status --porcelain")
    if not git_status:
        print("\n✨ Clean working tree. No uncommitted drift detected.")
        return 0

    modified_files = [line[3:].strip() for line in git_status.splitlines() if len(line) > 3]
    doc_changes = [f for f in modified_files if f.startswith("docs/")]
    code_changes = [f for f in modified_files if not f.startswith("docs/")]

    print(f"\n📊 Detected {len(code_changes)} modified code file(s) and {len(doc_changes)} doc update(s).")

    suggested_doc_updates = set()
    for code_file in code_changes:
        for patterns, target_doc, category in MAPPINGS:
            for pat in patterns:
                if pat in code_file:
                    suggested_doc_updates.add((target_doc, category, code_file))

    if suggested_doc_updates:
        print("\n⚠️  DETECTED ARCHITECTURAL / CODE DRIFT:")
        for target_doc, category, code_file in sorted(suggested_doc_updates):
            is_updated = target_doc in doc_changes
            status_icon = "✅ (Updated)" if is_updated else "❌ (Needs Sync)"
            print(f"   [{status_icon}] {category} -> Modified: {code_file} => Doc: {target_doc}")
    else:
        print("\n✅ No unmapped code modifications detected.")

    print("\n==================================================")
    return 0

if __name__ == "__main__":
    sys.exit(main())
