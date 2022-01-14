SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
############################################################################################
# Optional
############################################################################################

[[ -f $SCRIPT_DIR/homebrew/Brewfile.optional ]] && brew bundle --file=$SCRIPT_DIR/homebrew/Brewfile.optional

# antigen -> all plugins already configured in .zshrc-custom
curl -L git.io/antigen > antigen.zsh

# simlinks
test -f $SCRIPT_DIR/.zshrc-custom && echo "source ~/.zshrc-custom" >>~/.zshrc
test -f $SCRIPT_DIR/.zprofile && ln -s $SCRIPT_DIR/.zprofile ~/.zprofile
test -f $SCRIPT_DIR/.zshrc-custom && ln -s $SCRIPT_DIR/.zshrc-custom ~/.zshrc-custom
test -f $SCRIPT_DIR/hyper/.hyper.js && ln -s $SCRIPT_DIR/hyper/.hyper.js ~/.hyper.js

#docker shell completion (zsh)
etc=/Applications/Docker.app/Contents/Resources/etc
ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose

# colorls (to show file icons, etc.)
# sudo gem install colorls

#TBD gitconfig init
#TBD awscli config init