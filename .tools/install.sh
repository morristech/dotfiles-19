cd $HOME
rm -rf .git .vim .oh-my-zsh
rm .zshrc

if [[ $(uname -o) = "Android" ]]; then
	apt update
	apt install -y git zsh vim tmux nodejs tree man ranger

	# Oh My Zsh
	sh -c "$(curl -fsSL https://raw.github.com/skeevy420/oh-my-zsh/skeevy420-termux/tools/install.sh)"

	termux-setup-storage

elif [[ $(uname) = "Linux" ]]; then
	curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

	sudo apt update
	sudo apt -y install git zsh vim tmux nodejs npm tree nmap ranger

	# Oh My Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

elif [[ $(uname) = "Darwin" ]]; then
	if ! which brew > /dev/null; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	brew install git zsh vim tmux node git-extras gnupg tree trash ranger

	# Oh My Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

else
	echo
	echo 'Something happened.'
	echo
	exit 1
fi

git init
git remote add origin https://github.com/Kutsan/dotfiles.git
git fetch origin
git checkout --force -b master --track origin/master
git submodule update --init --recursive

# VimPlug
curl -Lo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qa

echo
echo '|_/   |_ _ _  _    _ '
echo '| \|_|| _)(_|| )  _) '
echo '         _           '
echo ' _| _ |_(_.| _ _     '
echo '(_|(_)|_| ||(-_)     ...is now installed!'
echo ''
echo
