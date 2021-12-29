HOUR="$(date +"%H")"
MIN="$(date +"%M")"
DATE="$(date +"%d %h %Y")"

echo -e "$HOUR\n$MIN" | rofi -config "$HOME/.config/rofi/status.rasi" -p "$DATE" -dmenu -kb-custom-1 "Super+Shift+space"
