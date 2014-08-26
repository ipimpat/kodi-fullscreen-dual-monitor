xbmc-fullscreen-dual-monitor
============================

Run XBMC in fullscreen on a single monitor in dual monitor setup (Linux)

This scripts allows you to make XBMC fullscreen on the left or right monitor while running. It has the advantage that you can move the cursor in and out of the window.

If you just wan't to prevent XBMC from stretching across mutiple monitors while running in fullscreen, you can use the SDL_VIDEO_FULLSCREEN_HEAD environment variable which can be used to select the screen used for fullscreen

```Bash
SDL_VIDEO_FULLSCREEN_HEAD=0 /usr/bin/xbmc -fs
```

## Installation

First of all, you will need to configure XBMC to run in window mode

- System > Video Output
- "Display mode" select "Windowed"

### Requirements

#### wmctrl

Debian-based/Ubuntu-based
> sudo apt-get install wmctrl

RPM-based
> yum install wmctrl

### Setup

Edit the variables at the top to fit your setup, default is 2x1920x1080 

```Bash
SCREEN_LEFT_POSITION="0,0" 
SCREEN_RIGHT_POSITION="1920,0"
```

## Run
> ~ $ xbmc-fullscreen.sh {left|right}
