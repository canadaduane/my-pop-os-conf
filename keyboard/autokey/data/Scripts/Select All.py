if window.get_active_class() != 'gnome-terminal-server.Gnome-terminal':
    keyboard.send_keys("<ctrl>+a")
else:
    if window.get_active_title() != 'Find':
        keyboard.send_keys("<ctrl>+<shift>+a")
    else:
        keyboard.send_keys("<ctrl>+a")