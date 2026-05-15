#!/usr/bin/env bash
# Imperial Terminal — installer
#
# Backs up the user's existing ~/.zshrc (and optionally ~/.bashrc), then either
# symlinks or copies warhammer_file.sh into place. Interactive but every prompt
# has a sensible default, so a bare `./install.sh` works.
#
# Usage:
#     ./install.sh                # interactive
#     ./install.sh --symlink      # default to symlink mode
#     ./install.sh --copy         # default to copy mode
#     ./install.sh --shell bash   # target .bashrc instead of .zshrc
#     ./install.sh --quiet        # non-interactive, copies, no chapter prompt
#     ./install.sh --uninstall    # restore most recent .{z,b}shrc.backup-*

set -euo pipefail

# ---------- helpers ----------
RED='\033[38;2;183;28;28m'
GREEN='\033[38;2;51;255;102m'
AMBER='\033[38;2;251;192;45m'
GOLD='\033[38;2;255;215;0m'
RESET='\033[0m'

say()  { printf "${GREEN}»${RESET} %s\n"  "$1"; }
warn() { printf "${AMBER}⚠${RESET} %s\n"  "$1" >&2; }
die()  { printf "${RED}✗${RESET} %s\n"    "$1" >&2; exit 1; }

ask() {
    # ask <prompt> <default>  ->  echo answer (or default if non-interactive)
    local prompt="$1" default="$2" answer
    if [[ "$QUIET" == "1" || ! -t 0 ]]; then
        echo "$default"
        return
    fi
    printf "${GOLD}?${RESET} %s [%s]: " "$prompt" "$default" >&2
    IFS= read -r answer
    echo "${answer:-$default}"
}

# ---------- arg parsing ----------
MODE=""
SHELL_TARGET=""
QUIET=0
ACTION="install"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --symlink)   MODE="symlink" ;;
        --copy)      MODE="copy" ;;
        --shell)     SHELL_TARGET="${2:-}"; shift ;;
        --quiet)     QUIET=1 ;;
        --uninstall) ACTION="uninstall" ;;
        -h|--help)
            sed -n '2,/^set -/p' "$0" | sed -n '/^#/p' | sed 's/^# \{0,1\}//'
            exit 0
            ;;
        *)           die "Unknown argument: $1 (try --help)" ;;
    esac
    shift
done

# ---------- locate the source file ----------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_FILE="$SCRIPT_DIR/warhammer_file.sh"
[[ -f "$SOURCE_FILE" ]] || die "warhammer_file.sh not found in $SCRIPT_DIR"

# ---------- pick target rc file ----------
if [[ -z "$SHELL_TARGET" ]]; then
    if [[ -n "${ZSH_VERSION:-}" ]] || command -v zsh >/dev/null 2>&1; then
        SHELL_TARGET="zsh"
    else
        SHELL_TARGET="bash"
    fi
fi
case "$SHELL_TARGET" in
    zsh)  RC_FILE="$HOME/.zshrc" ;;
    bash) RC_FILE="$HOME/.bashrc" ;;
    *)    die "Unknown shell target: $SHELL_TARGET (use 'zsh' or 'bash')" ;;
esac

# ---------- uninstall path ----------
if [[ "$ACTION" == "uninstall" ]]; then
    # Find most recent backup
    backup=$(ls -t "$RC_FILE.backup-"* 2>/dev/null | head -n1 || true)
    [[ -n "$backup" ]] || die "No backup found matching $RC_FILE.backup-*"
    say "Restoring $RC_FILE from $backup"
    cp -- "$backup" "$RC_FILE"
    say "Done. Open a new shell to use the restored config."
    exit 0
fi

# ---------- install path ----------
printf "\n${GOLD}╔═══════════════════════════════════════════════╗${RESET}\n"
printf "${GOLD}║      IMPERIAL TERMINAL INSTALLER              ║${RESET}\n"
printf "${GOLD}╚═══════════════════════════════════════════════╝${RESET}\n\n"

say "Target shell:   $SHELL_TARGET"
say "Target file:    $RC_FILE"
say "Source:         $SOURCE_FILE"
echo

# Back up existing rc file if present
if [[ -f "$RC_FILE" || -L "$RC_FILE" ]]; then
    backup="$RC_FILE.backup-$(date +%Y%m%d-%H%M%S)"
    say "Backing up existing $RC_FILE → $backup"
    cp -- "$RC_FILE" "$backup"
fi

# Choose install mode
if [[ -z "$MODE" ]]; then
    answer=$(ask "Install method: (s)ymlink or (c)opy?" "s")
    case "$answer" in
        s|S|symlink) MODE="symlink" ;;
        c|C|copy)    MODE="copy" ;;
        *)           die "Invalid choice: $answer" ;;
    esac
fi

case "$MODE" in
    symlink)
        say "Symlinking $SOURCE_FILE → $RC_FILE"
        ln -snf -- "$SOURCE_FILE" "$RC_FILE"
        ;;
    copy)
        say "Copying $SOURCE_FILE → $RC_FILE"
        cp -- "$SOURCE_FILE" "$RC_FILE"
        ;;
esac

# Chapter selection (interactive only)
if [[ "$QUIET" != "1" && -t 0 ]]; then
    echo
    say "Choose your chapter:"
    select chapter in ULTRAMARINES BLOOD_ANGELS DARK_ANGELS SPACE_WOLVES IMPERIAL_FISTS "(skip — use default)"; do
        case "$chapter" in
            ULTRAMARINES|BLOOD_ANGELS|DARK_ANGELS|SPACE_WOLVES|IMPERIAL_FISTS)
                config="$HOME/.imperial_chapter_config"
                # If config doesn't exist yet, the rc file will create it on first source.
                # Write a minimal one now so the user's choice is honoured immediately.
                cat > "$config" <<EOF
IMPERIAL_CHAPTER="$chapter"
COMPANY="2nd Company"
SQUAD="Tactical Squad Titus"
BATTLE_HONORS=("Hive Fleet Behemoth" "Siege of Macragge" "Defence of Macragge")
EOF
                say "Chapter set to $chapter (in $config)"
                break
                ;;
            "(skip — use default)")
                say "Using default chapter (Ultramarines). Run 'chapter-switch <NAME>' later to change."
                break
                ;;
            *)
                warn "Invalid selection. Pick a number."
                ;;
        esac
    done
fi

# OMZ plugin hint
if [[ "$SHELL_TARGET" == "zsh" ]]; then
    echo
    omz_custom="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    missing=()
    [[ -d "$omz_custom/plugins/zsh-autosuggestions"     ]] || missing+=("zsh-autosuggestions")
    [[ -d "$omz_custom/plugins/zsh-syntax-highlighting" ]] || missing+=("zsh-syntax-highlighting")
    if [[ ${#missing[@]} -gt 0 ]]; then
        warn "Missing Oh My Zsh plugins: ${missing[*]}"
        echo "  To install them:"
        for p in "${missing[@]}"; do
            echo "    git clone https://github.com/zsh-users/$p \\"
            echo "      \"$omz_custom/plugins/$p\""
        done
    fi
fi

echo
printf "${GREEN}✓ Installation complete.${RESET}\n"
printf "  Open a new ${SHELL_TARGET} shell, or run: ${GOLD}exec ${SHELL_TARGET}${RESET}\n"
printf "  Then try: ${GOLD}help-imperial${RESET} or ${GOLD}imperial-doctor${RESET}\n"
