# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "./", "/vagrant", type: :nfs
  config.vm.synced_folder "./", "/var/www", type: :nfs

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision :shell,
    name: "VM Setup",
    path: "provision_files/setup_centos7_vm.sh",
    privileged: false,
    keep_color: true

end
