# Apex Legends Config

I am trying to build out my config settings more formally after losing some the other day.  This should also hopefully make the experience more consistent as I jump between Linux and Windows.

## videoconfig.txt

Update this file in the location below for your platform.  After editing, be sure to make the file read-only, otherwise the game can reset the values.

- `~/.steam/steam/steamapps/compatdata/1172470/pfx/drive_c/users/steamuser/Saved Games/Respawn/Apex/local`
- `%HOME%/Saved Games/Respawn/Apex/local`

## autoexec.cfg

Update the launcher settings to run this file automatically.  For example, my current start settings are below.  The last part starting at `+exec` tells Apex to load these at the start.

```
-fullscreen -dev +exec autoexec.cfg
```
This file should go in the following directories:

- `~/.steam/steam/steamapps/common/Apex Legends/cfg`
- `C:\Program Files (x86)\Steam\steamapps\common\Apex Legends\cfg`

## Reference

These were heavily inspired by a number of different online resources and a friend who I suspect would prefer to remain anonymous ;).

- https://www.youtube.com/watch?v=Q0z-Vwq_FU0
- https://www.youtube.com/watch?v=D8JMOgRkcx4
- https://github.com/Natram1zh/Apex-Legends-Config-And-Tweaks
- https://github.com/kretz1xD/Apex-Legends-Tweaks
- https://github.com/slurpyb/apexconfig
