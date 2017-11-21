<h1 align="center"><img src="image/Odoo_Official_Logo.png"></h1>
<h1 align="center">Instalasi Odoo</h1>

# Apa itu Odoo?
[`^ kembali ke atas ^`](#)

Odoo ialah satu aplikasi Enterprise Resource Planning (ERP) open source yang dimana berfungsi sebagai suatu sistem manajerial perusahaan yang saling terintegrasi, fleksibilitas tinggi, dan telah dipergunakan diberbagai perusahaan besar didunia.	 

Dengan berbagai modul yang telah tersedia pada Odoo yang telah terstruktur berisi kode XML, bahasa Python, dan komponen web menggunakan Javascript.  Serta dilengkapi dengan Database Management System menggunakan PostgreSQL.

Kemudahannya yang didapat dari Odoo sendiri dibandingkan Software Enterprise lainnya dari komprehensifnya fungsi dan fitur yang didapatkan, sehingga memudahkan dalam kostumisasi sesuai dengan kebutuhan yang diinginkan.
	
[Official Web](https://www.odoo.com),  [Demo](https://demo3.odoo.com/web#home),  [Source Code](https://github.com/odoo/odoo)


# Instalasi
[`^ kembali ke atas ^`](#)

#### Kebutuhan Sistem :
- Unix, Linux atau Windows.
- Python 3.5+
- PostgreSQL
- RAM minimal 64 Mb+


#### Persiapan Server Virtual
Pada tutorial ini, instalasi dilakukan pada Server Virtual Ubuntu di Virtualbox. Jika anda ingin menggunakan server virtual, anda bisa mengikuti langkah berikut.

1. Install dan jalankan [Virtual Box](https://www.virtualbox.org/wiki/Downloads) 

2. [Download](https://www.ubuntu.com/download/server), [install](http://www.tecmint.com/installation-of-ubuntu-16-04-server-edition/) dan jalankan Ubuntu Server pada Virtual Box

3. Setting Port Forwading pada Virtual Box. Masuk ke '*Settings -> Network -> Advanced -> Port Forwarding*'

	Name   | Protocol   | Host IP    | Host Port  | Guest IP   | Guest Port
	----   | --------   | -------    | ---------  | --------   | ----------
	http   | TCP        |            | 8888       |            | 80
	ssh    | TCP        |            | 2222       |            | 22

4. Remote server menggunakan SSH. Untuk pengguna Windows dapat menggunakan [PUTTY](http://www.putty.org/)
    ```
    $ ssh student@localhost -p 2222
    ```
    Dengan `student` adalah user pada server, 2222 adalah Host Port SSH ke server


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
    

#### Menjalankan Odoo pada browser
1. Tambahkan*port forwarding* dengan ketentuan sebagai berikut:

    Name   | Protocol   | Host IP    | Host Port  | Guest IP   | Guest Port
    ----   | --------   | -------    | ---------  | --------   | ----------
    odoo   | TCP        |            | 8069       |            | 8069

2. Buka browser dan akses `http://localhost:8069/`


# Konfigurasi
[`^ kembali ke atas ^`](#)


# Maintenance
[`^ kembali ke atas ^`](#)

Maintenance merupakan salah satu fitur dari Odoo, karena Odoo terdiri dari beberapa modul yang bisa dicustomize sesuai kebutuhan pengguna ataupun perusahaan. Dalam penyesuaian tersebut tak jarak dilakukan pada backend atau baris kode, sehingga memungkinkan terjadinya error. Untuk mengidentifikasi dan menampilkan error, maka kita aktifkan Developer Mode.
##### 1. Pilih Settings
Pada menu bagian atas, silahkan pilih menu **Settings** (yang dilingkari merah).
![Pilih menu setting](image/odoo-settings.png)
##### 2. Pilih Activate the developer mode
Setelah memilih menu **Setting**, maka akan ditampilkan halaman seperti gambar dibawah ini. Pada bagian bawah terdapat dua buah menu yakni **Activate the developer mode** dan **Activate the developer mode (with assets)**.
![Activate developer mode](image/odoo-settings2.png)
##### 3. Terjadi perubahan pada URL
Jika sukses masuk pada **Developer mode**, bisa dilihat pada bagian URL seperti gambar di bawah ini. Kalau ada kata **debug** maka artinya proses telah berhasil
![Developer mode sukses](image/odoo-settings3.png)


# Otomatisasi
[`^ kembali ke atas ^`](#)


# Cara Pemakaian
[`^ kembali ke atas ^`](#)

Cara menggunakan Odoo sebenarnya mudah. Odoo membagi proses bisnis menjadi beberapa bagian yang dapat dimanajemen oleh pengguna. Bahkan dari proses bisnis tersebut dibagi lagi ke dalam sub-bagian, sehingga pengguna dapat sementara mengalihkan gambaran besar dalam dalam bagian kecil yang lebih mudah dimanajemen.
##### 1. Login ke halaman Odoo
Masuk ke halaman administrasi Odoo melalui web browser pada alamat [localhost:8069](http://localhost:8080) dengan dengan akun default email: **admin** dan password: **admin**.
![Login screen](image/1.usage-login.png)
##### 2. Halaman administrasi Odoo
Jika berhasil masuk, maka Odoo secara otomatis akan mengarahkan ke halaman #inbox seperti pada gambar di bawah ini:
![Halaman #inbox](image/2.usage-inbox.png)
Halaman #inbox secara default menampilkan ringkasan dari kotak masuk yang dimiliki oleh pengguna. 
##### 3. Baris menu utama
Pada baris menu atas, terdapat kumpulan menu utama yang terdiri dari **Discuss**, **Calendar**, **Contacts**, **CRM**, **Apps**, dan **Setting**.
##### 4. Discuss
![Halaman Discuss](image/3.usage-inbox-conversation.png)
Menu **Discus** menyediakan layanan untuk berkomunikasi dengan orang lain, termasuk percakapan melalui direct **message**, **channel**, dan **private channel**. Pada bilah sisi sebelah kanan, juga terdapat **Channel** yang berfungsi seperti *chat room*.
##### 5. Calendar
![Halaman Calendar](image/4.usage-calendar.png)
Menu **Calendar** menampilkan halaman agenda harian, bulanan, dan tahunan. Agenda dapat ditampilkan dalam bentuk kalendar maupun daftar kegiatan yang akan dilaksanakan. Odoo dapat memfasilitasi pengguna untuk melakukan kolaborasi dalam menggunakan calendar ini.
##### 6. Contacts
![Halaman Contacts](image/5.usage-contacts.png)
Menu **Contacts** menampilkan daftar kontak yang dimiliki oleh pengguna. Dari halaman ini pula menambah, meng*import*, mengubah, dan menghapus kontak.
##### 7. CRM
![Halaman CRM](image/6.usage-crm.png)
Menu **CRM** dalam halaman inilah inti dari penggunaan Odoo berada. *Consumer Relation Management* (**CRM**) dapat dijalankan melalui halaman ini. Secara *default* tampilan *pipeline*-lah yang dimunculkan, sehingga pengguna bisa lansung melihat gambaran besar dari peluang bisnis
##### 8. Apps
![Halaman Apps](image/7.usage-apps.png)
Menu **Apps** menampilkan keunggulan lain dari Odoo. Disinilah pengguna dapat menambahkan fitur-fitur yang dapat menunjang proses bisnis. Aplikasi yang ditawarkan dapat dipasang maupun dihilangkan tanpa harus mengubah instalasi inti Odoo.
##### 9. Settings
![Halaman Settings](image/8.usage-setting.png)
Menu **Settings** adalah tempat untuk melakukan konfigurasi utama dari Odoo. Mulai dari daftar aplikasi yang terinstall, implementasi optimal, sampai dengan melakukan alih bahasa sistem Odoo.


# Pembahasan
[`^ kembali ke atas ^`](#)

Odoo dibuat menggunakan bahasa pemrograman python, javascript, dan memanfaatkan XML sebagai webservice. Seperti yang sudah dijelaskan di awal Odoo merupakan aplikasi Enterprise Resource Planning (ERP). Di mana aplikasi ini berguna untuk mengorganisir atau memanajemen sumber daya perusahaan. Karena perkembangan yang begitu cepat saat ini Odoo telah mendukung 18 bahasa. Kelebihan lain dari odoo adalah didalamnya tersedia banyak modul yang bisa dimanfaatkan. Antara lain baik human resource, gaji karywan, inventory/asset perusahaan, dan masih banyak lagi. Selain itu ada modul blog untuk membuat artikel dan blog untuk perusahaan. Tidak semua modul langsung diinstall akan tetapi dapat disesuaikan dengan kebutuhan pengguna.

Berikut akan dijelaskan beberapa modul yang ada di dalam Odoo  :
a.	Contacts 
Modul ini digunakan untuk mendata karyawan ataupun perusahaan rekanan/vendor, beberapa atribut yang dimasukkan antara lain nama, alamat, nomor telepon, email, jabatan, bank account, 
b.	Customer Relationship Management (CRM)
CRM ini jika dilihat mirip dengan Trello, jadi nanti akan disediakan board nah masing-masing board dapat dipindah ke state tertentu. Cara kerjanya seperti pipeline. Misalnya ada keluhan nanti bisa dilihat progresnya, sudah sampai mana keluhan apakah keluhan tersebut sudah selesai ditanggapi atau belum. Sehingga pemilik state tahu apa yang harus dia kerjakan.
c.	Discuss
Digunakan untuk diskusi atau chatting, ada label general pada label general semua pengguna dapat melihat semua pesan yang ada didalamnya dan semua pengguna dapat membalasa pesan satu sama lain. Jika kita membuat sebuah tim cukup membuat grup baru dan hanya anggota yang diundang yang dapat melakukan diskusi (internal).  semacam Slack. 


Kelebihan Odoo?
- Data tiap modul lengkap dan saling terintegrasi
- Karena saling terintegrasi, redundansi dapat dihindari
- Multi Platform
- Akses informasi yang terpercaya
- Hemat waktu dan biaya, serta control yg mudah dalam skala Enterprise

Kekurangan Odoo?
- Kompleksitas pada konfigurasi tertentu menyulitkan pengguna
- Pengembangan Odoo sendiri menggunakan bahasa pemrograman Python, sehingga untuk beberapa kendala masih terbatas informasinya
- Karena dikembangkan oleh komunitas, maka pengembangannya masi sering dalam hal perubahan serta perbaikan.


# Referensi
[`^ kembali ke atas ^`](#)
1. [Official Web](https://www.odoo.com) - Odoo
2. [Demo](https://demo3.odoo.com/web#home) - Odoo
3. [Source Code](https://github.com/odoo/odoo) - Odoo
4. [Persiapan Server Ubuntu Virtual](https://github.com/auriza/komdat-lab/blob/master/p01.md) - Auriza
5. [Odoo Installation](https://www.odoo.com/documentation/11.0/setup/install.html) - Odoo
6. [PostgreSQL Installation](https://www.postgresql.org/download/linux/ubuntu/) - PostgreSQL
