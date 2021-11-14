# Interception

Create a Mac OS-like shortcut key experience:

- For most Meta+* key combos, translate to Ctrl+*, e.g.
  - Close Window: Meta+W -> Ctrl+W
  - New Tab: Meta+T -> Ctrl+T
  - Bold: Meta+B -> Ctrl+B
  - Italics: Meta+I -> Ctrl+I
  - etc.

- For cut/copy/paste key combos, translate to special clipboard keys:
  - Cut: Meta+X -> KEY_CUT
  - Copy: Meta+C -> KEY_COPY
  - Paste: Meta+V -> KEY_PASTE

- For window switching, let key combos pass through:
  - Switch: Meta+Tab -> Meta+Tab

See https://gitlab.com/interception/linux/plugins/caps2esc


Cut: Shift + Delete
Copy: Ctrl + Insert
Paste: Shift + Insert