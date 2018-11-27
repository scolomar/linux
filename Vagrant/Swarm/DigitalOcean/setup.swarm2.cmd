vagrant plugin install vagrant-digitalocean
SETLOCAL EnableDelayedExpansion
FOR /F %%z IN (token) DO (
 SET z=%%x
 )
FOR %%x IN (Wx2) DO (
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
