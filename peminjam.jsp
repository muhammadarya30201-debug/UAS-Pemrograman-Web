<%@ page import="java.sql.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Peminjam</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Data Peminjam 👥</h2>
        <a href="tambah_peminjam.jsp" class="btn">+ Tambah Peminjam</a>
        <a href="index.jsp" class="btn" style="background-color: #7f8c8d;">Kembali ke Menu Utama</a>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Nama</th>
                <th>NIM</th>
                <th>Jurusan</th>
            </tr>
            <%
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
                ResultSet rs = conn.createStatement().executeQuery("SELECT * FROM peminjam");
                while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("id_peminjam") %></td>
                <td><%= rs.getString("nama_peminjam") %></td>
                <td><%= rs.getString("nim") %></td>
                <td><%= rs.getString("jurusan") %></td>
            </tr>
            <% } conn.close(); %>
        </table>
    </div>
</body>
</html>