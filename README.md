# scripts

A collection of my scripts. Put somewhere in your `$PATH` for the best experience!

# Maimblast

A rewrite of Hyprland's [grimblast](https://github.com/hyprwm/contrib/blob/main/grimblast/grimblast) to use with X11 window managers and `maim`. 

I wrote this because the [grimblast rofi script](https://github.com/hyprwm/contrib/blob/main/grimblast/grimblast) is really convenient and I wanted to have a seamless experience with it between my i3wm and Hyprland rices.

## Dependencies

- `maim`

- `slop`

- `clpimg.py`

- `notify-send`

- `xdotool`

# Watchlist

A watchlist management script using `yt-dlp`.

I tend to get distracted when I have multiple tabs open in my browser, and this script fixes the issue for me, and it reduces RAM and network usage usage since you only need a video player and not a whole browser open to watch videos.

You can control the watchlist directory and video player used with the `$WATCHLIST_DIRECTORY` and `$WATCHLIST_PLAYER` environment variables respectively.

## Dependencies

- `yt-dlp`

- `sed`

- `nl`

- `mpv` (optional, default video player if `$WATCHLIST_PLAYER` is unset)

# Spacer

A python script that adds a user-defined number of spaces between text to make it d   r   a   m   a   t   i   c.

## Depencencies

- `python`
