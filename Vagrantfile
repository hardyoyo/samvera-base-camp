# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "camper"
    # define this box so Vagrant doesn't call it "default"
    config.vm.define "camper"

    # Hostname for virtual machine
    config.vm.hostname = "camper.vagrant.dev"

    # How long to wait for machine to boot (in seconds)
    config.vm.boot_timeout = 500


  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  if Dir.glob('./vagrant-boxes/*.box').count > 0
    # Use a local boxfile for snaker-net distribution on thumb-drives
    config.vm.box_url = "./vagrant-boxes/local-boxes.json"
  else
    # Use this url for web based setup
    config.vm.box_url = "http://camp.curationexperts.com/vagrant-boxes/dce-boxes.json"
    config.vm.box_version = ">= 6.1, < 7.0"
  end
   
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 8983, host: 8983, auto_correct: true
  config.vm.network "forwarded_port", guest: 8984, host: 8984, auto_correct: true
  config.vm.network "forwarded_port", guest: 8985, host: 8985, auto_correct: true
  config.vm.network "forwarded_port", guest: 8986, host: 8986, auto_correct: true
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true

    # If a port collision occurs (e.g. port 8080 on local machine is in use),
    # then tell Vagrant to use the next available port between 8081 and 8100
    config.vm.usable_port_range = 8081..8100

    # BEGIN Landrush (https://github.com/phinze/landrush) configuration
    # This section will only be triggered if you have installed "landrush"
    #     vagrant plugin install landrush
    if Vagrant.has_plugin?('landrush')
        config.landrush.enable
        config.landrush.tld = 'vagrant.dev'

        # let's use the Google free DNS
        config.landrush.upstream '8.8.8.8'
        config.landrush.guest_redirect_dns = false
    end
    # END Landrush configuration




  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"
  
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true
    #
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2046"]
    vb.customize ["modifyvm", :id, "--name", "Camper"]
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

    # Check if a test SSH connection to GitHub succeeds or fails (on every vagrant up)
    # 
    config.vm.provision :shell, :name => "root: testing SSH connection to GitHub on VM", :inline => "echo 'root: Testing SSH connection to GitHub on VM...' && ssh -T -q -oStrictHostKeyChecking=no git@github.com", run: "always"

    # that was for root, do it again for vagrant
    config.vm.provision :shell, :name => "vagrant: testing SSH connection to GitHub on VM", :inline => "echo 'vagrant: Testing SSH connection to GitHub on VM...' && sudo -u vagrant ssh -T -q -oStrictHostKeyChecking=no git@github.com", run: "always"


    #------------------------------
    # Caching Settings (if enabled)
    #------------------------------
    # BEGIN Vagrant-Cachier (https://github.com/fgrehm/vagrant-cachier) configuration
    # This section will only be triggered if you have installed "vagrant-cachier"
    #     vagrant plugin install vagrant-cachier
    if Vagrant.has_plugin?('vagrant-cachier')
       # Use a vagrant-cachier cache if one is detected
       config.cache.auto_detect = true

       # set vagrant-cachier scope to :box, so other projects that share the
       # vagrant box will be able to used the same cached files
       config.cache.scope = :box

       # and lets specifically use the apt cache (note, this is a Debian-ism)
       config.cache.enable :apt

   end
    # END Vagrant-Cachier configuration



   # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
    #------------------------
    # Enable SSH Forwarding
    #------------------------
    # Turn on SSH forwarding (so that 'vagrant ssh' has access to your local SSH keys, and you can use your local SSH keys to access GitHub, etc.)
    config.ssh.forward_agent = true

    # Prevent annoying "stdin: is not a tty" errors from displaying during 'vagrant up'
    # See also https://github.com/mitchellh/vagrant/issues/1673#issuecomment-28288042
    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    # Create a '/etc/sudoers.d/root_ssh_agent' file which ensures sudo keeps any SSH_AUTH_SOCK settings
    # This allows sudo commands (like "sudo ssh git@github.com") to have access to local SSH keys (via SSH Forwarding)
    # See: https://github.com/mitchellh/vagrant/issues/1303
    config.vm.provision :shell do |shell|
        shell.inline = "touch $1 && chmod 0440 $1 && echo $2 > $1"
        shell.args = %q{/etc/sudoers.d/root_ssh_agent "Defaults    env_keep += \"SSH_AUTH_SOCK\""}
    end

    # Load any local customizations from the "local-bootstrap.sh" script (if it exists)
    # Check out the "config/local-bootstrap.sh.example" for examples
    if File.exists?("config/local-bootstrap.sh")
        config.vm.provision :shell, :inline => "echo '   > > > running config/local_bootstrap.sh (as vagrant)' && sudo -i -u vagrant /vagrant/config/local-bootstrap.sh"
    end

    # Shell script to set up swap space for this VM

    if File.exists?("config/increase-swap.sh")
        config.vm.provision :shell, :name => "creating a swap file", :inline => "echo '   > > > running local increase-swap.sh to ensure enough memory is available, via a swap file.'"
        config.vm.provision :shell, :name => "creating a swap file with a local increase-swap.sh script", :path => "config/increase-swap.sh"
    else
        config.vm.provision :shell, :name => "creating a swap file", :inline => "echo '   > > > running default increase-swap.sh scripte to ensure enough memory is available, via a swap file.'"
        config.vm.provision :shell, :name => "creating a swap file with the default increase-swap.sh script", :path => "increase-swap.sh"
    end

    # Shell script to set apt sources.list to something appropriate (close to you, and actually up)
    # via apt-spy2 (https://github.com/lagged/apt-spy2)

    # If a customized version of this script exists in the config folder, use that instead

    if File.exists?("config/apt-spy-2-bootstrap.sh")
        config.vm.provision :shell, :name => "apt-spy-2, locating a nearby mirror", :inline => "echo '   > > > running local apt-spy2 to locate a nearby mirror (for quicker installs). Do not worry if it shows an error, it will be OK, there is a fallback.'"
        config.vm.provision :shell, :name => "apt-spy-2, running custom apt-spy-2-bootstrap", :path => "config/apt-spy-2-bootstrap.sh"
    else
        config.vm.provision :shell, :name => "apt-spy2, locating a nearby mirror", :inline => "echo '   > > > running default apt-spy2 to locate a nearby mirror (for quicker installs). Do not worry if it shows an error, it will be OK, there is a fallback.'"
        config.vm.provision :shell, :name => "apt-spy2, running default apt-spy-2-bootstrap", :path => "apt-spy-2-bootstrap.sh"
    end




end
