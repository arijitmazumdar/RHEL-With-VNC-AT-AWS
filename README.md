# RHEL-With-VNC-AT-AWS
This project contains a user data script that will setup VNC server at port 5901 for user joevnc for a RHEL 7.3 ec2 instance at AWS.
A few points to be pondered:

* The script is quite self explanatory. Hope it will help others as it has helped me.
* I have tried to use a very minimal GUI to improve booting performance. I welcome any advice towards this. 
* I have kept passwords using clear text, which probably is not a good practice. However, user can change the system password after login and vnc password using `vncpasswd`.
* I have created a new user joevnc in this script. We quickly change the script and setup VNC for default ec2-user.
* The VNC server process will run only at localhost. So connect it from remote machine one needs to use ssh tunnel for port 5901. Windows user using putty can easily do so using the following menu (Connections->SSH->Tunnels).

Finally I should thank to this [digital ocean blog](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-remote-access-for-the-gnome-desktop-on-centos-7) and many others for showing me directions. 
