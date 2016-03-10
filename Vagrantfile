# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty64"

  # Map port 80 in guest machine to port 8080 in host machine
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Place repo in /opt/pairjournal, for consistency with production environment
  config.vm.synced_folder ".", "/opt/pairjournal"

  # Set VM to use 1 GB of memory
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "chef_zero" do |chef|
    # Specify the local paths where Chef data is stored
    chef.cookbooks_path = "config/cookbooks"
    chef.nodes_path = ""

    # Add recipes
    chef.add_recipe "pairjournal::pairjournal"
    chef.add_recipe "pairjournal::nginx"
  end
end
