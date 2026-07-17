<%@ page import="java.sql.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pinjam Buku</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Form Peminjaman Buku 📝</h2>
        <form action="proses_pinjam.jsp" method="POST">
            <label>Pilih Peminjam:</label><br>
            <select name="id_peminjam" required>
                <%
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
                    ResultSet rsP = conn.createStatement().executeQuery("SELECT * FROM peminjam");
                    while(rsP.next()){
                %>
                    <option value="<%= rsP.getString("id_peminjam") %>"><%= rsP.getString("nama_peminjam") %></option>
                <% } %>
            </select><br><br>

            <label>Pilih Buku:</label><br>
            <select name="id_buku" required>
                <%
                    ResultSet rsB = conn.createStatement().executeQuery("SELECT * FROM buku");
                    while(rsB.next()){
                %>
                    <option value="<%= rsB.getString("id_buku") %>"><%= rsB.getString("judul") %></option>
                <% } %>
            </select><br><br>
            
            <button type="submit" class="btn">Proses Pinjam</button>
            <a href="daftar_pinjam.jsp" class="btn" style="background-color: #7f8c8d;">Batal</a>
        </form>
    </div>
</body>
</html>
<% conn.close(); %>