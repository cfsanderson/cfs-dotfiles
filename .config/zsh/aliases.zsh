#===============================================================================
#                             ___                     
#                      ____ _/ (_)___ _________  _____
#                     / __ `/ / / __ `/ ___/ _ \/ ___/
#                    / /_/ / / / /_/ (__  )  __(__  ) 
#                    \__,_/_/_/\__,_/____/\___/____/  
#                                                     
#===============================================================================
#                               @cfsanderson

# General
alias bbd='brew bundle dump -f'
alias brave='open -a "Brave Browser" https://www.'
alias brew='env PATH="${PATH//.asdf/shims:/}" brew'
alias c='clear'
alias darkdown='cd $HOME/.vim/plugged/markdown-preview.nvim && gs darkdown'
alias dropbox='cd /Users/caleb/Library/CloudStorage/Dropbox/'
alias gs='git switch'
alias home='cd $HOME && clear && fastfetch'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias hidepaths='defaults write com.apple.finder _FXShowPosixPathInTitle -bool false; killall Finder'
alias karabiner='"/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"'
alias kterm='"/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli" --select-profile 'Terminal''
alias knorm='"/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli" --select-profile 'Normal''
alias l='ls -lA'
alias myhub='open https://github.com/cfsanderson'
alias mkcdir=mkdir_cd
mkdir_cd() {
    mkdir -p -- "$1" &&
    cd -P -- "$1" &&
    ls -la
}
alias newbrew='brew update && brew upgrade && brew cleanup'
alias notes='cd $HOME/Projects/.notes && nvim 003_DUMP.md'
alias nv='nvim'
alias pihole='ssh pi@192.168.4.38'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias showpaths='defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder'
alias sourz='source $HOME/.config/zsh/.zshrc'
alias st='speedtest'
alias to=touch_open
touch_open() {
	if ! [ "$1" ]; then
		echo "need a file!" >&2
		return 1
	fi
	: > "$1" && nvim "$1"
}
alias tmux='env TERM=screen-256color tmux'
alias tp='trash-put'
alias weather="curl 'v2d.wttr.in/Bradenton?u'"
alias wikiread='open -a Firefox\ Developer\ Edition $HOME/Library/CloudStorage/Dropbox/.wiki/mdwiki.html'
alias wiki='cd $HOME/Projects/wiki && nv index.md'

# Taskwarrior
alias twork='task project:Work'
alias thome='task project:Home'
alias tinbox='task project:Inbox'
alias tsave='cd $HOME/Projects/.task/ && gst'

# Configs
alias conf='/usr/bin/git --git-dir=$HOME/.cfs-dotfiles/ --work-tree=$HOME'
alias confalacritty='cd $HOME/.config/alacritty/ && nvim alacritty.yml'
alias confalias='cd $HOME/.oh-my-zsh/custom/ && nvim aliases.zsh'
alias conflog='conf log'
alias confloga='conf log --oneline --decorate --graph --all'
alias confstat='conf status'
alias conftask='cd $HOME/.config/task/ && nvim taskrc'
alias conftmux='cd $HOME/ && nvim .tmux.conf'
alias confnv='cd $HOME/.config/nvim/ && nvim init.lua'
alias confzsh='cd $HOME/.config/zsh/ && nvim .zshrc'
