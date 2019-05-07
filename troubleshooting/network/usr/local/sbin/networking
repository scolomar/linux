#!/bin/sh -x

dev=eno1
addr=192.168.2.102/24
route=192.168.2.0/24
default=192.168.2.1
resolv="nameserver 8.8.8.8"

case $1 in 
     start)
       ip link set dev $dev up
       ip addr add $addr dev $dev
       ip route add $route dev $dev
       ip route add default via $default
       echo $resolv 1>/etc/resolv.conf
       ;;
     stop)
       ip link set dev $dev down
       ;;
     *)
       echo WRONG COMMAND && exit 1
       ;;
esac

exit 0
