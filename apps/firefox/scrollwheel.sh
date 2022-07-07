# Frame.work Laptop with Pop!_OS with Mac-like Defaults

# Make Firefox scrolling precision pixel-perfect
MOZ_PREFS_JS="$HOME/.mozilla/firefox/$(cat ~/.mozilla/firefox/installs.ini | grep Default | sed 's/Default=//')/prefs.js"
echo 'user_pref("mousewheel.acceleration.factor", 5);' >> $MOZ_PREFS_JS
echo 'user_pref("mousewheel.acceleration.start", 1);' >> $MOZ_PREFS_JS
echo 'user_pref("mousewheel.default.delta_multiplier_y", 40);' >> $MOZ_PREFS_JS

echo export MOZ_USE_XINPUT2=1 | sudo tee /etc/profile.d/use-xinput2.sh
