#2 domains for lets encrypt
domain1='outbound1.letsencrypt.org'
domain2='outbound2.letsencrypt.org'

#checks if cached addresses exist
#if yes, stores each one as a variable for later use
#if no, creates temp  variables and firewall rules (uses google dns addresses)
if [ -e add1old.txt ]
then
 add1old=$(awk '{print $0}' add1old.txt)
else
 add1old=8.8.8.8
 ufw allow from $add1old to any port 80
 ufw allow from $add1old to any port 443
fi

if [ -e add2old.txt ]
then
 add2old=$(awk '{print $0}' add2old.txt)
else
 add2old=8.8.4.4
 ufw allow from $add2old to any port 80
 ufw allow from $add2old to any port 443
fi

#lookup current ip for domain 1 and store to variable add1
nslookup $domain1 > add1.txt
add1=$(awk 'NR==6 {print $2}' add1.txt)

#lookup current ip for domain 2 and store to variable add2
nslookup $domain2 > add2.txt
add2=$(awk 'NR==6 {print $2}' add2.txt)

#compares cached address to current address, and if different, updates firewall rules, and the cached address for each domain name
if [ $add1 != $add1old ]
then
 ufw delete allow from $add1old to any port 80
 ufw delete allow from $add1old to any port 443
 ufw allow from $add1 to any port 80
 ufw allow from $add2 to any port 443
 echo $add1 > add1old.txt
 echo "Access rules updated for new address for outbound1.letsencrypt.org."
fi

if [ $add2 != $add2old ]
then
 ufw delete allow from $add2old to any port 80
 ufw delete allow from $add2old to any port 443
 ufw allow from $add2 to any port 80
 ufw allow from $add2 to any port 443
 echo $add2 > add2old.txt
 echo "Access rulse updated for new address for outbound2.letsencrypt.org."
fi
