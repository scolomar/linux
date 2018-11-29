vagrant plugin install vagrant-digitalocean
SETLOCAL EnableDelayedExpansion
FOR /F %%x IN (token) DO (
 SET z=%%x
 )
FOR %%x IN (Wx2) DO (
 mkdir %%x
 cd %%x
 curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/DigitalOcean/%%x/Vagrantfile -O
 FOR /F "tokens=* delims= " %%x IN (Vagrantfile) DO (
  SET y=%%x
  SET y=!y:token_vagrant=%z%!
  ECHO !y!>>Vagrantfile.NEW
  MOVE Vagrantfile.NEW Vagrantfile
  )
 vagrant up --parallel
 cd ..
 )
cd M0
vagrant ssh M0 -c "curl https://raw.githubusercontent.com/secobau/linux/master/Vagrant/Swarm/DigitalOcean/stack2.yml -O";
vagrant ssh M0 -c "sudo docker stack deploy -c stack2.yml my";
