<%@ page import="java.sql.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daftar Peminjaman</title>
    <link rel="stylesheet" href="style.css">
    <style>
        /* CSS tambahan buat mempercantik badge status */
        .badge { padding: 5px 10px; border-radius: 4px; font-size: 12px; font-weight: bold; }
        .badge-dipinjam { background-color: #f1c40f; color: #fff; } /* Kuning */
        .badge-selesai { background-color: #2ecc71; color: #fff; } /* Hijau */
    </style>
</head>
<body>
    <div class="container">
        <h2>Daftar Peminjaman Buku 📚</h2>
        
        <a href="pinjam_buku.jsp" class="btn">+ Pinjam Baru</a> 
        <a href="index.jsp" class="btn" style="background-color: #7f8c8d;">Menu Utama</a>
        
        <table>
            <tr>
                <th>ID</th>
                <th>Peminjam</th>
                <th>Buku</th>
                <th>Tgl Pinjam</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
            <%
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
                String sql = "SELECT t.*, b.judul, p.nama_peminjam FROM transaksi t JOIN buku b ON t.id_buku = b.id_buku JOIN peminjam p ON t.id_peminjam = p.id_peminjam";
                ResultSet rs = conn.createStatement().executeQuery(sql);
                while(rs.next()) {
                    String status = rs.getString("status");
            %>
            <tr>
                <td><%= rs.getString("id_transaksi") %></td>
                <td><%= rs.getString("nama_peminjam") %></td>
                <td><%= rs.getString("judul") %></td>
                <td><%= rs.getString("tanggal_pinjam") %></td>
                <td>
                    <% if(status.equals("Dipinjam")) { %>
                        <span class="badge badge-dipinjam">Dipinjam</span>
                    <% } else { %>
                        <span class="badge badge-selesai">Dikembalikan</span>
                    <% } %>
                </td>
                <td>
                    <% if(status.equals("Dipinjam")) { %>
                        <a href="proses_kembali.jsp?id=<%= rs.getString("id_transaksi") %>" class="btn-hapus" onclick="return confirm('Yakin buku ini mau dikembalikan?')">Kembalikan</a>
                    <% } else { %>
                        <span style="color: #95a5a6;">Selesai</span>
                    <% } %>
                </td>
            </tr>
            <% } conn.close(); %>
        </table>
    </div>
</body>
</html>