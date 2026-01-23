# Toutes les Commandes de Test par Modèle

**Prérequis:** copilot-api ou fork lancé sur port 4141

---

## 🔥 GPT Codex Models (Nécessite PR #170 Fork)

```bash
# GPT-5.2 Codex (Premium, Extended Thinking)
COPILOT_MODEL=gpt-5.2-codex ccc -p "Write a Python function"

# GPT-5.1 Codex (Standard)
COPILOT_MODEL=gpt-5.1-codex ccc -p "Write a Python function"

# GPT-5.1 Codex Mini (Rapide)
COPILOT_MODEL=gpt-5.1-codex-mini ccc -p "Write a Python function"

# GPT-5.1 Codex Max (Qualité maximale)
COPILOT_MODEL=gpt-5.1-codex-max ccc -p "Write a Python function"

# GPT-5 Codex (Legacy)
COPILOT_MODEL=gpt-5-codex ccc -p "Write a Python function"
```

---

## ⚡ GPT-5 Series

```bash
# GPT-5.2
COPILOT_MODEL=gpt-5.2 ccc -p "Write a Python function"

# GPT-5.1
COPILOT_MODEL=gpt-5.1 ccc -p "Write a Python function"

# GPT-5
COPILOT_MODEL=gpt-5 ccc -p "Write a Python function"

# GPT-5 Mini
COPILOT_MODEL=gpt-5-mini ccc -p "Write a Python function"
```

---

## 🤖 GPT-4 Series

```bash
# GPT-4.1 (0x premium recommandé)
COPILOT_MODEL=gpt-4.1 ccc -p "Write a Python function"

# GPT-4.1 Dated
COPILOT_MODEL=gpt-4.1-2025-04-14 ccc -p "Write a Python function"

# GPT-4.1 Copilot
COPILOT_MODEL=gpt-41-copilot ccc -p "Write a Python function"

# GPT-4o (Latest)
COPILOT_MODEL=gpt-4o ccc -p "Write a Python function"

# GPT-4o November 2024
COPILOT_MODEL=gpt-4o-2024-11-20 ccc -p "Write a Python function"

# GPT-4o August 2024
COPILOT_MODEL=gpt-4o-2024-08-06 ccc -p "Write a Python function"

# GPT-4o May 2024
COPILOT_MODEL=gpt-4o-2024-05-13 ccc -p "Write a Python function"

# GPT-4o Mini
COPILOT_MODEL=gpt-4o-mini ccc -p "Write a Python function"

# GPT-4o Mini July 2024
COPILOT_MODEL=gpt-4o-mini-2024-07-18 ccc -p "Write a Python function"

# GPT-4o Preview
COPILOT_MODEL=gpt-4-o-preview ccc -p "Write a Python function"

# GPT-4 Base
COPILOT_MODEL=gpt-4 ccc -p "Write a Python function"

# GPT-4 June 2023
COPILOT_MODEL=gpt-4-0613 ccc -p "Write a Python function"

# GPT-4 January 2025 Preview
COPILOT_MODEL=gpt-4-0125-preview ccc -p "Write a Python function"
```

---

## 💬 GPT-3.5 Series

```bash
# GPT-3.5 Turbo
COPILOT_MODEL=gpt-3.5-turbo ccc -p "Write a Python function"

# GPT-3.5 Turbo June 2023
COPILOT_MODEL=gpt-3.5-turbo-0613 ccc -p "Write a Python function"
```

---

## 🧠 Claude Models

```bash
# Claude Opus 4.5 (Meilleure qualité)
COPILOT_MODEL=claude-opus-4.5 ccc -p "Write a Python function"

# Claude Opus 4.1
COPILOT_MODEL=claude-opus-41 ccc -p "Write a Python function"

# Claude Sonnet 4.5 (Équilibre qualité/vitesse)
COPILOT_MODEL=claude-sonnet-4.5 ccc -p "Write a Python function"

# Claude Sonnet 4
COPILOT_MODEL=claude-sonnet-4 ccc -p "Write a Python function"

# Claude Haiku 4.5 (Ultra rapide)
COPILOT_MODEL=claude-haiku-4.5 ccc -p "Write a Python function"
```

---

## 🔮 Gemini Models

```bash
# Gemini 3 Pro Preview (Experimental)
COPILOT_MODEL=gemini-3-pro-preview ccc -p "Write a Python function"

# Gemini 3 Flash Preview (Experimental)
COPILOT_MODEL=gemini-3-flash-preview ccc -p "Write a Python function"

# Gemini 2.5 Pro (Stable)
COPILOT_MODEL=gemini-2.5-pro ccc -p "Write a Python function"
```

---

## 🌟 Other Models

```bash
# Grok Code Fast
COPILOT_MODEL=grok-code-fast-1 ccc -p "Write a Python function"

# OSWE VSCode Prime
COPILOT_MODEL=oswe-vscode-prime ccc -p "Write a Python function"
```

---

## 📊 Embedding Models (Non-chat)

**⚠️ Ces modèles ne supportent pas les prompts conversationnels**

```bash
# Text Embedding 3 Small
COPILOT_MODEL=text-embedding-3-small ccc -p "Embed this text"

# Text Embedding 3 Small Inference
COPILOT_MODEL=text-embedding-3-small-inference ccc -p "Embed this text"

# Text Embedding Ada 002
COPILOT_MODEL=text-embedding-ada-002 ccc -p "Embed this text"
```

---

## 🚀 Script de Test Automatique

Pour tester TOUS les modèles en une seule commande :

```bash
cd ~/Sites/perso/cc-copilot-bridge
./scripts/test-all-models.sh
```

Ce script :
- Teste les 42 modèles automatiquement
- Affiche ✅/❌ pour chaque modèle
- Génère un résumé final
- Durée estimée: ~5-10 minutes

---

## 📋 Copier-Coller Rapide

### Tous les Codex (5 commandes)
```bash
COPILOT_MODEL=gpt-5.2-codex ccc -p "Test"
COPILOT_MODEL=gpt-5.1-codex ccc -p "Test"
COPILOT_MODEL=gpt-5.1-codex-mini ccc -p "Test"
COPILOT_MODEL=gpt-5.1-codex-max ccc -p "Test"
COPILOT_MODEL=gpt-5-codex ccc -p "Test"
```

### Tous les GPT-5 (4 commandes)
```bash
COPILOT_MODEL=gpt-5.2 ccc -p "Test"
COPILOT_MODEL=gpt-5.1 ccc -p "Test"
COPILOT_MODEL=gpt-5 ccc -p "Test"
COPILOT_MODEL=gpt-5-mini ccc -p "Test"
```

### Tous les Claude (5 commandes)
```bash
COPILOT_MODEL=claude-opus-4.5 ccc -p "Test"
COPILOT_MODEL=claude-opus-41 ccc -p "Test"
COPILOT_MODEL=claude-sonnet-4.5 ccc -p "Test"
COPILOT_MODEL=claude-sonnet-4 ccc -p "Test"
COPILOT_MODEL=claude-haiku-4.5 ccc -p "Test"
```

### Tous les Gemini (3 commandes)
```bash
COPILOT_MODEL=gemini-3-pro-preview ccc -p "Test"
COPILOT_MODEL=gemini-3-flash-preview ccc -p "Test"
COPILOT_MODEL=gemini-2.5-pro ccc -p "Test"
```

---

## 🎯 Modèles Recommandés par Scénario

| Scénario | Commande |
|----------|----------|
| **Production critical** | `COPILOT_MODEL=claude-opus-4.5 ccc` |
| **Daily development** | `COPILOT_MODEL=claude-sonnet-4.5 ccc` |
| **Quick questions** | `COPILOT_MODEL=claude-haiku-4.5 ccc` |
| **Code generation (premium)** | `COPILOT_MODEL=gpt-5.2-codex ccc` |
| **Code generation (fast)** | `COPILOT_MODEL=gpt-5.1-codex-mini ccc` |
| **Alternative perspective** | `COPILOT_MODEL=gpt-4.1 ccc` |
| **Experimental features** | `COPILOT_MODEL=gemini-3-pro-preview ccc` |

---

**Total: 42 modèles** (39 chat + 3 embedding)
