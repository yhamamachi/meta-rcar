#!/bin/sh

do_start() {
    /usr/sbin/i2cset -y 12 0x44 0xf8 0x01
    echo 224 > /sys/class/hwmon/hwmon0/pwm1
    echo 224 > /sys/class/hwmon/hwmon1/pwm1
}

do_stop() {
# todo: what should we do on shutdown?
    /usr/sbin/i2cset -y 12 0x44 0xf8 0x00
    echo 0 > /sys/class/hwmon/hwmon0/pwm1
    echo 0 > /sys/class/hwmon/hwmon1/pwm1
}

case "$1" in
  start)
        echo "Starting $DESC"
        do_start
        ;;
  stop)
        echo "Stopping $DESC"
        do_stop
        ;;
  restart|force-reload)
        echo "Restarting $DESC"
        do_stop
        sleep 1
        do_start
        ;;
  *)
        echo "Usage: $0 {start|stop|restart|force-reload}" >&2
        exit 1
        ;;
esac

exit 0
