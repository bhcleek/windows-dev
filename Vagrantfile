# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "windows-dev"
	config.vm.communicator = "winrm"
	config.winrm.username = "bhcleek"
	config.winrm.password = "vagrant"

	config.vm.provider "virtualbox" do |vb|
		# Don't boot with headless mode
		vb.gui = true
		# Use VBoxManage to customize the VM. For example to change memory:
		vb.customize ["modifyvm", :id, "--memory", "4096"]
		vb.customize ["modifyvm", :id, "--cpus", "2"]
		vb.customize ["storageattach", :id, "--storagectl", "SATA", "--port", "0", "--nonrotational", "on"]
	end

	config.vm.provision :file, :source => "~/.gitconfig", :destination => ".gitconfig"
	config.vm.provision :file, :source => "~/.gitignore", :destination => ".gitignore"
	config.vm.provision :file, :source => "~/.ssh/id_rsa", :destination => ".ssh/id_rsa"
	config.vm.provision :file, :source => "~/.ssh/id_rsa.pub", :destination => ".ssh/id_rsa.pub"
	config.vm.provision :shell, :path => "vagrant-provision.ps1"
end
