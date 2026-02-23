#!/bin/bash

if ! todo &>/dev/null; then
    echo "Todo script not found"
    exit 1
fi

current_task=$(todo -c)

if [ -n "$current_task" ]; then
    echo "{ \"text\": \"$current_task\", \"tooltip\": \"$current_task\" }"
fi
