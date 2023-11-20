#How to change trackpad size in wayland

required

- libinput
- libinput-utils

- x1
  128.7x83.2mm

- x1.5
  193.1x124.8mm
- delete decimals
  193x124

- use this command to change size

```
sudo libinput measure touchpad-size 193x124
```

- set config result from previous command here

```
sudo nvim /etc/udev/hwdb.d/61-evdev-local.hwdb
```

- make actual config take effect

```
  sudo systemd-hwdb update
  sudo udevadm trigger
```
