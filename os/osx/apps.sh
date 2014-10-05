#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
	alfred
	dropbox
	google-chrome
	google-chrome-canary
	firefox
	firefox-nightly
	webkit-nightly
	breach
	torbrowser
	qlcolorcode
	opera-next
	evernote-beta
	mou
	teamviewer
	taskpaper
	hazel
	qlmarkdown
	spotify
	vagrant
	flash
	iterm2
	sublime-text3
	atom
	flux
	inky
	qlstephen
	tower
	vlc
	nvalt
	quicklook-json
	skype
	transmission
	rescuetime
	namechanger
	cakebrew
	mamp
	dash-beta
	fontprep
	the-unarchiver
	feeds
	daisydisk
	onepassword
	framer-studio
	droplr
	airfoil
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
	brew cleanup
}

main "$@"
exit 0
