## Webp Thumbnails in Thunar (and other file managers)

```bash
sudo cp webp.thumbnailer /usr/share/thumbnailers/
sudo cp webp.xml /usr/share/mime/packages/webp.xml
sudo update-mime-database /usr/share/mime
```

Config files taken from (with thanks to Supa Shang):
https://spacebums.co.uk/thunar-webp-thumbnails/
