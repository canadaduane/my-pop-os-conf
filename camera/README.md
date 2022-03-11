Disable camera:

```
$ echo '0' | sudo tee /sys/bus/usb/devices/3-7/bConfigurationValue
```

Enable camera:
```
$ echo '1' | sudo tee /sys/bus/usb/devices/3-7/bConfigurationValue
```