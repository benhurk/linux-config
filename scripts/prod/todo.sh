#!/bin/bash

dir="$HOME/.local/share/todo"
list_file="$dir/list.txt"
current_task_file="$dir/current.txt"
cmd=$(basename "$0")

if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
fi

if [ ! -f "$list_file" ]; then
    touch "$list_file"
fi

if [ ! -f "$current_task_file" ]; then
    touch "$current_task_file"
fi

print_usage() {
    echo -e "Usage: $cmd <option>\n"
    echo -e "Option                       Effect\n"
    echo "-l                           print list"
    echo "-c                           print current task"
    echo "-s <index>                   set current task"
    echo "-a <string>                  add task"
    echo "-r <index>|all|current       remove task"
}

list() {
    cat -n "$list_file"
}

print_current() {
    cat "$current_task_file"
}

set_current() {
    if [ -z "$1" ]; then
        echo "Usage: $cmd -s <index>"
        exit 1
    fi

    to_set=$(sed "${1}!d" "$list_file")

    echo "$to_set" > "$current_task_file"
    echo "\"$to_set\" set as current task."
}

add() {
    if [ -z "$1" ]; then
        echo "Usage: $cmd -a <task>"
        exit 1
    fi

    echo "$*" >> "$list_file"

    if [ -z "$(cat "$current_task_file")" ]; then
        echo "$*" > "$current_task_file"
    fi

    echo "\"$*\" added to the list."
}

remove() {
    if [ -z "$1" ]; then
        echo "Usage: $cmd -r <index>|all|current"
        exit 1
    fi

    if [ "$1" == "all" ]; then
        :> "$list_file"
        :> "$current_task_file"
        echo "List cleared."
        exit
    fi

    if [ "$1" == "current" ]; then
        sed -i "/^$(print_current)$/d" "$list_file"
        echo "\"$(print_current)\" cleared."

        if [ -n "$(cat "$list_file")" ]; then
            set_current 1
        else
            :> "$current_task_file"
        fi

        exit
    fi

    to_remove=$(sed "${1}!d" "$list_file")

    if [ -n "$to_remove" ]; then
        sed -i "${1}d" "$list_file"
        echo "\"$to_remove\" removed from the list."
    else
        echo "Index $1 doesn't exist."
    fi
}

case "$1" in
    "-a") add "${@:2}" ;;
    "-l") list ;;
    "-c") print_current ;;
    "-s") set_current "${@:2}" ;;
    "-r") remove "${@:2}" ;;
    *) print_usage ;;
esac
