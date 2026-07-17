<%@ page import="java.sql.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Buku - Perpustakaan Web</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h2>Daftar Buku Perpustakaan 📚</h2>
        
        <div style="margin-bottom: 20px;">
            <form action="index.jsp" method="GET">
                <input type="text" name="cari" placeholder="Cari judul buku...">
                <button type="submit" class="btn" style="background-color: #3498db;">Cari</button>
                <a href="index.jsp" class="btn" style="background-color: #7f8c8d;">Reset</a>
            </form>
        </div>

        <a href="tambah.jsp" class="btn">+ Tambah Buku Baru</a>
        <a href="peminjam.jsp" class="btn" style="background-color: #9b59b6;">Data Peminjam</a>
        <a href="daftar_pinjam.jsp" class="btn" style="background-color: #e67e22;">Daftar Pinjam</a>

        <table>
            <tr>
                <th>No</th>
                <th>Judul Buku</th>
                <th>Pengarang</th>
                <th>Penerbit</th>
                <th>Tahun</th>
                <th>Aksi</th>
            </tr>
            <%
                try {
                    // Load driver MySQL
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    // Koneksi ke Database
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
                    
                    String cari = request.getParameter("cari");
                    String sql;
                    PreparedStatement stmt;

                    if (cari != null && !cari.trim().equals("")) {
                        sql = "SELECT * FROM buku WHERE judul LIKE ? ORDER BY id_buku DESC";
                        stmt = conn.prepareStatement(sql);
                        stmt.setString(1, "%" + cari + "%");
                    } else {
                        sql = "SELECT * FROM buku ORDER BY id_buku DESC";
                        stmt = conn.prepareStatement(sql);
                    }

                    ResultSet rs = stmt.executeQuery();
                    int no = 1;
                    while(rs.next()) {
            %>
            <tr>
                <td><%= no++ %></td>
                <td><%= rs.getString("judul") %></td>
                <td><%= rs.getString("pengarang") %></td>
                <td><%= rs.getString("penerbit") %></td>
                <td><%= rs.getString("tahun_terbit") %></td>
                <td>
                    <a href="edit.jsp?id=<%= rs.getString("id_buku") %>" class="btn-edit">Edit</a>
                    <a href="hapus.jsp?id=<%= rs.getString("id_buku") %>" class="btn-hapus" onclick="return confirm('Yakin hapus?')">Hapus</a>
                </td>
            </tr>
            <% 
                    } 
                    conn.close(); // Tutup koneksi
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error database: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
    </div>
</body>
</html>