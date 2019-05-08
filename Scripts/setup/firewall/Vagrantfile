Vagrant.configure("2") do |config|
  config.vm.define "mgmt" do |mgmt|
    mgmt.vm.provider "virtualbox" do |v|
      v.name = "vagrant_mgmt"
      v.linked_clone = true
    end
    mgmt.vm.box = "centos/6"
    mgmt.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.2",
      netmask: "255.255.255.0"
  end
  config.vm.define "nginx" do |nginx|
    nginx.vm.provider "virtualbox" do |v|
      v.name = "vagrant_nginx"
      v.linked_clone = true
    end
    nginx.vm.box = "centos/6"
    nginx.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.4",
      netmask: "255.255.255.0"
  end
  config.vm.define "php_fpm" do |php_fpm|
    php_fpm.vm.provider "virtualbox" do |v|
      v.name = "vagrant_php_fpm"
      v.linked_clone = true
    end
    php_fpm.vm.box = "centos/6"
    php_fpm.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.6",
      netmask: "255.255.255.0"
  end
  config.vm.define "httpd_php" do |httpd_php|
    httpd_php.vm.provider "virtualbox" do |v|
      v.name = "vagrant_httpd_php"
      v.linked_clone = true
    end
    httpd_php.vm.box = "centos/6"
    httpd_php.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.8",
      netmask: "255.255.255.0"
  end
  config.vm.define "client" do |client|
    client.vm.provider "virtualbox" do |v|
      v.name = "vagrant_client"
      v.linked_clone = true
    end
    client.vm.box = "centos/6"
    client.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.9",
      netmask: "255.255.255.0"
  end
  config.vm.define "mysql" do |mysql|
    mysql.vm.provider "virtualbox" do |v|
      v.name = "vagrant_mysql"
      v.linked_clone = true
    end
    mysql.vm.box = "centos/6"
    mysql.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.10",
      netmask: "255.255.255.0"
  end
  config.vm.define "httpd" do |httpd|
    httpd.vm.provider "virtualbox" do |v|
      v.name = "vagrant_httpd"
      v.linked_clone = true
    end
    httpd.vm.box = "centos/6"
    httpd.vm.network "private_network",
      virtualbox__intnet: "mgmt_net",
      ip: "10.255.255.11",
      netmask: "255.255.255.0"
  end
end
