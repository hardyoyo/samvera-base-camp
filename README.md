# samvera-base-camp
A slightly modified Vagrant VM for Samvera Camp, with a few helpful additions

This Vagrant VM is based on the guide here:
https://github.com/RepoCamp/ohsu2018/wiki/Initial-Vagrant-Setup


## Serverspec included

I've added a simple [Serverspec](https://serverspec.org/) test to handle the initial "is this thing on?" test of the Ruby installation.

To run the tests, you'll need serverspec installed

```
gem install serverspec
gem install highline #required by serverspec
```
And you'll also need to run `vagrant up` so the machine is up and running.

Then, you just need to run

```
rake spec
```

from the root of this repository.

## Tmuxinator, too

I've also added [Tmuxinator](https://github.com/tmuxinator/tmuxinator) and a simple project config for it to make the camper experience more enjoyable. To use it, after the VM is up and you've run `vagrant ssh` to log in to the machine, you can run:

```
tmuxinator camper start
```
which will launch Rails, solr_wrapper and fedora_wrapper in different panes, and a second layout/window for coding. New to Tmux? You might [glance at this introduction](https://www.sitepoint.com/tmux-a-simple-start/) to get your bearings.

## Optional local-bootstrap.sh provisioner

There's an example of a shell provisioner which you can use to further customize this VM. If you rename `config/local-bootstrap.sh.example` to just `local-bootstrap.sh` it will be called every time you run a fresh `vagrant up` command. If you have your own dotfiles repository with all of your shell preferences, you can use this bootstrap file to set it up for you. Feel free to borrow mine, but this is really here to make life easier for *you* and you probably already have preferences, you don't need to borrow mine. Have fun!
