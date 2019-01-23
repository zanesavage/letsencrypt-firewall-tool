# letsencrypt-firewall-tool
This tool is built for ubuntu based unifi controllers. It checks the dns resolution of the lets encrypt outbound servers weekly, and if it sees changes, it will update firewall rules to allow port 80 and 443 access only from letsencrypt's servers.
