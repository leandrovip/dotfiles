# Custom aliases
alias viperp='cd d:/dev/viperp'
alias mobile='cd d:/dev/VipERP.Mobile'
alias dev='cd d:/dev'
alias temp='cd d:/temp'
alias emul='d:/Programas/scrcpy/scrcpy-noconsole.vbs'

# Git aliases
alias ad='git ck develop'
alias am='git ck master'
alias au='git up'
alias al='git l'
alias as='git st'
#alias gs='git status -sb'
#alias gcc='git checkout'
#alias gcm='git checkout master'
#alias gaa='git add --all'
#alias gc='git commit -m $2'
#alias push='git push'
#alias gpo='git push origin'
#alias pull='git pull'
#alias clone='git clone'
#alias stash='git stash'
#alias pop='git stash pop'
#alias ga='git add'
#alias gb='git branch'
#alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
#alias gm='git merge'

# Bash aliases
alias .='cd .'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias bashclear='echo "" > ~/.bash_history'
alias cls='clear'
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias ll.='ls -la'
alias lls='ls -la --sort=size'
alias llt='ls -la --sort=time'
alias rm='rm -iv'

# Bash shell settings
# Typing a directory name just by itself will automatically change into that directory.
shopt -s autocd

# Automatically fix directory name typos when changing directory.
shopt -s cdspell

# Automatically expand directory globs and fix directory name typos whilst completing. 
# Note, this works in conjuction with the cdspell option listed above.
shopt -s direxpand dirspell

# Enable the ** globstar recursive pattern in file and directory expansions.
# For example, ls **/*.txt will list all text files in the current directory hierarchy.
shopt -s globstar

# oh-my-posh
eval "$(oh-my-posh init bash --config ~/.bash/themes/craver.omp.json)"