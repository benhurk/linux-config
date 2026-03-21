#!/bin/bash

dir="$HOME/.local/share/todo"
list_file="$dir/list.txt"
current_task_file="$dir/current.txt"
cmd=$(basename "$0")

if ! fzf --version >/dev/null; then
    echo "Error: fzf not found. Is it installed?"
    exit 1
fi

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
    echo "add <option?>                add new task"
    echo -e "     --set                   set the added task as current\n"
    echo -e "current                      print current task\n"
    echo "ls <option?>                 print list"
    echo -e "     --no-index              ommit the index numbers\n"
    echo "rm <option?>                 remove task"
    echo "     --current               remove current"
    echo "     --all                   remove all"
    echo -e "     --index                 choose by index\n"
    echo "set <option?>                set current task"
    echo "     --last                  set the last added task"
    echo -e "     --index                 choose by index"
}

list() {
    if [ -z "$1" ]; then
        cat -b "$list_file"
    elif [ "$1" == "--no-index" ]; then
        cat "$list_file"
    else
        echo "Option \"$1\" doesn't exist." && exit 1
    fi
}

print_current() {
    cat "$current_task_file"
}

set_current() {
    by_index() {
        to_set=$(sed "${1}!d" "$list_file" 2>/dev/null)

        if [ -z "$1" ] || [ -z "$to_set" ]; then
            echo "Invalid index." && exit 1
        fi
    }

    case "$1" in
        "--index") by_index "$2" ;;
        "--last") to_set=$(tail -1 "$list_file") ;;
        "") to_set=$(list --no-index | fzf) ;;
        *) echo "Option \"$1\" doesn't exist." && exit 1 ;;
    esac

    if [ -n "$to_set" ]; then
        echo "$to_set" > "$current_task_file"
        echo "New current task: \"$to_set\""
    fi
}

add() {
    task=$(read -r str; echo $str)

    if [ -n "$task" ]; then
        echo "$task" >> "$list_file"

        if [ -z "$(print_current)" ] || [[ "$1" == "--set" ]]; then
            echo "$task" > "$current_task_file"
        fi

        echo "New task added: \"$task\""
    fi
}

remove() {
    all() {
        :> "$list_file"
        :> "$current_task_file"
        echo "List cleared." && exit
    }

    by_index() {
        to_remove=$(sed "${1}!d" "$list_file" 2>/dev/null)

        if [ -z "$1" ] || [ -z "$to_remove" ]; then
            echo "Invalid index." && exit 1
        fi
    }

    case "$1" in
        "--all") all ;;
        "--current") to_remove=$(print_current) ;;
        "--index") by_index "$2" ;;
        "") to_remove=$(list --no-index | fzf) ;;
        *) echo "Option \"$1\" doesn't exist." && exit 1 ;;
    esac

    if [ -n "$to_remove" ]; then
        sed -i "/^$to_remove$/d" "$list_file"

        if [[ "$to_remove" == $(print_current) ]]; then
            last_added=$(tail -1 "$list_file")
            echo "$last_added" > "$current_task_file"
        fi

        echo "Task removed: \"$to_remove\"."
    fi
}

case "$1" in
    "add") add "${@:2}" ;;
    "current") print_current ;;
    "ls") list "${@:2}" ;;
    "rm") remove "${@:2}" ;;
    "set") set_current "${@:2}" ;;
    *) print_usage ;;
esac
