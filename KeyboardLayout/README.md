# KeyboardLayout

A [SVORAK keyboard layout](https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard#Svorak) fork, inspired by [Launchpad-McQ/KeyboardLayout](http://github.com/Launchpad-McQ/KeyboardLayout) and heavily modified by [medik](http://olofsjodin.se). Currently, there is a OS X and Linux version of the same layout.

## Install

### OS X
Fork this repo and then copy the files from the OSX folder to /Library/Keyboard\ Layouts/. After rebooting you will see the layout being available in Input Sources under Keyboard Preferences.

```
$ sudo cp OSX/*.keylayout /Library/Keyboard\ Layouts/
```

### Linux
Copy everything the Linux folder to `/usr/share/X11/xkb/symbols`. Then, add the following statement into `/usr/share/X11/xkb/rules/evdev.xml`.

```
<layoutList>
	...
    <layout>
      <configItem>
        <name>se-svorak-custom</name>

        <shortDescription>svorak</shortDescription>
        <description>Swedish Svorak Custom</description>
        <languageList>
          <iso639Id>swe</iso639Id>
        </languageList>
      </configItem>
      <variantList>
      </variantList>
    </layout>
	...
</layoutList>
```

Reboot your computer.

## License
Everything in this repository is protected by GNU General Public License v3, this means that you can't use this in your proprietary code. Read more on how it might affect you in the COPYING file.
