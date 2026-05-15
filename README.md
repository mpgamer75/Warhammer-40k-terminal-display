# Imperial Terminal Configuration

<div align="center">
  <img src="warhammer_image_1.jpg" alt="Imperial Terminal Logo" width="300">

  [![shellcheck](https://github.com/mpgamer75/Warhammer-40k-terminal-display/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/mpgamer75/Warhammer-40k-terminal-display/actions/workflows/shellcheck.yml)
</div>

---

## Vue d'ensemble

Transformez votre terminal Linux en **Terminal de Commandement Impérial** thématisé Warhammer 40K : prompt dynamique, bannière au démarrage, ~50 commandes en alias / fonction, et 5 chapitres jouables (Ultramarines, Blood Angels, Dark Angels, Space Wolves, Imperial Fists).

> 🇬🇧 English documentation: [README_EN.md](README_EN.md)

## Compatibilité

- **Zsh** (`.zshrc`) — recommandé, support complet (prompt, prompt droit dynamique, `setopt HIST_*`)
- **Bash** (`.bashrc`) — fonctions et aliases marchent ; les blocs zsh-spécifiques (PROMPT, RPROMPT, TRAPALRM, setopt) sont gated derrière `[[ -n $ZSH_VERSION ]]`, donc bash reste propre (pas d'erreurs)
- **Plateformes** : Linux principalement (utilise `/proc/uptime`, `apt`, `pgrep`, `ss`, `nmap`). Sur macOS/BSD la majorité des fonctions marche, mais les aliases qui appellent `apt` ou `uptime -p` échoueront.

## Installation

### Option 1 — Installation rapide via `curl` (recommandé)

> ⚠ **Inspecter avant d'exécuter du code téléchargé.** La méthode "inspect-first" ci-dessous est l'approche sûre ; le one-liner `curl … | bash` est pratique mais suppose que vous faites confiance à HTTPS + au dépôt GitHub à ce moment précis. Pour une garantie d'intégrité, voir [Pinning d'une version](#pinning-dune-version).

**Méthode 1a — Inspect-first (sûre)**

```bash
curl -fsSL https://raw.githubusercontent.com/mpgamer75/Warhammer-40k-terminal-display/main/install.sh \
    -o /tmp/imperial-install.sh
less /tmp/imperial-install.sh        # lire le script avant exécution
bash /tmp/imperial-install.sh        # ajouter les flags désirés (voir plus bas)
```

**Méthode 1b — One-liner**

```bash
curl -fsSL https://raw.githubusercontent.com/mpgamer75/Warhammer-40k-terminal-display/main/install.sh | bash
```

L'installeur détecte qu'il tourne sans le dépôt cloné et télécharge `warhammer_file.sh` depuis le même ref (`main` par défaut) vers `~/.local/share/imperial-terminal/warhammer_file.sh`. Sauvegarde de `~/.zshrc` en `~/.zshrc.backup-<timestamp>` avant toute écriture. Vérifications d'intégrité basiques (taille minimale + présence du marqueur `IMPERIAL TERMINAL CONFIGURATION`) avant install.

**Désinstallation rapide via `curl`**

```bash
curl -fsSL https://raw.githubusercontent.com/mpgamer75/Warhammer-40k-terminal-display/main/install.sh \
    | bash -s -- --uninstall
```

Restaure le `~/.zshrc.backup-<timestamp>` le plus récent. Si aucune sauvegarde n'existe (jamais installé via ce script), le script s'arrête proprement sans toucher au fichier. La désinstallation ne nécessite pas `warhammer_file.sh`, donc fonctionne via curl-pipe directement.

**Pinning d'une version**

Pour figer une version connue (recommandé en production), exporter `IMPERIAL_INSTALL_REF` avant le pipe :

```bash
# Tag de release
export IMPERIAL_INSTALL_REF=v3.0
curl -fsSL https://raw.githubusercontent.com/mpgamer75/Warhammer-40k-terminal-display/$IMPERIAL_INSTALL_REF/install.sh | bash

# SHA commit (immutable sur GitHub — la garantie d'intégrité la plus forte sans GPG)
export IMPERIAL_INSTALL_REF=d51c888
curl -fsSL https://raw.githubusercontent.com/mpgamer75/Warhammer-40k-terminal-display/$IMPERIAL_INSTALL_REF/install.sh | bash
```

### Option 2 — Clone + installeur (dev / contributeurs)

```bash
git clone https://github.com/mpgamer75/Warhammer-40k-terminal-display.git
cd Warhammer-40k-terminal-display
./install.sh
```

L'installeur :
- sauvegarde `~/.zshrc` en `~/.zshrc.backup-<timestamp>`
- propose **symlink** (suit les `git pull`) ou **copie** (fige la version)
- demande votre chapitre interactivement
- détecte les plugins Oh My Zsh manquants et donne la commande de clone

Flags disponibles :
```bash
./install.sh --symlink           # symlink direct, pas de prompt
./install.sh --copy              # copie
./install.sh --shell bash        # cibler ~/.bashrc au lieu de ~/.zshrc
./install.sh --quiet --copy      # non-interactif (CI / Ansible)
./install.sh --uninstall         # restaurer la sauvegarde la plus récente
```

### Option 3 — Manuelle

```bash
cp ~/.zshrc ~/.zshrc.backup
cp warhammer_file.sh ~/.zshrc
source ~/.zshrc
```

---

À la première session, `~/.imperial_chapter_config` est créé automatiquement (et lu **avant** l'affichage de la bannière, donc votre chapitre personnalisé apparaît dès le premier shell).

> **Conseil de premier usage :** lancez `imperial-doctor` pour vérifier dépendances, capacités du terminal et config en une commande.

### Dépendances

```bash
# Ubuntu / Debian
sudo apt install curl htop nmap iproute2 procps

# Plugins Oh My Zsh (chargés depuis plugins=(...))
git clone https://github.com/zsh-users/zsh-autosuggestions     ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Effets visuels optionnels
sudo apt install cmatrix hollywood
```

## Système de chapitre

La valeur de `$IMPERIAL_CHAPTER` détermine couleurs, symbole, cri de guerre et motto :

| Chapitre | Couleurs | Symbole | Cri de guerre |
|---|---|:---:|---|
| **ULTRAMARINES** *(défaut)* | Bleu / Or | ☩ | "COURAGE AND HONOUR!" |
| **BLOOD_ANGELS** | Rouge sang / Or | ⸸ | "FOR SANGUINIUS AND THE EMPEROR!" |
| **DARK_ANGELS** | Vert sombre / Bone | ⚔ | "REPENT! FOR TOMORROW YOU DIE!" |
| **SPACE_WOLVES** | Gris / Orange | 🐺 | "FOR RUSS AND THE ALLFATHER!" |
| **IMPERIAL_FISTS** | Jaune / Noir | ✊ | "PRIMARCH-PROGENITOR, TO YOUR GLORY!" |

Pour changer de chapitre, deux options :

```bash
# Méthode courte (v3.0+) : commande dédiée, valide le token, réécrit la config
chapter-switch BLOOD_ANGELS
reload-config

# Méthode manuelle
chapter-config         # ouvre ~/.imperial_chapter_config dans nano
# modifier IMPERIAL_CHAPTER="BLOOD_ANGELS" puis :
reload-config          # re-source sans la bannière
```

Si `IMPERIAL_CHAPTER` est inconnue (typo, ancien token), un avertissement est affiché au démarrage et le terminal retombe sur ULTRAMARINES.

## Date impériale

Format `M42.NNN.DDD.HHMM` :

| Segment | Sens |
|---|---|
| `M42` | 42ᵉ millénaire (lore-courant du 40K, M42.026 ≈ 2026 AD) |
| `NNN` | année dans le millénaire (3 chiffres) |
| `DDD` | jour de l'année (Julien) |
| `HHMM` | heure militaire |

Exemple : `M42.026.135.1430` = an 026 du 42ᵉ millénaire, jour 135, 14h30.

## Système de rang

Le rang est dérivé de l'uptime de la machine (lu depuis `/proc/uptime`) :

| Uptime | Rang |
|---:|---|
| 0–6 jours | BATTLE-BROTHER |
| 7–29 j | VETERAN |
| 30–99 j | SERGEANT |
| 100–364 j | CAPTAIN |
| 365+ j | CHAPTER-MASTER |

## Bannière au démarrage

Affichée **une fois par shell interactif**. Elle est sautée si :

- `IMPERIAL_QUIET=1` est exporté (utile en CI / SSH non-interactif)
- Le shell est non-interactif (scripts, `bash -c`, etc.)
- Le fichier est re-source dans la même session (via `reload-config` par ex.)

Le `clear` initial ne s'exécute qu'au niveau de shell le plus haut (`$SHLVL ≤ 1`), pour ne pas écraser le scrollback dans tmux / `:!sh` d'un éditeur.

## Variables d'environnement

| Variable | Effet |
|---|---|
| `IMPERIAL_QUIET=1` | Saute la bannière au démarrage |
| `IMPERIAL_AUTHORIZED=1` | **Débloque les commandes nmap.** À utiliser uniquement sur des réseaux dont vous êtes propriétaire ou que vous êtes autorisé à scanner. |
| `IMPERIAL_CHAPTER` | Token de chapitre. Normalement chargé depuis `~/.imperial_chapter_config`. |
| `IMPERIAL_BANNER_SHOWN` | Interne. Set à `1` une fois la bannière affichée, empêche le re-jouer. |

## Référence complète des commandes

### Rituels & statut

| Commande | Effet |
|---|---|
| `praise-omnissiah` | Bénédiction Mechanicus + uptime |
| `binary-prayer` | « Emperor protects » en binaire |
| `machine-blessing` | Rituel animé de bénédiction (~12s) |
| `emperor-blessing` | Bénédiction impériale (texte) |
| `chapter-oath` | Motto + cri de guerre du chapitre courant (bordure dynamique) |
| `imperial-status` | Rapport : rang, chapitre, compagnie, escouade, battle honors, uptime, load, date |
| `imperial-doctor` | Diagnostic : dépendances, capacités du terminal, validité de la config |
| `chapter-switch <NAME>` | Change le chapitre actif (valide + réécrit `~/.imperial_chapter_config`) |
| `help-imperial` | Codex complet des commandes |
| `imperial_date` | Date impériale `M42.NNN.DDD.HHMM` |
| `imperial_time` | Heure impériale |
| `imperial_rank` | Rang courant |

### Purification système (Linux / apt)

| Commande | Effet |
|---|---|
| `purify-system` | `apt update && apt upgrade` (avec rituel visuel) |
| `cleanse-heresy` | `apt autoremove && apt autoclean` |
| `install-sacred <paquet>` | `apt install` |
| `search-archives <terme>` | `apt search` |
| `sacred-logs` | `tail -f /var/log/syslog` |
| `system-status <service>` | `systemctl status` |
| `monitor-machine` | `htop` |
| `scan-machine` | `ps aux` |
| `storage-status` | `df -h` |

### Reconnaissance ⚿ *requiert `IMPERIAL_AUTHORIZED=1`*

| Commande | Effet |
|---|---|
| `recon-scan <range>` | `nmap -sn` (ping discovery) |
| `full-augury <target>` | `nmap -sV -O -T4 --script=default` (services + OS) |
| `stealth-probe <target>` | `nmap -sS -T2 -f` (SYN furtif fragmenté) |
| `deep-scan <target>` | `nmap -sS -sU -T4 -A -v --script=vuln` (TCP+UDP + vulns) |
| `active-channels` | `netstat -tulanp \| grep LISTEN` |
| `external-position` | IP externe via ipinfo.io (⚠ requête vers tiers) |
| `open-ports` | `ss -tuln` (ports locaux) |

Sans `IMPERIAL_AUTHORIZED=1`, les 4 commandes nmap affichent un avertissement et refusent de s'exécuter. **Ces scans peuvent être illégaux** sur des réseaux dont vous n'êtes pas propriétaire ou autorisé à tester (CFAA, Computer Misuse Act, équivalents). Vous restez responsable de la légalité.

### Gestion des données

| Commande | Effet |
|---|---|
| `list-data` | `ls -alF` avec couleurs |
| `brief-list` | `ls -CF` en colonnes |
| `read-scroll <fichier>` | `cat` |
| `inscribe <fichier>` | `nano` |
| `duplicate src dest` | `cp` |
| `relocate src dest` | `mv` |
| `purge <cible…>` ⚠ | `rm -rf` avec **confirmation textuelle** : tape `EXTERMINATUS` |
| `compress archive.tgz files` | `tar -czf` |
| `extract archive.tgz` | `tar -xzf` |

### Recherche & filtres

| Commande | Effet |
|---|---|
| `filter-data <pattern>` | `grep --color` |
| `search-pattern <pattern>` | `grep -r` (récursif) |
| `count-lines <fichier>` | `wc -l` |
| `sort-data` | `sort` |
| `unique-only` | `uniq` |

### Container / Docker

| Commande | Effet |
|---|---|
| `dcbuild` | `docker compose build` |
| `dcup` | `docker compose up` |
| `dcdown` | `docker compose down` |
| `dockps` | `docker ps` (format compact) |
| `docksh <container> [shell]` | `docker exec -it <container> <shell>`. Tente `bash` par défaut, fallback `/bin/sh` (alpine et autres images minimales). |

### Configuration

| Commande | Effet |
|---|---|
| `terminal-config` | éditer `~/.zshrc` |
| `chapter-config` | éditer `~/.imperial_chapter_config` |
| `reload-config` | re-source `~/.zshrc` (bannière sautée car déjà affichée) |

### Utilitaires & divers

| Commande | Effet |
|---|---|
| `c` | `clear` |
| `identity` | `whoami && id && groups` |
| `shutdown-now` ⚠ | Arrêt système avec **confirmation** : tape `EMPEROR` |
| `machine-spirit` | `cmatrix -s` (effet Matrix) |
| `data-stream` | `hollywood` (faux flux à la Hollywood) |

## Sécurité

| Commande | Garde |
|---|---|
| `purge` | Demande la phrase exacte `EXTERMINATUS` avant d'exécuter `rm -rf`. Un tab-complete accidentel ne peut donc rien supprimer. |
| `shutdown-now` | Demande la phrase exacte `EMPEROR` avant `sudo shutdown -h now`. |
| `recon-scan`, `full-augury`, `stealth-probe`, `deep-scan` | Bloqués par défaut. Requièrent `IMPERIAL_AUTHORIZED=1`. Le bandeau d'avertissement explique pourquoi (CFAA / CMA). |
| `external-position` | Fait une requête HTTPS sortante vers `ipinfo.io` — votre IP réelle est exposée à ce tiers. Préférez `ip addr` ou `hostname -I` si ce n'est pas souhaité. |

## Performance

- **Bannière de démarrage** : ~3s (animations `imperial_loading`). Skip via `IMPERIAL_QUIET=1` ou shell non-interactif.
- **Prompt droit (zsh) avec date dynamique** : refresh toutes les `TMOUT=60` secondes (était 1s). Pour des shells encore plus discrets, mettre `TMOUT=300` après le source.
- **Détection processus** : `detect_heresy` lance 3 `pgrep` au démarrage uniquement (pas à chaque prompt).
- **Re-sourcing** : la bannière n'est pas rejouée grâce à `IMPERIAL_BANNER_SHOWN`.

## Architecture

Le fichier `warhammer_file.sh` (~770 lignes) est organisé en blocs (top-to-bottom) :

1. Boilerplate Oh My Zsh (plugins, theme désactivé)
2. Bootstrap `~/.imperial_chapter_config` + `case` couleurs/symboles par chapitre
3. Palette couleurs partagée (24-bit ANSI)
4. Primitives UI (`imperial_date`, `imperial_loading`, `imperial_box`, etc.)
5. Système de rang, gestion d'erreur, événements ambiants (warp storms, blessings)
6. Aliases groupés par thème
7. Bannière (gated par `IMPERIAL_QUIET` / non-interactif)
8. Rituels haut niveau (`praise-omnissiah`, `machine-blessing`, etc.)
9. `help-imperial` (codex complet)

Détails dans `CLAUDE.md` à la racine.

## Personnalisation

### Changer de chapitre

```bash
chapter-config         # édite ~/.imperial_chapter_config
# IMPERIAL_CHAPTER="BLOOD_ANGELS"
# COMPANY="3rd Company"
# SQUAD="Death Company"
# BATTLE_HONORS=("Baal" "Armageddon" "Vraks")
reload-config
```

### Ajouter un chapitre custom

Modifier le `case` dans `warhammer_file.sh` (vers la ligne 95) :

```bash
"YOUR_CHAPTER")
    PRIMARY_COLOR="\033[38;2;R;G;Bm"   # couleur 24-bit
    SECONDARY_COLOR="\033[38;2;R;G;Bm"
    CHAPTER_SYMBOL="⚡"
    BATTLE_CRY="Your battle cry!"
    CHAPTER_MOTTO="Your motto"
    ;;
```

Puis ajouter le nom-affichage propre dans `imperial_chapter_display()` (vers la ligne 148) :

```bash
YOUR_CHAPTER) echo "Your Chapter" ;;
```

## Exemples d'usage

### Rituel quotidien

```bash
purify-system && cleanse-heresy && imperial-status
```

### Mission de reconnaissance (réseau autorisé)

```bash
export IMPERIAL_AUTHORIZED=1
recon-scan 192.168.1.0/24
full-augury 192.168.1.42
```

### Shell silencieux (SSH / CI)

```bash
IMPERIAL_QUIET=1 ssh user@host
# ou de façon permanente dans ~/.ssh/environment :
IMPERIAL_QUIET=1
```

### Shell interactif dans un container

```bash
docksh my-container        # tente bash, fallback sh
docksh my-container ash    # force ash (Alpine)
```

### Bénédiction du soir

```bash
emperor-blessing && machine-blessing
```

## Dépannage

**Le prompt droit montre `M30` au lieu de `M42`**
Vous utilisez encore une version ≤ 2.0. Récupérez la dernière `warhammer_file.sh` et relancez un nouveau terminal (ou `exec zsh`).

**`/home/user/.zshrc:407: defining function based on alias 'purge'`**
Une ancienne version définissait `alias purge='rm -rf'`. La version actuelle `unalias` au début, mais si le shell mixe les deux états, un `exec zsh` ou un nouveau terminal résout.

**Couleurs absentes ou incorrectes**
Vérifier `$COLORTERM` (doit contenir `truecolor`) et `$TERM` (≥ 256 couleurs). Les couleurs 24-bit utilisent les escapes `\033[38;2;R;G;Bm`.

**Trop d'animations / boot trop long**
Mettre `export IMPERIAL_QUIET=1` dans `~/.zshenv` pour skipper la bannière en permanence.

**Restaurer la config précédente**
```bash
cp ~/.zshrc.backup ~/.zshrc && exec zsh
```

## Quoi de neuf

### v3.0 — Édition Doctor

**Nouvelles commandes :**
- `imperial-doctor` — diagnostic complet : version du shell, support 24-bit / 256 couleurs, largeur du terminal, binaires (`curl`, `htop`, `nmap`, `ss`, `pgrep`, `awk`, `apt`), plugins Oh My Zsh, fichier de config, validité du chapitre, état des variables d'env. Sortie `✓ / ⚠ / ✗` avec résumé.
- `chapter-switch <NAME>` — bascule de chapitre en une commande : valide le token, réécrit `~/.imperial_chapter_config` via `awk`, demande un `reload-config`. Sans argument : liste les chapitres et marque l'actuel.

**Outillage :**
- `install.sh` — bootstrap automatisé. Sauvegarde de `~/.zshrc` en `.backup-<timestamp>`, choix symlink/copie, prompt de chapitre, détection des plugins OMZ manquants. Mode `--quiet` pour CI/Ansible. Mode `--uninstall` pour restaurer le backup le plus récent.
- `.github/workflows/shellcheck.yml` — CI qui lint `install.sh` (et tout futur script bash portable) sur push/PR. `warhammer_file.sh` est exclu car shellcheck ne comprend pas la syntaxe zsh (`PROMPT %F{}`, `setopt`, etc.).

**Robustesse :**
- Validation du token `IMPERIAL_CHAPTER` au boot : un nom inconnu affiche un avertissement sur stderr et retombe sur ULTRAMARINES au lieu de tomber silencieusement dans le `*)` du `case`.

**Pas de changement breaking** vs v2.1 — la version monte à v3.0 parce que la surface des commandes utilisateur s'élargit (`imperial-doctor`, `chapter-switch`, `install.sh`) et que les garde-fous sécurité de v2.1 sont désormais documentés comme contrat stable.

### v2.1 — Édition Codex Améliorée

**Corrections :**
- Date impériale : offset `+40000` (affichait M30 au lieu de M42)
- Rang : utilise `/proc/uptime` et ajoute le tier CHAPTER-MASTER (365 j+)
- Crâne ASCII : recentré, mur droit aligné, bannière entière à 88 colonnes
- `contextual_message` : `Dawn Patrol` réellement affiché à 6h (était `Night Watch`)
- `vox_message` : garde anti-overflow pour messages > 48 caractères
- `chapter-oath` : bordures dynamiques selon la longueur du motto
- `imperial-status` : Battle Honors / Company / Squad ajoutés, tolère absence de `uptime -p`
- `docksh` : `$1` quoté, fallback `/bin/sh` (Alpine et autres images minimales)
- Doublons `help-imperial` / `create_chapter_config` supprimés
- Bootstrap `~/.imperial_chapter_config` *avant* le source (1ʳᵉ session voit ses settings)

**Sécurité :**
- `purge` : fonction avec confirmation `EXTERMINATUS`
- `shutdown-now` : fonction avec confirmation `EMPEROR`
- Aliases nmap (`recon-scan`, `full-augury`, `stealth-probe`, `deep-scan`) : gated par `IMPERIAL_AUTHORIZED=1`

**Performance / cross-shell :**
- `TMOUT=1` → `TMOUT=60` (élimine fork-exec storms via `$(imperial_date)` dans RPROMPT)
- Bannière wrappée : skip si `IMPERIAL_QUIET=1`, non-interactif, ou déjà affichée
- `PROMPT` / `RPROMPT` / `TRAPALRM` / `setopt` derrière garde `[[ -n $ZSH_VERSION ]]` → bash propre
- `command_not_found_handle` ajouté (équivalent bash de `command_not_found_handler` zsh)

**UX :**
- `help-imperial` : codex complet, sections gold, légende ⚠/⚿, exemples rapides
- Noms de chapitres affichés en propre (« Blood Angels » au lieu de « BLOOD_ANGELS »)

### Version 2.0 — Édition Améliorée

- Palette couleurs impériale authentique
- Animations interactives (`imperial_loading`, `imperial_progress`, `imperial_box`, `imperial_type`)
- ASCII art crâne impérial
- Système de rangs, événements warp storm
- Messages contextuels selon l'heure (Dawn / Midday / Night)

## Fichiers du projet

- `warhammer_file.sh` — configuration complète (un seul fichier, ~890 lignes)
- `install.sh` — bootstrap (backup + install + chapter prompt)
- `README.md` — documentation française (primaire)
- `README_EN.md` — documentation anglaise (mirroir)
- `CLAUDE.md` — guide pour les agents Claude Code (architecture, conventions)
- `.github/workflows/shellcheck.yml` — CI shellcheck sur scripts portables
- `LICENSE` — licence MIT
- `warhammer_image_1.jpg` — logo

## Contribuer

Soumettez vos améliorations :

- Nouveaux chapitres Space Marines
- Aliases thématiques additionnels
- Améliorations ASCII art / symboles
- Précisions lore
- Optimisations performance / cross-shell

**Garde-fous :**
- Garder la précision lore (Omnissiah, Macragge, mottos, etc.)
- Réutiliser les constantes de couleur (`GOLD_IMPERIAL`, `CRIMSON_RED`, …) plutôt que de nouveaux escapes bruts
- Terminer chaque `printf`/`echo` stylé par `${RESET}`
- Préserver les commentaires Oh My Zsh en tête de fichier
- Tester en zsh **et** en bash (`bash -n warhammer_file.sh; zsh -n warhammer_file.sh`)

## Licence

MIT — voir `LICENSE`.

**The Emperor Protects Those Who Serve**

---

<div align="center">
  <h2><strong>FOR THE EMPEROR</strong></h2>
  <p><em>Dans les ténèbres du lointain futur, il n'y a que la guerre... et des terminaux magnifiquement thématisés.</em></p>
</div>
