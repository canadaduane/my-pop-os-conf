## Gaming Mouse

I have a gaming mouse that works beautifully, but has a quirk where the Linux kernel puts it to sleep every few seconds and only re-awakens it with a mouse button press.

To prevent it from going to sleep, I have a udev rule, `/etc/udev/rules.d/90-usb-game-mouse.rules`:

```
ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="258a", ATTRS{idProduct}=="1007", TEST=="power/control", ATTR{power/control}="on"
```

I found the idVendor and idProduct via `lsusb`:

```bash
$ lsusb
...
Bus 003 Device 002: ID 258a:1007 SINOWEALTH Wired Gaming Mouse
```
