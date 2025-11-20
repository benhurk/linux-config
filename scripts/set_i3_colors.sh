#!/usr/bin/env bash

source "$HOME/scripts/env.sh"

cat >~/.config/i3/colors.conf <<EOF
set \$color_background $COLOR_BACKGROUND
set \$color_background_alt $COLOR_BACKGROUND_ALT
set \$color_foreground $COLOR_FOREGROUND
set \$color_primary $COLOR_PRIMARY
set \$color_secondary $COLOR_SECONDARY
set \$color_disabled $COLOR_DISABLED
set \$color_active $COLOR_ACTIVE
set \$color_alert $COLOR_ALERT

client.focused          #ffffff #000000 #ffffff \$color_primary   \$color_primary
client.focused_inactive #ffffff #000000 #ffffff \$color_secondary   \$color_secondary
client.unfocused        #ffffff #000000 #ffffff \$color_disabled   \$color_disabled
client.urgent           #ffffff #000000 #ffffff \$color_alert   \$color_alert
client.placeholder      #000000 #000000 #ffffff \$color_secondary   \$color_secondary
client.background               #ffffff
EOF

i3-msg reload
