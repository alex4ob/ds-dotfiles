# mac defaults registry
defaults write com.apple.dock showhidden -bool yes
defaults write com.apple.dock single-app -bool true
defaults write com.apple.dock mineffect -string suck
# defaults write com.apple.dock mineffect -string scale
# defaults write com.apple.dock autohide-delay -float 86400
defaults write com.apple.dock autohide-time-modifier -int 0.15
killall Dock1