FOR %%x IN (Wx2) DO (
 mkdir %%x
 cd %%x
 curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/Virtualbox/%%x/Vagrantfile -O
 vagrant up --parallel
 cd .. )
cd M1
vagrant ssh M1 -c "curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/Virtualbox/stack2.yml -O";
vagrant ssh M1 -c "sudo docker stack deploy -c stack2.yml my";
