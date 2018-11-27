FOR %%x IN (Wx2) DO (
 mkdir %%x
 cd %%x
 curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/Virtualbox/%%x/Vagrantfile -O
 vagrant up --parallel
 cd .. )
