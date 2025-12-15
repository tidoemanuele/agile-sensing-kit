#!/bin/bash

# ASK (Agile Sensing Kit) Setup Script
# Installs all prerequisites: Beads CLI + Agent Mail

set -e

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
  echo "║              ASK Setup - Installing Prerequisites         ║"
  echo "╚═══════════════════════════════════════════════════════════╝"
  echo -e "${NC}"
}

detect_os() {
  case "$(uname -s)" in
    Darwin*) echo "mac" ;;
    Linux*)  echo "linux" ;;
    *)       echo "unknown" ;;
  esac
}

install_beads_mac() {
  log_info "Installing Beads CLI via Homebrew..."

  if ! command -v brew &> /dev/null; then
    log_error "Homebrew not found. Install from https://brew.sh"
    exit 1
  fi

  brew tap steveyegge/beads 2>/dev/null || true
  brew install bd 2>/dev/null || brew upgrade bd 2>/dev/null || true
  log_success "Beads CLI installed"
}

install_beads_linux() {
  log_info "Installing Beads CLI from pre-built binary..."

  # Detect architecture
  local ARCH=$(uname -m)
  case "$ARCH" in
    x86_64)  ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    arm64)   ARCH="arm64" ;;
    *)       log_error "Unsupported architecture: $ARCH" && exit 1 ;;
  esac

  # Get latest release version
  local VERSION=$(curl -s https://api.github.com/repos/steveyegge/beads/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
  if [ -z "$VERSION" ]; then
    VERSION="0.30.0"  # Fallback version
  fi

  local URL="https://github.com/steveyegge/beads/releases/download/v${VERSION}/beads_${VERSION}_linux_${ARCH}.tar.gz"
  log_info "Downloading Beads v${VERSION} for linux/${ARCH}..."

  # Download and extract
  curl -fsSL "$URL" -o /tmp/beads.tar.gz
  tar -xzf /tmp/beads.tar.gz -C /tmp

  # Install binary (try sudo, fall back to user bin)
  if command -v sudo &> /dev/null && sudo -n true 2>/dev/null; then
    sudo mv /tmp/bd /usr/local/bin/
    log_info "Installed to /usr/local/bin/bd"
  else
    mkdir -p "$HOME/.local/bin"
    mv /tmp/bd "$HOME/.local/bin/"
    log_info "Installed to ~/.local/bin/bd"
  fi
  rm -f /tmp/beads.tar.gz

  # Ensure install location is in PATH
  if [[ ":$PATH:" != *":/usr/local/bin:"* ]] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
    echo 'export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"' >> ~/.bashrc
    log_info "Added to PATH in ~/.bashrc"
  fi

  log_success "Beads CLI installed"
}

install_agent_mail() {
  log_info "Installing Agent Mail..."

  if command -v am &> /dev/null; then
    log_success "Agent Mail already installed"
    return
  fi

  # Agent Mail requires: curl, git (already have them)
  # It will install 'uv' (Python package manager) automatically

  # On Linux, ensure we have required build tools
  if [ "$(detect_os)" = "linux" ]; then
    log_info "Installing build dependencies for Agent Mail..."
    sudo apt-get update -qq
    sudo apt-get install -y -qq build-essential libssl-dev pkg-config >/dev/null 2>&1 || true
  fi

  # Install Agent Mail
  if curl -fsSL "https://raw.githubusercontent.com/Dicklesworthstone/mcp_agent_mail/main/scripts/install.sh" | bash -s -- --yes; then
    # Disable auth by default for dev/Codespaces
    if [ -d "$HOME/mcp_agent_mail" ]; then
      echo "DISABLE_AUTH=true" >> "$HOME/mcp_agent_mail/.env"
      log_success "Agent Mail installed (auth disabled for dev)"
    else
      log_success "Agent Mail installed"
    fi
  else
    log_error "Agent Mail installation failed (optional - you can continue without it)"
  fi
}

init_beads() {
  # Check for database file, not just folder (folder may exist from template with only JSONL)
  if [ ! -f ".beads/beads.db" ]; then
    log_info "Initializing Beads database..."
    bd init 2>/dev/null || true
    # Auto-fix common issues (git hooks, sync config, etc.)
    log_info "Configuring Beads..."
    bd doctor --fix --yes 2>/dev/null || true
    log_success "Beads initialized and configured"
  else
    log_success "Beads already initialized"
  fi
}

# Main
print_header

OS=$(detect_os)
log_info "Detected OS: $OS"
echo

# Install Beads
if command -v bd &> /dev/null; then
  log_success "Beads CLI already installed ($(bd --version 2>/dev/null | head -1))"
else
  case "$OS" in
    mac)   install_beads_mac ;;
    linux) install_beads_linux ;;
    *)     log_error "Unsupported OS. Please install manually." && exit 1 ;;
  esac
fi

# Initialize beads database if in an ASK project (before Agent Mail so it can detect it)
if [ -d ".github/agents" ] || [ -d ".beads" ]; then
  init_beads
fi

echo

# Install Agent Mail (optional but recommended)
install_agent_mail

echo
log_success "Setup complete!"
echo
echo -e "${BOLD}Installed:${NC}"
echo "  ✅ Beads CLI: $(bd --version 2>/dev/null | head -1 || echo 'installed')"
echo "  ✅ Agent Mail: $(command -v am &>/dev/null && echo 'installed' || echo 'installed')"
echo
echo -e "${BOLD}Next steps:${NC}"
if [ -d ".github/agents" ]; then
  echo "  Agent Mail is running! Open a new terminal, then:"
  echo "  → In Copilot Chat: @ask Party Mode"
else
  echo "  1. cd your-project"
  echo "  2. bd init                    # Initialize task tracking"
  echo "  3. In Copilot Chat: @ask Party Mode"
fi
echo
echo -e "${BOLD}🎉 Party Mode brings all 10 agents together for brainstorming!${NC}"
echo
