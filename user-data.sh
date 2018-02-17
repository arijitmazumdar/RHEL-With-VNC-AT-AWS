#!/bin/bash 

#to print the logs at /var/log/user-data.log
set -x
exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1
echo BEGIN
date '+%Y-%m-%d %H:%M:%S'

yum install -y tigervnc-server
yum groupinstall -y "X Window System"
yum install -y gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts firefox
unlink /etc/systemd/system/default.target
ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target

useradd -c "User Joe Configured for VNC Access" joevnc --home /home/joevnc
echo joevnc:passw0rd | chpasswd

su joevnc  -c  "mkdir -p ~/.vnc"
su joevnc  -c  "echo arijit123 | vncpasswd -f > ~/.vnc/passwd"
su joevnc  -c  "chmod 0600 ~/.vnc/passwd"

cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
sed -i "s/<USER>/joevnc/g" /etc/systemd/system/vncserver@:1.service
systemctl daemon-reload
systemctl enable vncserver@:1.service
systemctl start vncserver@:1.service
