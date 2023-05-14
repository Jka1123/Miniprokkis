# Reference to original script: https://github.com/tonijaaskelainen/beginnerpentest/blob/master/Vagrantfile

Vagrant.configure("2") do |config|
	config.vm.define "ms2" do |ms2_conf|
	    ms2_conf.vm.box = "tonijaaskelainen/ms2" # This is Metasploitable 2 with VirtualBox 5.1.30 Guest Additions and passwordless sudo and root
	
	    ms2_conf.vm.provider "virtualbox" do |vb|
	      vb.name = "Metasploitable-2"
	      #vb.customize ["modifyvm", :id, "--FLAG", "VALUE"]
	    end
	
	    ms2_conf.vm.base_mac = "080027362690"
	    ms2_conf.vm.network "private_network", ip: "192.168.56.101" # This is a Host-only network
	
	    ms2_conf.ssh.username = "msfadmin"
	    ms2_conf.ssh.password = "msfadmin"
	  end
	
end
