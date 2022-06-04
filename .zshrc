# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump)

source $ZSH/oh-my-zsh.sh

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chao/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chao/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chao/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chao/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/home/chao/.yarn/bin:$PATH"

alias pnc="cd ~/workspace/pnc && ./docker/scripts/dev_start.sh -l && ./docker/scripts/dev_into.sh"
alias sim="cd ~/workspace/simview && ./docker/scripts/dev_start.sh -l && ./docker/scripts/dev_into.sh"
alias recorder="cd ~/workspace/mi-pilot/ados && ./bazel-bin/ados/tools/recorder/recorder"
alias monitor="cd ~/workspace/mi-pilot/ados && export TERMINFO=/usr/lib/terminfo:/lib/terminfo && ./bazel-bin/ados/third_party/cyberrt/cyber/tools/cyber_monitor/cyber_monitor"
alias server="cd ~/workspace/mi-pilot/ados && ADOS_NODE_ROLE=SERVER \
    ./bazel-bin/ados/tools/discovery_server/discovery_server \
    --config ados/tools/discovery_server/conf/discovery_server.pb.conf"
alias play="cd ~/workspace/mi-pilot/simview && ./bazel-bin/modules/simview/simview_with_simulation --flagfile=modules/common/data/global_flagfile.txt"
alias build_recorder="cd ~/workspace/mi-pilot/ados && bazelisk build //ados/tools/recorder:recorder"
alias build_monitor="cd ~/workspace/mi-pilot/ados && bazelisk build //ados/third_party/cyberrt/cyber/tools/cyber_monitor:cyber_monitor"
alias build_server="cd ~/workspace/mi-pilot/ados && bazelisk build --config=gcc-x86_64 --config=release //ados/tools/discovery_server:discovery_server"
alias build_planning="cd ~/workspace/mi-pilot/pnc && bazelisk build --config=gcc7-x86_64 //modules/planning/..."
alias build_simview="cd ~/workspace/mi-pilot/simview && bazelisk build --config=gcc7-x86_64 //modules/simview:simview_with_simulation"
alias build_simulation="cd ~/workspace/mi-pilot/pnc && bazelisk build --config=gcc7-x86_64 --config=simulation --config=release //packaging/simulation/..."
alias simulation="cd ~/workspace/mi-pilot/simview && ./bazel-bin/modules/simview/simview_with_simulation -config modules/simview/conf/launch.pb.txt -pnc-artifacts-path artifacts -scenario-path modules/simulator/scenarios/test/haoli_scenario_bhx_3.pb.txt -simulation-config-path modules/simulator/conf/gallery/1_planning.pb.txt --simulation_start_state stepping --simulation_start_state_param /sim/planning"
alias simulation_dbg="cd ~/workspace/mi-pilot/simview && GLOG_v=4 GLOG_logtostderr=1 ./bazel-bin/modules/simview/simview_with_simulation -config modules/simview/conf/launch.pb.txt -pnc-artifacts-path artifacts -scenario-path modules/simulator/scenarios/test/haoli_scenario_bhx_3.pb.txt -simulation-config-path modules/simulator/conf/gallery/1_planning.pb.txt"
