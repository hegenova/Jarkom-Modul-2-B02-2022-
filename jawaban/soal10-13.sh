echo "
<VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/eden.wise.b02.com
        ServerName eden.wise.b02.com
        ServerAlias www.eden.wise.b02.com

        <Directory /var/www/eden.wise.b02.com>
                Options +Indexes
        </Directory>

        <Directory /var/www/eden.wise.b02.com/public>
                Options +Indexes
        </Directory>

        ErrorDocument 404 /error/404.html
        Alias \"/js\" \"/var/www/eden.wise.b02.com/public/js\"
        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined

        <Directory /var/www/eden.wise.b02.com>
                Options +FollowSymLinks -Multiviews
                AllowOverride All
        </Directory>
</VirtualHost>
" > /etc/apache2/sites-available/eden.wise.b02.com.conf
a2ensite eden.wise.b02.com.conf
mkdir /var/www/eden.wise.b02.com
cp -r /Resourcegan/eden.wise/. /var/www/eden.wise.b02.com
service apache2 restart