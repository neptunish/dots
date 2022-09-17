ZDOTDIR=~/.zsh
git clone https://github.com/neptunish/dots.git $ZDOTDIR

[[ -f ~/.zshenv ]] && mv ~/.zshenv ~/.zshenv.bak
ln -s $ZDOTDIR/.zshenv ~/.zshenv

# start a new zsh session
zsh
