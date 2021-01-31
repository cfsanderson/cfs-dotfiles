# oh-my-zsh custom aliases

alias alius='vim $HOME/.oh-my-zsh/custom/aliases.zsh'
alias bbd='brew bundle dump -f'
alias brave='open -a "Brave Browser"'
alias c='clear'
alias calebpi='ssh pi@calebpi.local'
alias chrome='open -a "Google Chrome"'
alias conf='/usr/bin/git --git-dir=/Users/calebsanderson/.cfs-dotfiles/ --work-tree=/Users/calebsanderson'
alias confstat='conf status'
alias conflog='conf log'
alias confloga='conf log --oneline --decorate --graph --all'
alias firefox='open -a "Firefox"'
alias gs='git switch'
alias home='~ && ls -la'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias hidepaths='defaults write com.apple.finder _FXShowPosixPathInTitle -bool false; killall Finder'
alias rootpi='ssh root@192.168.254.100'
alias mkcdir=mkdir_cd
mkdir_cd() {
    mkdir -p -- "$1" &&
    cd -P -- "$1" &&
    ls -la
}
alias myhub='open https://github.com/cfsanderson'
alias notes='cd ~/Projects/.notes && nvim .'
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
alias vimrc='nvim ~/.config/nvim/init.vim'
alias zshrc='nvim ~/.zshrc'
