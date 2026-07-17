<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tambah Peminjam</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Tambah Data Peminjam 👥</h2>
        <form action="proses_tambah_peminjam.jsp" method="POST">
            <label>Nama Peminjam:</label><br>
            <input type="text" name="nama" required><br><br>
            
            <label>NIM:</label><br>
            <input type="text" name="nim" required><br><br>
            
            <label>Jurusan:</label><br>
            <input type="text" name="jurusan" required><br><br>
            
            <button type="submit" class="btn">Simpan Peminjam</button>
            <a href="peminjam.jsp" class="btn" style="background-color: #7f8c8d;">Batal</a>
        </form>
    </div>
</body>
</html>