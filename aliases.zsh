# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias reloadshell="source $HOME/.zshrc"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias c="clear"
alias o="open ."

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias dev="cd $HOME/dev/"
alias sites="cd $HOME/dev/sites"
alias clients="cd $HOME/dev/clients"

# Docker
alias docker-composer="docker-compose"

# Git
alias gitit="git commit -m 'update #`git log | grep commit | wc -l | xargs`'; git push"
alias gst="git status"
#alias gb="git branch"
#alias gc="git checkout"
#alias gl=glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
#alias amend="git add . && git commit --amend --no-edit"
#alias commit="git add . && git commit -m"
#alias diff="git diff"
#alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
alias undo="git reset --soft HEAD~1"

# Laravel
alias a="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias tinker="php artisan tinker"
alias seed="php artisan db:seed"
alias serve="php artisan serve"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias co="composer"
alias cu="composer update"
alias cr="composer require"
alias ci="composer install"
alias cda="composer dump-autoload -o"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Redis
alias flush-redis="redis-cli FLUSHALL"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com -4"
alias localip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Lock the screen
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"