#!/bin/bash

if [ `whoami` != root ]; then
	echo 'Ошибка: Скрипт должен быть запущен с правами root' ;
	exit
fi


echo 'Ждём'
$(sleep 0.1 && echo '$i0000#013#010' > /dev/ttyACM0) &

responce=$(head -n 40 /dev/ttyACM0)
wait $!

echo $responce
wait $!
echo 'Усё'
