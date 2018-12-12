# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/cameronaziz/.oh-my-zsh"
# POWERLEVEL9K_MODE='awesome-fontconfig'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes



# ZSH_THEME="powerlevel9k/powerlevel9k"

# Tab Title
#DISABLE_AUTO_TITLE="true"
#function precmd () {
#  window_title="\033]0;${PWD##*/}\007"
#  echo -ne "$window_title"
#}
# ZSH_THEME_TERM_TITLE_IDLE="%~"
# ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# POWERLEVEL9K_MODE='nerdfont-complete'
# source  ~/powerlevel9k/powerlevel9k.zsh-theme

# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uf178 "
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_DIR_HOME_BACKGROUND='046'
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='155'
# POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='001'
# POWERLEVEL9K_DIR_ETC_BACKGROUND='003'
# POWERLEVEL9K_MODE='nerdfont-complete'

#SPACESHIP_PROMPT_ADD_NEWLINE="true"
#SPACESHIP_CHAR_PREFIX="\uf296"
#SPACESHIP_CHAR_SYMBOL=" \uf0e7"
#SPACESHIP_CHAR_SUFFIX=(" ")
#SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
#SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
#SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
#SPACESHIP_USER_SHOW="true"

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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

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
  screen
  battery
  zsh-nvmi
  git
  history
  git-prompt
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User Prompt
DEFAULT_USER=$USER

function collapse_pwd {
	echo $(pwd | sed -e "s,^$HOME,~,")

}

# Terminal Title
DISABLE_AUTO_TITLE="true"

precmd() {
	echo -ne "\e]1;$PWD\a"
}

# Prompts
PROMPT='${PWD/#$HOME/~}$(git_prompt_info)'

# Aliases
alias ls='colorls -A --sd'
alias lc=’colorls — tree — light’
alias vi="nvim"
alias vim="nvim"
alias omz='nvim ~/.zshrc'
alias mkdir='mkdir -pv'
mcd()  { if [ "$#" -ne 1 ]; then echo "usage: mcd directory"; else mkdir "$1"; cd "$1"; fi;}


cdn() {
	TEMP_PWD=`pwd`
	while ! [ -f package.json ]; do
		cd ..
	done
	OLDPWD=$TEMP_PWD
}


#User configuration

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# prompt_context() {
#  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#  fi
# }

  # Set Spaceship ZSH as a prompt
  autoload -U promptinit; promptinit
  prompt spaceship

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh