# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disable Powerlevel10k pour utiliser un prompt personnalisé Warhammer 40k style
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  sudo
  web-search
  copypath
  copyfile
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# ═════════════════════════════════════════════════════════════════════════════
# IMPERIAL TERMINAL CONFIGURATION - SERVANT OF THE EMPEROR
# ═════════════════════════════════════════════════════════════════════════════

# Load Imperial Chapter Configuration
IMPERIAL_CONFIG_FILE="$HOME/.imperial_chapter_config"

# Create the chapter-config file on first launch *before* sourcing it, so the
# very first shell already reflects user-customizable defaults (previously the
# file was created after the banner finished, requiring a second shell).
if [[ ! -f "$IMPERIAL_CONFIG_FILE" ]]; then
    cat > "$IMPERIAL_CONFIG_FILE" << 'EOF'
# Imperial Chapter Configuration File
# Modify these values to customize your Chapter

IMPERIAL_CHAPTER="ULTRAMARINES"
COMPANY="2nd Company"
SQUAD="Tactical Squad Titus"
BATTLE_HONORS=("Hive Fleet Behemoth" "Siege of Macragge" "Defence of Macragge")

# Available Chapters:
# - ULTRAMARINES (default blue/gold)
# - BLOOD_ANGELS (red/gold)
# - DARK_ANGELS (dark green/bone)
# - SPACE_WOLVES (grey/orange)
# - IMPERIAL_FISTS (yellow/black)
EOF
fi
source "$IMPERIAL_CONFIG_FILE"

# Imperial Chapter Color System
case $IMPERIAL_CHAPTER in
    "BLOOD_ANGELS")
        PRIMARY_COLOR="\033[38;2;220;20;60m"    # Rouge sang
        SECONDARY_COLOR="\033[38;2;255;215;0m"  # Or
        CHAPTER_SYMBOL="⸸"
        BATTLE_CRY="FOR SANGUINIUS AND THE EMPEROR!"
        CHAPTER_MOTTO="In Death, Sacrifice. In Sacrifice, Victory."
        ;;
    "DARK_ANGELS")
        PRIMARY_COLOR="\033[38;2;0;100;0m"      # Vert sombre
        SECONDARY_COLOR="\033[38;2;245;245;220m" # Bone
        CHAPTER_SYMBOL="⚔"
        BATTLE_CRY="REPENT! FOR TOMORROW YOU DIE!"
        CHAPTER_MOTTO="Loyalty is its own reward"
        ;;
    "SPACE_WOLVES")
        PRIMARY_COLOR="\033[38;2;105;105;105m"  # Gris loup
        SECONDARY_COLOR="\033[38;2;255;140;0m"  # Orange
        CHAPTER_SYMBOL="🐺"
        BATTLE_CRY="FOR RUSS AND THE ALLFATHER!"
        CHAPTER_MOTTO="There are no wolves on Fenris"
        ;;
    "IMPERIAL_FISTS")
        PRIMARY_COLOR="\033[38;2;255;215;0m"    # Jaune impérial
        SECONDARY_COLOR="\033[38;2;0;0;0m"      # Noir
        CHAPTER_SYMBOL="✊"
        BATTLE_CRY="PRIMARCH-PROGENITOR, TO YOUR GLORY!"
        CHAPTER_MOTTO="The pain of the mind is worse than the pain of the body"
        ;;
    *)
        PRIMARY_COLOR="\033[38;2;51;255;102m"   # Bleu Ultramarines (défaut vert phosphore)
        SECONDARY_COLOR="\033[38;2;255;215;0m"  # Or
        CHAPTER_SYMBOL="☩"
        BATTLE_CRY="COURAGE AND HONOUR!"
        CHAPTER_MOTTO="We march for Macragge!"
        ;;
esac

# Pretty display form for the chapter token (e.g. BLOOD_ANGELS → "Blood Angels").
imperial_chapter_display() {
    case "$IMPERIAL_CHAPTER" in
        ULTRAMARINES)   echo "Ultramarines" ;;
        BLOOD_ANGELS)   echo "Blood Angels" ;;
        DARK_ANGELS)    echo "Dark Angels" ;;
        SPACE_WOLVES)   echo "Space Wolves" ;;
        IMPERIAL_FISTS) echo "Imperial Fists" ;;
        *)              echo "$IMPERIAL_CHAPTER" ;;
    esac
}

# Couleurs phosphore vert authentique des terminaux impériaux + couleurs chapitre
GREEN_PHOSPHOR="$PRIMARY_COLOR"
DARK_GREEN="\033[38;2;0;128;0m"
BRIGHT_GREEN="\033[92m"
RED_WARNING="\033[38;2;183;28;28m"      # Rouge sang W40k
AMBER_ALERT="\033[38;2;251;192;45m"     # Jaune impérial W40k
WHITE_TEXT="\033[97m"
CHAPTER_COLOR="$SECONDARY_COLOR"
STEEL_GREY="\033[38;2;125;127;129m"     # Gris acier
GOLD_IMPERIAL="\033[38;2;255;215;0m"    # Or impérial
CRIMSON_RED="\033[38;2;220;20;60m"      # Rouge cramoisi
GOTHIC_BLACK="\033[38;2;28;28;28m"      # Noir gothique
RESET="\033[0m"

# Imperial Date System (M41/M42 timeline)
# Offset chosen so the current real year lands in M42 (lore-consistent with the
# "current" 40K era). 2026 → 42026 → M42.026.
function imperial_date() {
    local year=$(date +%Y)
    local imperial_year=$((year + 40000))
    printf "M%02d.%03d.%s.%s\n" \
        "$((imperial_year / 1000))" \
        "$((imperial_year % 1000))" \
        "$(date +%j)" \
        "$(date +%H%M)"
}

# Imperial Time Format
function imperial_time() {
    local hour=$(date +%H)
    local minute=$(date +%M)
    local second=$(date +%S)
    echo "${hour}${minute}.${second}"
}

# Animation de chargement impériale
function imperial_loading() {
    local message="$1"
    local duration=${2:-3}
    echo -ne "${GREEN_PHOSPHOR}${message}${RESET} "
    for ((i=0; i<duration; i++)); do
        echo -ne "${BRIGHT_GREEN}▓${RESET}"
        sleep 0.3
    done
    echo -e " ${BRIGHT_GREEN}[✓]${RESET}"
}

# Barre de progression impériale
function imperial_progress() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local filled=$((width * current / total))
    local empty=$((width - filled))
    
    printf "\r${GREEN_PHOSPHOR}["
    printf "%${filled}s" | tr ' ' '█'
    printf "${STEEL_GREY}%${empty}s" | tr ' ' '░'
    printf "${GREEN_PHOSPHOR}] ${GOLD_IMPERIAL}%3d%%${RESET}" "$percentage"
    
    if [ "$current" -eq "$total" ]; then
        echo ""
    fi
}

# Affichage stylé avec bordures
function imperial_box() {
    local message="$1"
    local color="${2:-$GREEN_PHOSPHOR}"
    local length=${#message}
    local border_length=$((length + 4))
    
    printf "${color}╔"
    printf "═%.0s" $(seq 1 $border_length)
    printf "╗\n"
    printf "║  %s  ║\n" "$message"
    printf "╚"
    printf "═%.0s" $(seq 1 $border_length)
    printf "╝${RESET}\n"
}

# Effet de typing pour les messages importants
function imperial_type() {
    local text="$1"
    local color="${2:-$GREEN_PHOSPHOR}"
    local delay=${3:-0.03}
    
    for ((i=0; i<${#text}; i++)); do
        echo -ne "${color}${text:$i:1}${RESET}"
        sleep "$delay"
    done
    echo ""
}

# Système de rangs basé sur l'uptime
# /proc/uptime is reliable across reboots and gives seconds directly,
# unlike `uptime` whose text format omits "days" when < 1 day.
function imperial_rank() {
    local up_seconds up_days
    if [[ -r /proc/uptime ]]; then
        up_seconds=$(awk '{print int($1)}' /proc/uptime)
    else
        up_seconds=0
    fi
    up_days=$((up_seconds / 86400))

    if   (( up_days >= 365 )); then echo "CHAPTER-MASTER"
    elif (( up_days >= 100 )); then echo "CAPTAIN"
    elif (( up_days >= 30 ));  then echo "SERGEANT"
    elif (( up_days >= 7 ));   then echo "VETERAN"
    else                            echo "BATTLE-BROTHER"
    fi
}

# Messages d'erreur thématiques
# zsh calls command_not_found_handler; bash calls command_not_found_handle.
function command_not_found_handler() {
    echo -e "${RED_WARNING}╔══════════════════════════════════════╗${RESET}"
    echo -e "${RED_WARNING}║  HERETICAL COMMAND DETECTED: '$1'    ║${RESET}"
    echo -e "${RED_WARNING}║  Consult the Sacred Codex below      ║${RESET}"
    echo -e "${RED_WARNING}╚══════════════════════════════════════╝${RESET}"
    echo -e "${GREEN_PHOSPHOR}Sacred Command: help-imperial${RESET}"
    return 127
}
command_not_found_handle() { command_not_found_handler "$@"; }

# Bénédictions impériales aléatoires
imperial_blessings=(
    "The Emperor protects the faithful"
    "Knowledge is power, guard it well"
    "An open mind is like a fortress with its gates unbarred"
    "Blessed is the mind too small for doubt"
    "Hope is the first step on the road to disappointment"
    "Suffer not the alien to live"
    "The wise learn from the deaths of others"
    "Victory needs no explanation, defeat allows none"
    "Success is commemorated; Failure merely remembered"
    "Only in death does duty end"
)

function random_blessing() {
    local blessing="${imperial_blessings[$RANDOM % ${#imperial_blessings[@]}]}"
    echo -e "${AMBER_ALERT}Imperial Wisdom: ${blessing}${RESET}"
}

# Détection d'événements warp (flavor only — always returns success)
function warp_storm_check() {
    if [[ $((RANDOM % 200)) -lt 1 ]]; then  # 0.5% de chance
        echo -e "${RED_WARNING}╔═════════ WARP ANOMALY DETECTED ═════════╗${RESET}"
        echo -e "${RED_WARNING}║ Gellar Field fluctuations detected...   ║${RESET}"
        echo -e "${RED_WARNING}║ Navigator reports safe passage ahead    ║${RESET}"
        echo -e "${RED_WARNING}╚══════════════════════════════════════════╝${RESET}"
        sleep 1
        echo -e "${GREEN_PHOSPHOR}The Emperor's light guides us through the storm${RESET}"
    fi
}

# Authorization gate for offensive recon (nmap). Returns non-zero unless
# IMPERIAL_AUTHORIZED=1 is set, blocking the scan with a printed warning.
function imperial_nmap_check() {
    if [[ "$IMPERIAL_AUTHORIZED" != "1" ]]; then
        echo -e "${RED_WARNING}╔════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${RED_WARNING}║ ⚠  Network reconnaissance requires authorization.          ║${RESET}"
        echo -e "${RED_WARNING}║    Scanning networks you do not own may be illegal         ║${RESET}"
        echo -e "${RED_WARNING}║    (CFAA, Computer Misuse Act, equivalents).               ║${RESET}"
        echo -e "${RED_WARNING}║                                                            ║${RESET}"
        echo -e "${RED_WARNING}║    To proceed: export IMPERIAL_AUTHORIZED=1                ║${RESET}"
        echo -e "${RED_WARNING}╚════════════════════════════════════════════════════════════╝${RESET}"
        return 1
    fi
    return 0
}

# Messages de succès/échec pour opérations importantes
function success_litany() {
    echo -e "${GREEN_PHOSPHOR}☩ The Emperor's will is done ☩${RESET}"
}

function failure_litany() {
    echo -e "${RED_WARNING}⚠ The machine spirit is displeased ⚠${RESET}"
    echo -e "${AMBER_ALERT}Recite the Litany of Ignition and try again${RESET}"
}

# Système de vox-communication
function vox_message() {
    local message="$1"
    local length=${#message}
    # Inner width is fixed at 50; truncate long messages so padding stays positive.
    if (( length > 48 )); then
        message="${message:0:45}..."
        length=${#message}
    fi
    local padding=$(( (50 - length) / 2 ))
    local line=""

    for ((i=0; i<50; i++)); do line+="═"; done

    echo -e "${GREEN_PHOSPHOR}╔${line}╗${RESET}"
    printf "${GREEN_PHOSPHOR}║%*s%s%*s║${RESET}\n" $padding "" "$message" $((50 - length - padding)) ""
    echo -e "${GREEN_PHOSPHOR}╚${line}╝${RESET}"
}

# Prompt ASTARTES (zsh-only — %F{}, RPROMPT, zle are zsh extensions; bash falls
# back to its own PS1 elsewhere). TMOUT=60 instead of 1 so the prompt only redraws
# once a minute, avoiding sub-second fork-exec storms from $(imperial_date).
if [[ -n "$ZSH_VERSION" ]]; then
    PROMPT='%F{green}╔═══[%B%F{46}$(imperial_rank)%b%f%F{green}]═[%F{46}%n@%M%f%F{green}]═[%F{cyan}%~%f%F{green}]
╚══☩ %f'
    RPROMPT='%F{green}[%F{46}$(imperial_date)%f%F{green}]☩%f'

    TMOUT=60
    TRAPALRM() {
        zle reset-prompt 2>/dev/null || true
    }
fi

# IMPERIAL ALIASES - SERVICE À L'EMPEREUR

# === SYSTEM PURIFICATION ===
alias purify-system='echo -e "${GOLD_IMPERIAL}╔═══════════════════════════════════════════════════════════╗${RESET}"; echo -e "${GOLD_IMPERIAL}║  INITIATING SYSTEM PURIFICATION PROTOCOL                  ║${RESET}"; echo -e "${GOLD_IMPERIAL}╚═══════════════════════════════════════════════════════════╝${RESET}"; imperial_loading "Sanctifying system repositories" 2; sudo apt update && sudo apt upgrade && success_litany'
alias cleanse-heresy='echo -e "${CRIMSON_RED}╔═══════════════════════════════════════════════════════════╗${RESET}"; echo -e "${CRIMSON_RED}║  PURGING HERETICAL DATA FROM SYSTEM                       ║${RESET}"; echo -e "${CRIMSON_RED}╚═══════════════════════════════════════════════════════════╝${RESET}"; imperial_loading "Cleansing corrupted packages" 2; sudo apt autoremove && sudo apt autoclean && success_litany'
alias install-sacred='sudo apt install'
alias search-archives='sudo apt search'
alias sacred-logs='sudo tail -f /var/log/syslog'
alias system-status='systemctl status'
alias monitor-machine='htop'
alias scan-machine='ps aux'
alias storage-status='df -h'

# === RECONNAISSANCE & SECURITY ===
# All nmap aliases are gated by imperial_nmap_check; set IMPERIAL_AUTHORIZED=1
# only when scanning networks you own or have written permission to test.
alias recon-scan='imperial_nmap_check && { warp_storm_check; nmap -sn; }'
alias full-augury='imperial_nmap_check && { warp_storm_check; nmap -sV -O -T4 --script=default; }'
alias stealth-probe='imperial_nmap_check && { warp_storm_check; nmap -sS -T2 -f; }'
alias deep-scan='imperial_nmap_check && { warp_storm_check; nmap -sS -sU -T4 -A -v --script=vuln; }'
alias active-channels='netstat -tulanp | grep LISTEN'
alias external-position='curl -s https://ipinfo.io/ip'
alias open-ports='ss -tuln'

# === DATA MANAGEMENT ===
alias list-data='ls -alF --color=always'
alias brief-list='ls -CF --color=always'
alias read-scroll='cat'
alias inscribe='nano'
alias duplicate='cp'
alias relocate='mv'
# A prior version of this file aliased `purge` to `rm -rf`. Re-sourcing into
# a shell that still has that alias would make `purge() {` parse as
# `'rm -rf'() {` and fail. Drop any stale alias first, then use the `function`
# keyword (no alias expansion at parse time in zsh).
unalias purge 2>/dev/null
function purge {
    if (( $# == 0 )); then
        echo -e "${AMBER_ALERT}Usage: purge <target> [more targets...]${RESET}" >&2
        return 1
    fi
    echo -e "${RED_WARNING}⚠ Purge protocol — the following will be removed recursively:${RESET}"
    local t
    for t in "$@"; do echo "    $t"; done
    printf "%s" "Confirm with EXTERMINATUS: "
    local confirm
    read -r confirm
    if [[ "$confirm" != "EXTERMINATUS" ]]; then
        echo "Purge aborted. The Emperor has spared the data this day."
        return 1
    fi
    rm -rf -- "$@"
}
alias compress='tar -czf'
alias extract='tar -xzf'

# === SEARCH & FILTER ===
alias filter-data='grep --color=always'
alias search-pattern='grep -r'
alias count-lines='wc -l'
alias sort-data='sort'
alias unique-only='uniq'

# === CONFIGURATION ===
alias terminal-config='nano ~/.zshrc'
alias reload-config='source ~/.zshrc && vox_message "IMPERIAL CONFIGURATION RELOADED"'
alias chapter-config='nano ~/.imperial_chapter_config'

# === UTILITY ===
alias c='clear'
alias identity='whoami && id && groups'
# Same precaution as `purge`: the previous version aliased `shutdown-now`;
# drop the alias before defining the function and use the `function` keyword
# so re-sourcing into an alias-bearing shell parses cleanly.
unalias shutdown-now 2>/dev/null
function shutdown-now {
    vox_message "INITIATING EMERGENCY SHUTDOWN PROTOCOL"
    printf "%s" "Confirm shutdown — type EMPEROR: "
    local confirm
    read -r confirm
    if [[ "$confirm" != "EMPEROR" ]]; then
        echo "Shutdown aborted."
        return 1
    fi
    sudo shutdown -h now
}

# === ENTERTAINMENT ===
alias machine-spirit='cmatrix -s'
alias data-stream='hollywood'

# === DOCKER COMMANDS ===
alias dcbuild='docker compose build'
alias dcup='docker compose up'
alias dcdown='docker compose down'
alias dockps='docker ps --format "{{.ID}} {{.Names}}"'
docksh() {
    [[ -z "$1" ]] && { echo "Usage: docksh <container> [shell]"; return 1; }
    docker exec -it "$1" "${2:-bash}" 2>/dev/null || docker exec -it "$1" /bin/sh
}

# History configuration - Mémoire Impériale
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
# setopt is a zsh builtin; calling it from bash would trigger command_not_found.
if [[ -n "$ZSH_VERSION" ]]; then
    setopt HIST_EXPIRE_DUPS_FIRST
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_IGNORE_SPACE
    setopt HIST_FIND_NO_DUPS
    setopt HIST_SAVE_NO_DUPS
    setopt APPEND_HISTORY
    setopt SHARE_HISTORY
    setopt INC_APPEND_HISTORY
fi

# Couleurs IMPERIALES pour ls
export LS_COLORS='di=01;92:ln=01;96:pi=40;92:so=01;95:do=01;95:bd=40;92;01:cd=40;92;01:or=40;91;01:ex=01;92:*.tar=01;91:*.tgz=01;91:*.arc=01;91:*.arj=01;91:*.taz=01;91:*.lha=01;91:*.lz4=01;91:*.lzh=01;91:*.lzma=01;91:*.tlz=01;91:*.txz=01;91:*.tzo=01;91:*.t7z=01;91:*.zip=01;91:*.z=01;91:*.dz=01;91:*.gz=01;91:*.lrz=01;91:*.lz=01;91:*.lzo=01;91:*.xz=01;91:*.zst=01;91:*.tzst=01;91:*.bz2=01;91:*.bz=01;91:*.tbz=01;91:*.tbz2=01;91:*.tz=01;91:*.deb=01;91:*.rpm=01;91:*.jar=01;91:*.war=01;91:*.ear=01;91:*.sar=01;91:*.rar=01;91:*.alz=01;91:*.ace=01;91:*.zoo=01;91:*.cpio=01;91:*.7z=01;91:*.rz=01;91:*.cab=01;91:*.wim=01;91:*.swm=01;91:*.dwm=01;91:*.esd=01;91:'

# Détection contextuelle selon l'heure
function contextual_message() {
    # date may emit a leading zero (e.g. "06"). Strip it so arithmetic is base-10,
    # not octal — otherwise "08" and "09" cause a parse error.
    local hour=$((10#$(date +%H)))

    if   (( hour >= 22 || hour < 6 )); then
        echo -e "${GREEN_PHOSPHOR}Night Watch Active - The Emperor's vigilance never sleeps${RESET}"
    elif (( hour >= 12 && hour <= 14 )); then
        echo -e "${AMBER_ALERT}Midday Observance - Honor the God-Emperor${RESET}"
    elif (( hour >= 6 && hour <= 8 )); then
        echo -e "${GREEN_PHOSPHOR}Dawn Patrol - Another day in service of the Emperor${RESET}"
    fi
}

# Surveillance des processus suspects (de manière humoristique).
# Inner width 46, plus two single-space gutters and two walls = 50 visible cols.
function detect_heresy() {
    local suspicious_processes=("chrome" "firefox" "discord")
    local detected=false

    for proc in "${suspicious_processes[@]}"; do
        if pgrep "$proc" > /dev/null 2>&1; then
            if [[ $detected == false ]]; then
                echo -e "${RED_WARNING}╔════════════════════════════════════════════════╗${RESET}"
                printf  "${RED_WARNING}║ %-46s ║${RESET}\n" "POTENTIAL DISTRACTIONS DETECTED"
                detected=true
            fi
            printf "${RED_WARNING}║ %-46s ║${RESET}\n" "Recreational process active: $proc"
        fi
    done

    if [[ $detected == true ]]; then
        printf "${RED_WARNING}║ %-46s ║${RESET}\n" "Focus on your Imperial duties, Battle-Brother"
        echo -e "${RED_WARNING}╚════════════════════════════════════════════════╝${RESET}"
    fi
}

# IMPERIAL TERMINAL INITIALIZATION - IMPERIAL SKULL
# Banner runs once per interactive shell. Skipped when:
#   - the shell is non-interactive (scripts, tmux pane init w/o a TTY, etc.)
#   - IMPERIAL_QUIET=1 is exported (CI/SSH automation)
#   - the file has already been sourced once this session (reload-config)
if [[ -z "$IMPERIAL_BANNER_SHOWN" && "$IMPERIAL_QUIET" != "1" && $- == *i* ]]; then
IMPERIAL_BANNER_SHOWN=1
# Only wipe scrollback at the outermost shell level; nested shells keep context.
[[ ${SHLVL:-1} -le 1 ]] && clear

# Affichage du chapitre et motto avec centrage dynamique
chapter_line="                              $(imperial_chapter_display)                                    "
motto_line="                            ${CHAPTER_MOTTO}                     "

echo -e "${PRIMARY_COLOR}╔══════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
printf "${PRIMARY_COLOR}║${CHAPTER_COLOR}%-86s${PRIMARY_COLOR}║${RESET}\n" "${chapter_line:0:86}"
printf "${PRIMARY_COLOR}║${WHITE_TEXT}%-86s${PRIMARY_COLOR}║${RESET}\n" "${motto_line:0:86}"
echo -e "${PRIMARY_COLOR}╚══════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
echo ""

echo -e "${GREEN_PHOSPHOR}"
echo "╔══════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                      ║"
echo "║                                        ______                                        ║"
echo '║                                     .-"      "-.                                     ║'
echo "║                                    /            \\                                    ║"
echo "║                        _          |              |          _                        ║"
echo "║                       ( \\         |,  .-.  .-.  ,|         / )                       ║"
echo '║                        > "=._     | )(__/  \__)( |     _.=" <                        ║'
echo '║                       (_/"=._"=._ |/     /\     \| _.="_."=\_)                       ║'
echo '║                              "=._ (_     ^^     _)"_.="                              ║'
echo '║                                  "=\__|IIIIII|__/="                                  ║'
echo '║                                 _.="| \IIIIII/ |"=._                                 ║'
echo '║                       _     _.="_."="\          /"=._"=._     _                      ║'
echo '║                      ( \_.="_."="     \--------/     "=._"=._/ )                     ║'
echo '║                       > _.="                            "=._ <                       ║'
echo "║                      (_/                                    \\_)                      ║"
echo "║                                                                                      ║"
echo "║                            ⚔ IMPERIAL COMMAND TERMINAL ⚔                             ║"
echo "║                                                                                      ║"
echo "║                    >> MACHINE SPIRIT AWAKENING SEQUENCE <<                           ║"
echo "║                                                                                      ║"
echo -e "║                   ${RED_WARNING}⚠${GREEN_PHOSPHOR}  SACRED KNOWLEDGE CONTAINED - GUARD IT WELL  ${RED_WARNING}⚠${GREEN_PHOSPHOR}                   ║${RESET}"
echo "║                                                                                      ║"
echo "║               Blessed is the mind too small for doubt                                ║"
echo "║               An open mind is like a fortress with its gates unbarred                ║"
echo "║               Hope is the first step on the road to disappointment                   ║"
echo "║               Fear the alien, the mutant, the heretic                                ║"
echo "║               In the grim darkness of the far future, there is only war              ║"
echo "║                                                                                      ║"
echo -e "║                               ${AMBER_ALERT}☩ THE EMPEROR PROTECTS ☩${GREEN_PHOSPHOR}                               ║${RESET}"
echo "╚══════════════════════════════════════════════════════════════════════════════════════╝"

# COGITATOR STATUS MATRIX
echo ""
echo -e "${GREEN_PHOSPHOR}╔══════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN_PHOSPHOR}║                         COGITATOR STATUS MATRIX                                      ║${RESET}"
echo -e "${GREEN_PHOSPHOR}╠══════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Rank:" "$(imperial_rank) - $(whoami)"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Battle Barge:" "$(hostname)"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Chapter:" "$(imperial_chapter_display)"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Company:" "${COMPANY}"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Squad:" "${SQUAD}"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "System Uptime:" "$(uptime -p)"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Imperial Date:" "$(imperial_date)"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Current Sector:" "$(pwd)"
echo -e "${GREEN_PHOSPHOR}╚══════════════════════════════════════════════════════════════════════════════════════╝${RESET}"

# Messages contextuels
echo ""
contextual_message
random_blessing
detect_heresy

echo ""
echo -e "${AMBER_ALERT}╔═══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${AMBER_ALERT}║         INITIATING IMPERIAL AWAKENING SEQUENCE            ║${RESET}"
echo -e "${AMBER_ALERT}╚═══════════════════════════════════════════════════════════╝${RESET}"
echo ""

# Séquence de chargement animée
imperial_loading "» Activating cogitator core" 2
imperial_loading "» Initializing data-protocols" 2
imperial_loading "» Blessing machine spirit" 2
imperial_loading "» Establishing vox-communications" 2
imperial_loading "» Loading tactical interface" 2

echo ""
echo -e "${GREEN_PHOSPHOR}╔═══════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN_PHOSPHOR}║  ✓  MACHINE SPIRIT INITIALIZED SUCCESSFULLY               ║${RESET}"
echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════════════════════════════════╝${RESET}"
echo ""
echo -e "${GOLD_IMPERIAL}⚔ Chapter Battle Cry: ${CRIMSON_RED}${BATTLE_CRY}${RESET}"
echo -e "${GREEN_PHOSPHOR}⚙ System ready - Awaiting sacred binary inputs...${RESET}"
echo ""
echo -e "${STEEL_GREY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${AMBER_ALERT}» Type ${WHITE_TEXT}'help-imperial'${AMBER_ALERT} to view all available commands${RESET}"
echo -e "${STEEL_GREY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
fi  # end interactive-banner guard

# Added by Encryptor installer
export PATH="$HOME/.local/bin:$PATH"

# IMPERIAL FUNCTIONS
function praise-omnissiah() {
    echo -e "${GREEN_PHOSPHOR}⚙ Praise the Omnissiah! Machine spirits are appeased! ⚙${RESET}"
    echo -e "${WHITE_TEXT}(Legacy Mechanicus blessing - still functional)${RESET}"
    uptime
}

function binary-prayer() {
    echo -e "${GREEN_PHOSPHOR}01000101 01101101 01110000 01100101 01110010 01101111 01110010 00100000 01110000 01110010 01101111 01110100 01100101 01100011 01110100 01110011${RESET}"
    echo -e "${WHITE_TEXT}Translation: Emperor protects${RESET}"
}

function machine-blessing() {
    echo -e "${GOLD_IMPERIAL}╔═══════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD_IMPERIAL}║      COMMENCING MACHINE SPIRIT BLESSING RITUAL            ║${RESET}"
    echo -e "${GOLD_IMPERIAL}╚═══════════════════════════════════════════════════════════╝${RESET}"
    echo ""
    imperial_loading "☩ Blessing the machine in the Emperor's name" 3
    imperial_loading "⚙ Applying sacred oils to components" 3
    imperial_loading "Burning imperial incense" 3
    imperial_loading "Reciting Litanies of the Emperor" 3
    echo ""
    echo -e "${CRIMSON_RED}⚔═══════════════════════════════════════════════════════════⚔${RESET}"
    echo -e "${GREEN_PHOSPHOR}   By His will, the machine serves faithfully!${RESET}"
    echo -e "${CRIMSON_RED}⚔═══════════════════════════════════════════════════════════⚔${RESET}"
}

function emperor-blessing() {
    echo -e "${AMBER_ALERT}☩☩☩ THE EMPEROR PROTECTS ☩☩☩${RESET}"
    echo -e "${GREEN_PHOSPHOR}His light guides us through the darkness${RESET}"
    echo -e "${GREEN_PHOSPHOR}His will grants us strength${RESET}"
    echo -e "${GREEN_PHOSPHOR}His wisdom illuminates our path${RESET}"
    echo -e "${WHITE_TEXT}Glory to the God-Emperor of Mankind!${RESET}"
}

function chapter-oath() {
    # Border width tracks the motto length so the box never goes asymmetric.
    local motto_line=" ${CHAPTER_MOTTO} "
    local w=${#motto_line}
    # Floor width at 20 cols so very short mottos still look box-like.
    if (( w < 20 )); then
        local pad=$(( (20 - w) / 2 ))
        motto_line="$(printf '%*s' $pad '')${motto_line}$(printf '%*s' $((20 - w - pad)) '')"
        w=20
    fi
    local border
    border=$(printf '═%.0s' $(seq 1 $w))

    echo -e "${PRIMARY_COLOR}╔${border}╗${RESET}"
    echo -e "${PRIMARY_COLOR}║${motto_line}║${RESET}"
    echo -e "${PRIMARY_COLOR}╚${border}╝${RESET}"
    echo -e "${CHAPTER_COLOR}Battle Cry: ${BATTLE_CRY}${RESET}"
}

function imperial-status() {
    local up
    if command -v uptime >/dev/null 2>&1; then
        up=$(uptime -p 2>/dev/null || uptime)
    else
        up="unknown"
    fi
    local load
    load=$(uptime 2>/dev/null | awk -F'load average:' '{ print $2 }')
    echo -e "${GREEN_PHOSPHOR}╔═══ IMPERIAL STATUS REPORT ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Rank: $(imperial_rank)${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Chapter: $(imperial_chapter_display)${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Company: ${COMPANY}${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Squad: ${SQUAD}${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Battle Honors: ${BATTLE_HONORS[*]}${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Uptime: ${up}${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Load:${load}${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Date: $(imperial_date)${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
}

# Fonction d'aide impériale — codex complet des commandes
# Légende :
#   ⚠   commande destructive nécessitant confirmation textuelle
#   ⚿   commande gated par une variable d'environnement
function help-imperial() {
    # --- header ---
    echo -e "${GOLD_IMPERIAL}╔══════════════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD_IMPERIAL}║              ☩  CODEX DES COMMANDES IMPÉRIALES  ☩                ║${RESET}"
    echo -e "${GOLD_IMPERIAL}║   Légende : ${RED_WARNING}⚠${GOLD_IMPERIAL} = confirmation requise   ${RED_WARNING}⚿${GOLD_IMPERIAL} = variable d'env requise   ║${RESET}"
    echo -e "${GOLD_IMPERIAL}╚══════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- rituels & statut ---
    echo -e "${GOLD_IMPERIAL}╔═══ RITUELS & STATUT ═══════════════════════════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "praise-omnissiah"   "Bénédiction Mechanicus + uptime"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "binary-prayer"      "Prière Empereur en binaire"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "machine-blessing"   "Rituel animé de bénédiction machine"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "emperor-blessing"   "Bénédiction impériale complète"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "chapter-oath"       "Serment + cri de guerre du chapitre"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "imperial-status"    "Rapport détaillé (rang, chapitre, etc)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "imperial_date"      "Date impériale (M42.jjj.HHMM)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "imperial_time"      "Heure impériale"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "imperial_rank"      "Rang dérivé de l'uptime"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- purification système ---
    echo -e "${GOLD_IMPERIAL}╔═══ PURIFICATION SYSTÈME (apt / systemctl) ═════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "purify-system"    "apt update && upgrade (avec rituel)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "cleanse-heresy"   "apt autoremove && autoclean"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "install-sacred"   "apt install <paquet>"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "search-archives"  "apt search <terme>"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "sacred-logs"      "tail -f /var/log/syslog"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "system-status"    "systemctl status <service>"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "monitor-machine"  "htop (moniteur interactif)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "scan-machine"     "ps aux (processus)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "storage-status"   "df -h (espace disque)"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- reconnaissance (auth-gated) ---
    echo -e "${GOLD_IMPERIAL}╔═══ RECONNAISSANCE ${RED_WARNING}⚿${GOLD_IMPERIAL} requiert IMPERIAL_AUTHORIZED=1 ═══════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "recon-scan"        "nmap -sn (découverte réseau)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "full-augury"       "nmap -sV -O -T4 (services + OS)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "stealth-probe"     "nmap -sS -T2 -f (furtif)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "deep-scan"         "nmap full + scripts vuln"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "active-channels"   "netstat ports LISTEN"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "external-position" "IP externe (ipinfo.io)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "open-ports"        "ss -tuln (ports locaux)"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- gestion données ---
    echo -e "${GOLD_IMPERIAL}╔═══ GESTION DES DONNÉES ════════════════════════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "list-data"         "ls -alF avec couleurs"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "brief-list"        "ls -CF format colonnes"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "read-scroll"       "cat <fichier>"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "inscribe"          "nano <fichier>"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "duplicate"         "cp source dest"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "relocate"          "mv source dest"
    printf "${GOLD_IMPERIAL}║${RED_WARNING} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "purge ⚠"           "rm -rf  (tape \"EXTERMINATUS\")"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "compress"          "tar -czf archive.tgz <files>"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "extract"           "tar -xzf archive.tgz"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- recherche & filtres ---
    echo -e "${GOLD_IMPERIAL}╔═══ RECHERCHE & FILTRES ════════════════════════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "filter-data"       "grep --color"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "search-pattern"    "grep -r récursif"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "count-lines"       "wc -l"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "sort-data"         "sort"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "unique-only"       "uniq"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- docker ---
    echo -e "${GOLD_IMPERIAL}╔═══ CONTAINER / DOCKER ═════════════════════════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "dcbuild"           "docker compose build"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "dcup"              "docker compose up"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "dcdown"            "docker compose down"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "dockps"            "docker ps (format court)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "docksh <cont>"     "shell interactif (fallback /bin/sh)"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- configuration ---
    echo -e "${GOLD_IMPERIAL}╔═══ CONFIGURATION ══════════════════════════════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "terminal-config"   "éditer ~/.zshrc"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "chapter-config"    "éditer ~/.imperial_chapter_config"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "reload-config"     "recharger la config (sans bannière)"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- utilitaires ---
    echo -e "${GOLD_IMPERIAL}╔═══ UTILITAIRES & DIVERS ═══════════════════════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "c"                 "clear"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "identity"          "whoami + id + groups"
    printf "${GOLD_IMPERIAL}║${RED_WARNING} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "shutdown-now ⚠"    "arrêt (tape \"EMPEROR\")"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "machine-spirit"    "cmatrix (effet Matrix)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-18s ${GREEN_PHOSPHOR}%-43s${GOLD_IMPERIAL}║${RESET}\n" "data-stream"       "hollywood (flux de données)"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- variables d'environnement ---
    echo -e "${GOLD_IMPERIAL}╔═══ VARIABLES D'ENVIRONNEMENT ══════════════════════════════════╗${RESET}"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-22s ${GREEN_PHOSPHOR}%-39s${GOLD_IMPERIAL}║${RESET}\n" "IMPERIAL_QUIET=1"      "saute la bannière (CI/SSH)"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-22s ${GREEN_PHOSPHOR}%-39s${GOLD_IMPERIAL}║${RESET}\n" "IMPERIAL_AUTHORIZED=1" "débloque les commandes nmap"
    printf "${GOLD_IMPERIAL}║${WHITE_TEXT} %-22s ${GREEN_PHOSPHOR}%-39s${GOLD_IMPERIAL}║${RESET}\n" "IMPERIAL_CHAPTER"      "voir ~/.imperial_chapter_config"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    # --- exemples rapides ---
    echo -e "${GOLD_IMPERIAL}╔═══ EXEMPLES RAPIDES ═══════════════════════════════════════════╗${RESET}"
    echo -e "${GOLD_IMPERIAL}║${GREEN_PHOSPHOR} purify-system && cleanse-heresy        ${WHITE_TEXT}# rituel quotidien    ${GOLD_IMPERIAL}║${RESET}"
    echo -e "${GOLD_IMPERIAL}║${GREEN_PHOSPHOR} IMPERIAL_AUTHORIZED=1 recon-scan 10/24 ${WHITE_TEXT}# scan autorisé      ${GOLD_IMPERIAL}║${RESET}"
    echo -e "${GOLD_IMPERIAL}║${GREEN_PHOSPHOR} IMPERIAL_QUIET=1 zsh                   ${WHITE_TEXT}# shell sans banner  ${GOLD_IMPERIAL}║${RESET}"
    echo -e "${GOLD_IMPERIAL}║${GREEN_PHOSPHOR} chapter-config                         ${WHITE_TEXT}# changer de chapter ${GOLD_IMPERIAL}║${RESET}"
    echo -e "${GOLD_IMPERIAL}╚════════════════════════════════════════════════════════════════╝${RESET}"
    echo ""

    echo -e "${AMBER_ALERT}Use 'chapter-config' to customize your Chapter settings${RESET}"
    echo -e "${GREEN_PHOSPHOR}The Emperor protects those who serve with knowledge${RESET}"
}

# Chapter-config bootstrap is now handled inline near the top of this file,
# before $IMPERIAL_CONFIG_FILE is sourced, so first-launch users get their
# customised settings immediately rather than after a second shell.