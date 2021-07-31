if window.get_active_class() != 'gnome-terminal-server.Gnome-terminal':
    keyboard.send_keys("<ctrl>+f")
else:
    keyboard.send_keys("<ctrl>+<shift>+f")