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

[Geary](https://wiki.gnome.org/Apps/Geary) - an excellent multi-account email app native to Gnome ([flatpak](https://flathub.org/apps/org.gnome.Geary))

[LazPaint](https://lazpaint.github.io) - a simple yet powerful raster graphics app

[Obsidian](https://obsidian.md/) - a searchable, personal knowledge base on top of time-honored local text files ([flatpak](https://flathub.org/apps/details/md.obsidian.Obsidian))
  - Maybe use [Logseq](https://logseq.com/) instead?

[Pop Dictionary](https://github.com/canadaduane/pop-dictionary) my attempt at making a simple-to-use dictionary (GoldenDict) function as a built-in cosmic launcher extension

[Shotcut](https://www.shotcut.org/) - a sophisticated yet easy-to-use video editor ([flatpak](https://flathub.org/apps/details/org.shotcut.Shotcut))

[Tauon Music Box](https://tauonmusicbox.rocks/) - a beautiful but dead-simple music player with a searchable catalog for your tunes ([flatpak](https://flathub.org/apps/details/com.github.taiko2k.tauonmb))

[VSCodium](https://vscodium.com/) - "Visual Studio Code" editor/IDE, minus the Microsoft trackers ([my setup](apps/vscodium.md))


## Command-line Tools

[exa](https://the.exa.website/) - Better 'ls'
`sudo apt install exa`

[fzf](https://github.com/junegunn/fzf) - Fuzzy Finder: find files in current dir & subdirs
`sudo apt install fzf`

[lazygit](https://github.com/jesseduffield/lazygit/) - Interact with git visually

[resh](https://github.com/curusarn/resh) - Show better command history with ctrl-R

[nala](https://gitlab.com/volian/nala#installation) - Like package tool "apt", but in a much friendlier way

[broot](https://dystroy.org/broot/install/) - Simple folder navigation ([download](https://dystroy.org/broot/download/x86_64-linux/broot))

[libtree](https://github.com/haampie/libtree) - Show what shared libs a binary depends on

## Gnome Extensions

See [./gnome-extensions](./gnome-extensions/).

# Why I switched to Linux

Story time.

I come from 15 years of software development on a Mac, so why have I switched to Linux (Pop!_OS) in 2021?

Mac OS seems as strong as ever, but a trickle of software developers have been disenfranchised by Apple’s [increasing](https://www.npr.org/2021/08/06/1025402725/apple-iphone-for-child-sexual-abuse-privacy) demand for [control](https://9to5mac.com/2020/11/15/apple-explains-addresses-mac-privacy-concerns/) over its [hardware](https://www.iclarified.com/78310/apple-blocks-camera-repair-on-new-iphone-12-video), which diminishes the importance of values like ownership, the right to repair, and free-culture.

In addition, in November 2020, my MacBook ground to a halt. Apps wouldn't load, and rebooting didn't help. I assumed something had gone seriously wrong with my hardware--a bad hard drive, perhaps? It turned out that the cause was [Apple's server outage](https://news.ycombinator.com/item?id=25074959). Until that point, I had no idea Apple had programmed a control mechanism (which catastrophically failed that day) that could prevent me from running already-installed apps on my system. I woke up.

Today, Apple [removes apps](https://www.thefpsreview.com/2022/04/24/apple-to-remove-apps-and-games-that-havent-been-updated-in-two-years/) from its app store because they haven't been updated, and decides for everyone who likes Mac OS whether their next hardware upgrade will or will not have a touchbar, or [escape key](https://www.theverge.com/circuitbreaker/2016/10/25/13409258/apple-new-macbook-pro-no-escape-key). It's an ecosystem problem, and a culture problem. I think Apple's "Think Different" slogan embodies much of the free culture aspect that drew me to the company in the first place. Apple is no longer the Think Different company.

While I appreciate Apple's general sense of design, having no choice in these matters made me realize how much I value freedom, and so I've started a journey to appreciate and improve the ecosystem of free software, and that includes Linux--and Pop!_OS.
