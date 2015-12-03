#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
)

# fonts
fonts=(
	font-m-plus
	font-clear-sans
	font-roboto
	font-source-code-pro
	font-inconsolata
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

	# Ensure homebrew is installed
	homebrew

	# Install homebrew-cask
	echo "installing cask..."
	brew tap phinze/homebrew-cask
	brew install brew-cask

	# Tap alternative versions
	brew tap caskroom/versions

	# Tap the fonts
	brew tap caskroom/fonts

	# install apps
	echo "installing apps..."
	brew cask install --appdir=$appdir ${apps[@]}

	# install fonts
	echo "installing fonts..."
	brew cask install ${fonts[@]}

	# link with alfred
	alfred
	cleanup
}

homebrew() {
	if test ! $(which brew); then
		echo "Installing homebrew..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
}

alfred() {
	brew cask alfred link
}

cleanup() {
	rm -rf ~/.atom
	ln -s ~/Dropbox/Apps/Atom ~/.atom
	rm -rf /Users/Kyla/Library/Application\ Support/Sublime\ Text\ 3
	ln -s /Users/Kyla/Dropbox\ \(Personal\)/Apps/Sublime /Users/Kyla/Library/Application\ Support/Sublime\ Text\ 3
	brew cleanup
}

main "$@"
exit 0
