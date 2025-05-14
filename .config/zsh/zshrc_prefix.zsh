### Exports
### Prompt stuff
autoload -Uz vcs_info
precmd() { vcs_info }

autoload -U compinit 
compinit
fpath=(~/.config/zsh $fpath)

zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
zstyle ':vcs_info:git:*' formats ' (%F{32}%b%f)'

setopt prompt_subst
PROMPT='[%F{green}%n%B%F{white}@%F{cyan}${RAWR_HOSTNAME} %b%F{036}%1d%f${vcs_info_msg_0_}] '

setopt nobeep
setopt rm_star_silent
setopt inc_append_history
setopt share_history

bindkey  "^A" beginning-of-line
bindkey  "^E" end-of-line
bindkey  "^[b" backward-word
bindkey  "^[f" forward-word
bindkey  "^R" history-incremental-search-backward

### SSH-agent setup
killall -0 ssh-agent &>/dev/null
if [ $? -ne 0 ]; then 
        eval $(ssh-agent) &>/dev/null
fi 
ssh-add -A &>/dev/null

### Aliases
alias tmux='tmux -2'
alias ls="ls -Ga"
alias d="sudo docker"
alias k="kubectl"
alias vim="nvim"

alias gfr="git fetch -v origin && git rebase"
alias gf="git fetch -v origin"
alias gap="git add -p"
alias gc="git commit"
alias gp="git push"

source ~/.config/zsh/zsh-z/zsh-z.plugin.zsh
