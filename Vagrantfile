Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"

    config.vm.provision "shell", path: "provisioner.sh"

    config.vm.hostname = "vagrant-devbox"

    config.vm.network "private_network", type: "dhcp"

    config.vm.synced_folder ".", "/vagrant", owner: "vagrant", mount_options: ["dmode=775,fmode=775"]

    config.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.name = "vagrant-devbox"
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
end