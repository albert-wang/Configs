source ~/.bashrc
source ~/git-completion.bash

PS1='[\[\e[00;32m\]\u\[\e[01;37m\]@\[\e[01;36m\]\h\[\e[01;30m\] \W$(git branch &> /dev/null ; if [ $? -eq 0 ]; then echo " \[\e[01;00m\](\[\e[01;34m\]$(git branch | grep '^\*' | cut -c3-)\[\e[01;00m\])"; fi)\[\e[01;00m\]] '



alias tmux='tmux -2'
