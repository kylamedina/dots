#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
	google-chrome
	google-drive
	1password
	sketch
	sketch-toolbox
	slack
	dropbox
	plug
	iterm2
	alfred
	totalfinder
)

# fonts
fonts=(
	font-m-plus
	font-clear-sans
	font-roboto
	font-source-code-pro
	font-inconsolata
	font-fira-code
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
	brew tap caskroom/fonts 
	# Install homebrew-cask
	echo "installing cask..."
	brew tap caskroom/cask

	# Tap alternative versions
	brew tap caskroom/versions

	# Tap the fonts
	#brew tap caskroom/fonts

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
	brew install cowsay fortune graphicsmagick hub legit mysql node python rbenv libiconv
	brew cleanup
	legit install
	brew link openssl --force
	brew link libiconv --force
	#cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
	#rm -r User
	#ln -s ~/Dropbox/Sublime/User
	#ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/Sites/dot-settings/bin/subl
	xcode-select --install
}

main "$@"
exit 0
