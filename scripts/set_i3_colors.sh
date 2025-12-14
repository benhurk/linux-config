#!/usr/bin/env bash

source "$HOME/scripts/env.sh"

CONF_FILE="$HOME/.config/i3/colors.conf"

sed -i "s/^\(set \$color_background \)#[0-9a-fA-F]\{6\}/\1$COLOR_BACKGROUND/" $CONF_FILE
sed -i "s/^\(set \$color_background_alt \)#[0-9a-fA-F]\{6\}/\1$COLOR_BACKGROUND_ALT/" $CONF_FILE
sed -i "s/^\(set \$color_foreground \)#[0-9a-fA-F]\{6\}/\1$COLOR_FOREGROUND/" $CONF_FILE
sed -i "s/^\(set \$color_primary \)#[0-9a-fA-F]\{6\}/\1$COLOR_PRIMARY/" $CONF_FILE
sed -i "s/^\(set \$color_secondary \)#[0-9a-fA-F]\{6\}/\1$COLOR_SECONDARY/" $CONF_FILE
sed -i "s/^\(set \$color_disabled \)#[0-9a-fA-F]\{6\}/\1$COLOR_DISABLED/" $CONF_FILE
sed -i "s/^\(set \$color_active \)#[0-9a-fA-F]\{6\}/\1$COLOR_ACTIVE/" $CONF_FILE
sed -i "s/^\(set \$color_alert \)#[0-9a-fA-F]\{6\}/\1$COLOR_ALERT/" $CONF_FILE

i3-msg reload
