#!/bin/bash
#
# Copyright Javier Arraiza Cenoz 2015
# License: GPLv2
#
# depends on: byzanz, espeak 
#
# best used with: key-mon
#
# usage:
# arrange windows (shell and program window) so you can hit enter 
# in the shell and click on window to record (no size changes later!)
#
# ./recordToGif.sh [duration in seconds] [/path/to/file.gif]
#
# then select the window to record.


# Delay before starting
DELAY=3

# Duration and output file
if [ $# -gt 0 ] 
then 
    D="--duration=$1"
    if [ -z "$2" ]
    then 
	echo "Default recording to /tmp/recorded.gif"
        F="/tmp/recorded.gif"
    else
	F=$2
    fi
else
    echo "Default recording duration 10s to /tmp/recorded.gif"
    D="--duration=10"
    F="/tmp/recorded.gif"
fi

XWININFO=$(xwininfo)

X=`awk -F: '/Absolute upper-left X/{print $2}' <<< "$XWININFO"`
Y=`awk -F: '/Absolute upper-left Y/{print $2}' <<< "$XWININFO"`
W=`awk -F: '/Width/{print $2}' <<< "$XWININFO"`
H=`awk -F: '/Height/{print $2}' <<< "$XWININFO"`

echo "Delaying $DELAY seconds. After that, byzanz will start."

for (( i=$DELAY; i>0; --i )) ; do
    echo $i
    espeak $i
    sleep 1
done
espeak "Start!"
echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::"

byzanz-record --verbose --delay=0 -c -x $X -y $Y -w $W -h $H $D $F & read FULLDURATION FAKE <<<$(IFS=";"; echo $D)
read FAKE DURATION <<<$(IFS="="; echo $FULLDURATION)

for (( i=$DURATION; i>0; --i ))
do
    if [ $i -ne $DURATION ] 
    then
        echo $i seconds
        if [ $[ $i ] -eq 10 ]  #[ $[ $i % 10 ] -eq 0 ]
        then
	   espeak $i
	fi
    fi
    sleep 1
done
espeak "Recording finished."
