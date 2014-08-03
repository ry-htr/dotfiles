xcode-select --install

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew bundle

ln -s ~/dotfile/.vimrc ~/.vimrc
ln -s ~/dotfile/.zshrc ~/.zshrc
ln -s ~/dotfile/.zshenv ~/.zshenv

source ~/.zshrc
