# letsencrypt-firewall-tool
This tool is built for ubuntu based unifi controllers. It checks the dns resolution of the lets encrypt outbound servers weekly, and if it sees changes, it will update firewall rules to allow port 80 and 443 access only from letsencrypt's servers.

To install on your system, run the following commands on your system:

sudo wget https://raw.githubusercontent.com/mtereo/letsencrypt-firewall-tool/edit/master/installer.sh

sudo chmod +x installer.sh

sudo installer.sh
