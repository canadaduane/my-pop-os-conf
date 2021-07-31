import re

winTitle = window.get_active_title()
winClass = window.get_active_class()
# dialog.info_dialog("Window information", 
#           "Active window information:\\nTitle: '%s'\\nClass: '%s'" % (winTitle, winClass))
          
if re.match('Gnome-terminal', winClass):
    keyboard.send_keys("<ctrl>+<shift>+w")
elif re.match('.*(code.Code|Nautilus)', winClass):
    keyboard.send_keys("<ctrl>+w")
else:
    keyboard.send_keys("<ctrl>+<f4>")
