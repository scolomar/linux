#!/bin/bash -x

command0='sudo yum update -y'
command1='sudo yum install git -y'
command2='cd / && sudo curl -o .gitignore https://raw.githubusercontent.com/secobau/linux/master/Scripts/rootfs.gitignore'
command3='cd / && sudo git init && sudo git add . && sudo git commit -m "Initial commit"'

command4='sudo cp firewall.service /etc/systemd/system'
command5='sudo chmod +x /usr/local/sbin/firewall'
command6='sudo chown root. /usr/local/sbin/firewall'
command7='sudo chown root. /etc/systemd/system/firewall.service'
command8='sudo systemctl daemon-reload'
command9='sudo systemctl enable firewall.service'

$command0 && $command1 && $command2 && $command3 && sudo cp hosts /etc/hosts;

for x in $(grep . list)
 do
  ssh $x "$command0 && $command1 && $command2 && $command3"
 done;
  
for x in $(grep . list)
 do 
  scp firewall firewall.service $x:
  ssh $x "sudo cp firewall /usr/local/sbin && $command4 && $command5 && $command6 && $command7 && $command8 && $command9 && sudo init 6" 
 done
 
sudo cp firewall.mgmt /usr/local/sbin/firewall && $command4 && $command5 && $command6 && $command7 && $command8 && $command9 && sudo init 6
