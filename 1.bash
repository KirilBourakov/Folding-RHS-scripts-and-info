apt-get update
apt-get install x11vnc net-tools

x11vnc -storepasswd

touch "/etc/systemd/system/x11vnc.service"
FILE="/etc/systemd/system/x11vnc.service"
printf "[Unit]\nDescription=x11vnc remote desktop server\nAfter=multi-user.target\n[Service]\nType=simple\nExecStart=/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/%s/.vnc/passwd -rfbport 5900 -shared\nRestart=on-failure\n[Install]\nWantedBy=multi-user.target\n" "$USER" > $FILE


systemctl daemon-reload
systemctl start x11vnc
systemctl enable x11vnc.service