#!/bin/bash

if [ `whoami` != root ]; then
	echo 'Error: Скрипт должен быть запущен с правами суперпользователя' ;
	exit
fi

echo 'Ожидание инициализации термометра...'

$(sleep 0.1 && echo '$i0000#013#010' > /dev/ttyACM0) &


responce=$(head -n 40 /dev/ttyACM0)
wait $!

echo 'Алкотестер инициализирован:'
echo $responce
wait $!

# Print thermometer information
echo 'Информация о термометре:';
lsusb -d 10c4:ea60 -v | grep iSerial

echo 'Готово.'
