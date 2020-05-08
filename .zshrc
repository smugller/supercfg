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

# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# START Experimental --------------------

# #libressl
# export PATH="/usr/local/opt/libressl/bin:$PATH"

# #bison
# export PATH="/usr/local/opt/bison/bin:$PATH"

# #openssl
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# # export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
# # export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# # export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/zlib/lib"
# # export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/zlib/include"

# symlink openssl
# ln -s /usr/local/opt/openssl@1.1/include/openssl /usr/local/include

# END Experimental --------------------

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gianu"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  dotenv
  git
  osx
  pyenv
  rake
  rbenv
  ruby
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Custom settings ==========================================

# Hyper Terminal

# Delete % sign from Hyper Terminal - (This is workaround, in next versions should be fixed)
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=""

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

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Functions

# check your weather putting city as parameter
function weather() {
  curl "https://v2.wttr.in/$1"
}

# cheat-sheet in terminal
function cheat-sheet() {
  curl "https://cht.sh/$1"
}

# list all npm global packages
function npm-global-variables() {
  npm list -g --depth 0
}

#  glances - https://github.com/nicolargo/glances
function system-info() {
  glances
}

# Other useful aliases

alias testcolors1="curl -s https://gist.githubusercontent.com/WoLpH/8b6f697ecc06318004728b8c0127d9b3/raw/colortest.py | python3 "
alias testcolors2='for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"'

# Manager .dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.supercfg/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh