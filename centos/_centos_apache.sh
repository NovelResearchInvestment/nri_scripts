#!/bin/bas

__domain__=domain.com

yum install nginx -y
systemctl enable nginx
systemctl start nginx
yum install epel-release -y
yum install certbot python3-certbot-nginx -y
certbot --nginx
echo "0 0,12 * * * root python3 -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null

dnf install httpd
systemctl start httpd
systemctl enable httpd
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
systemctl reload firewalld

mkdir /var/www/$__domain__
chown apache:apache /var/www/$__domain__/
echo "
<virtualhost *:80>
ServerName gabrielwf.ml
ServerAlias www.gabrielwf.ml
DocumentRoot /var/www/gabrielwf.ml
ErrorLog /var/log/httpd/gabrielwf.ml-error.log
CustomLog /var/log/httpd/gabrielwf.ml-access.log combined
SSLEngine on
SSLCertificateFile /etc/pki/tls/certs/gabrielwfml.crt
SSLCertificateKeyFile /etc/pki/tls/private/gabrielwfml.key
</virtualhost>
" > /etc/httpd/conf.d/$__domain__.conf

# If you want multiple domain names to work with the same content, just list them separated by a space in the ServerAlias line.
# ServerAlias www.domain-name.com domain-name2.com domain-name3.com

systemctl restart httpd



