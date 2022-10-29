a2enmod rewrite
echo "
RewriteEngine On
RewriteBase /
RewriteCond %{REQUEST_URI} !/public/images/eden.png
RewriteRule /.* http://eden.wise.b02.com/public/images/eden.png [L]
" > /var/www/eden.wise.b02.com/.htaccess

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
service apache2 restart