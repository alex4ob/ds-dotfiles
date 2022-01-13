# General Aliases

# Open .zshrc to be editor in VS Code
alias change="code ~/.zshrc"
# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"
# Use the VS Code insiders build by default for the `code` CLI commands
alias co="code"
# cd into iCloud drive folder in terminal
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

# Clear terminal
alias c='clear'

# View files/folder alias using colorsls (https://github.com/athityakumar/colorls)
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'
alias ls='colorls -h --group-directories-first -1'
alias la='colorls -h --group-directories-first --almost-all --long'
alias lt='colorls --tree=3' # show as tree, 3 levels deep

alias awsdev='aws sso login --profile OB_Dev'

#sublime-text4
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'