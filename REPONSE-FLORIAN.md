# Réponse à tes Questions

## 1️⃣ Toutes les Commandes de Test

**42 modèles disponibles**, toutes les commandes sont dans :
📄 **`docs/ALL-MODEL-COMMANDS.md`**

**Copier-coller rapide des plus importants :**

```bash
# === Codex (5 modèles) - Nécessite fork ===
COPILOT_MODEL=gpt-5.2-codex ccc -p "Test"
COPILOT_MODEL=gpt-5.1-codex ccc -p "Test"
COPILOT_MODEL=gpt-5.1-codex-mini ccc -p "Test"
COPILOT_MODEL=gpt-5.1-codex-max ccc -p "Test"
COPILOT_MODEL=gpt-5-codex ccc -p "Test"

# === GPT-5 Series (4 modèles) ===
COPILOT_MODEL=gpt-5.2 ccc -p "Test"
COPILOT_MODEL=gpt-5.1 ccc -p "Test"
COPILOT_MODEL=gpt-5 ccc -p "Test"
COPILOT_MODEL=gpt-5-mini ccc -p "Test"

# === GPT-4 Series (les principaux) ===
COPILOT_MODEL=gpt-4.1 ccc -p "Test"
COPILOT_MODEL=gpt-4o ccc -p "Test"
COPILOT_MODEL=gpt-4o-mini ccc -p "Test"

# === Claude (5 modèles) ===
COPILOT_MODEL=claude-opus-4.5 ccc -p "Test"
COPILOT_MODEL=claude-sonnet-4.5 ccc -p "Test"
COPILOT_MODEL=claude-haiku-4.5 ccc -p "Test"

# === Gemini (3 modèles) ===
COPILOT_MODEL=gemini-3-pro-preview ccc -p "Test"
COPILOT_MODEL=gemini-3-flash-preview ccc -p "Test"
COPILOT_MODEL=gemini-2.5-pro ccc -p "Test"

# === Autres ===
COPILOT_MODEL=grok-code-fast-1 ccc -p "Test"
COPILOT_MODEL=oswe-vscode-prime ccc -p "Test"
```

**Script auto pour tester les 42 :**
```bash
./scripts/test-all-models.sh
```

---

## 2️⃣ Alias pour Lancer le Fork

**Ajoute ça dans ton `~/.zshrc` :**

```bash
# Lancer copilot-api fork (PR #170)
alias ccfork='~/Sites/perso/cc-copilot-bridge/scripts/launch-responses-fork.sh'
```

**Puis recharge :**
```bash
source ~/.zshrc
```

**Utilisation :**
```bash
ccfork  # C'est tout !
```

Le script vérifie maintenant automatiquement :
- ✅ Si PR #170 est mergée (affiche warning si oui)
- ✅ Si port 4141 est libre
- ✅ Si fork est à jour
- ✅ Si build existe

**Si la PR est mergée**, tu verras :
```
╔════════════════════════════════════════════════════════════════╗
║  ⚠️  WARNING: This fork is no longer necessary!               ║
╚════════════════════════════════════════════════════════════════╝

What to do:
  1. Stop this fork: pkill -f 'copilot-api'
  2. Update official: npm update -g copilot-api
  3. Start official: copilot-api start
  4. Test Codex: COPILOT_MODEL=gpt-5.2-codex ccc -p 'Test'

Continue launching fork anyway? (y/N)
```

---

## 🚀 Setup Ultra-Rapide (Tout en Une)

```bash
# Ajouter l'alias ccfork
echo "alias ccfork='~/Sites/perso/cc-copilot-bridge/scripts/launch-responses-fork.sh'" >> ~/.zshrc

# (Optionnel) Ajouter les aliases Codex
cat >> ~/.zshrc << 'EOF'
# Modèles Codex
alias ccc-codex='COPILOT_MODEL=gpt-5.2-codex claude-switch copilot'
alias ccc-codex-mini='COPILOT_MODEL=gpt-5.1-codex-mini claude-switch copilot'
alias ccc-codex-max='COPILOT_MODEL=gpt-5.1-codex-max claude-switch copilot'
EOF

# Recharger
source ~/.zshrc
```

---

## 🎯 Utilisation

**Lancer le fork :**
```bash
ccfork  # Terminal 1
```

**Tester les modèles :**
```bash
# Méthode 1: Variable
COPILOT_MODEL=gpt-5.2-codex ccc -p "Write a function"

# Méthode 2: Alias (si configurés)
ccc-codex -p "Write a function"
ccc-codex-mini -p "Quick question"
```

**Tester TOUS les modèles :**
```bash
./scripts/test-all-models.sh
```

---

## 📚 Documentation Complète

| Fichier | Quoi |
|---------|------|
| `docs/QUICK-LAUNCH-GUIDE.md` | Guide complet avec alias |
| `docs/ALL-MODEL-COMMANDS.md` | ⭐ Commandes pour 42 modèles |
| `debug-responses-api/FINAL-SUMMARY.md` | Récap de tout |
| `scripts/test-all-models.sh` | Script test auto |

---

## ✅ Résumé Ultra-Court

**Setup (copie-colle) :**
```bash
echo "alias ccfork='~/Sites/perso/cc-copilot-bridge/scripts/launch-responses-fork.sh'" >> ~/.zshrc && source ~/.zshrc
```

**Lancer fork :**
```bash
ccfork
```

**Tester Codex :**
```bash
COPILOT_MODEL=gpt-5.2-codex ccc -p "Test"
```

**C'est tout !** 🎉

---

**Tests effectués:** ✅ 6/6 réussis
**PR #170:** ✅ Recommandée pour merge
**Script lancement:** ✅ Vérifie si PR mergée automatiquement
**Documentation:** ✅ Complète
