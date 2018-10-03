#!/bin/bash

# Let's get these puppies into the Applications directory.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Install Caskroom
brew tap caskroom/cask
brew tap buo/cask-upgrade
brew install brew-cask-completion
brew tap caskroom/versions

brew cask outdated # List outdated casks.

# Install packages
apps=(
    # Browsers
    firefox firefoxnightly
    google-chrome google-chrome-canary phantomjs # Phantom runs headless Chrome.

    # Automation/Productivity/Team Tools.
    alfred # Spotlight on speed. Ask for serial.
    caprine # FB Messenger Client.
    dash # Offline programming documentation. Ask for serial.
    evernote # Cloud note storage/collaboration.
    hazel # Task runner.
    harvest # Time tracking.
    flux # Screen luminescence manager.
    spectacle # Screen management.
    screenflow # Screen recording.
    slack # Team communication.
    transmission # Lightweight torrent client.
    textual # IRC Client.
    the-unarchiver # Decompress/Compress .zip/.rar etc.

    # Secure password management
    1password # Online/Shared
    keepassx # Offline

    # Developer Tools (Editors/IDE/Terminal)
    visual-studio-code
    iterm2 # Best MacOS Terminal
    transmit # SFTP & Amazon S3 File Transfer
    virtualbox # VM's
    vagrant vagrant-manager # VM Management

    # Media Players/Convertors.
    calibre # eBook conversion/management | https://manual.calibre-ebook.com/generated/en/cli-index.html
    vlc # Best video player.
    xld # Audio conversion GUI + CLI tool.
    )

for application in ${apps[@]}
do
    brew cask install $application
done

for application in ${apps[@]}
do
    brew install caskroom/cask/$application
done

brew cu -afy # Force ugprade of all packages.
