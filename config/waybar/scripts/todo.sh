#!/bin/bash

if ! todo &>/dev/null; then
    echo "Todo script not found"
    exit 1
fi

current_task=$(todo current)

if [ -n "$current_task" ]; then
    echo "{ \"text\": \"$current_task\" }"
fi
