# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export LC_ALL="en_US.UTF-8"
export   LANG="en_US.UTF-8"

export  PATH=$HOME/bin:/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/sbin:$PATH
export SHELL=/usr/local/bin/zsh

# Path to your oh-my-zsh installation.
# export ZSH="/Users/pawelgora/.oh-my-zsh"
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gianu"




# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  dotenv
  git
  osx
  pyenv
  rbenv
)

# Custom settings ==========================================

# zplug

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug "romkatv/powerlevel10k",                  as:theme, use:powerlevel10k.zsh-theme, depth:1
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    else
      echo
    fi
fi

zplug load

# Aliases

# The next gen ls command - https://github.com/Peltoche/lsd
alias   l="lsd -1 --group-dirs first"
alias  ll="lsd -a --group-dirs first"
alias lll="lsd -la --group-dirs first"
alias  lt="lsd --tree"

alias   ..="cd .."
alias  ...="cd ../.."
alias ....="cd ../../.."

# Functions

# check your weather putting city as parameter
function weather() {
  curl "https://v2.wttr.in/$1"
}

# cheat-sheet in terminal
function cheatsheet() {
  curl "https://cht.sh/$1"
}

# List all npm global packages
function npm-global-variables() {
  npm list -g --depth 0
}

# Check my local IP
function localip() {
  ifconfig -l | xargs -n1 ipconfig getifaddr
}

# Check my external IP
function publicip()
{
  curl -s https://api.ipify.org && echo
}

# Upgrade everything
function upgrade-everything()
{
  echo "\033[1;32m┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ Upgrading plugins, packages and scripts to latest versions:              │"
  echo "│ 🟢 OhMyZsh                                                               │"
  echo "│ 🟢 zplug                                                                 │"
  echo "│ 🟢 Homebrew                                                              │"
  echo "│ 🟢 npm                                                                   │"
  echo "│ 🟢 pnpm                                                                  │"
  echo "│ 🟢 ncu                                                                   │"
  echo "│ 🟢 Fig                                                                   │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ 🟡 OhMyZsh - Framework for managing zsh configuration                    │"
  echo "│ ⏳ OhMyZsh - Updating...                                                 │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│                                                                          │"
  omz update
  echo "\033[1;32m│                                                                          │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│ ✅ OhMyZsh - Done!                                                       │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ 🟡 zplug - Next-generation plugin manager for zsh                        │"
  echo "│ ⏳ zplug - Updating...                                                   │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│                                                                          │"
  zplug update
  echo "\033[1;32m│                                                                          │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│ ✅ zplug - Done!                                                         │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ 🟡 Homebrew - The missing package manager for macOS                      │"
  echo "│ ⏳ Homebrew - Updating...                                                │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│                                                                          │"
  brew upgrade && brew cleanup
  echo "\033[1;32m│                                                                          │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│ ✅ Homebrew - Done!                                                      │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ 🟡 npm - Package manager for JavaScript                                  │"
  echo "│ ⏳ npm - Updating...                                                     │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│                                                                          │"
  npm install -g npm@latest
  echo "\033[1;32m│                                                                          │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│ ✅ npm - Done!                                                           │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ 🟡 pnpm - Package manager for JavaScript                                 │"
  echo "│ ⏳ pnpm - Updating...                                                    │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│                                                                          │"
  npm install -g pnpm@latest
  echo "\033[1;32m│                                                                          │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│ ✅ pnpm - Done!                                                          │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ 🟡 ncu - Easy upgrades dependencies to the latest versions              │"
  echo "│ ⏳ ncu - Updating...                                                     │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│                                                                          │"
  npm install -g npm-check-updates@latest
  echo "\033[1;32m│                                                                          │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│ ✅ ncu - Done!                                                           │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│ 🟡 Fig - Visual autocomplete to any CLI tool or script in your Terminal  │"
  echo "│ ⏳ Fig - Updating...                                                     │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│                                                                          │"
  fig update
  echo "\033[1;32m│                                                                          │"
  echo "├──────────────────────────────────────────────────────────────────────────┤"
  echo "│ ✅ Fig - Done!                                                           │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
  echo "┌──────────────────────────────────────────────────────────────────────────┐"
  echo "│                                                                          │"
  echo "│ ✅ Upgrading all scripts and packages done!                              │"
  echo "│                                                                          │"
  echo "│ Type: commands in your terminal to learn some more.                      │"
  echo "│                                                                          │"
  echo "└──────────────────────────────────────────────────────────────────────────┘"
}

# testcolors
alias testcolors1="curl -s https://gist.githubusercontent.com/WoLpH/8b6f697ecc06318004728b8c0127d9b3/raw/colortest.py | python3 "
alias testcolors2="for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f""

function commands() {
  echo "\033[0;91m ============== ALL COMMANDS AVAILABLE =============="
  echo "weather [city]         - Check weather"
  echo "cheatsheet [command]   - cheatsheet online"
  echo "npm-global-variables   - Check NPM global variables"
  echo "glances                - Process manager"
  echo "neofetch               - Hardware summary"
  echo "localip                - Check local IP"
  echo "publicip               - Check public IP"
  echo "alias                  - Check all aliases"
  echo "zsh_stats              - Get a list of the top 20 commands and how many times they have been run."
  echo "config [command]       - Manage .dotfiles"
  echo "testcolors1            - Test colors #1"
  echo "testcolors2            - Test colors #2"
  echo "upgrade-everything     - Upgrade all scripts and packages to latest versions:"
  echo "                       - (omz update)"
  echo "                       - (zplug update)"
  echo "                       - (brew upgrade)"
  echo "                       - (npm install -g npm@latest)"
  echo "                       - (npm install -g npm-check-updates@latest)"
  echo "\033[0;91m ===================================================="
}

# Manager .dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.supercfg/ --work-tree=$HOME"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
