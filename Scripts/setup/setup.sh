#!/bin/bash -x

list="$(cat list)"

function setup_git
 {
  command0='sudo yum update -y'
  command1='sudo yum install git -y'
  command2='cd / && sudo curl -o .gitignore https://raw.githubusercontent.com/secobau/linux/master/Scripts/rootfs.gitignore'
  command3='cd / && sudo git init && sudo git add . && sudo git commit -m "Initial commit"'

  $command0 && $command1 && $command2 && $command3
  for x in $list
   do
    ssh $x "$command0 && $command1 && $command2 && $command3"
   done;
 }
 
function setup_firewall
 {
  command4='sudo cp firewall.functions /usr/local/sbin'
  command5='sudo cp firewall.service /etc/systemd/system'
  command6='sudo chmod +x /usr/local/sbin/firewall.sh'
  command7='sudo chown root. /usr/local/sbin/firewall.sh /usr/local/sbin/firewall.functions'
  command8='sudo chown root. /etc/systemd/system/firewall.service'
  command9='sudo systemctl daemon-reload'
  commandA='sudo systemctl enable firewall.service'

  for x in $list
   do 
    scp firewall.sh firewall.functions firewall.service $x:
    ssh $x "sudo cp firewall.minions /usr/local/sbin/firewall.sh"
    ssh $x "$command4 && $command5 && $command6 && $command7 && $command8 && $command9 && $commandA && sudo init 6" 
   done
  sudo cp firewall.mgmt /usr/local/sbin/firewall.sh
  $command4 && $command5 && $command6 && $command7 && $command8 && $command9 && $commandA && sudo init 6
 }

sudo cp hosts /etc/hosts
setup_git
setup_firewall  
