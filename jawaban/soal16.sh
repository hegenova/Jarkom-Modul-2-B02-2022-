echo "
<VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/html

        RewriteEngine On
        RewriteCond %{HTTP_HOST} ^10\.4\.3\.3$
        RewriteRule /.* http://wise.B02.com/ [R]

 

</VirtualHost>
" > /etc/apache2/sites-available/000-default.conf
a2enmod rewrite
service apache2 restart