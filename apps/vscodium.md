# VSCodium Code Editor

Plugins:
- canadaduane/notes
- amvim
- gitlens
- prettier
- svelte

Community:
- https://www.reddit.com/r/vsCodium/

## Install:

```bash
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list

sudo apt update && sudo apt install codium
```

## Keyboard Shortcuts

Enable VIM keys in File Explorer (workbench):

(settings.json)
```json
{
  "workbench.list.automaticKeyboardNavigation": false
}
```

(keybindings.json)
```json
{
  "key": "/",
  "command": "list.toggleKeyboardNavigation",
  "when": "explorerViewletFocus && explorerViewletVisible"
}
```
