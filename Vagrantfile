# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "precise32"
  config.ssh.forward_agent = true
  config.vm.network :private_network, ip: "192.168.19.87"

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
  end

  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.hostname = "rails.dev"
  config.vm.network :forwarded_port, guest: 3000, host: 6666


  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.options = ['--verbose']
  end

end
