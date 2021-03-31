### Exports
### Prompt stuff
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' (%F{32}%b%f)'
setopt prompt_subst
PROMPT='[%F{green}%n%B%F{white}@%F{cyan}macbook %b%F{036}%1d%f${vcs_info_msg_0_}] '

setopt nobeep

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

### SSH-agent setup
eval $(ssh-agent) &>/dev/null
ssh-add -A &>/dev/null


### Aliases
alias tmux='tmux -2'
alias ls="ls -Ga"
alias brew64="arch -x86_64 /usr/local/homebrew/bin/brew"
alias do64="arch -x86_64"
