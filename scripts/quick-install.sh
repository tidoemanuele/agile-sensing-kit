#!/bin/bash

# ASK (Agile Sensing Kit) Quick Install Script
# One-liner installation from GitHub

set -e

REPO="tidoemanuele/agile-sensing-kit"
TARGET_DIR="."

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

log_info() { echo -e "${BLUE}ℹ${NC} $1"; }
log_success() { echo -e "${GREEN}✓${NC} $1"; }
log_error() { echo -e "${RED}✗${NC} $1"; }

print_header() {
  echo -e "${BLUE}${BOLD}"
  echo "╔═══════════════════════════════════════════════════════════╗"
  echo "║           ASK (Agile Sensing Kit) Installer               ║"
  echo "╚═══════════════════════════════════════════════════════════╝"
  echo -e "${NC}"
}

parse_args() {
  while [[ $# -gt 0 ]]; do
    case $1 in
      --target)
        TARGET_DIR="$2"
        shift 2
        ;;
      --help)
        cat << EOF
ASK (Agile Sensing Kit) Quick Install Script

Usage: curl -fsSL https://raw.githubusercontent.com/tidoemanuele/agile-sensing-kit/main/scripts/quick-install.sh | bash -s -- [OPTIONS]

OPTIONS:
  --target DIR   Install to specific directory (default: current)
  --help         Show this help message

EXAMPLES:
  # Install to current directory
  curl -fsSL https://raw.githubusercontent.com/tidoemanuele/agile-sensing-kit/main/scripts/quick-install.sh | bash

  # Install to specific project
  curl -fsSL https://raw.githubusercontent.com/tidoemanuele/agile-sensing-kit/main/scripts/quick-install.sh | bash -s -- --target ./my-project

EOF
        exit 0
        ;;
      *)
        log_error "Unknown option: $1"
        echo "Use --help for usage information"
        exit 1
        ;;
    esac
  done
}

install_ask() {
  local temp_dir=$(mktemp -d)

  log_info "Cloning ASK repository..."

  if ! git clone --depth 1 "https://github.com/${REPO}.git" "$temp_dir/ask" 2>/dev/null; then
    log_error "Failed to clone repository"
    rm -rf "$temp_dir"
    exit 1
  fi

  log_success "Cloned successfully"

  log_info "Installing to: $TARGET_DIR"
  mkdir -p "$TARGET_DIR"

  # Copy essential directories
  [ -d "$temp_dir/ask/.github" ] && cp -r "$temp_dir/ask/.github" "$TARGET_DIR/"
  [ -d "$temp_dir/ask/.ask" ] && cp -r "$temp_dir/ask/.ask" "$TARGET_DIR/"
  [ -d "$temp_dir/ask/.vscode" ] && cp -r "$temp_dir/ask/.vscode" "$TARGET_DIR/"
  [ -f "$temp_dir/ask/CLAUDE.md" ] && cp "$temp_dir/ask/CLAUDE.md" "$TARGET_DIR/"

  log_success "Copied .github/, .ask/, .vscode/"

  # Cleanup
  rm -rf "$temp_dir"
}

# Main
parse_args "$@"
print_header

log_info "Target: $TARGET_DIR"
echo

install_ask

echo
log_success "ASK installation complete!"
echo
echo -e "${BOLD}What's installed:${NC}"
echo "  ✅ .github/agents/   - 9 specialized AI agents"
echo "  ✅ .github/prompts/  - Workflow prompts (/prd, /frd, /plan, etc.)"
echo "  ✅ .ask/             - Knowledge base & ceremony workflows"
echo "  ✅ .vscode/          - MCP server configuration"
echo
echo -e "${BOLD}Next steps:${NC}"
echo "  1. Run setup: curl -fsSL https://raw.githubusercontent.com/${REPO}/main/scripts/setup.sh | bash"
echo "  2. In Copilot Chat: @ask Party Mode"
echo
echo -e "${BOLD}🎉 Party Mode brings all 10 agents together for brainstorming!${NC}"
echo
echo "Learn more: https://github.com/${REPO}"
echo
