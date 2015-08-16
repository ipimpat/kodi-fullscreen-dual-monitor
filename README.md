This repository is no longer needed.
============================

Kodi now (at least for my part: `15.1 Git:d496682 Media Center Kodi`) detects both my monitors instead of one big virtual display, which means I can switch around the monitors from within Kodi and it no longer binds the cursor to the window either.

However this script still allows you to specify which monitor to start move Kodi to and it also allows you to move Kodi to the other monitor from outside Kodi.

kodi-fullscreen-dual-monitor
============================

Run Kodi in fullscreen on a specific display in a dual monitor setup (Linux)

This script allows you to make Kodi fullscreen on the left or right monitor while running in windowed mode. It has the advantage that you can move the cursor in and out of the window.

If you just wan't to prevent Kodi from stretching across mutiple monitors while running in fullscreen, you can use the SDL_VIDEO_FULLSCREEN_HEAD environment variable which can be used to select the screen used for fullscreen

```Bash
SDL_VIDEO_FULLSCREEN_HEAD=0 /usr/bin/kodi -fs
```

## Kodi configuration

First of all, you will need to configure Kodi to run in window mode

- System > Video Output
- "Display mode" select "Windowed"

## Installation of requirements

### wmctrl

Debian-based/Ubuntu-based
> sudo apt-get install wmctrl

RHEL-based (CentOS, Fedora, ...)
> yum install wmctrl

openSUSE-based
> zypper install wmctrl

## Setup

Edit the position variables at the top of the kodi-fullscreen.sh script to fit your setup, default is 2x1920x1080 

```Bash
SCREEN_LEFT_POSITION="0,0" 
SCREEN_RIGHT_POSITION="1920,0"
```

You may also have to change the name variable to what ever the title of the XBMC/Kodi Window is set to in your distro/package version.

## Run
> ~ $ kodi-fullscreen.sh {left|right}
