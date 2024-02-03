#!/usr/bin/env bash

play="Play"
playlist="Playlist"
delete="Delete"
add="Download"

list_files() {
  /usr/bin/env ls -1v $(watchlist dir) | grep "\.mkv$" | while read -r file; do
  echo -en "$file\0icon\x1fvideo\n"
  done | cat
}

# Function to check if a string is a YouTube URL
is_youtube_url() {
  local url="$1"
  # Check if the URL matches the YouTube pattern
  if [[ "$url" =~ ^(https?://)?(www\.)?(youtube\.com|youtu\.be)/ ]]; then
    return 0
  else
    return 1
  fi
}

cd $(watchlist dir)

if [[ -z $1 ]]; then
  echo -en "$play\0icon\x1fvideo\n"
  echo -en "$playlist\0icon\x1fvideo\n"
  echo -en "$delete\0icon\x1fuser-trash\n"
  echo -en "$add\0icon\x1femblem-downloads\n"
  echo "none" > /tmp/watchlist-rofi-operation
elif [[ "$1" == "$play" || "$1" == "$delete" ]]; then
  echo "$1" > /tmp/watchlist-rofi-operation
  list_files
elif [[ "$1" == "$add" ]]; then
  echo "$1" > /tmp/watchlist-rofi-operation
  echo "Press <enter> to start downloading the video."
elif [[ "$1" == "$playlist" ]]; then
  coproc ( watchlist playlist > /dev/null 2>&1 )
elif [[ $(cat /tmp/watchlist-rofi-operation) == "$add" ]]; then
  if is_youtube_url "$1"; then
    coproc ( notify-send "Download has started!"  > /dev/null  2>&1 )
    coproc ( yt-dlp "$1" --exec "notify-send --icon=document-save 'Watchlist download finished!'" > /dev/null  2>&1 )
    exit 0
  else
    coproc ( notify-send --icon=dialog-error "The string isn't a YouTube url!" > /dev/null  2>&1 )
    exit 1
  fi
elif [[ $(cat /tmp/watchlist-rofi-operation) == "$delete" ]]; then
  coproc ( notify-send --icon=user-trash "Sucessfully deleted $1." > /dev/null  2>&1 )
  trash "$1"
else
  coproc ( mpv "$1" > /dev/null  2>&1 )
fi
