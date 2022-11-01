 #!/bin/bash

if [ 0 == $UID ]; then
    echo -e "The current user is the root user and enters the installation process"
    sleep 3
else
    echo -e "The current user is not root, please use the sudo su command to switch to the root user and re-execute the script"
    exit 1    
fi

#apt update && apt upgrade -y && apt autoremove -y

if [[ -f /usr/bin/vlmcsd ]]; then
    echo -e "update vlmcsd"
    systemctl stop vlmcsd
    wget --no-check-certificate -O /usr/bin/vlmcsd https://raw.githubusercontent.com/ActiveIce/vlmcsd/master/vlmcsd
    systemctl start vlmcsd
    echo -e "VLMCSD update successful"
    exit 0
fi

echo -e "Start installing VLMCSD"
wget --no-check-certificate -O /usr/bin/vlmcsd https://raw.githubusercontent.com/ActiveIce/vlmcsd/master/vlmcsd
wget --no-check-certificate -O /etc/systemd/system/vlmcsd.service https://raw.githubusercontent.com/ActiveIce/vlmcsd/master/vlmcsd.service
chmod +x /usr/bin/vlmcsd
systemctl start vlmcsd
systemctl enable vlmcsd
echo -e "VLMCSD is installed successfully"

exit 0