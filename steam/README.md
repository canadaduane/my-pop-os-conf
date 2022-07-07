Steam is too small on my 4k monitor. Here's how I fix it (installed as Flatpak):

$ cp ~/.local/share/flatpak/app/com.valvesoftware.Steam/current/active/export/share/applications/com.valvesoftware.Steam.desktop ~/.local/share/applications/

$ vim ~/.local/share/applications/com.valvesoftware.Steam.desktop

Change `Exec=...` line to `Exec=env GDK_SCAL=2 ...`