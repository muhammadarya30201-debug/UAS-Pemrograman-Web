# 📚 Sistem Informasi Perpustakaan Web (UAS)

Dokumentasi ini disusun untuk mempermudah proses evaluasi dan pengujian aplikasi **Perpustakaan Web**. Aplikasi ini dikembangkan sebagai pemenuhan tugas akhir (UAS) mata kuliah Pemrograman Web.

## 📝 Deskripsi Project
Aplikasi ini adalah sistem manajemen perpustakaan berbasis web yang dibangun menggunakan **Java Server Pages (JSP)** dan **Apache Tomcat**. Fitur utama mencakup pengelolaan data buku, anggota, dan transaksi peminjaman buku.

## ✨ Fitur Utama
- **Autentikasi User**: Sistem Login untuk membatasi akses (Admin/Petugas).
- **Manajemen Buku (CRUD)**: Menambah, mengedit, dan menghapus data koleksi buku.
- **Manajemen Anggota**: Pendataan anggota perpustakaan.
- **Sistem Peminjaman**: Pencatatan transaksi peminjaman dan pengembalian.

## 🛠️ Stack Teknologi
- **Bahasa**: Java (JSP)
- **Web Server**: Apache Tomcat 10.x
- **Database**: MySQL (MariaDB)
- **IDE**: Apache NetBeans
- **Library**: MySQL Connector/J

## 🚀 Panduan Instalasi & Deployment

### Opsi 1: Menggunakan Apache NetBeans (Direkomendasikan)
Cara ini paling efektif jika ingin melakukan pengujian atau modifikasi kode.
1. **Import Project**: Buka NetBeans, pilih `File > Open Project`, lalu arahkan ke folder `PerpustakaanWeb`.
2. **Server Configuration**: Pastikan Apache Tomcat 10 sudah terdaftar di NetBeans (`Tools > Servers`).
3. **Run**: Klik kanan pada project, pilih `Run`. NetBeans akan otomatis mengompilasi dan menjalankan aplikasi di browser.

### Opsi 2: Deployment Manual (Tanpa IDE)
Cara ini digunakan jika ingin menjalankan aplikasi langsung melalui server Tomcat.
1. **Database**: Pastikan XAMPP berjalan, buka `localhost/phpmyadmin`, lalu import `perpustakaan_db.sql` ke database `perpustakaan_db`.
2. **Copy Project**: Copy folder `PerpustakaanWeb` ke direktori `webapps` milik Tomcat (contoh: `C:\Program Files\Apache Software Foundation\Tomcat 10.0\webapps\`).
3. **Start Server**: Jalankan `startup.bat` pada folder `bin` direktori Tomcat.
4. **Access**: Buka browser dan akses `http://localhost:8080/PerpustakaanWeb`.

## 🛠️ Troubleshooting & Tips
Jika aplikasi tidak berjalan, periksa hal berikut:

*   **Masalah Koneksi Database**: Aplikasi ini dikonfigurasi menggunakan **MySQL Port 3310**. Jika Anda menggunakan port default (3306), silakan sesuaikan variabel port pada file `koneksi.jsp` di folder `WEB-INF`.
*   **Database Error**: Pastikan nama database pada file `koneksi.jsp` sudah sesuai dengan nama database yang Anda import di phpMyAdmin (`perpustakaan_db`).
*   **Library Missing**: Jika project tidak bisa di-build, pastikan file `mysql-connector-j-xxx.jar` sudah terpasang di folder `WEB-INF/lib`.

---
*Dibuat oleh: [Nama Kamu] - [NIM Kamu]*