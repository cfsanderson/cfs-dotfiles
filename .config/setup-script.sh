echo "========================================================================"
echo "==                __                     _                            =="
echo "==    ____       / _|                   | |                           =="
echo "==   / __ \  ___| |_ ___  __ _ _ __   __| | ___ _ __ ___  ___  _ __   =="
echo "==  / / _  |/ __|  _/ __|/ _  |  _ \ / _  |/ _ \  __/ __|/ _ \|  _ \  =="
echo "== | | (_| | (__| | \__ \ (_| | | | | (_| |  __/ |  \__ \ (_) | | | | =="
echo "==  \ \__,_|\___|_| |___/\__,_|_| |_|\__,_|\___|_|  |___/\___/|_| |_| =="
echo "==   \____/                                                           =="
echo "==                                                                    =="
echo "==========          Ready to install some dotfiles?           =========="
echo "============   https://github.com/cfsanderson/cfs-dotfiles  ============"
echo "======      curl -Lks http://bit.do/cfsanderson-xcode | zsh       ======"
echo "========================================================================"

xcode-select --install

echo "=====                 xcode-select installed                 ====="
echo "=====  Install cfg-dotfiles alias and begin dotfiles setup?  ====="
echo "=====  curl -Lks http://bit.do/cfsanderson-cfg-alias | zsh  ====="

alias conf='/usr/bin/git --git-dir=$HOME/.cfs-dotfiles/ --work-tree=$HOME'
echo ".cfs-dotfiles" >> .gitignore
echo "===== Next: Clone cfg-dotfiles repo? ====="
echo "===== curl -Lks http://bit.do/cfsanderson-cfg-clone | zsh ====="

git clone --bare https://github.com/cfsanderson/cfs-dotfiles.git $HOME/.cfs-dotfiles

function cfs {
   /usr/bin/git --git-dir=$HOME/.cfs-dotfiles/ --work-tree=$HOME $@
   echo "===== cfs function has run ====="
}

mkdir -p .cfs-backup
cfs checkout
if [ $? = 0 ]; then
  echo "===== checked out cfs =====";
  else
    echo "===== backing up pre-existing dot files =====";
    cfs checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .cfs-backup/{}
fi;
cfs checkout
cfs config status.showUntrackedFiles no

echo "=====      Next: Install Homebrew and 'brew bundle'?      ====="
echo "===== curl -Lks http://bit.do/cfsanderson-homebrew | zsh ====="

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "===== Installing all Brewfile dependencies ====="

brew bundle

echo "=====               Next: Install Oh-My-Zsh?               ====="
echo "===== curl -Lks http://bit.do/cfsanderson-oh-my-zsh | zsh ====="

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "=====                       WARNING:                       ====="
echo "=====     this may have backed up the existing .zshrc      ====="
echo "=====    to .zshrc.pre-oh-my-zsh. Change it back if so.    ====="
echo "=====          Next Step: Install Powerline fonts          ====="
echo "===== curl -Lks http://bit.do/cfsanderson-powerline | zsh ====="

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "===== Next: install global NPM packages              ====="
echo "===== curl -Lks http://bit.do/cfsanderson-nvm | zsh ====="

npm install --global trash-cli
npm install -g nodemon
npm install -g gatsby-cli

echo "===== Next Step: generate SSH keys       ====="
echo "===== curl http://bit.do/cfsanderson-ssh ====="

# generate new keys
echo "===== after keygen, press enter to leave in default folder ====="
echo "===== go to 'GitHub > settings > SSH and GPG keys' and delete old SSH key and click on 'New SSH Key' button. ====="
echo "===== 'pbcopy < ~/.ssh/id_rsa.pub' to copy the contents of rsa.pub and paste into Github ====="
echo "===== Next: Fix all those settings! ====="

ssh-keygen -t rsa -b 4096 -C "calebsanderson@icloud.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa
