#!/bin/sh
# zinc - this script starts and stops the zinc daemon
#
# chkconfig:   - 85 15 
# description:  Main process
# processname: zinc
# pidfile:     main.pid

PIDFILE=/home/ec2-user/zinc-search/main.pid

case "$1" in
start)
	sudo /home/ec2-user/zinc-search/forego start -r -f /home/ec2-user/zinc-search/Procfile >> /home/ec2-user/zinc-search/logs.txt &

    echo $! > $PIDFILE
;;
status)
        printf "%-50s" "Checking zinc..."
        if [ -f $PIDFILE ]; then
            PID=`cat $PIDFILE`
            if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
                printf "%s\n" "Process dead but pidfile exists"
            else
                echo "Running"
            fi
        else
            printf "%s\n" "Service not running"
        fi
;;
stop)
        printf "%-50s" "Stopping zinc"
            PID=`cat $PIDFILE`
        if [ -f $PIDFILE ]; then
            kill $PID
            printf "%s\n" "Ok"
        else
            printf "%s\n" "pidfile not found"
        fi
;;

restart)
  	$0 stop
  	$0 start
;;

*)
        echo "Usage: $0 {status|start|stop|restart}"
        exit 1
esac