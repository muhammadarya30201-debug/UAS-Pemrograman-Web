# PerpustakaanWeb

Project UAS Pemrograman Web.

## Cara Menjalankan:
1. Pastikan Apache Tomcat 10 terinstall.
2. Pastikan MySQL berjalan di port 3310.
3. Import database `perpustakaan_db`.
4. Copy folder project ke `webapps` Tomcat dan jalankan server.

# Perpustakaan Web (UAS)

Aplikasi manajemen perpustakaan sederhana berbasis Java Server Pages (JSP) dan Apache Tomcat.

## 🛠️ Prasyarat (Requirements)
Sebelum menjalankan aplikasi, pastikan komputer Anda telah terinstall:
- [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/downloads/)
- [Apache Tomcat 10](https://tomcat.apache.org/)
- [XAMPP](https://www.apachefriends.org/index.html) (Untuk Database MySQL)

## 🚀 Cara Menjalankan

1. **Clone Repository**
   Buka terminal/command prompt dan ketik:
   `git clone https://github.com/muhammadarya30201-debug/UAS-Pemrograman-Web.git`

2. **Database Setup**
   - Buka XAMPP Control Panel, jalankan **Apache** dan **MySQL**.
   - Buka `localhost/phpmyadmin`.
   - Buat database dengan nama `perpustakaan_db`.
   - Import file `perpustakaan_db.sql` (jika ada) atau pastikan tabel sudah sesuai dengan koneksi di `koneksi.jsp`.

3. **Deploy ke Tomcat**
   - Copy folder project `PerpustakaanWeb` ke dalam folder `webapps` di direktori instalasi Tomcat Anda.
   - Contoh path: `C:\Program Files\Apache Software Foundation\Tomcat 10.0\webapps\`

4. **Jalankan Aplikasi**
   - Buka folder `bin` di direktori Tomcat, jalankan `startup.bat`.
   - Buka browser, akses alamat: `http://localhost:8080/PerpustakaanWeb`