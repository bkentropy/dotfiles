export EDITOR="nvim"
# export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"
#echo "$(brew --prefix)/anaconda3/bin"
# export PATH="$(brew --prefix)/anaconda3/bin:/usr/local/anaconda3/bin:$PATH"

# Apparently you must run this (once) on newer Macs for PressAndHold functionality
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

### Docker tricks
alias dc="docker-compose"
alias dps="docker ps"
alias dpsa="docker ps -a" # shows all docker process
alias drm="docker rm -f" # drm `allids` will remove all docker processes
alias allids="docker ps -aq"
alias di="docker images"
alias drmi="docker rmi"
alias dnone="docker images | grep '^<none>' | awk '{print \$3}'"
alias dprune="drmi \$(di -q -f dangling=true)"
# I like drmi $(di -q -f dangling=true)
alias dni="docker network inspect"

### Config Files
alias prof="nvim ~/.profile"
alias reprof="source ~/.profile"
alias tconfig="nvim ~/.tmux.conf"
alias vimvim="vim ~/.vimrc"
alias windows="nvim ~/.hammerspoon/init.lua"

### Navigation ###
alias bund="cd ~/.vim/bundle"
alias desk="cd ~/Desktop; ls"
#c
### Shortcuts ###
alias c="clear"
alias h="history"
alias nggo="nginx -t && nginx -s reload"
alias findp="ps aux | ag"
alias ports="lsof -iTCP -sTCP:LISTEN"
alias myip="curl http://ipecho.net/plain && echo"

# strips newline
alias dcp="pwd | pcp"

### Better default
alias pysh="ptpython"
alias tree="tree -I target -I node_modules"
alias tmux="tmux -2"
alias pcp="tr -d '\n' | pbcopy" # use this just like pbcopy EXCEPT that it will remove that stupid \n
alias cpd="pwd | pcp"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias grep="grep --color=auto"
alias l="ls -CF"
alias la="ls -A"
alias ll="ls -alF"
alias ls="ls -GFh"
alias attach="tmux attach -t avserv"

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'


