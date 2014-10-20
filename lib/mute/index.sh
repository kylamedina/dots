sudo chmod u+x /usr/local/lib/dots/lib/mute/mute-on.sh
sudo chmod u+x /usr/local/lib/dots/lib/mute/mute-off.sh

sudo defaults write com.apple.loginwindow LogoutHook /usr/local/lib/dots/lib/mute/mute-on.sh
sudo defaults write com.apple.loginwindow LoginHook /usr/local/lib/dots/lib/mute/mute-off.sh

# To Delete:
# sudo defaults delete com.apple.loginwindow LoginHook
# sudo defaults delete com.apple.loginwindow LogoutHook	