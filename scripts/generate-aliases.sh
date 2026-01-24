#!/bin/bash
# Generate aliases file for manual sourcing
# Does NOT modify your shell config automatically

set -e

ALIASES_FILE="$HOME/.claude/aliases.sh"

mkdir -p "$HOME/.claude"

cat > "$ALIASES_FILE" << 'EOF'
# Claude Code Multi-Provider Aliases
# Source this file in your .zshrc: source ~/.claude/aliases.sh

export PATH="$HOME/bin:$PATH"

# Core Commands
alias ccd='claude-switch direct'
alias ccc='claude-switch copilot'
alias cco='claude-switch ollama'
alias ccs='claude-switch status'

# Copilot Model Shortcuts
alias ccc-opus='COPILOT_MODEL=claude-opus-4.5 claude-switch copilot'
alias ccc-sonnet='COPILOT_MODEL=claude-sonnet-4.5 claude-switch copilot'
alias ccc-haiku='COPILOT_MODEL=claude-haiku-4.5 claude-switch copilot'
alias ccc-gpt='COPILOT_MODEL=gpt-4.1 claude-switch copilot'
alias ccc-gemini='COPILOT_MODEL=gemini-2.5-pro claude-switch copilot'
alias ccc-gemini3='COPILOT_MODEL=gemini-3-flash-preview claude-switch copilot'
alias ccc-gemini3-pro='COPILOT_MODEL=gemini-3-pro-preview claude-switch copilot'

# Ollama Model Shortcuts
alias cco-devstral='OLLAMA_MODEL=devstral-small-2 claude-switch ollama'
alias cco-granite='OLLAMA_MODEL=ibm/granite4:small-h claude-switch ollama'

# Unified Fork (Experimental - Codex + Gemini 3)
alias ccunified='~/Sites/perso/cc-copilot-bridge/scripts/launch-unified-fork.sh'
alias ccc-codex='COPILOT_MODEL=gpt-5.2-codex claude-switch copilot'
alias ccc-codex-mini='COPILOT_MODEL=gpt-5.1-codex-mini claude-switch copilot'
EOF

echo "✓ Created $ALIASES_FILE"
echo ""
echo "Add to your .zshrc:"
echo "  source ~/.claude/aliases.sh"
echo ""
echo "Or with antigen:"
echo "  antigen bundle ~/.claude/aliases.sh"
