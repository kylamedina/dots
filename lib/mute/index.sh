sudo chmod u+x ./mute-on.sh
sudo chmod u+x ./mute-off.sh

sudo defaults write com.apple.loginwindow LogoutHook ./mute-on.sh
sudo defaults write com.apple.loginwindow LoginHook ./mute-off.sh

# To Delete:
# sudo defaults delete com.apple.loginwindow LoginHook
# sudo defaults delete com.apple.loginwindow LogoutHook