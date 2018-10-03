#!/bin/bash
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew & latest formulae.
brew update && brew upgrade

apps=(
    # Utility Packages / Better Defaults
    coreutils # https://www.gnu.org/software/coreutils/coreutils.html
    findutils # https://www.gnu.org/software/findutils/
    moreutils # https://rentes.github.io/unix/utilities/2015/07/27/moreutils-package/
    rmtrash # rm command sends to trash instead of hard deleting. Can be a life saver.
    source-highlight # Syntax highlighted 'cat' https://www.gnu.org/software/src-highlite/source-highlight.html#HTML-and-XHTML-output
    tree # Better directory listing (colorized). http://brewformulas.org/Tree
    wget # Retrieve files from CLI.

    git git-extras # Git + extra tools.
    gnu-sed --with-default-names # Powerful regex based text manipulation command.
    grep --with-default-names

    # Tools/Programs
    httpie # Make HTTP requests (POST/GET etc. ) from the CLI.
    msmtp --with-macosx-keyring
    mutt # CLI email client. Powerful to send emails from scripts.
    ripgrep # Shit hot binary tree searching based on Rust regex engine. The fastest grep there is.
    mtr # Powerful ping/traceroute amalgamation. https://www.bitwizard.nl/mtr/

    # Media Processing
    guetzli imagemagick jpeg libpng optipng # Images
    ffmpeg # Movies

    # Programming Languages/Environments/Packages
    awscli
    docker docker-machine
    node nvm
    php71 php72


    # Better shell. Read : http://ohmyz.sh/
    zsh zsh-completions zsh-syntax-highlighting
)

# Install the list.
brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

# Install XCode command line tools.
xcode-select --install