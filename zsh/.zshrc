# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#Locales
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="/home/noel/.oh-my-zsh"

export ZSH_CUSTOM="$HOME/.zsh-custom"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Golang env
[[ -s "/home/noel/.gvm/scripts/gvm" ]] && source "/home/noel/.gvm/scripts/gvm"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# lua
export LUA_PATH='/home/noel/.luarocks/share/lua/5.3/?.lua;/home/noel/.luarocks/share/lua/5.3/?/init.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/lib/lua/5.3/?.lua;/usr/lib/lua/5.3/?/init.lua;./?.lua;./?/init.lua'
export LUA_CPATH='/home/noel/.luarocks/lib/lua/5.3/?.so;/usr/lib/lua/5.3/?.so;/usr/lib/lua/5.3/loadall.so;./?.so'
export PATH="/home/noel/.luarocks/bin:$PATH"

# github/hub tool
eval "$(hub alias -s)"
GITHUB_USER="noelmace"

# GCP

# required by the gcloud zsh plugin
CLOUDSDK_HOME=/home/noel/.gcp/google-cloud-sdk/

# uncomment next lines if you don't want to use this plugin
# updates PATH for the Google Cloud SDK.
# if [ -f "$CLOUDSDK_HOME/path.zsh.inc" ]; then . "$CLOUDSDK_HOME/path.zsh.inc"; fi
# enables shell command completion for gcloud.
# if [ -f "$CLOUDSDK_HOME/completion.zsh.inc" ]; then . "$CLOUDSDK_HOME/completion.zsh.inc"; fi

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  gcloud
  docker
  docker-compose
  ng
  npm
  web-search
  yarn
  debian
  autojump
  golang
  github
  zsh-autosuggestions
)

SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_BATTERY_THRESHOLD=25
SPACESHIP_BATTERY_SHOW=always
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT=%T

source $ZSH/oh-my-zsh.sh

##=== User configuration ===##

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code --wait'
else
  export EDITOR='mvim'
fi

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

alias gdtl="git difftool"

zhelp() {
  cat $HOME/.oh-my-zsh/plugins/$1/$1.plugin.zsh | grep ${@:2}
}

[ -s "/etc/profile.d/autojump.zsh" ] && source /etc/profile.d/autojump.zsh

# NVM

export NVM_DIR="$(realpath $HOME/.nvm)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# .zshrc.d

ZSH_ANGULAR_PROMPT=$HOME/.zshrc.d/spaceship-angular-prompt/angular-prompt-zsh.sh

if [[ -f $ZSH_ANGULAR_PROMPT ]]; then
  . $ZSH_ANGULAR_PROMPT;
fi

CMD_IMDONE=$HOME/.zshrc.d/commands/imdone.sh

if [[ -f $CMD_IMDONE ]]; then
  . $CMD_IMDONE;
fi

# spaceship

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  angular
  angular_cli
  angular_devkit
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  line_sep      # Line break
  exit_code     # Exit code section
  exec_time     # Execution time
  jobs          # Background jobs indicator
  vi_mode       # Vi-mode indicator
  battery       # Battery level and status
  time          # Time stampts section
  char          # Prompt character
)

# Editor

export EDITOR="code --wait"
export GIT_EDITOR="code --wait"

# SSH Agent

SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
		      
if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    start_agent;
	}
else
	start_agent;
fi

# Debug Nodejs

DEBUG_NODE="node --max_old_space_size=8192 --inspect-brk"

alias dnode="$DEBUG_NODE"
alias dngg="$DEBUG_NODE $(where ng)"
alias dng="$DEBUG_NODE ./node_modules/@angular/cli/bin/ng"

# Aliases

alias chrome="google-chrome-stable"
alias xx="asciinema play"
alias netflix="chrome --app=https://www.netflix.com/"
alias npmp="npx install-peerdeps"
alias sub="subliminal download -l fr"
alias imhome="bluetoothctl -- power on && bash $HOME/.screenlayout/home-office.sh && xbacklight = 0"
alias obscam="sudo modprobe v4l2loopback devices=1 video_nr=10 card_label=\"OBS Cam\" exclusive_caps=1 \
    && sudo modprobe snd-aloop index=10 id=\"OBS Mic\" \
    && pacmd 'update-source-proplist alsa_input.platform-snd_aloop.0.analog-stereo device.description=\"OBS Mic\" ' \
    && ffmpeg -probesize 32 -analyzeduration 0 -listen 1 -i rtmp://127.0.0.1:1935/live/test -map 0:1 -f v4l2 -vcodec rawvideo /dev/video10 -map 0:0 -f alsa hw:10,1"
alias fanq="sudo smbios-thermal-ctl --set-thermal-mode=Balanced"
alias fanp="sudo smbios-thermal-ctl --set-thermal-mode=Performance"
alias hibernate="systemctl hibernate"
alias suspend="systemctl suspend"
alias logout="sudo systemctl restart lightdm"
alias gpt="git push --follow-tags"
alias npmI="npm install --package-lock-only --ignore-scripts"
alias stayup="xset s off -dpms"

PATH="/home/noel/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/noel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/noel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/noel/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/noel/perl5"; export PERL_MM_OPT;
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;}
