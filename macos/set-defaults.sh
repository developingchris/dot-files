defaults write -g ApplePressAndHoldEnabled -bool false

# fast key repeat, mostly for holding j/k in vim. These are the fastest the
# System Settings sliders go (30ms between repeats, 225ms before it starts)
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
