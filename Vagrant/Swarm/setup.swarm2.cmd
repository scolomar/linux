SET d="C:\Users\usuario\Desktop\VagrantSwarm"
FOR %%x IN (Wx2) DO (
 mkdir %%x
 cd %%x
 curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/%%x/Vagrantfile -O
 vagrant up
 cd %d% )
