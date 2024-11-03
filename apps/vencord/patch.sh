#!/bin/bash

# This script removes the "Nitro" and "Shop" sections from Discord's sidebar

# Stop vesktop
pkill vesktop.bin

# Install asar extract/pack utility
pnpm add -g

# Enter the flatpak app's directory
cd ~/.local/share/flatpak/app/dev.vencord.Vesktop/current/active/files/bin/vesktop/resources

# Create a backup file of the asar
RANDOM_SUFFIX=$(openssl rand -hex 4)
BACKUP_FILE="app.asar.${RANDOM_SUFFIX}"
cp app.asar "$BACKUP_FILE"

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Couldn't create backup!"
  exit 1
fi

asar extract app.asar app

echo <<-EOF >> app/dist/js/renderer.js
setInterval(() => {
  // Find the UL element with aria-label="Direct Messages"
  const ul = document.querySelector('ul[aria-label="Direct Messages"]');

  if (ul) {
    // Select all LI children
    const listItems = ul.querySelectorAll('li');

    listItems.forEach(item => {
      const textContent = item.textContent || "";
      // Check if the item contains "Nitro" or "Shop"
      if (textContent.includes("Nitro") || textContent.includes("Shop")) {
        item.remove();
      }
    });
  }
}, 1500);
EOF

asar pack app app.asar

echo "Done! Restart vesktop to see the changes."
