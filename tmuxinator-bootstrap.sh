#!/bin/sh
# tmuxinator-bootstrap.sh
# installs the Ruby gem tmuxinator to help make the camp experience a little more fun

# Load up the release information
. /etc/lsb-release

# Do the initial apt-get update

echo "Installing 'tmuxinator'."

if [ "$(gem search -i tmuxinator)" = "false" ]; then
  echo "Installing tmuxinator..."
  gem install tmuxinator
  echo "... tmuxinator installed!"
fi

# set up tmuxinator
mkdir /home/vagrant/.tmuxinator

if [ -f "/vagrant/config/dotfiles/tmuxinator-camper.yml" ]; then
    echo "copying the camper project config for tmuxinator"
    cp /vagrant/config/dotfiles/tmuxinator-camper.yml /home/vagrant/.tmuxinator/camper.yml
fi

exit 0
