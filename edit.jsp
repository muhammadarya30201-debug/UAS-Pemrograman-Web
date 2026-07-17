<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
    String sql = "SELECT * FROM buku WHERE id_buku = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setString(1, id);
    ResultSet rs = stmt.executeQuery();
    rs.next();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Buku</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Edit Data Buku 📝</h2>
        
        <form action="proses_edit.jsp" method="POST">
            <!-- Hidden ID agar database tahu data mana yang diupdate -->
            <input type="hidden" name="id" value="<%= rs.getString("id_buku") %>">
            
            <label>Judul Buku:</label><br>
            <input type="text" name="judul" value="<%= rs.getString("judul") %>" required><br><br>
            
            <label>Pengarang:</label><br>
            <input type="text" name="pengarang" value="<%= rs.getString("pengarang") %>" required><br><br>
            
            <label>Penerbit:</label><br>
            <input type="text" name="penerbit" value="<%= rs.getString("penerbit") %>" required><br><br>
            
            <label>Tahun Terbit:</label><br>
            <input type="number" name="tahun" value="<%= rs.getString("tahun_terbit") %>" required><br><br>
            
            <button type="submit" class="btn">Simpan Perubahan</button>
            <a href="index.jsp" class="btn" style="background-color: #7f8c8d;">Batal</a>
        </form>
    </div>
</body>
</html>
<% rs.close(); stmt.close(); conn.close(); %>