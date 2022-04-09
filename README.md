# CatalystToolbarMenuButton

This is a simple Mac Catalyst example showcasing how to build a dropdown menu toolbar button using AppKit.

There are ways to build this using NSToolbarItemGroup, but it has peculiarities like the button always being the width of the longest menu item, even when no title is shown. This way, instead, gives you an NSPopUpButton for your toolbar item, and lets you set an NSMenu of your own design to it.

### Screenshot

![https://hccdata.s3.amazonaws.com/gh_toolbarmenubutton.jpg](https://hccdata.s3.amazonaws.com/gh_toolbarmenubutton.jpg)
