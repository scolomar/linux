vagrant plugin install vagrant-digitalocean
SET d="C:\Users\usuario\Desktop\Vagrant\DigitalOcean\Swarm"
FOR %%x IN (Wx2) DO (
 mkdir %%x
 cd %%x
 curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/DigitalOcean/%%x/Vagrantfile -O
 vagrant up --parallel
 cd %d% )
