vagrant plugin install vagrant-digitalocean
FOR %%x IN (Wx2) DO (
 mkdir %%x
 cd %%x
 curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/DigitalOcean/%%x/Vagrantfile -O
 vagrant up --parallel
 cd .. )
