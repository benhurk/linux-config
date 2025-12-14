#!/bin/bash

source "$HOME/scripts/env.sh"

CONF_FILE="$HOME/.config/rofi/colorscheme.rasi"

sed -i "s/background: #[0-9a-fA-F]\{8\}/background: "$COLOR_BACKGROUND"D9/" $CONF_FILE
sed -i "s/background-alt: #[0-9a-fA-F]\{6\}/background-alt: $COLOR_BACKGROUND_ALT/" $CONF_FILE
sed -i "s/foreground: #[0-9a-fA-F]\{6\}/foreground: $COLOR_FOREGROUND/" $CONF_FILE
sed -i "s/selected: #[0-9a-fA-F]\{6\}/selected: $COLOR_PRIMARY/" $CONF_FILE
sed -i "s/secondary: #[0-9a-fA-F]\{6\}/secondary: $COLOR_SECONDARY/" $CONF_FILE
sed -i "s/disabled: #[0-9a-fA-F]\{6\}/disabled: $COLOR_DISABLED/" $CONF_FILE
sed -i "s/active: #[0-9a-fA-F]\{6\}/active: $COLOR_ACTIVE/" $CONF_FILE
sed -i "s/urgent: #[0-9a-fA-F]\{6\}/urgent: $COLOR_ALERT/" $CONF_FILE
