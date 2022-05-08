## Touchpad Sensitivity

When starting a touchpad motion, libinput has a minimum movement threshold that is too large for my touchpad (PIXA3854).

To reduce the fuzz, install `libinput-tools` and then:

```
sudo libinput measure fuzz --fuzz=2
```

Restart.

See also https://wayland.freedesktop.org/libinput/doc/1.11.3/touchpad_jitter.html