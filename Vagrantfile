# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :n1 do |n1|
      n1.vm.box = "bento/ubuntu-20.04"
      n1.vm.network "private_network", ip: "172.20.20.10"
      n1.vm.provision "shell", path: "script_n1.sh"
      n1.vm.hostname = "n1"
  end

  config.vm.define :n2 do |n2|
      n2.vm.box = "bento/ubuntu-20.04"
      n2.vm.network "private_network", ip: "172.20.20.11"
      n2.vm.provision "shell", path: "script_n2.sh"
      n2.vm.hostname = "n2"
  end
end
