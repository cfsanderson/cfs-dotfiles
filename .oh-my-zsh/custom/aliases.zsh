#===============================================================================
#                             ___                     
#                      ____ _/ (_)___ _________  _____
#                     / __ `/ / / __ `/ ___/ _ \/ ___/
#                    / /_/ / / / /_/ (__  )  __(__  ) 
#                    \__,_/_/_/\__,_/____/\___/____/  
#                                                     
#===============================================================================
#                               @cfsanderson

alias bbd='brew bundle dump -f'
alias brave='open -a "Brave Browser"'
alias conf='/usr/bin/git --git-dir=/Users/calebsanderson/.cfs-dotfiles/ --work-tree=/Users/calebsanderson'
alias confalias='vim $HOME/.oh-my-zsh/custom/aliases.zsh'
alias confalacritty='cd ~/.config/alacritty && vim alacritty.yml'
alias confstat='conf status'
alias conftmux='vim ~/.tmux.conf'
alias conflog='conf log'
alias confloga='conf log --oneline --decorate --graph --all'
alias confvim='vim ~/.config/nvim/init.vim'
alias confzsh='vim ~/.zshrc'
alias firefox='open -a "Firefox"'
alias gs='git switch'
alias home='cd ~ && clear && neofetch'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias hidepaths='defaults write com.apple.finder _FXShowPosixPathInTitle -bool false; killall Finder'
alias kali='ssh caleb@192.168.254.23'
alias l='ls -lA'
alias mkcdir=mkdir_cd
mkdir_cd() {
    mkdir -p -- "$1" &&
    cd -P -- "$1" &&
    ls -la
}
alias music='cmus'
alias myhub='open https://github.com/cfsanderson'
alias notes='cd ~/Projects/.notes && nvim .'
alias pihole='ssh pi@calebpi.local'
alias preview='open -a Preview'
alias rootpi='ssh root@192.168.254.100'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias showpaths='defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder'
alias sourcezsh='source ~/.zshrc'
alias st='speedtest'
alias startmeup='zsh ~/.config/iterm/startup-ascii.sh'
alias timez='date “+EST: %H:%M” && TZ=America/Chicago date “+CST: %H:%M” && TZ=America/Denver date “+MST: %H:%M” && TZ=America/Los_Angeles date “+PST: %H:%M”'
alias to=touch_open
touch_open() {
        if ! [ "$1" ]; then
                echo "need a file!" >&2
                return 1
        fi
        : > "$1" && nvim "$1"
}
alias tp='trash-put'
alias vim='nvim'
