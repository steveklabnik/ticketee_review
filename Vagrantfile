# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"

  config.vm.box_url = "http://files.vagrantup.com/precise32.box"
  config.vm.network "forwarded_port", guest: 80, host: 8080
end
