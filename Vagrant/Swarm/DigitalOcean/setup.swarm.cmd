vagrant plugin install vagrant-digitalocean
SETLOCAL EnableDelayedExpansion
FOR /F %%x IN (token) DO (
 SET z=%%x
 )
FOR %%x IN (M1,Mx,Wx) DO (
 mkdir %%x
 cd %%x
 curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/DigitalOcean/%%x/Vagrantfile -O
 FOR /F "tokens=* delims= " %%x IN (Vagrantfile) DO (
  SET y=%%x
  SET y=!y:xxx=%z%!
  ECHO !y!>>Vagrantfile.NEW
  MOVE Vagrantfile.NEW Vagrantfile
  )
 vagrant up --parallel
 cd ..
 )
cd M1
vagrant ssh M1 -c "for x in $(sudo docker node ls -q -f name=M);do sudo docker node update --availability drain $x;done"
vagrant ssh M1 -c "curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/DigitalOcean/stack.yml -O"
vagrant ssh M1 -c "sudo docker stack deploy -c stack.yml my"
