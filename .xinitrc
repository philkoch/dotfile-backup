#load .Xresources
xrdb /home/phil/.Xresources
#disable pc-speaker
xset -b
#detect monitor configuration
autorandr --change
#increase standby time of monitors <standby><suspend><off> in seconds
xset dpms 1800 2400 3000
# increase typematic delay and rate
xset r rate 200 40
#set keyboard alt-space toggle between us and de
setxkbmap -model pc104 -layout us,de -option grp:alt_space_toggle

#configure synaptics touchpad
if [ -f /home/phil/.synaptics_conf ]; then
    source /home/phil/.synaptics_conf
fi

#start i3
exec i3
