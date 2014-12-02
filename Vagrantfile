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

	config.vm.provision :file, :source => "Documents/ConfigureRemotingForAnsible.ps1", :destination => "Documents/ConfigureRemotingForAnsible.ps1"
	# todo: run ConfigureRemotingForAnsible.ps1

	config.vm.provision "ansible" do |ansible|
			ansible.inventory_path = "inventory"
			ansible.extra_vars = {
				username: "#{username}",
				ansible_ssh_username: "${username}",
				ansible_ssh_password: "vagrant"
			}
			ansible.verbose = "v"
			ansible.playbook = "playbooks/win-developer.yml"
	end

	script = <<-SCRIPT
		git config --global core.eol crlf
		write-host "Thumbs.db" >> .gitignore
		netsh http add urlacl url=http://+:51247/ user=everyone
	SCRIPT
	config.vm.provision :shell, inline: script
end
