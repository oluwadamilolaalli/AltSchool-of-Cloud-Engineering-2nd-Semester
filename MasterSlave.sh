#!/bin/bash

vagrant init ubuntu-23.10.1-desktop-

cat <<EOF > Vagrantfile
Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|

    master.vm.hostname = "Master-1"
    master.vm.box = "ubuntu-23.10.1-desktop-"
    master.vm.network "private_network", ip: "192.168.20.10"
    master.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get-install -y avahi-daemon libnss-mdns
    SHELL
  end

# Define the "Slave" server configuration
cat <<EOF >> Vagrantfile
  config.vm.define "slave" do |slave|

    slave.vm.hostname = "slave-1"
    slave.vm.box = "ubuntu-23.10.1-desktop-"
    slave.vm.network "private_network", ip: "192.168.20.11"
    slave.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get-install -y avahi-daemon libnss-mdns
    SHELL
    end
    config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
  
end
EOF

# Start and provision the servers
vagrant up



