# samvera-base-camp
A slightly modified Vagrant VM for Samvera Camp, with a few helpful additions

This Vagrant VM is based on the guide here:
https://github.com/RepoCamp/ohsu2018/wiki/Initial-Vagrant-Setup

So far, all I've added is a simple Serverspec test to handle the initial "is this thing on?" test of the Ruby installation.

To run the tests, you'll need serverspec installed

```
gem install serverspec
gem install highline #required by serverspec
```
And you'll also need to run vagrant up so the machine is up and running.

Then, you just need to run

```
rake spec
```

from the root of this repository.
