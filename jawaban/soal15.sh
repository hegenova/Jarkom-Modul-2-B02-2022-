htpasswd -c -b /etc/apache2/.htpasswd Twilight opStrix

echo "
<VirtualHost *:15000>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/strix.operation.wise.b02.com
        ServerName strix.operation.wise.b02.com
        ServerAlias www.strix.operation.wise.b02.com

        <Directory \"/var/www/strix.operation.wise.b02.com\">
                AuthType Basic
                AuthName \"Restricted Content\"
                AuthUserFile /etc/apache2/.htpasswd
                Require valid-user
        </Directory>

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
<VirtualHost *:15500>        
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/strix.operation.wise.b02.com
        ServerName strix.operation.wise.b02.com
        ServerAlias www.strix.operation.wise.b02.com
        
        <Directory \"/var/www/strix.operation.wise.b02.com\">
                AuthType Basic
                AuthName \"Restricted Content\"
                AuthUserFile /etc/apache2/.htpasswd
                Require valid-user
        </Directory>
        
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
" > /etc/apache2/sites-available/strix.operation.wise.b02.com.conf
service apache2 restart