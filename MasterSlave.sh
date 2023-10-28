#!/bin/bash

vagrant init ubuntu/bionic64

cat <<EOF > Vagrantfile
Vagrant.configure("2") do |config|

  config.vm.define "Master_1" do |Master_1|

    Master_1.vm.hostname = "Master-1"
    Master_1.vm.box = "ubuntu/bionic64"
    Master_1.vm.network "private_network", ip: "192.168.20.10"
    Master_1.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get-install -y avahi-daemon libnss-mdns
    SHELL
    node.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
  end
end
EOF

# Define the "Slave" server configuration
cat <<EOF >> Vagrantfile
  config.vm.define "Slave_1" do |Slave-1|
   Slave_1.vm.box = "ubuntu/bionic64"
    Slave_1node.vm.network "private_network", ip: "192.168.20.11"
    Slave_1.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get-install -y avahi-daemon libnss-mdns
    SHELL
    config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
  end
end
EOF

# Start and provision the servers
vagrant up





