### Exports
### Prompt stuff
autoload -Uz vcs_info
precmd() { vcs_info }

autoload -U -X compinit && compinit
fpath=(~/.config/zsh $fpath)

zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
zstyle ':vcs_info:git:*' formats ' (%F{32}%b%f)'

setopt prompt_subst
PROMPT='[%F{green}%n%B%F{white}@%F{cyan}macbook %b%F{036}%1d%f${vcs_info_msg_0_}] '

setopt nobeep
setopt RM_STAR_SILENT

bindkey  "^[[1;6D" beginning-of-line
bindkey  "^[[1;6C" end-of-line
bindkey  "^[[1;5D" backward-word
bindkey  "^[[1;5C" forward-word

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
