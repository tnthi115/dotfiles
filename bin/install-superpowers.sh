#!/usr/bin/env bash
# install-superpowers.sh - Install superpowers skills framework for OpenCode
#
# Superpowers provides workflow discipline (TDD, systematic debugging, planning)
# that complements oh-my-opencode's agent orchestration.
#
# Usage: ./install-superpowers.sh
#
# See: https://github.com/obra/superpowers

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SUPERPOWERS_DIR="$HOME/.config/opencode/superpowers"
PLUGINS_DIR="$HOME/.config/opencode/plugins"

echo -e "${GREEN}Installing superpowers for OpenCode...${NC}"
echo ""

# Step 1: Clone or update superpowers
if [[ -d "$SUPERPOWERS_DIR" ]]; then
    echo -e "${YELLOW}Updating existing superpowers installation...${NC}"
    cd "$SUPERPOWERS_DIR" && git pull
else
    echo "Cloning superpowers..."
    git clone https://github.com/obra/superpowers.git "$SUPERPOWERS_DIR"
fi

# Step 2: Create plugin symlink
echo "Creating plugin symlink..."
mkdir -p "$PLUGINS_DIR"
rm -f "$PLUGINS_DIR/superpowers.js"
ln -s "$SUPERPOWERS_DIR/.opencode/plugins/superpowers.js" "$PLUGINS_DIR/superpowers.js"

# Verify installation
echo ""
echo -e "${GREEN}Verifying installation...${NC}"

if [[ -L "$PLUGINS_DIR/superpowers.js" ]]; then
    echo -e "  ${GREEN}✓${NC} Plugin symlink created"
else
    echo -e "  ${RED}✗${NC} Plugin symlink missing"
    exit 1
fi

if [[ -d "$SUPERPOWERS_DIR/skills" ]]; then
    echo -e "  ${GREEN}✓${NC} Skills directory found"
else
    echo -e "  ${RED}✗${NC} Skills directory missing"
    exit 1
fi

# Count available skills
SKILL_COUNT=$(find "$SUPERPOWERS_DIR/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
echo -e "  ${GREEN}✓${NC} Found $SKILL_COUNT superpowers skills"

echo ""
echo -e "${GREEN}✅ Superpowers installed successfully!${NC}"
echo ""
echo "Available skills:"
for skill in "$SUPERPOWERS_DIR/skills"/*/; do
    skill_name=$(basename "$skill")
    echo "  - superpowers/$skill_name"
done
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Restart OpenCode to activate the plugin"
echo "  2. Verify with: Ask OpenCode 'do you have superpowers?'"
echo ""
echo "To update superpowers later:"
echo "  cd $SUPERPOWERS_DIR && git pull"
