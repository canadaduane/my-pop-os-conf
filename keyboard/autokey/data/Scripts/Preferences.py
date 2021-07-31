if window.get_active_class() == 'Navigator.Firefox':
    keyboard.send_keys("<alt>+e")
    time.sleep(0.2)
    keyboard.send_keys("n")
else:
    keyboard.send_keys("<ctrl>+,")