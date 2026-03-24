#!/bin/bash

data_dir="$HOME/.local/share/leap"
cmd=$(basename "$0")

if ! fzf --version >/dev/null; then
    echo "Error: fzf not found. Is it installed?"
    exit 1
fi

if [ ! -d "$data_dir" ]; then
    mkdir -p "$data_dir"
fi

print_usage() {
    echo -e "Usage: $cmd <option>\n"
    echo "add '<command?>'                   add a leap to the current directory."
    echo -e "                                   <command> is the command to run after leaping, if blank it will default to a 'ls'.\n"

    echo "to                                 fzf select a directory to leap to"
    echo "rm                                 fzf select a leap to remove"
    echo "ls                                 print available leaps"
}

format_dir() {
    echo "$(echo "$1" | sed -e "s/~/\/home\/$USER/" -e "s/\//_/g")"
}

unformat_dir() {
    echo "$(echo "$1" | sed -e "s/_/\//g" -e "s/\/home\/$USER/~/")"
}

list() {
    unformat_dir "$(ls "$data_dir")"
}

add() {
    formatted_dir="$(format_dir "$PWD")"

    if [ -f "$data_dir/$formatted_dir" ]; then
        echo "A leap for this directory already exists."
        exit 1
    fi

    if [ -z "$1" ]; then
        command="ls"
    else
        command="$1"
    fi

    file="$data_dir/$formatted_dir"

    touch "$file"
    echo -e "#!/bin/bash\nkitty --working-directory $PWD --hold sh -c '$command' &" >> "$file"
    chmod +x "$file"
}

to() {
    if [ -n "$1" ]; then
        if [ ! -f "$data_dir/$(format_dir "$1")" ]; then
            echo "Error: Leap for $1 not found."
            exit 1
        fi

        leap_to="$1"
    else
        leap_to=$(list | fzf) || exit
    fi

    "$data_dir/$(format_dir "$leap_to")"
}

remove() {
    to_remove=$(list | fzf) || exit

    rm "$data_dir/$(format_dir "$to_remove")"
}

case "$1" in
    ls) list ;;
    add) add "${@:2}" ;;
    to) to "${@:2}" ;;
    rm) remove ;;
    *) print_usage ;;
esac
