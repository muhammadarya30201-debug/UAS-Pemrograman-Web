<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tambah Buku</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Tambah Data Buku 📚</h2>
        <form action="proses_tambah.jsp" method="POST">
            <label>Judul Buku:</label><br>
            <input type="text" name="judul" required><br><br>
            
            <label>Pengarang:</label><br>
            <input type="text" name="pengarang" required><br><br>
            
            <label>Penerbit:</label><br>
            <input type="text" name="penerbit" required><br><br>
            
            <label>Tahun Terbit:</label><br>
            <input type="number" name="tahun" required><br><br>
            
            <button type="submit" class="btn">Simpan Buku</button>
            <a href="index.jsp" class="btn" style="background-color: #7f8c8d;">Batal</a>
        </form>
    </div>
</body>
</html>