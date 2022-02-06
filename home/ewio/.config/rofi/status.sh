TIME="󱑍 $(date +"%H:%M")"
DATE="󰃶 $(date +"%d %h %y")"
BAT="󰁹 $(cat /sys/class/power_supply/BAT0/capacity)% $(cat /sys/class/power_supply/BAT0/status)"
TEMP="󰔏 $(cat /sys/class/thermal/thermal_zone6/temp | rev | cut -c 4- | rev)°C"
NET="󰖩 $(nmcli -t -f NAME c show --active)"
VOL="󰕾 $(amixer get Master | tail -n 1 | grep -o "\[\(.*%\)\]"| tr -d "[]")"

chosen="$(echo -e "$TIME\n$DATE\n$BAT\n$TEMP\n$NET\n$VOL" | rofi -dmenu -config "$HOME/.config/rofi/status.rasi")"

case $chosen in
    $NET)
        alacritty -e sudo nmtui
        ;;
    $VOL)
        alacritty -e alsamixer
        ;;
    $TEMP)
        alacritty -e top
        ;;
esac
