
# LAPRES Jarkom B02

Anggota :

	Muhammad Daffa Aldriantama (5025201177)
	Burhanudin Rifa (5025201191)
	Maisan Auliya (5025201137)

## 1. 
WISE akan dijadikan sebagai DNS Master, Berlint akan dijadikan DNS Slave, dan Eden akan digunakan sebagai Web Server. Terdapat 2 Client yaitu SSS, dan Garden. Semua node terhubung pada router Ostania, sehingga dapat mengakses internet (1).
![Alt text](/image/Jarkom2-1.png)

## 2.
Untuk mempermudah mendapatkan informasi mengenai misi dari Handler, bantulah Loid membuat website utama dengan akses wise.yyy.com dengan alias www.wise.yyy.com pada folder wise (2).
![Alt text](/image/Jarkom2-2.png)

## 3. 
Setelah itu ia juga ingin membuat subdomain eden.wise.yyy.com dengan alias www.eden.wise.yyy.com yang diatur DNS-nya di WISE dan mengarah ke Eden (3).
![Alt text](/image/Jarkom2-3.png)

## 4.
Buat juga reverse domain untuk domain utama (4).
![Alt text](/image/Jarkom2-4.png)

## 5.
Agar dapat tetap dihubungi jika server WISE bermasalah, buatlah juga Berlint sebagai DNS Slave untuk domain utama (5).
![Alt text](/image/Jarkom2-5.png)
![Alt text](/image/Jarkom2-5a.png)
![Alt text](/image/Jarkom2-5b.png)
![Alt text](/image/Jarkom2-5c.png)

## 6.
Karena banyak informasi dari Handler, buatlah subdomain yang khusus untuk operation yaitu operation.wise.yyy.com dengan alias www.operation.wise.yyy.com yang didelegasikan dari WISE ke Berlint dengan IP menuju ke Eden dalam folder operation (6).
![Alt text](/image/Jarkom2-6.png)
![Alt text](/image/Jarkom2-6a.png)

## 7.
Untuk informasi yang lebih spesifik mengenai Operation Strix, buatlah subdomain melalui Berlint dengan akses strix.operation.wise.yyy.com dengan alias www.strix.operation.wise.yyy.com yang mengarah ke Eden (7).
![Alt text](/image/Jarkom2-7.png)

## 8.
Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver www.wise.yyy.com. Pertama, Loid membutuhkan webserver dengan DocumentRoot pada /var/www/wise.yyy.com (8).
![Alt text](/image/Jarkom2-8.png)

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
![Alt text](/image/Jarkom2-14.png)

## 15.
dengan autentikasi username Twilight dan password opStrix dan file di /var/www/strix.operation.wise.yyy (15)
![Alt text](/image/Jarkom2-15.png)

## 16.
dan setiap kali mengakses IP Eden akan dialihkan secara otomatis ke www.wise.yyy.com (16).
![Alt text](/image/Jarkom2-16.png)

## 17. 
Karena website www.eden.wise.yyy.com semakin banyak pengunjung dan banyak modifikasi sehingga banyak gambar-gambar yang random, maka Loid ingin mengubah request gambar yang memiliki substring “eden” akan diarahkan menuju eden.png. Bantulah Agent Twilight dan Organisasi WISE menjaga perdamaian! (17)
![Alt text](/image/Jarkom2-17.png)

