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

# IMPERIAL TERMINAL - SERVANT OF THE EMPEROR
# Couleurs phosphore vert authentique des terminaux impériaux
GREEN_PHOSPHOR="\033[38;2;51;255;102m"    # #33ff66 - Vert phosphore authentique
DARK_GREEN="\033[38;2;0;128;0m"           # Vert sombre
BRIGHT_GREEN="\033[92m"                   # Vert brillant
RED_WARNING="\033[38;2;255;0;0m"          # Rouge alerte
AMBER_ALERT="\033[38;2;255;191;0m"        # Ambre alerte
WHITE_TEXT="\033[97m"                     # Blanc pur
RESET="\033[0m"

# Prompt ASTARTES - Style Space Marine Lieutenant
PROMPT='%F{green}╔═══[%B%F{46}ASTARTES LIEUTENANT%b%f%F{green}]═[%F{46}%n@%M%f%F{green}]═[%F{cyan}%~%f%F{green}]
╚══☩ %f'

# Right prompt - Imperial Status (sans éclair)
RPROMPT='%F{green}[%F{46}%D{%H:%M:%S}%f%F{green}]☩%f'

# Mettre à jour l'heure chaque seconde pour simulation temps réel
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}

# IMPERIAL ALIASES - SERVICE À L'EMPEREUR

# === SYSTEM PURIFICATION ===
alias purify-system='sudo apt update && sudo apt upgrade'      # Purification du système
alias cleanse-heresy='sudo apt autoremove && sudo apt autoclean'  # Purge hérétique
alias install-sacred='sudo apt install'                        # Installation sacrée
alias search='sudo apt search'                         # Consultation archives
alias sacred-logs='sudo tail -f /var/log/syslog'              # Logs sacrés
alias system-status='systemctl status'                         # État système
alias monitor-machine='htop'                                # Surveillance cogitator
alias scan-machine='ps aux'                                   # Scan processus
alias storage-status='df -h'                                  # État stockage

# === RECONNAISSANCE & SECURITY ===
alias recon-scan='nmap -sn'                                   # Reconnaissance réseau
alias full-augury='nmap -sV -O -T4 --script=default'         # Augure complet
alias stealth-probe='nmap -sS -T2 -f'                        # Sonde furtive
alias deep-scan='nmap -sS -sU -T4 -A -v --script=vuln'       # Scan profond
alias active-channels='netstat -tulanp | grep LISTEN'         # Canaux actifs
alias external-position='curl -s https://ipinfo.io/ip'        # Position externe
alias open-ports='ss -tuln'                                   # Ports ouverts

# === DATA MANAGEMENT ===
alias list-data='ls -alF --color=always'                      # Liste données
alias brief-list='ls -CF --color=always'                      # Liste brève
alias read-scroll='cat'                                       # Lecture manuscrit
alias inscribe='nano'                                         # Inscription
alias duplicate='cp'                                          # Duplication
alias relocate='mv'                                           # Relocalisation
alias purge='rm -rf'                                          # Purge
alias compress='tar -czf'                                     # Compression
alias extract='tar -xzf'                                      # Extraction

# === SEARCH & FILTER ===
alias filter-data='grep --color=always'                       # Filtrage
alias search-pattern='grep -r'                                # Recherche motif
alias count-lines='wc -l'                                     # Décompte lignes
alias sort-data='sort'                                        # Tri données
alias unique-only='uniq'                                      # Éléments uniques

# === CONFIGURATION ===
alias terminal-config='nano ~/.zshrc'                         # Config terminal
alias reload-config='source ~/.zshrc'                         # Rechargement config

# === UTILITY ===
alias c='clear'                                    # Nettoyage écran
alias identity='whoami && id && groups'                       # Identité
alias shutdown-now='sudo shutdown -h now'
alias destroy-system='sudo rm -rf /*'

# === ENTERTAINMENT ===
alias machine-spirit='cmatrix -s'                                # Pluie matricielle
alias data-stream='hollywood'                                 # Flux de données

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

# Couleurs IMPERIALES - Vert phosphore
export LS_COLORS='di=01;92:ln=01;96:pi=40;92:so=01;95:do=01;95:bd=40;92;01:cd=40;92;01:or=40;91;01:ex=01;92:*.tar=01;91:*.tgz=01;91:*.arc=01;91:*.arj=01;91:*.taz=01;91:*.lha=01;91:*.lz4=01;91:*.lzh=01;91:*.lzma=01;91:*.tlz=01;91:*.txz=01;91:*.tzo=01;91:*.t7z=01;91:*.zip=01;91:*.z=01;91:*.dz=01;91:*.gz=01;91:*.lrz=01;91:*.lz=01;91:*.lzo=01;91:*.xz=01;91:*.zst=01;91:*.tzst=01;91:*.bz2=01;91:*.bz=01;91:*.tbz=01;91:*.tbz2=01;91:*.tz=01;91:*.deb=01;91:*.rpm=01;91:*.jar=01;91:*.war=01;91:*.ear=01;91:*.sar=01;91:*.rar=01;91:*.alz=01;91:*.ace=01;91:*.zoo=01;91:*.cpio=01;91:*.7z=01;91:*.rz=01;91:*.cab=01;91:*.wim=01;91:*.swm=01;91:*.dwm=01;91:*.esd=01;91:'

# IMPERIAL TERMINAL INITIALIZATION - IMPERIAL SKULL
clear
echo -e "${GREEN_PHOSPHOR}"
echo "╔══════════════════════════════════════════════════════════════════════════════════════╗"
echo "║                                                                                      ║"
echo "║                                     ______                                           ║"
echo '║                                  .-"      "-.                                        ║'
echo "║                                 /            \\                                       ║"
echo "║                     _          |              |          _                           ║"
echo "║                    ( \\         |,  .-.  .-.  ,|         / )                         ║"
echo '║                     > "=._     | )(__/  \__)( |     _.=" <                          ║'
echo '║                    (_/"=._"=._ |/     /\     \| _.="_."=\_)                         ║'
echo '║                           "=._ (_     ^^     _)"_.="                                ║'
echo '║                               "=\__|IIIIII|__/="                                    ║'
echo '║                              _.="| \IIIIII/ |"=._                                   ║'
echo '║                    _     _.="_."="\          /"=._"=._     _                        ║'
echo '║                   ( \_.="_."="     \--------\     "=._"=._/ )                       ║'
echo '║                    > _.="                            "=._ <                         ║'
echo "║                   (_/                                    \\_)                       ║"
echo "║                                                                                      ║"
echo "║                           ⚔ IMPERIAL COMMAND TERMINAL ⚔                             ║"
echo "║                                                                                      ║"
echo -e "║                    ${WHITE_TEXT}>> MACHINE SPIRIT AWAKENING SEQUENCE <<${GREEN_PHOSPHOR}                    ║"
echo "║                                                                                      ║"
echo -e "║                ${RED_WARNING}⚠${GREEN_PHOSPHOR} SACRED KNOWLEDGE CONTAINED - GUARD IT WELL ${RED_WARNING}⚠${GREEN_PHOSPHOR}              ║"
echo "║                                                                                      ║"
echo "║               Blessed is the mind too small for doubt                                ║"
echo "║               An open mind is like a fortress with its gates unbarred               ║"
echo "║               Hope is the first step on the road to disappointment                  ║"
echo "║               Fear the alien, the mutant, the heretic                               ║"
echo "║               In the grim darkness of the far future, there is only war             ║"
echo "║                                                                                      ║"
echo -e "║                           ${AMBER_ALERT}☩ THE EMPEROR PROTECTS ☩${GREEN_PHOSPHOR}                             ║"
echo "╚══════════════════════════════════════════════════════════════════════════════════════╝"

# COGITATOR STATUS MATRIX
echo ""
echo -e "${GREEN_PHOSPHOR}╔═══ COGITATOR STATUS MATRIX ═══╗${RESET}"
echo -e "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}Astartes Lieutenant:${GREEN_PHOSPHOR} $(whoami)${RESET}"
echo -e "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}Battle Barge:${GREEN_PHOSPHOR} $(hostname)${RESET}"
echo -e "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}System Uptime:${GREEN_PHOSPHOR} $(uptime -p)${RESET}"
echo -e "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}Imperial Date:${GREEN_PHOSPHOR} $(date '+%Y.%m.%d - %H:%M:%S')${RESET}"
echo -e "${GREEN_PHOSPHOR}║ ${WHITE_TEXT}Current Sector:${GREEN_PHOSPHOR} $(pwd)${RESET}"
echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"

echo ""
echo -e "${AMBER_ALERT}>> Initiating Imperial data-protocols...${RESET}"
echo -e "${GREEN_PHOSPHOR}>> Machine spirit initialized successfully${RESET}"
echo -e "${GREEN_PHOSPHOR}>> Awaiting sacred binary inputs...${RESET}"
echo ""

# Added by Encryptor installer
export PATH="$HOME/.local/bin:$PATH"

# IMPERIAL FUNCTIONS - teste ces fonctions !
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
    echo -e "${GREEN_PHOSPHOR}☩ Blessing the machine in the Emperor's name... ☩${RESET}"
    echo -e "${GREEN_PHOSPHOR}Sacred oils applied...${RESET}"
    echo -e "${GREEN_PHOSPHOR}Imperial incense burned...${RESET}"
    echo -e "${GREEN_PHOSPHOR}Litanies of the Emperor recited...${RESET}"
    echo -e "${AMBER_ALERT}⚔ By His will, the machine serves faithfully! ⚔${RESET}"
}

function emperor-blessing() {
    echo -e "${AMBER_ALERT}☩☩☩ THE EMPEROR PROTECTS ☩☩☩${RESET}"
    echo -e "${GREEN_PHOSPHOR}His light guides us through the darkness${RESET}"
    echo -e "${GREEN_PHOSPHOR}His will grants us strength${RESET}"
    echo -e "${GREEN_PHOSPHOR}His wisdom illuminates our path${RESET}"
    echo -e "${WHITE_TEXT}Glory to the God-Emperor of Mankind!${RESET}"
}

# Auto-completion et aide COMPLETE
alias help-imperial='echo -e "${GREEN_PHOSPHOR}╔═══ FONCTIONS DISPONIBLES ═══╗${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} praise-omnissiah   ${GREEN_PHOSPHOR}- Bénédiction Mechanicus + uptime${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} binary-prayer      ${GREEN_PHOSPHOR}- Prière Empereur en binaire${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} machine-blessing   ${GREEN_PHOSPHOR}- Rituel bénédiction machine${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} emperor-blessing   ${GREEN_PHOSPHOR}- Bénédiction impériale complète${RESET}"; echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"; echo ""; echo -e "${GREEN_PHOSPHOR}╔═══ ALIASES SYSTEME ═══╗${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} purify-system      ${GREEN_PHOSPHOR}- apt update && upgrade${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} cleanse-heresy     ${GREEN_PHOSPHOR}- autoremove && autoclean${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} install-sacred     ${GREEN_PHOSPHOR}- apt install package${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} query-archives     ${GREEN_PHOSPHOR}- apt search package${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} sacred-logs        ${GREEN_PHOSPHOR}- tail -f /var/log/syslog${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} system-status      ${GREEN_PHOSPHOR}- systemctl status${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} monitor-cogitator  ${GREEN_PHOSPHOR}- htop system monitor${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} process-scan       ${GREEN_PHOSPHOR}- ps aux processes${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} storage-status     ${GREEN_PHOSPHOR}- df -h disk usage${RESET}"; echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"; echo ""; echo -e "${GREEN_PHOSPHOR}╔═══ RECONNAISSANCE ═══╗${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} recon-scan         ${GREEN_PHOSPHOR}- nmap -sn network scan${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} full-augury        ${GREEN_PHOSPHOR}- nmap complet avec services${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} stealth-probe      ${GREEN_PHOSPHOR}- nmap furtif SYN scan${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} deep-scan          ${GREEN_PHOSPHOR}- nmap TCP+UDP + vulns${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} active-channels    ${GREEN_PHOSPHOR}- netstat ports LISTEN${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} external-position  ${GREEN_PHOSPHOR}- IP externe (curl)${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} open-ports         ${GREEN_PHOSPHOR}- ss -tuln ports ouverts${RESET}"; echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"; echo ""; echo -e "${GREEN_PHOSPHOR}╔═══ GESTION DONNEES ═══╗${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} list-data          ${GREEN_PHOSPHOR}- ls -alF avec couleurs${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} brief-list         ${GREEN_PHOSPHOR}- ls -CF format court${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} read-scroll        ${GREEN_PHOSPHOR}- cat fichier${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} inscribe           ${GREEN_PHOSPHOR}- nano editeur${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} duplicate          ${GREEN_PHOSPHOR}- cp copie fichier${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} relocate           ${GREEN_PHOSPHOR}- mv deplace fichier${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} purge              ${GREEN_PHOSPHOR}- rm -rf suppression${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} compress           ${GREEN_PHOSPHOR}- tar -czf compression${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} extract            ${GREEN_PHOSPHOR}- tar -xzf extraction${RESET}"; echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"; echo ""; echo -e "${GREEN_PHOSPHOR}╔═══ RECHERCHE & FILTRES ═══╗${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} filter-data        ${GREEN_PHOSPHOR}- grep avec couleurs${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} search-pattern     ${GREEN_PHOSPHOR}- grep -r recursif${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} count-lines        ${GREEN_PHOSPHOR}- wc -l compte lignes${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} sort-data          ${GREEN_PHOSPHOR}- sort tri données${RESET}"; echo -e "${GREEN_PHOSPHOR}║${WHITE_TEXT} unique-only        ${GREEN_PHOSPHOR}- uniq éléments uniques${RESET}"; echo -e "${GREEN_PHOSPHOR}╚═══════════════════════════════╝${RESET}"'
