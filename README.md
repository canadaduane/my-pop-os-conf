# My Pop!_OS Configuration

Pop!_OS is a beautiful and functional version of Ubuntu Linux designed and developed by System76. I like it to behave like Mac OS--keyboard shortcuts in particular. This repository tracks the settings I've used.

Currently running Pop!_OS version 22.04 (beta as of this writing).

## Hardware

I run Pop 22.04 on a [Framework](https://frame.work) laptop. It has an integrated Intel GPU, which means I can run Wayland quite well (nvidia is still a ways behind in terms of "it just works" from what I understand). 1 TB NVMe drive, 64 GB dual-channel RAM, external 4k monitor.

## Favorite Apps

[Bitwarden](https://bitwarden.com) - a password manager that has autofill extensions for all browsers ([flatpak](https://flathub.org/apps/details/com.bitwarden.desktop))

[Celluloid](https://celluloid-player.github.io/) - a simple but versatile GTK-native video player ([flatpak](https://flathub.org/apps/details/io.github.celluloid_player.Celluloid))

[Discord](https://discord.com/) - Chat software ([flatpak](https://flathub.org/apps/details/com.discordapp.Discord))

[Flameshot](https://flameshot.org/) - a screenshot app that lets you easily add annotations like text or arrows pointing to things ([flatpak](https://flathub.org/apps/details/org.flameshot.Flameshot) | [my setup](apps/flameshot.md))

[Foliate](https://johnfactotum.github.io/foliate/) - a bookshelf app to store and read e-books ([flatpak](https://flathub.org/apps/details/com.github.johnfactotum.Foliate))

[Obsidian](https://obsidian.md/) - a searchable, personal knowledge base on top of time-honored local text files ([flatpak](https://flathub.org/apps/details/md.obsidian.Obsidian))
  - Maybe use [Logseq](https://logseq.com/) instead?

[Pinta](https://www.pinta-project.com/) - a powerful raster graphics app ([flatpak](https://flathub.org/apps/details/com.github.PintaProject.Pinta))

[Pop Dictionary](https://github.com/canadaduane/pop-dictionary) my attempt at making a simple-to-use dictionary (GoldenDict) function as a built-in cosmic launcher extension

[Shotcut](https://www.shotcut.org/) - a sophisticated yet easy-to-use video editor ([flatpak](https://flathub.org/apps/details/org.shotcut.Shotcut))

[Tauon Music Box](https://tauonmusicbox.rocks/) - a beautiful but dead-simple music player with a searchable catalog for your tunes ([flatpak](https://flathub.org/apps/details/com.github.taiko2k.tauonmb))

[Vivaldi](https://vivaldi.com/download/) - a chromium-based browser with a beautiful, best-in-class calendar and email capability

[VSCodium](https://vscodium.com/) - "Visual Studio Code" editor/IDE, minus the Microsoft trackers ([my setup](apps/vscodium.md))


## Command-line Tools

**exa** - Better 'ls'
`sudo apt install exa`

**fzf** - Fuzzy Finder: find files in current dir & subdirs
`sudo apt install fzf`

[lazygit](https://github.com/jesseduffield/lazygit/) - Interact with git visually

[mcfly](https://github.com/cantino/mcfly) - Show better command history with ctrl-R

[nala](https://gitlab.com/volian/nala#installation) - Like package tool "apt", but in a much friendlier way

**ncdu** - ncurses "disk usage" (du) replacement
`sudo apt install ncdu`

**nnn** - File manager
`sudo apt install nnn`

[libtree](https://github.com/haampie/libtree) - Show what shared libs a binary depends on

## Gnome Extensions

Note: I use [Extension Manager](https://beta.flathub.org/apps/com.mattjakeman.ExtensionManager) via flatpak to manage Gnome extensions.

[Burn my Windows](https://extensions.gnome.org/extension/4679/burn-my-windows/) - Just for fun, this animates the window open/close transitions. I use `Apparition` on open and `TV Glitch` on close.

[Dash to Dock for COSMIC](https://extensions.gnome.org/extension/5004/dash-to-dock-for-cosmic/) - Provides a more Mac OS-like "dock" on the bottom of the screen, and makes it easier to manage multi-monitor setup.

[Fullscreen Avoider](https://extensions.gnome.org/extension/4362/fullscreen-avoider/) - Shows the top bar on an alternate screen (if available) when in full-screen mode. This lets me see the time, for example, while in a Zoom meeting.

[Fullscreen Hot Corner](https://extensions.gnome.org/extension/1562/fullscreen-hot-corner/) - Allows to use the upper-left "hot corner" to see workspaces overview, even while in full-screen mode.

[One Thing](https://extensions.gnome.org/extension/5072/one-thing/) - Allows me to type something into the top bar, to help me maintain my focus on a task.

[Vitals](https://extensions.gnome.org/extension/1460/vitals/) - Shows CPU, network in top bar


# Why I switched to Linux

Story time.

I come from 15 years of software development on a Mac, so why have I switched to Linux (Pop!_OS) in 2021?

Mac OS seems as strong as ever, but a trickle of software developers have been disenfranchised by Apple’s [increasing](https://www.npr.org/2021/08/06/1025402725/apple-iphone-for-child-sexual-abuse-privacy) demand for [control](https://9to5mac.com/2020/11/15/apple-explains-addresses-mac-privacy-concerns/) over its [hardware](https://www.iclarified.com/78310/apple-blocks-camera-repair-on-new-iphone-12-video), which diminishes the importance of values like ownership, the right to repair, and free-culture.

In addition, in November 2020, my MacBook ground to a halt. Apps wouldn't load, and rebooting didn't help. I assumed something had gone seriously wrong with my hardware--a bad hard drive, perhaps? It turned out that the cause was [Apple's server outage](https://news.ycombinator.com/item?id=25074959). Until that point, I had no idea Apple had programmed a control mechanism (which catastrophically failed that day) that could prevent me from running already-installed apps on my system. I woke up.

Today, Apple [removes apps](https://www.thefpsreview.com/2022/04/24/apple-to-remove-apps-and-games-that-havent-been-updated-in-two-years/) from its app store because they haven't been updated, and decides for everyone who likes Mac OS whether their next hardware upgrade will or will not have a touchbar, or [escape key](https://www.theverge.com/circuitbreaker/2016/10/25/13409258/apple-new-macbook-pro-no-escape-key). It's an ecosystem problem, and a culture problem. I think Apple's "Think Different" slogan embodies much of the free culture aspect that drew me to the company in the first place. Apple is no longer the Think Different company.

While I appreciate Apple's general sense of design, having no choice in these matters made me realize how much I value freedom, and so I've started a journey to appreciate and improve the ecosystem of free software, and that includes Linux--and Pop!_OS.
