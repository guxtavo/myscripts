#!/bin/bash

#context=`dbus-send --dest=org.hexchat.service --print-reply --type=method_call /org/hexchat/Remote org.hexchat.plugin.FindContext string:"RHAT" string:"" | tail -n1 | awk '{print $2}'`
#dbus-send --dest=org.hexchat.service --type=method_call /org/hexchat/Remote org.hexchat.plugin.SetContext uint32:$context
dbus-send --dest=org.hexchat.service --type=method_call /org/hexchat/Remote org.hexchat.plugin.SetContext uint32:0
lock_old=inactive

while true
do
lock=`/usr/bin/gnome-screensaver-command -q | cut -d" " -f4`

if [ $lock != $lock_old ]
then
case $lock in
	active)
		dbus-send --dest=org.hexchat.service --type=method_call /org/hexchat/Remote org.hexchat.plugin.Command string:"nick gux|afk";;
	inactive)
		dbus-send --dest=org.hexchat.service --type=method_call /org/hexchat/Remote org.hexchat.plugin.Command string:"nick gux";;
	*)
		echo asterisk >> /dev/null;;
esac
fi
		
sleep 5
echo $lock > /tmp/w.log
lock_old=`cat /tmp/w.log`
done
