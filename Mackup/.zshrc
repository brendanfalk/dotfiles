### Prompt
export PS1="%. \$ "


### Aliases
alias ..='cd ..'
alias c="clear"
alias g="git"
alias rm='trash'
alias exa='exa --long --grid --all  -@ --git --time modified --octal-permissions --header --numeric --time-style long-iso --classify --reverse -s type --color always'
alias who='who -H'
alias typora='open -a Typora.app'
alias excel='open -a Microsoft\ Excel.app'
alias reset_fig_ssh='trash ~/.fig/ssh'
alias tree='tree -aF -I "node_modules" --dirsfirst'
alias slow_internet='throttle --up 200 --down 200 --rtt 500'
alias fast_internet='throttle stop'
alias ls='ls -Alp'
alias cdt='cd `mktemp --dir`'
alias grep='rg'


### Path
export PATH="$PATH:$HOME/bin:/usr/local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME'/.cargo/bin"
export PATH="$PATH:$HOME'/go/bin"
export PATH="$PATH:$HOME'/.local/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


### Environment Variables
VISUAL="$EDITOR"
EDITOR="code"
echo -ne "\033]0;Fig ◧\007"


### Functions
function fig_demo() {
  echo -ne "\033]0;◧ Fig\007"
  export PS1='%. $ '
}

# function timeshell() {
#   shell=${1-$SHELL}
#     echo "Timing $shell"
#     unset FIG_TERM
#     unset FIG_HOSTNAME
#     unset FIGTERM_SESSION_ID
#     unset FIG_LOG_LEVEL
#     for i in $(seq 1 10); do /usr/bin/time $shell -li -c exit; 
# done


function dock_prompt() {
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd () {  echo; tput cup $LINES } 
  # eval "$(starship init zsh)"
}


### Plugins
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"


# History substring search
# https://unix.stackexchange.com/questions/97843/how-can-i-search-history-with-text-already-entered-at-the-prompt-in-zsh
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end