mkdir /var/www/strix.operation.wise.b02.com
echo "
<VirtualHost *:15000>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/strix.operation.wise.b02.com
        ServerName strix.operation.wise.b02.com
        ServerAlias www.strix.operation.wise.b02.com


        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
<VirtualHost *:15500>        
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/strix.operation.wise.b02.com
        ServerName strix.operation.wise.b02.com
        ServerAlias www.strix.operation.wise.b02.com
        

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/strix.operation.wise.b02.com.conf
a2ensite strix.operation.wise.b02.com
service apache2 restart 

cp -r /Resourcegan/strix.operation.wise/. /var/www/strix.operation.wise.b02.com/

echo "
# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 15000
Listen 15500
<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>
" > /etc/apache2/ports.conf

service apache2 restart