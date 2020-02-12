#!/bin/sh
#sudo su
#echo "***************permit root login****************"
sed -i '/#PermitRootLogin/c PermitRootLogin yes' /etc/ssh/sshd_config
sed -i '/^PasswordAuthentication/c PasswordAuthentication yes' /etc/ssh/sshd_config
sed -i '/^GSSAPIAuthentication/c GSSAPIAuthentication no' /etc/ssh/sshd_config
#echo 'AllowUsers root' >> /etc/ssh/sshd_config
echo "**************service sshd start****************"
echo "linuxpassword" | passwd --stdin root
systemctl restart sshd
