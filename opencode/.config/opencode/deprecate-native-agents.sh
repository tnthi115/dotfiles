#!/bin/bash
# OAC Native Agent Deprecation Script
# Run this to hide/archive native agents you don't need anymore

cd ~/dotfiles/opencode/.config/opencode

# Create archive directory
mkdir -p agent/.archive
mkdir -p agents/.archive

echo "=== OAC Native Agent Deprecation Script ==="
echo ""
echo "This will archive native agents that OAC replaces."
echo "Agents will be moved to .archive/ directories (not deleted)."
echo ""

# Agents that OAC OpenCoder replaces
OAC_REPLACED=(
    "agent/planner.md"
    "agent/executor.md"
    "agent/code-reviewer.md"
    "agent/plan-reviewer.md"
    "agents/planner.md"
    "agents/executor.md"
    "agents/code-reviewer.md"
    "agents/plan-reviewer.md"
)

# Agents to KEEP (OAC doesn't replace these)
KEEP=(
    "agent/commit.md"
    "agent/docs-writer.md"
    "agent/git-master.md"
    "agents/commit.md"
    "agents/docs-writer.md"
    "agents/git-master.md"
)

echo "Agents that will be ARCHIVED (OAC replaces these):"
for agent in "${OAC_REPLACED[@]}"; do
    if [ -f "$agent" ]; then
        echo "  - $agent"
    fi
done

echo ""
echo "Agents that will be KEPT (OAC doesn't replace these):"
for agent in "${KEEP[@]}"; do
    if [ -f "$agent" ]; then
        echo "  - $agent"
    fi
done

echo ""
read -p "Proceed with archiving? (yes/no): " confirm

if [ "$confirm" != "yes" ]; then
    echo "Aborted. No changes made."
    exit 0
fi

echo ""
echo "Archiving agents..."

# Archive from agent/
for agent in "${OAC_REPLACED[@]}"; do
    if [ -f "$agent" ]; then
        echo "  Archiving: $agent"
        mv "$agent" "agent/.archive/"
    fi
done

# Archive from agents/ (if different from agent/)
for agent in agents/planner.md agents/executor.md agents/code-reviewer.md agents/plan-reviewer.md; do
    if [ -f "$agent" ]; then
        echo "  Archiving: $agent"
        mv "$agent" "agents/.archive/"
    fi
done

echo ""
echo "Restowing configuration..."
cd ~/dotfiles
stow --restow opencode

echo ""
echo "=== Done ==="
echo ""
echo "Native agents archived. OAC agents are now primary."
echo ""
echo "To restore native agents later:"
echo "  cd ~/dotfiles/opencode/.config/opencode"
echo "  mv agent/.archive/* agent/"
echo "  mv agents/.archive/* agents/"
echo "  cd ~/dotfiles && stow --restow opencode"
echo ""
echo "Current agent status:"
echo "  OAC agents: agent/core/"
ls agent/core/ 2>/dev/null | sed 's/^/    - /'
echo ""
echo "  Native agents (kept): agent/"
ls agent/*.md 2>/dev/null | xargs -n1 basename | sed 's/^/    - /'
echo ""
echo "  Native agents (archived): agent/.archive/"
ls agent/.archive/*.md 2>/dev/null | xargs -n1 basename | sed 's/^/    - /'
