#!/bin/bash

options=("Add" "Play" "Delete")

# Define functions
add_video() {
    link=$(rofi -dmenu -p "Enter YouTube video link:")
    [ -n "$link" ] && watchlist add "$link"
}

play_video() {
    index=$(watchlist list | rofi -dmenu -p "Choose video to play:" | awk '{print $1}')
    [ -n "$index" ] && watchlist play "$index"
}

delete_video() {
    index=$(watchlist list | rofi -dmenu -p "Choose video to delete:" | awk '{print $1}')
    [ -n "$index" ] && watchlist delete "$index"
}

# Main rofi menu
selected=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "Watchlist Menu:")

case $selected in
    "Add")
        add_video
        ;;
    "Play")
        play_video
        ;;
    "Delete")
        delete_video
        ;;
    *)
        echo "Invalid option"
        ;;
esac

