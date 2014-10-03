# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	username = "vagrant"
	config.vm.box = "windows-dev"
	config.vm.communicator = "winrm"

	config.windows.set_work_network = true
	config.vm.network "private_network", ip: "192.168.7.2"

	config.vm.provider "virtualbox" do |vb|
		# Don't boot with headless mode
		vb.gui = true
		# Use VBoxManage to customize the VM. For example to change memory:
		vb.customize ["modifyvm", :id, "--memory", "4096"]
		vb.customize ["modifyvm", :id, "--cpus", "2"]
		vb.customize ["storageattach", :id, "--storagectl", "SATA Controller", "--port", "0", "--nonrotational", "on"]
	end

	config.vm.provision :file, :source => "~/.gitconfig", :destination => ".gitconfig"
	config.vm.provision :file, :source => "~/.gitignore", :destination => ".gitignore"
	config.vm.provision :file, :source => "~/.ssh/id_rsa", :destination => ".ssh/id_rsa"
	config.vm.provision :file, :source => "~/.ssh/id_rsa.pub", :destination => ".ssh/id_rsa.pub"
	config.vm.provision :file, :source => "~/.vimrc", :destination => "_vimrc"

	config.vm.synced_folder "~/.vim", "/Users/#{username}/vimfiles", create: true
	config.vm.synced_folder "Documents/WindowsPowerShell", "/Users/#{username}/Documents/WindowsPowerShell", create: true

	script = <<-SCRIPT
		git config --global core.eol crlf
		write-host "Thumbs.db" >> .gitignore
	SCRIPT
	config.vm.provision :shell, inline: script
end
