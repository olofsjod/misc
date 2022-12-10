# General purpose scripts

Small scripts that belongs in $HOME/bin

## Useful commands

Here is a list of useful commands I use sometimes.

| Command				           | Description
| -------					   | -----------
| `xinput list` 				   | A list of connected HID devices.
| `xinput set-prop <nr> "Device Enabled" [0|1]`    | Disable or enable a device
| `git ls-files | xargs cat | wc -l`		   | Count rows in a git repository
| `fc-cache -f -v`				   | When you installing a font you should use this command. 
| `git fetch --all; git reset --hard origin/master`| Forcing git to overwrite files
| `nohup path/to/script`			   | Making a script run in the background
| `xrdb -merge ~/.Xresources`			   | To reread your .Xresources file, and keep your old resources
| `xset dpms force [off|on]`			   | To turn off or on the monitor
