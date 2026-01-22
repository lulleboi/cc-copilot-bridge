# Frequently Asked Questions (FAQ)

**Reading time**: 15 minutes | **Skill level**: All levels | **Last updated**: 2026-01-22

---

## 📋 Table of Contents

- [Installation & Setup](#installation--setup)
- [Usage & Commands](#usage--commands)
- [Providers & Models](#providers--models)
- [Performance & Optimization](#performance--optimization)
- [Troubleshooting](#troubleshooting)
- [Cost & Billing](#cost--billing)
- [Security & Privacy](#security--privacy)
- [Advanced Topics](#advanced-topics)

---

## Installation & Setup

### Q: Do I need GitHub Copilot Pro+ or is regular Copilot enough?

**A**: You need **GitHub Copilot Pro+** ($10/month). Regular Copilot ($4/month for students) doesn't include API access required by copilot-api.

**Verify your subscription**: Go to [github.com/settings/copilot](https://github.com/settings/copilot) and check if you see "Copilot Pro+" or just "Copilot".

---

### Q: Can I use this without GitHub Copilot?

**A**: Yes! cc-copilot-bridge supports 3 providers:
- **Anthropic Direct** (`ccd`) - Works with just `ANTHROPIC_API_KEY`
- **Ollama Local** (`cco`) - 100% free, no subscription needed
- **GitHub Copilot** (`ccc`) - Optional, requires Copilot Pro+

You can use Anthropic or Ollama without ever touching Copilot.

---

### Q: What are the prerequisites?

**A**: Minimum requirements:
1. ✅ [Claude Code CLI](https://docs.anthropic.com/claude/docs/claude-code) installed
2. ✅ Bash shell (macOS/Linux)
3. ✅ `nc` (netcat) - Usually pre-installed
4. ✅ `jq` - For JSON parsing: `brew install jq`

**Optional** (depending on provider):
- For `ccd`: `ANTHROPIC_API_KEY` environment variable
- For `ccc`: copilot-api installed (`npm install -g copilot-api`)
- For `cco`: Ollama installed and running

---

### Q: Does this work on Windows?

**A**: Not directly. cc-copilot-bridge is a Bash script designed for macOS/Linux.

**Workarounds**:
1. **WSL2** (Windows Subsystem for Linux) - Full compatibility
2. **Git Bash** - Partial compatibility, may need adjustments
3. **Docker** - Run in a container (future feature)

We're considering a PowerShell port in the future.

---

### Q: How do I verify installation worked?

**A**: Run these verification steps:

```bash
# 1. Check script is installed
which claude-switch
# Expected: /Users/yourname/bin/claude-switch

# 2. Check aliases are loaded
alias | grep ccc
# Expected: Multiple aliases listed

# 3. Check provider status
ccs
# Expected: Status report for all providers

# 4. Test a provider
ccc
# Expected: Claude Code starts successfully
```

See [INSTALLATION-VERIFICATION.md](INSTALLATION-VERIFICATION.md) for full checklist.

---

## Usage & Commands

### Q: Which command should I use for daily development?

**A**: Use **`ccc`** (GitHub Copilot with Claude Sonnet 4.5).

**Why?**
- ✅ Free with your $10/month Copilot Pro+ subscription
- ✅ Unlimited usage (no per-token charges)
- ✅ Balanced quality and speed
- ✅ 100% MCP compatible

For critical code reviews, upgrade to `ccc-opus`.

---

### Q: What's the difference between ccc, ccc-sonnet, and ccc-opus?

**A**: They all use GitHub Copilot, but with different models:

| Command | Model | Quality | Speed | Use Case |
|---------|-------|---------|-------|----------|
| `ccc` | Sonnet 4.5 | ⭐⭐⭐⭐ | Fast | Daily dev (default) |
| `ccc-sonnet` | Sonnet 4.5 | ⭐⭐⭐⭐ | Fast | Same as ccc |
| `ccc-opus` | Opus 4.5 | ⭐⭐⭐⭐⭐ | Slower | Code reviews |
| `ccc-haiku` | Haiku 4.5 | ⭐⭐⭐ | Fastest | Quick questions |

**All are FREE** with Copilot Pro+ subscription.

---

### Q: Can I switch providers mid-session?

**A**: No. Provider is set when Claude Code launches.

**To switch**:
1. Exit current session: `/exit` or `Ctrl+D`
2. Launch with different provider: `ccc`, `ccd`, or `cco`

**Alternative**: Run multiple terminals with different providers simultaneously.

---

### Q: How do I pass arguments to Claude Code?

**A**: Add arguments after the command:

```bash
# Resume previous session
ccc -c

# Use specific model with Anthropic
ccd --model opus

# Combine multiple arguments
ccc -c --verbose
```

All arguments after `ccc`/`ccd`/`cco` are forwarded to `claude`.

---

## Providers & Models

### Q: Why is Ollama so slow?

**A**: **Context mismatch**. Claude Code sends ~60K tokens of context (Memory files + MCP tools + System prompt), but Ollama defaults to 8K context.

**Result**: 87% of context truncated → constant reprocessing → 2-6 minute responses.

**Solutions**:
1. **Recommended**: Use `ccc` for large projects (fast, cloud-based)
2. **Alternative**: Increase Ollama context to 32K (slower but works):
   ```bash
   launchctl setenv OLLAMA_CONTEXT_LENGTH 32768
   brew services restart ollama
   ```

See [TROUBLESHOOTING.md#ollama-slow](TROUBLESHOOTING.md#ollama-extremely-slow) for details.

---

### Q: Can I use GPT models with Copilot?

**A**: Yes, but with limitations:

**✅ Compatible GPT models**:
- `gpt-4.1` (recommended, 0x premium)
- `gpt-5` (advanced reasoning, 1x premium)
- `gpt-5-mini` (ultra fast, 0x premium)

**❌ Incompatible GPT Codex models**:
- `gpt-5.2-codex`, `gpt-5.1-codex`, etc.
- **Reason**: Require `/responses` endpoint (copilot-api v0.7.0 doesn't support it)

**Use**:
```bash
COPILOT_MODEL=gpt-4.1 ccc
# or
ccc-gpt  # Pre-configured alias
```

---

### Q: Which models support MCP servers?

**A**: MCP compatibility by model family:

| Model Family | Compatibility | Reason |
|--------------|---------------|---------|
| **Claude** (all) | ✅ 100% | Permissive validation |
| **GPT-4.1, GPT-5** | ⚠️ ~80% | Strict validation, auto-profiles exclude problematic servers |
| **Gemini** | ⚠️ ~80% | Strict validation, auto-profiles |
| **Ollama** | ✅ 100% | Permissive validation |

**Recommendation**: Use Claude models (`ccc-sonnet`, `ccc-opus`) for best MCP compatibility.

---

### Q: How do I switch models dynamically?

**A**: Use environment variables:

**Copilot models**:
```bash
COPILOT_MODEL=claude-opus-4.5 ccc
COPILOT_MODEL=gpt-4.1 ccc
COPILOT_MODEL=gemini-3-pro-preview ccc
```

**Ollama models**:
```bash
OLLAMA_MODEL=qwen2.5-coder:7b cco
OLLAMA_MODEL=qwen2.5-coder:14b cco
```

Or use pre-configured aliases: `ccc-opus`, `ccc-haiku`, `ccc-gpt`.

See [MODEL-SWITCHING.md](MODEL-SWITCHING.md) for complete guide.

---

## Performance & Optimization

### Q: Which provider is fastest?

**A**: Performance comparison:

| Provider | Latency | Best For |
|----------|---------|----------|
| **Copilot** | 1-3s | Daily development |
| **Anthropic Direct** | 1-2s | Production code |
| **Ollama 8K** | 3-10s | Small projects, offline |
| **Ollama 32K** | 30-60s | Large projects, privacy (slow) |

**For speed**: Use `ccc` or `ccd` (cloud-based).
**For privacy**: Use `cco` (local, accepts slowness).

---

### Q: How can I optimize Ollama performance?

**A**: Apple Silicon optimization:

1. **Apply optimizations**:
   ```bash
   # Set environment variables
   launchctl setenv OLLAMA_FLASH_ATTENTION 1
   launchctl setenv OLLAMA_NUM_PARALLEL 4
   brew services restart ollama
   ```

2. **Use recommended models**:
   - M4 Pro 48GB: `qwen2.5-coder:32b` (26-39 tok/s)
   - M3/M2 24GB: `qwen2.5-coder:14b` (20-30 tok/s)
   - M1 16GB: `qwen2.5-coder:7b` (15-25 tok/s)

3. **Read full guide**: [OPTIMISATION-M4-PRO.md](OPTIMISATION-M4-PRO.md)

---

### Q: Why does Ollama use so much RAM?

**A**: Large models require significant RAM:

| Model | RAM Required | Quality |
|-------|--------------|---------|
| qwen2.5-coder:32b | 26 GB | ⭐⭐⭐⭐⭐ Best |
| qwen2.5-coder:14b | 12-14 GB | ⭐⭐⭐⭐ Good |
| qwen2.5-coder:7b | 6-8 GB | ⭐⭐⭐ Acceptable |

**Normal behavior**. If RAM is limited, use smaller model or cloud providers.

---

## Troubleshooting

### Q: "copilot-api not running on :4141" error

**A**: copilot-api is not started.

**Fix**:
```bash
# Start copilot-api in separate terminal
copilot-api start

# Keep it running while using ccc
```

**Auto-start** (optional):
- macOS: Create LaunchAgent (see [README.md#advanced-usage](../README.md#advanced-usage))
- Linux: Create systemd service

---

### Q: "Model not found" error with Ollama

**A**: Model not downloaded.

**Fix**:
```bash
# Check installed models
ollama list

# Pull the model
ollama pull qwen2.5-coder:32b-instruct-q4_k_m

# Verify
ollama list | grep qwen
```

---

### Q: MCP schema validation errors with GPT-4.1

**A**: GPT-4.1 applies strict JSON Schema validation. Some MCP servers (like `grepai`) have incomplete schemas.

**Fix**: Use Claude models instead (100% MCP compatible):
```bash
ccc-sonnet  # Instead of ccc-gpt
```

**Or**: Disable problematic MCP server in `~/.claude/claude_desktop_config.json`.

See [MCP-PROFILES.md](MCP-PROFILES.md) for technical details.

---

### Q: Aliases not working after installation

**A**: Shell config not reloaded.

**Fix**:
```bash
# Reload shell config
source ~/.zshrc  # or ~/.bashrc

# Verify aliases loaded
alias | grep ccc
```

---

### Q: Where are the logs stored?

**A**: Session logs are at: `~/.claude/claude-switch.log`

**View logs**:
```bash
# Recent sessions
tail -20 ~/.claude/claude-switch.log

# Filter by provider
grep "mode=copilot" ~/.claude/claude-switch.log

# Session durations
grep "Session ended" ~/.claude/claude-switch.log
```

---

## Cost & Billing

### Q: How much does cc-copilot-bridge cost?

**A**: Depends on which provider you use:

| Provider | Cost | Billing Model |
|----------|------|---------------|
| **GitHub Copilot** | $10/month | Flat rate, UNLIMITED usage |
| **Anthropic Direct** | $15-20/month* | Pay-per-token usage |
| **Ollama Local** | FREE | Self-hosted, no charges |

*Typical software development usage

**Best value**: GitHub Copilot ($10/month flat for unlimited usage).

---

### Q: Does Copilot charge extra for Claude models?

**A**: **No**. All models available through copilot-api are included in your $10/month Copilot Pro+ subscription:
- Claude Opus/Sonnet/Haiku
- GPT-4.1, GPT-5, GPT-5-mini
- Gemini models

**Unlimited usage** with no per-token charges.

---

### Q: How much can I save compared to Anthropic Direct?

**A**: Significant savings:

**Example** (typical monthly usage):
- Anthropic Direct: ~$15-20/month
- Copilot Bridge: $10/month flat
- **Savings**: $5-10/month + unlimited usage peace of mind

**Heavy users** (>$50/month on Anthropic): Save $40+/month with Copilot.

---

## Security & Privacy

### Q: Where does my code go with each provider?

**A**: Data flow by provider:

| Provider | Data Sent To | Retention | Privacy Level |
|----------|--------------|-----------|---------------|
| `ccd` (Anthropic) | Anthropic API (cloud) | 30 days | ⚠️ Cloud |
| `ccc` (Copilot) | GitHub Copilot API (cloud) | Per GitHub policy | ⚠️ Cloud |
| `cco` (Ollama) | **Localhost ONLY** | Never leaves machine | ✅ **100% Private** |

**For proprietary code**: Use `cco` (Ollama) to keep everything local.

---

### Q: Is it safe to use Copilot for work code?

**A**: Depends on your company policy and code sensitivity.

**Generally safe for**:
- Internal tools
- Non-confidential projects
- Open-source contributions
- Learning and experimentation

**Use Ollama instead for**:
- Client code under strict NDA
- Highly regulated industries (finance, healthcare)
- Proprietary algorithms
- Confidential business logic

**Always check**: Your company's AI tool usage policy.

---

### Q: Can I verify Ollama isn't sending data externally?

**A**: Yes, monitor network traffic:

```bash
# Monitor Ollama port (should only see localhost connections)
sudo tcpdump -i lo0 -A 'tcp port 11434'

# Check Ollama process network connections
lsof -i -P | grep ollama
```

Ollama is 100% local - no telemetry, no cloud calls.

---

## Advanced Topics

### Q: Can I use multiple providers in the same project?

**A**: Yes! Use different terminals:

```bash
# Terminal 1: Daily dev with Copilot
ccc

# Terminal 2: Private analysis with Ollama
cco

# Terminal 3: Critical review with Anthropic
ccd --model opus
```

Each terminal runs independently.

---

### Q: How do I create custom MCP profiles?

**A**:

1. Edit exclusions: `~/.claude/mcp-profiles/excludes.yaml`
2. Regenerate profiles: `~/.claude/mcp-profiles/generate.sh`
3. Test with GPT model: `ccc-gpt`

See [MCP-PROFILES.md](MCP-PROFILES.md) for complete guide.

---

### Q: Can I use this in CI/CD pipelines?

**A**: Yes, but requires setup:

**For CI/CD**:
- Use `ccd` (Anthropic Direct) with `ANTHROPIC_API_KEY` secret
- Or use self-hosted runners with Ollama

**Not recommended**: Copilot in CI/CD (requires authentication flow).

See [workflows/CI-CD.md](workflows/CI-CD.md) for integration guide.

---

### Q: How do I update to the latest version?

**A**: Re-run installation:

```bash
curl -fsSL https://raw.githubusercontent.com/FlorianBruniaux/cc-copilot-bridge/main/install.sh | bash
```

Installation script updates existing installation.

**Check version**:
```bash
grep "^# Version" ~/bin/claude-switch
```

---

### Q: Can I contribute to cc-copilot-bridge?

**A**: Yes! Contributions welcome.

**Ways to contribute**:
1. Report bugs: [GitHub Issues](https://github.com/FlorianBruniaux/cc-copilot-bridge/issues)
2. Suggest features: [GitHub Discussions](https://github.com/FlorianBruniaux/cc-copilot-bridge/discussions)
3. Submit PRs: Fork → Branch → PR
4. Improve docs: Documentation PRs always welcome
5. Share workflows: Add examples to `examples/`

See [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

---

## Still Have Questions?

- 📖 **Read full documentation**: [Documentation Index](README.md)
- 🆘 **Check troubleshooting**: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- 💬 **Ask community**: [GitHub Discussions](https://github.com/FlorianBruniaux/cc-copilot-bridge/discussions)
- 🐛 **Report bug**: [GitHub Issues](https://github.com/FlorianBruniaux/cc-copilot-bridge/issues)

---

**Related Documentation**:
- [Quick Start Guide](../QUICKSTART.md)
- [Command Reference](COMMANDS.md)
- [Troubleshooting Guide](TROUBLESHOOTING.md)
- [Model Switching Guide](MODEL-SWITCHING.md)

**Back to**: [Documentation Index](README.md) | [Main README](../README.md)
