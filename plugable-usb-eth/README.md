There's a hard-to-track problem with the Plugable usb-ethernet adapter using realtek r8156 chip: when the device is unplugged, then re-inserted it fails to start again. This is due to the laptop power management (TLP). We can blacklist the device like so:

```
echo 'USB_BLACKLIST="0bda:8156"' | sudo tee /etc/tlp.d/54-blacklist-usbeth.conf
```

(see [forum post](https://support.plugable.com/t/solution-to-works-when-plugged-in-at-boot-time-not-when-plugged-in-later-linux/22958))
