#!/bin/bash

if [ `whoami` != root ]; then
	echo 'Error: Запустите используя root права' ;
	exit
fi

echo 'Waiting...'

# Send the command to the device
$(sleep 0.1 && echo '$i0000#013#010' > /dev/ttyACM0) &

# Wait for the response
responce=$(head -n 40 /dev/ttyACM0)
wait $!

echo 'Response:'
echo $responce
wait $!

# Print device information
echo 'Device information:';
lsusb -d 10c4:ea60 -v

echo 'Done.'
