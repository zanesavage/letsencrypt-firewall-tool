cd /etc
mkdir letsencrypt-firewall-tool
cd letsencrypt-firewall-tool
sudo wget https://raw.githubusercontent.com/mtereo/letsencrypt-firewall-tool/new/master/checker.sh -O /etc/letsencrypt-firewall-tool/checker.sh
sudo chmod +x /etc/letsencrypt-firewall-tool/checker.sh
crontab -l > mycron
echo "0 23 * * 6 /etc/letsencrypt-firewall-tool/checker.sh" >> mycron
crontab mycron
rm mycron
