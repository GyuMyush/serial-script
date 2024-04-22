#!/bin/bash

if [ `whoami` != root ]; then
	echo 'Error: The script should be run with root privileges' ;
	exit
fi

echo 'Waiting for thermometer to initialize...'

# Send the command to the thermometer to initialize
$(sleep 0.1 && echo '$i0000#013#010' > /dev/ttyACM0) &

# Wait for the thermometer to initialize
responce=$(head -n 40 /dev/ttyACM0)
wait $!

echo 'Thermometer initialized:'
echo $responce
wait $!

# Print thermometer information
echo 'Thermometer information:';
lsusb -d 10c4:ea60 -v | grep iSerial

echo 'Running alcohol tester script...'

# Run the alcohol tester script
# Replace "alcohol_tester.sh" with the actual path to the alcohol tester script
./alcohol_tester.sh

echo 'Done.'
