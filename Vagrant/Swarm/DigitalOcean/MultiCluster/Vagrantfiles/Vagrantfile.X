Vagrant.configure("2") do |config|
 (2..ManagersNumber).each do |x|
  config.vm.define "m#{x}.DOMAIN" do |m|
   m.ssh.private_key_path = "~/.ssh/id_rsa"
   m.vm.box = "digital_ocean"
   m.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
   m.vm.synced_folder ".", "/vagrant", disabled: true
   m.vm.provision "file",
    source: "../../../../../token_docker",
    destination: "/etc/yum/vars/dockerurl"
   m.vm.provision "shell",
    path: "../../../../Shell/setup.DOCKER"
   m.vm.provision "shell",
    path: "../token_manager"
   m.vm.provider "digital_ocean" do |d|
    d.token = "TOKEN_DO"
    d.image = "centos-7-x64"
    d.region = "LOCATION"
    d.size = "SIZE"
    d.monitoring = true
    d.private_networking = true
    d.tags = [ "manager" ]
    d.ssh_key_name = "SSH_KEY_NAME"
   end
  end
 end
 (1..WorkersNumber).each do |x|
  config.vm.define "w#{x}.DOMAIN" do |m|
   m.ssh.private_key_path = "~/.ssh/id_rsa"
   m.vm.box = "digital_ocean"
   m.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
   m.vm.synced_folder ".", "/vagrant", disabled: true
   m.vm.provision "file",
    source: "../../../../../token_docker",
    destination: "/etc/yum/vars/dockerurl"
   m.vm.provision "shell",
    path: "../../../../Shell/setup.DOCKER"
   m.vm.provision "shell",
    path: "../token_worker"
   m.vm.provider "digital_ocean" do |d|
    d.token = "TOKEN_DO"
    d.image = "centos-7-x64"
    d.region = "LOCATION"
    d.size = "SIZE"
    d.monitoring = true
    d.private_networking = true
    d.tags = [ "worker" ]
    d.ssh_key_name = "SSH_KEY_NAME"
   end
  end
 end
 (1..DTRNumber).each do |x|
  config.vm.define "r#{x}.DOMAIN" do |m|
   m.ssh.private_key_path = "~/.ssh/id_rsa"
   m.vm.box = "digital_ocean"
   m.vm.box_url = "https://github.com/devopsgroup-io/vagrant-digitalocean/raw/master/box/digital_ocean.box"
   m.vm.synced_folder ".", "/vagrant", disabled: true
   m.vm.provision "file",
    source: "../../../../../token_docker",
    destination: "/etc/yum/vars/dockerurl"
   m.vm.provision "shell",
    path: "../../../../Shell/setup.DOCKER"
   m.vm.provision "shell",
    path: "../token_worker"
   m.vm.provider "digital_ocean" do |d|
    d.token = "TOKEN_DO"
    d.image = "centos-7-x64"
    d.region = "LOCATION"
    d.size = "SIZE"
    d.monitoring = true
    d.private_networking = true
    d.tags = [ "dtr" ]
    d.ssh_key_name = "SSH_KEY_NAME"
   end
  end
 end
end
