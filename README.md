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

## Recommended Vagrant Plugins

This VM is sized to work on a MacBook Air, which has 4GB of RAM. If your workstation has more memory, I highly recommend using

* [Vagrant-faster](https://github.com/rdsubhas/vagrant-faster)

If you have plans to use Vagrant much in the future, you probably should install

* [Vagrant-Disksize](https://github.com/sprotheroe/vagrant-disksize)

Many Vagrant projects use base machine images with very tiny hard drive allocations, which makes them download quickly, however, these images aren't very usable since they have almost no available disk space. The Vagrant-Disksize plugin can help.

The following Vagrant plugins are not required, but they do make using Vagrant more enjoyable.

* [Vagrant-VBGuest](https://github.com/dotless-de/vagrant-vbguest) - *Highly Recommended for VirtualBox* as it keeps VirtualBox Guest Additions up to date
  * `vagrant plugin install vagrant-vbguest`
  * [Vagrant-Cachier](https://github.com/fgrehm/vagrant-cachier) - Caches packages between VMs. (Project now unmaintained, see URL)
  * [Vagrant-Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
  * [Vagrant-Proxyconf](https://github.com/tmatilai/vagrant-proxyconf/)
  * [Vagrant-VBox-Snapshot](https://github.com/dergachev/vagrant-vbox-snapshot/)
  * [Vagrant-Notify](https://github.com/fgrehm/vagrant-notify)
  * [Landrush](https://github.com/vagrant-landrush/landrush)
