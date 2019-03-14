hdmi_active="$(cat /sys/class/drm/card0/*HDMI*/status |grep '^connected')" 
if [ "$hdmi_active" = "connected" ] 
then
  xrandr --output HDMI1 --auto --output eDP1 --off
else
  xrandr --output HDMI1 --off --output eDP1 --auto
fi

setxkbmap br
