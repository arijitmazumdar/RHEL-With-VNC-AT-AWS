# RHEL-With-VNC-AT-AWS
This project contains a user data script that will setup VNC server at 5901 for user joevnc for a RHEL 7.3 ec2 instance at AWS.
A few points to be pondered
-The script is quite self explanatory. Hope it will help others as it has helped me.
-I have tried to use a very minimal GUI to improve booting performance. I welcome any advice towards this. 
-I have kept passwords using clear text, which probably is not a good practice. However, user can change the system password after login and vnc password using `vncpasswd`.
-I have created a new user joevnc in this script. We quickly change the script and setup VNC for default ec2-user.
