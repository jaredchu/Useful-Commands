#!/bin/sh
### BEGIN INIT INFO
# Provides:          ProviderName
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# X-Interactive:     false
# Short-Description: Short description
# Description:       Long Description
### END INIT INFO

do_start()
{
   echo "starting!";
}

do_stop()
{
   echo "stopping!"
}


case "$1" in
   start)
     do_start
     ;;
   stop)
     do_stop
     ;;
   restart)
     do_stop
     do_start
     ;;
esac

exit 0
