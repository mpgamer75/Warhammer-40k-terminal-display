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
if [[ -f "$IMPERIAL_CONFIG_FILE" ]]; then
    source "$IMPERIAL_CONFIG_FILE"
else
    # Default configuration if no chapter file exists
    IMPERIAL_CHAPTER="ULTRAMARINES"
    COMPANY="2nd Company"
    SQUAD="Tactical Squad Titus"
    BATTLE_HONORS=("Hive Fleet Behemoth" "Siege of Macragge")
fi

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
function imperial_date() {
    local year=$(date +%Y)
    local imperial_year=$((year + 28000))
    local day_of_year=$(date +%j)
    local time=$(date +%H%M)
    echo "M${imperial_year:0:2}.${imperial_year:2:3}.${day_of_year}.${time}"
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

# Système de rangs basé sur l'uptime et l'utilisation
function imperial_rank() {
    local uptime_days=$(uptime | grep -oE '[0-9]+ day' | cut -d' ' -f1 2>/dev/null)
    if [[ -z "$uptime_days" ]]; then
        uptime_days=0
    fi
    
    if [[ $uptime_days -gt 100 ]]; then
        echo "CAPTAIN"
    elif [[ $uptime_days -gt 30 ]]; then
        echo "SERGEANT"
    elif [[ $uptime_days -gt 7 ]]; then
        echo "VETERAN"
    else
        echo "BATTLE-BROTHER"
    fi
}

# Messages d'erreur thématiques
function command_not_found_handler() {
    echo -e "${RED_WARNING}╔══════════════════════════════════════╗${RESET}"
    echo -e "${RED_WARNING}║  HERETICAL COMMAND DETECTED: '$1'    ║${RESET}"
    echo -e "${RED_WARNING}║  Consult the Sacred Codex below      ║${RESET}"
    echo -e "${RED_WARNING}╚══════════════════════════════════════╝${RESET}"
    echo -e "${GREEN_PHOSPHOR}Sacred Command: help-imperial${RESET}"
    return 127
}

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

# Détection d'événements warp
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
    local padding=$(( (50 - length) / 2 ))
    local line=""
    
    for ((i=0; i<50; i++)); do line+="═"; done
    
    echo -e "${GREEN_PHOSPHOR}╔${line}╗${RESET}"
    printf "${GREEN_PHOSPHOR}║%*s%s%*s║${RESET}\n" $padding "" "$message" $((50 - length - padding)) ""
    echo -e "${GREEN_PHOSPHOR}╚${line}╝${RESET}"
}

# Prompt ASTARTES avec rang dynamique et chapitre - VERSION CORRIGÉE
PROMPT='%F{green}╔═══[%B%F{46}$(imperial_rank)%b%f%F{green}]═[%F{46}%n@%M%f%F{green}]═[%F{cyan}%~%f%F{green}]
╚══☩ %f'

# Right prompt avec date impériale - VERSION SIMPLIFIÉE
RPROMPT='%F{green}[%F{46}$(imperial_date)%f%F{green}]☩%f'

# Mettre à jour l'heure chaque seconde
TMOUT=1
TRAPALRM() {
    zle reset-prompt 2>/dev/null || true
}

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
alias recon-scan='warp_storm_check && nmap -sn'
alias full-augury='warp_storm_check && nmap -sV -O -T4 --script=default'
alias stealth-probe='warp_storm_check && nmap -sS -T2 -f'
alias deep-scan='warp_storm_check && nmap -sS -sU -T4 -A -v --script=vuln'
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
alias purge='rm -rf'
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
alias shutdown-now='vox_message "INITIATING EMERGENCY SHUTDOWN PROTOCOL" && sudo shutdown -h now'

# === ENTERTAINMENT ===
alias machine-spirit='cmatrix -s'
alias data-stream='hollywood'

# === DOCKER COMMANDS ===
alias dcbuild='docker compose build'
alias dcup='docker compose up'
alias dcdown='docker compose down'
alias dockps='docker ps --format "{{.ID}} {{.Names}}"'
docksh(){ docker exec -it $1 /bin/bash; }

# History configuration - Mémoire Impériale
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Couleurs IMPERIALES pour ls
export LS_COLORS='di=01;92:ln=01;96:pi=40;92:so=01;95:do=01;95:bd=40;92;01:cd=40;92;01:or=40;91;01:ex=01;92:*.tar=01;91:*.tgz=01;91:*.arc=01;91:*.arj=01;91:*.taz=01;91:*.lha=01;91:*.lz4=01;91:*.lzh=01;91:*.lzma=01;91:*.tlz=01;91:*.txz=01;91:*.tzo=01;91:*.t7z=01;91:*.zip=01;91:*.z=01;91:*.dz=01;91:*.gz=01;91:*.lrz=01;91:*.lz=01;91:*.lzo=01;91:*.xz=01;91:*.zst=01;91:*.tzst=01;91:*.bz2=01;91:*.bz=01;91:*.tbz=01;91:*.tbz2=01;91:*.tz=01;91:*.deb=01;91:*.rpm=01;91:*.jar=01;91:*.war=01;91:*.ear=01;91:*.sar=01;91:*.rar=01;91:*.alz=01;91:*.ace=01;91:*.zoo=01;91:*.cpio=01;91:*.7z=01;91:*.rz=01;91:*.cab=01;91:*.wim=01;91:*.swm=01;91:*.dwm=01;91:*.esd=01;91:'

# Détection contextuelle selon l'heure
function contextual_message() {
    local hour=$(date +%H)
    
    if [[ $hour -ge 22 || $hour -le 6 ]]; then
        echo -e "${GREEN_PHOSPHOR}Night Watch Active - The Emperor's vigilance never sleeps${RESET}"
    elif [[ $hour -ge 12 && $hour -le 14 ]]; then
        echo -e "${AMBER_ALERT}Midday Observance - Honor the God-Emperor${RESET}"
    elif [[ $hour -ge 6 && $hour -le 8 ]]; then
        echo -e "${GREEN_PHOSPHOR}Dawn Patrol - Another day in service of the Emperor${RESET}"
    fi
}

# Surveillance des processus suspects (de manière humoristique)
function detect_heresy() {
    local suspicious_processes=("chrome" "firefox" "discord")
    local detected=false
    
    for proc in "${suspicious_processes[@]}"; do
        if pgrep "$proc" > /dev/null 2>&1; then
            if [[ $detected == false ]]; then
                echo -e "${RED_WARNING}╔═══ POTENTIAL DISTRACTIONS DETECTED ═══╗${RESET}"
                detected=true
            fi
            echo -e "${RED_WARNING}║ Recreational process active: $proc${RESET}"
        fi
    done
    
    if [[ $detected == true ]]; then
        echo -e "${RED_WARNING}║ Focus on your Imperial duties, Battle-Brother${RESET}"
        echo -e "${RED_WARNING}╚═══════════════════════════════════════════╝${RESET}"
    fi
}

# IMPERIAL TERMINAL INITIALIZATION - IMPERIAL SKULL
clear

# Affichage du chapitre et motto avec centrage dynamique
chapter_line="                              ${IMPERIAL_CHAPTER}                                    "
motto_line="                            ${CHAPTER_MOTTO}                     "

echo -e "${PRIMARY_COLOR}╔══════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
printf "${PRIMARY_COLOR}║${CHAPTER_COLOR}%-86s${PRIMARY_COLOR}║${RESET}\n" "${chapter_line:0:86}"
printf "${PRIMARY_COLOR}║${WHITE_TEXT}%-86s${PRIMARY_COLOR}║${RESET}\n" "${motto_line:0:86}"
echo -e "${PRIMARY_COLOR}╚══════════════════════════════════════════════════════════════════════════════════════╝${RESET}"
echo ""

echo -e "${GREEN_PHOSPHOR}"
echo "╔══════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                      ║"
echo "║                                     ______                                           ║"
echo '║                                  .-"      "-.                                        ║'
echo "║                                 /            \\                                       ║"
echo "║                     _          |              |          _                           ║"
echo "║                    ( \\         |,  .-.  .-.  ,|         / )                          ║"
echo '║                     > "=._     | )(__/  \__)( |     _.=" <                           ║'
echo '║                    (_/"=._"=._ |/     /\     \| _.="_."=\_)                          ║'
echo '║                           "=._ (_     ^^     _)"_.="                                 ║'
echo '║                               "=\__|IIIIII|__/="                                     ║'
echo '║                              _.="| \IIIIII/ |"=._                                    ║'
echo '║                    _     _.="_."="\          /"=._"=._     _                         ║'
echo '║                   ( \_.="_."="     \--------/     "=._"=._/ )                        ║'
echo '║                    > _.="                            "=._ <                          ║'
echo "║                   (_/                                    \\_)                        ║"
echo "║                                                                                      ║"
echo "║                           ⚔ IMPERIAL COMMAND TERMINAL ⚔                             ║"
echo "║                                                                                      ║"
echo "║                    >> MACHINE SPIRIT AWAKENING SEQUENCE <<                           ║"
echo "║                                                                                      ║"
echo -e "║               ${RED_WARNING}⚠${GREEN_PHOSPHOR}  SACRED KNOWLEDGE CONTAINED - GUARD IT WELL  ${RED_WARNING}⚠${GREEN_PHOSPHOR}               ║${RESET}"
echo "║                                                                                      ║"
echo "║               Blessed is the mind too small for doubt                                ║"
echo "║               An open mind is like a fortress with its gates unbarred               ║"
echo "║               Hope is the first step on the road to disappointment                  ║"
echo "║               Fear the alien, the mutant, the heretic                               ║"
echo "║               In the grim darkness of the far future, there is only war             ║"
echo "║                                                                                      ║"
echo -e "║                           ${AMBER_ALERT}☩ THE EMPEROR PROTECTS ☩${GREEN_PHOSPHOR}                             ║${RESET}"
echo "╚══════════════════════════════════════════════════════════════════════════════════════╝"

# COGITATOR STATUS MATRIX
echo ""
echo -e "${GREEN_PHOSPHOR}╔══════════════════════════════════════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN_PHOSPHOR}║                         COGITATOR STATUS MATRIX                                      ║${RESET}"
echo -e "${GREEN_PHOSPHOR}╠══════════════════════════════════════════════════════════════════════════════════════╣${RESET}"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Rank:" "$(imperial_rank) - $(whoami)"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Battle Barge:" "$(hostname)"
printf "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}%-18s${GREEN_PHOSPHOR} %-63s║${RESET}\n" "Chapter:" "${IMPERIAL_CHAPTER}"
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
    echo -e "${PRIMARY_COLOR}╔═══ CHAPTER OATH ═══╗${RESET}"
    echo -e "${PRIMARY_COLOR}║ ${CHAPTER_MOTTO} ║${RESET}"
    echo -e "${PRIMARY_COLOR}╚══════════════════════╝${RESET}"
    echo -e "${CHAPTER_COLOR}Battle Cry: ${BATTLE_CRY}${RESET}"
}

function imperial-status() {
    echo -e "${GREEN_PHOSPHOR}╔═══ IMPERIAL STATUS REPORT ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Rank: $(imperial_rank)${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Chapter: ${IMPERIAL_CHAPTER}${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Uptime: $(uptime -p)${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Load: $(uptime | awk -F'load average:' '{ print $2 }')${RESET}"
    echo -e "${GREEN_PHOSPHOR}║ Date: $(imperial_date)${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
}

# Fonction d'aide impériale complète
function help-imperial() {
    echo -e "${GREEN_PHOSPHOR}╔═══ FONCTIONS RITUELLES ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} active-channels    ${GREEN_PHOSPHOR}- netstat ports LISTEN${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} external-position  ${GREEN_PHOSPHOR}- IP externe (curl)${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} open-ports         ${GREEN_PHOSPHOR}- ss -tuln ports ouverts${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GREEN_PHOSPHOR}╔═══ GESTION DONNEES ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} list-data          ${GREEN_PHOSPHOR}- ls -alF avec couleurs${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} brief-list         ${GREEN_PHOSPHOR}- ls -CF format court${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} read-scroll        ${GREEN_PHOSPHOR}- cat fichier${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} inscribe           ${GREEN_PHOSPHOR}- nano editeur${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} duplicate          ${GREEN_PHOSPHOR}- cp copie fichier${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} relocate           ${GREEN_PHOSPHOR}- mv deplace fichier${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} purge              ${GREEN_PHOSPHOR}- rm -rf suppression${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} compress           ${GREEN_PHOSPHOR}- tar -czf compression${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} extract            ${GREEN_PHOSPHOR}- tar -xzf extraction${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GREEN_PHOSPHOR}╔═══ RECHERCHE & FILTRES ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} filter-data        ${GREEN_PHOSPHOR}- grep avec couleurs${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} search-pattern     ${GREEN_PHOSPHOR}- grep -r recursif${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} count-lines        ${GREEN_PHOSPHOR}- wc -l compte lignes${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} sort-data          ${GREEN_PHOSPHOR}- sort tri données${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} unique-only        ${GREEN_PHOSPHOR}- uniq éléments uniques${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${AMBER_ALERT}Use 'chapter-config' to customize your Chapter settings${RESET}"
}

# Création automatique du fichier de configuration chapitre s'il n'existe pas
function create_chapter_config() {
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
# 
# You can add custom chapters by modifying the case statement in .zshrc
EOF
        echo -e "${GREEN_PHOSPHOR}Chapter configuration file created at: $IMPERIAL_CONFIG_FILE${RESET}"
        echo -e "${AMBER_ALERT}Edit with: chapter-config${RESET}"
    fi
}

# Fonction d'aide impériale complète - VERSION CORRIGÉE
function help-imperial() {
    echo -e "${GREEN_PHOSPHOR}╔═══ FONCTIONS RITUELLES ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} praise-omnissiah   ${GREEN_PHOSPHOR}- Bénédiction Mechanicus + uptime${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} binary-prayer      ${GREEN_PHOSPHOR}- Prière Empereur en binaire${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} machine-blessing   ${GREEN_PHOSPHOR}- Rituel bénédiction machine${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} emperor-blessing   ${GREEN_PHOSPHOR}- Bénédiction impériale complète${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} chapter-oath       ${GREEN_PHOSPHOR}- Serment du chapitre${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} imperial-status    ${GREEN_PHOSPHOR}- Rapport de statut complet${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GREEN_PHOSPHOR}╔═══ PURIFICATION SYSTEME ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} purify-system      ${GREEN_PHOSPHOR}- apt update && upgrade${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} cleanse-heresy     ${GREEN_PHOSPHOR}- autoremove && autoclean${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} install-sacred     ${GREEN_PHOSPHOR}- apt install package${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} search-archives    ${GREEN_PHOSPHOR}- apt search package${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} sacred-logs        ${GREEN_PHOSPHOR}- tail -f /var/log/syslog${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} system-status      ${GREEN_PHOSPHOR}- systemctl status${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} monitor-machine    ${GREEN_PHOSPHOR}- htop system monitor${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} scan-machine       ${GREEN_PHOSPHOR}- ps aux processes${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} storage-status     ${GREEN_PHOSPHOR}- df -h disk usage${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GREEN_PHOSPHOR}╔═══ RECONNAISSANCE ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} recon-scan         ${GREEN_PHOSPHOR}- nmap -sn network scan${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} full-augury        ${GREEN_PHOSPHOR}- nmap complet avec services${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} stealth-probe      ${GREEN_PHOSPHOR}- nmap furtif SYN scan${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} deep-scan          ${GREEN_PHOSPHOR}- nmap TCP+UDP + vulns${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} active-channels    ${GREEN_PHOSPHOR}- netstat ports LISTEN${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} external-position  ${GREEN_PHOSPHOR}- IP externe (curl)${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} open-ports         ${GREEN_PHOSPHOR}- ss -tuln ports ouverts${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GREEN_PHOSPHOR}╔═══ GESTION DONNEES ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} list-data          ${GREEN_PHOSPHOR}- ls -alF avec couleurs${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} brief-list         ${GREEN_PHOSPHOR}- ls -CF format court${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} read-scroll        ${GREEN_PHOSPHOR}- cat fichier${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} inscribe           ${GREEN_PHOSPHOR}- nano editeur${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} duplicate          ${GREEN_PHOSPHOR}- cp copie fichier${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} relocate           ${GREEN_PHOSPHOR}- mv deplace fichier${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} purge              ${GREEN_PHOSPHOR}- rm -rf suppression${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} compress           ${GREEN_PHOSPHOR}- tar -czf compression${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} extract            ${GREEN_PHOSPHOR}- tar -xzf extraction${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GREEN_PHOSPHOR}╔═══ RECHERCHE & FILTRES ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} filter-data        ${GREEN_PHOSPHOR}- grep avec couleurs${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} search-pattern     ${GREEN_PHOSPHOR}- grep -r recursif${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} count-lines        ${GREEN_PHOSPHOR}- wc -l compte lignes${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} sort-data          ${GREEN_PHOSPHOR}- sort tri données${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} unique-only        ${GREEN_PHOSPHOR}- uniq éléments uniques${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${GREEN_PHOSPHOR}╔═══ CONFIGURATION ═══╗${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} terminal-config    ${GREEN_PHOSPHOR}- nano ~/.zshrc${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} chapter-config     ${GREEN_PHOSPHOR}- nano chapter settings${RESET}"
    echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} reload-config      ${GREEN_PHOSPHOR}- source ~/.zshrc${RESET}"
    echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"
    echo ""
    echo -e "${AMBER_ALERT}Use 'chapter-config' to customize your Chapter settings${RESET}"
    echo -e "${GREEN_PHOSPHOR}The Emperor protects those who serve with knowledge${RESET}"
}

# Création automatique du fichier de configuration chapitre s'il n'existe pas
function create_chapter_config() {
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
# 
# You can add custom chapters by modifying the case statement in .zshrc
EOF
        echo -e "${GREEN_PHOSPHOR}Chapter configuration file created at: $IMPERIAL_CONFIG_FILE${RESET}"
        echo -e "${AMBER_ALERT}Edit with: chapter-config${RESET}"
    fi
}

# Créer le fichier de config au premier lancement
create_chapter_config