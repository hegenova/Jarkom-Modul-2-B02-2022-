
# LAPRES Jarkom B02

Anggota :

	Muhammad Daffa Aldriantama (5025201177)
	Burhanudin Rifa (5025201191)
	Maisan Auliya (5025201137)

## 1. 
WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet (1).
![Alt text](/images/no1.png)

## 2.
Untuk mempermudah mendapatkan informasi mengenai misi dari Handler, bantulah Loid membuat website utama dengan akses wise.yyy.com dengan alias www.wise.yyy.com pada folder wise (2).

Wise lakukan nano /etc/bind/named.conf.local untuk mengedit
![Alt text](/images/no2.png)

## 3. 
Setelah itu ia juga ingin membuat subdomain eden.wise.yyy.com dengan alias www.eden.wise.yyy.com yang diatur DNS-nya di WISE dan mengarah ke Eden (3).

a. Konfigurasi /etc/bind/wise/wise.b02.com di Wise
![Alt text](/images/no3.png)
b. Kemudian restart service bind9 restart di Wise dan lakukan ping www.eden.wise.b02.com di client

## 4.
Buat juga reverse domain untuk domain utama (4).

a. Konfigurasi /etc/bind/wise/2.4.10.in-addr.arpa di Wise
![Alt text](/images/no4.png)

b. Konfigurasi /etc/bind/named.conf.local di Wise
![Alt text](/images/no4a.png)

c. Kemudian restart service bind9 restart di Wise dan lakukan host -t PTR 10.4.3.2 di client

## 5.
Agar dapat tetap dihubungi jika server WISE bermasalah, buatlah juga Berlint sebagai DNS Slave untuk domain utama (5).

a. Konfigurasi /etc/bind/named.conf.local di Berlint
![Alt text](/images/no5.png)
b. Kemudian restart service bind9 restart di Berlint dan stop service bind9 stop di Wise. Lakukan ping www.wise.b02.com di client

## 6.
Karena banyak informasi dari Handler, buatlah subdomain yang khusus untuk operation yaitu operation.wise.yyy.com dengan alias www.operation.wise.yyy.com yang didelegasikan dari WISE ke Berlint dengan IP menuju ke Eden dalam folder operation (6).

a. Konfigurasi /etc/bind/wise/wise.b02.com di Wise
![Alt text](/images/no6.png)

b. Konfigurasi /etc/bind/named.conf.options di Wise
![Alt text](/images/no6a.png)

c. Konfigurasi /etc/bind/operation/operation.wise.b02.com di Berlint
![Alt text](/images/no6b.png)

d. Konfigurasi /etc/bind/named.conf.options di Berlint
![Alt text](/images/no6c.png)

e. Kemudian restart service bind9 restart di Wise dan Berlint. Lakukan ping www.wise.b02.com di client

## 7.
Untuk informasi yang lebih spesifik mengenai Operation Strix, buatlah subdomain melalui Berlint dengan akses strix.operation.wise.yyy.com dengan alias www.strix.operation.wise.yyy.com yang mengarah ke Eden (7).
![Alt text](/image/Jarkom2-7.png)

## 8.
Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver www.wise.yyy.com. Pertama, Loid membutuhkan webserver dengan DocumentRoot pada /var/www/wise.yyy.com (8).
![Alt text](/image/Jarkom2-8a.png)

## 9.
Setelah itu, Loid juga membutuhkan agar url www.wise.yyy.com/index.php/home dapat menjadi menjadi www.wise.yyy.com/home (9).
![Alt text](/image/Jarkom2-9.png)

## 10.
Setelah itu, pada subdomain www.eden.wise.yyy.com, Loid membutuhkan penyimpanan aset yang memiliki DocumentRoot pada /var/www/eden.wise.yyy.com (10). 
![Alt text](/image/Jarkom2-10.png)

## 11.
Akan tetapi, pada folder /public, Loid ingin hanya dapat melakukan directory listing saja (11). 
![Alt text](/image/Jarkom2-11.png)

## 12.
Tidak hanya itu, Loid juga ingin menyiapkan error file 404.html pada folder /error untuk mengganti error kode pada apache (12).
![Alt text](/image/Jarkom2-12.png)

## 13.
Loid juga meminta Franky untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset www.eden.wise.yyy.com/public/js menjadi www.eden.wise.yyy.com/js (13).
![Alt text](/image/Jarkom2-13.png)

## 14.
Loid meminta agar www.strix.operation.wise.yyy.com hanya bisa diakses dengan port 15000 dan port 15500 (14)

pada eden buat config baru dengan nano /etc/apache2/sites-available/strix.operation.wise.b02.com.conf
![Alt text](/images/no14.png)

kemudian aktifkat dengan a2ensite strix.operation.wise.b02.com kemudian edit juga pada /etc/apache2/ports.conf seperti berikut
![Alt text](/images/no14a.png)

dan jangan lupa untuk copy resourcenya cp -r /Resourcegan/strix.operation.wise/. /var/www/strix.operation.wise.b02.com/

## 15.
dengan autentikasi username Twilight dan password opStrix dan file di /var/www/strix.operation.wise.yyy (15)

bikin password di Eden buat apache2 htpasswd -c -b /etc/apache2/.htpasswd Twilight opStrix dan tambahkan
![Alt text](/images/no15.png)

pada setiap host lalu test dengan lynx strix.operation.wise.b02.com:15000 maka akan disuruh memasukan username dan password

## 16.
dan setiap kali mengakses IP Eden akan dialihkan secara otomatis ke www.wise.yyy.com (16).

![Alt text](/images/no16.png)
pada /etc/apache2/sites-available/000-default.conf

## 17. 
Karena website www.eden.wise.yyy.com semakin banyak pengunjung dan banyak modifikasi sehingga banyak gambar-gambar yang random, maka Loid ingin mengubah request gambar yang memiliki substring “eden” akan diarahkan menuju eden.png. Bantulah Agent Twilight dan Organisasi WISE menjaga perdamaian! (17)

pada eden nano /var/www/eden.wise.b02.com/.htaccess dan tambahkan
![Alt text](/images/no16.png)

lalu ganti config pada /etc/apache2/sites-available/eden.wise.b02.com.conf dengan menambah AllowOverride All lalu jangan lupa a2enmod rewrite dan juga jangan lupa restart apache
![Alt text](/images/no16a.png)

