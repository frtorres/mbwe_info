#!/bin/sh

case "$1" in

  start)          [ -z "`/bin/netstat -rn|/bin/grep ^239.0.0.0`" ] && /sbin/route add -net 239.0.0.0 netmask 255.0.0.0 eth0 ;
                  [ -z "`/sbin/ifconfig eth0|/bin/grep 'ALLMULTI MULTICAST'`" ] && /sbin/ifconfig eth0 allmulti multicast ;
                  /opt/mediatomb/bin/mediatomb --daemon --home /var/mediatomb \
                         --user mediatomb --group mediatomb \
                         --config /var/mediatomb/.mediatomb/config.xml \
                         --pidfile /var/mediatomb/mediatomb.pid \
                         --logfile /var/mediatomb/mediatomb.log ;;
                                                                                                                 
  stop)           /usr/bin/killall mediatomb ;;
                                                                                                                                                                                                
  restart)        $0 stop ; $0 start ;;
                                                                                                                                                                                                        
  *)              echo "Usage `basename $0` {start|stop}" >&2 ;
                  exit 1 ;;
esac
exit $?
                                                                                                                                                                                                                                       
