<h1 align="center"><img src="https://raw.githubusercontent.com/albertbrucelee/odoo/master/image/Odoo_Official_Logo.png"></h1>
<h1 align="center">Instalasi Odoo</h1>

# Apa itu Odoo?
[`^ kembali ke atas ^`](#)

**Odoo** 
Kenapa Odoo?
	Sebelumnya, Odoo ialah satu aplikasi Enterprise Resource Planning (ERP) open source yang dimana berfungsi sebagai suatu sistem manajerial perusahaan yang saling terintegrasi, fleksibilitas tinggi, dan telah dipergunakan diberbagai perusahaan besar didunia.	 
	Dengan berbagai modul yang telah tersedia pada Odoo yang telah terstruktur berisi kode XML, bahasa Python, dan komponen web menggunakan Javascript.  Serta dilengkapi dengan Database Management System menggunakan PostgreSQL.
	Kemudahannya yang didapat dari Odoo sendiri dibandingkan Software Enterprise lainnya dari komprehensifnya fungsi dan fitur yang didapatkan, sehingga memudahkan dalam kostumisasi sesuai dengan kebutuhan yang diinginkan.

Kelebihan Odoo?

•	Data tiap modul lengkap dan saling terintegrasi

•	Karena saling terintegrasi, redundansi dapat dihindari

•	Multi Platform

•	Akses informasi yang terpercaya

•	Hemat waktu dan biaya, serta control yg mudah dalam skala Enterprise

Kekurangan Odoo?

•	Kompleksitas pada konfigurasi tertentu menyulitkan pengguna
•	Pengembangan Odoo sendiri menggunakan bahasa pemrograman Python, sehingga untuk beberapa kendala masih terbatas informasinya
•	Karena dikembangkan oleh komunitas, maka pengembangannya masi sering dalam hal perubahan serta perbaikan.


[Official Web](https://www.odoo.com),  [Demo](https://demo3.odoo.com/web#home),  [Source Code](https://github.com/odoo/odoo)

#### Lisensi:
`LGPLv3` `Python`


# Instalasi
[`^ kembali ke atas ^`](#)

#### Kebutuhan Sistem :


#### Persiapan Server Virtual
Jika anda ingin menggunakan server virtual, anda bisa mengikuti langkah berikut.




#### Instalasi Default:
Instalasi ini akan menginstall Odoo versi 11.0

1. Login ke server menggunakan SSH

2. Masuk ke root
    ```
    $ sudo su
    ```
3. Tambahkan key PPA Odoo
    ```
    # wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
    ```
4. Tambahkan Odoo Repository
    ```
    # echo "deb http://nightly.odoo.com/11.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
    ```
5. Update paket Sistem dan install Odoo
    ```
    # apt-get update && apt-get install odoo
    ```
6. Jalankan Odoo
    ```
    # service odoo start
    ```
7. Jika ingin upgrade Odoo
    ```
    # apt-get upgrade
    ```
8. Jika ingin mengubah konfigurasi Odoo. Lebih lanjut tentang file konfigurasi Odoo:
[Konfigurasi Odoo](https://www.odoo.com/documentation/11.0/reference/cmdline.html#reference-cmdline-config)
    ```
    # nano /etc/odoo/odoo.conf
    ```
    Restart Odoo setelah mengubah file konfigurasi
    ```
    # service odoo restart
    ```

#### Instalasi Advance
Instalasi advance merupakan instalasi menggunakan source kode Odoo. Instalasi ini digunakan control Odoo yang lebih lanjut, pengembangan modul Odoo sesuai kebutuhan, dan dapat menjalankan beberapa versi yang berbeda sekaligus.

1. Login ke server menggunakan SSH
2. Download (clone) source kode Odoo
    ```
    $ git clone https://github.com/odoo/odoo.git
    ```
3. Install Python 3.5 (harus versi 3.5 ke atas)
    ```
    $ sudo apt-get update
    $ sudo apt-get install python3
    ```
4. Install PostgreSQL untuk database (sesuaikan versi Ubuntu) 
Lebih Lanjut: [PostgreSQL Installation](https://www.postgresql.org/download/linux/ubuntu/)
    ```
    $ deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main
    $ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    $ sudo apt-get update
    $ sudo apt-get install postgresql-9.6
    ```
5. Buat user (role) baru pada PostgreSQL
    ```
    sudo su - postgres -c "createuser -s $USER"
    ```
    `$USER` adalah unix login anda. Ganti `$USER` jika ingin membuat user yang berbeda, seperti `student`
6. Install Python Depedencies
    ```
    $ pip3 install -r requirements.txt
    ```
7. Install Less CSS via nodejs
    ```
    $ sudo apt-get install -y npm
    $ sudo ln -s /usr/bin/nodejs /usr/bin/node
    ```
8. Jalankan Odoo
    ```
    $ ./odoo-bin --addons-path=addons,../mymodules --db-filter=mydb$
    ```
    dimana `../mymodules` adalah direktori addons tambahan, dan `mydb` adalah default db yang akan digunakan
    

# Konfigurasi


# Maintenance


# Otomatisasi


# Cara Pemakaian


# Pembahasan


# Referensi
[`^ kembali ke atas ^`](#)
1. [Official Web](https://www.odoo.com) - Odoo
2. [Demo](https://demo3.odoo.com/web#home) - Odoo
3. [Source Code](https://github.com/odoo/odoo) - Odoo
4. [Persiapan Server Ubuntu Virtual](https://github.com/auriza/komdat-lab/blob/master/p01.md) - Auriza
5. [Odoo Installation](https://www.odoo.com/documentation/11.0/setup/install.html) - Odoo
6. [PostgreSQL Installation](https://www.postgresql.org/download/linux/ubuntu/) - PostgreSQL
