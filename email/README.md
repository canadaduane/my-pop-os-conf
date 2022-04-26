# evolution (Gnome email app)

Helpful blog post:
https://major.io/2015/11/27/custom-keyboard-shortcuts-for-evolution-in-gnome/

## via Flatpak

If `evolution` is installed via flatpak, copy `evolution.accels` to:

`~/.var/app/org.gnome.Evolution/config/evolution/accels`

(see https://www.reddit.com/r/flatpak/comments/spwck9/flatpak_doesnt_follow_custom_fontconfig_file/)

# via Apt

Otherwise, if `evolution` is installed via regular apt, copy to:

`~/.config/evolution/accels`
