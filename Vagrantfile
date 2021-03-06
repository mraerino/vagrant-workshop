# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_ALL"] = "en_US.UTF-8"

$hostname = $hostname || "vagrant-devbox"

unless Vagrant.has_plugin?("landrush")
  raise 'The landrush plugin is not installed!'
end

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.provision "shell", path: "provisioner.sh"

    config.vm.hostname = $hostname + ".dev"

    config.vm.network "private_network", type: "dhcp"

    config.vm.synced_folder ".", "/vagrant", owner: "vagrant", mount_options: ["dmode=775,fmode=775"]

    config.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.name = $hostname
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.landrush.enabled = true
    config.landrush.tld = 'dev'

    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
end