#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Remove .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Remove .p10k.zsh from $HOME (if it exists) and symlinks the .p10k.zsh file from the .dotfiles
rm -rf $HOME/.p10k.zsh
ln -s $HOME/.dotfiles/.p10k.zsh $HOME/.p10k.zsh

# Install power-level-10k
! git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.dotfiles/themes/powerlevel10k"

# Install zsh auto suggestions
! git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.dotfiles/plugins/zsh-autosuggestions"

# Install zsh-syntax-highlighting
! git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.dotfiles/plugins/zsh-syntax-highlighting"

# Install zsh-z
! git clone https://github.com/agkozak/zsh-z.git "$HOME/.dotfiles/plugins/zsh-z"

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (see Brewfile)
brew tap homebrew/bundle
brew bundle --file $DOTFILES/Brewfile

# Set default MySQL root password and auth type
#mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
# pecl install imagick redis swoole

# Install global Composer packages
composer global require laravel/installer laravel/valet beyondcode/expose spatie/global-ray spatie/visit

# Install Laravel Valet
valet install

# Install Global Ray
# $HOME/.composer/vendor/bin/global-ray install

# Create a dev directory
mkdir -p $HOME/dev

# Create dev subdirectories
mkdir -p $HOME/dev/sites
mkdir -p $HOME/dev/clients

# Update Valet's paths
cd $HOME/dev/sites && valet park

# Load nvm for the first time
source $(brew --prefix nvm)/nvm.sh

# Set nvm directory
export NVM_DIR="$HOME/.nvm"

# Create nvm directory
mkdir -p ~/.nvm

# Install latest node
nvm install --lts

# Reload the Environment
test -d ~/.zshrc && source ~/.zshrc

# Switch to latest node
nvm use --lts

# Upgrade npm to latest version
npm i -g npm --silent

# Install conventional commits
npm i -g commitizen cz-conventional-changelog @commitlint/cli @commitlint/config-conventional --silent

# Install other npm commonly used tools
npm i -g npm yarn eslint prettier cross-env nodemailer --silent

# Clone Github repositories
# $DOTFILES/clone.sh

# Symlink the Mackup config file to the home directory
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences - we will run this last because this will reload the shell
# source $DOTFILES/.macos