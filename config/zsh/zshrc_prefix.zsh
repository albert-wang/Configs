### Exports
### Prompt stuff
autoload -Uz vcs_info
precmd() { vcs_info }

autoload -U compinit 
compinit
fpath=(~/.config/zsh $fpath)

export LANG=en_US.UTF-8

zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.zsh
zstyle ':vcs_info:git:*' formats ' (%F{32}%b%f)'

setopt prompt_subst
PROMPT='[%F{green}%n%B%F{white}@%F{cyan}${RAWR_HOSTNAME} %b%F{036}%1d%f${vcs_info_msg_0_}] '

setopt nobeep
setopt rm_star_silent
setopt inc_append_history
setopt share_history

# Remove vim / emacs bindings
bindkey -v
bindkey -e

# reasonable bindings

# del, shift+del
bindkey "^[[3~" delete-char
bindkey "^[[3;2~" delete-char

# up, shift + up
bindkey "^[[A" up-line-or-history
bindkey "^[[1;2A" beginning-of-line

# down, shift + down
bindkey "^[[B" down-line-or-history
bindkey "^[[1;2B" end-of-line

# left, Shift + left
bindkey  "^[b" backward-word
bindkey  "^[[1;2D" backward-word

# right, Shift + right
bindkey  "^[f" forward-word
bindkey  "^[[1;2C" forward-word

# Home, shift Home
bindkey "^[[1~" beginning-of-line
bindkey "^[[1;2H" beginning-of-line
bindkey "^[[H" beginning-of-line

# End, shift End
bindkey "^[[4~" end-of-line
bindkey "^[[1;2F" end-of-line
bindkey "^[[F" end-of-line


bindkey  "^R" history-incremental-search-backward

### SSH-agent setup
killall -0 ssh-agent &>/dev/null
if [ $? -ne 0 ]; then 
        eval $(ssh-agent) &>/dev/null
fi 
ssh-add -A &>/dev/null

### Aliases
alias tmux='tmux -2'
alias ls="ls -Ga --color=auto"
alias d="sudo docker"
alias k="kubectl"
alias vim="nvim"

alias g="git"
alias gfr="git fetch -v origin && git rebase"
alias gf="git fetch -v origin"
alias gap="git add -p"
alias gc="git commit"
alias gp="git push"

source ~/.config/zsh/zsh-z/zsh-z.plugin.zsh
