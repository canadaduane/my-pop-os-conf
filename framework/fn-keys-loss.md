## Action Keys Stop Working

Occasionally, the action keys (fn keys, e.g. volume, brightness, etc.) on the framework laptop will stop working (especially
after suspend/hibernate). It turns out this rare occurence is caused by [cros_ec_lpcs](https://community.frame.work/t/tracking-fn-key-stops-working-on-popos-after-a-while/21208/32).

It can be disabled, like so:

```
echo "blacklist cros_ec_lpcs" | sudo tee -a /etc/modprobe.d/no_cros_ec.conf
sudo update-initramfs -u
```
