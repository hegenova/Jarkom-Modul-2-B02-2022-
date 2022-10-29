echo "
<VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/wise.b02.com
        ServerName wise.b02.com
        ServerAlias www.wise.b02.com

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/wise.b02.com.conf
a2ensite wise.b02.com.conf
mkdir /var/www/wise.b02.com
cp -r /Resourcegan/wise/. /var/www/wise.b02.com
service apache2 restart