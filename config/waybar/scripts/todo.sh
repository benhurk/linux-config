#!/bin/bash

if ! todo &>/dev/null; then
    echo "Todo script not found"
    exit 1
fi

current_task=$(todo current)
rest=$(todo ls --no-index | sed -e "/^$current_task$/d" -e "s/^/• /" | tr '\n' '\r')

if [ -n "$current_task" ]; then
    echo "{ \"text\": \"$current_task\", \"alt\": \"${rest}\" }"
fi
