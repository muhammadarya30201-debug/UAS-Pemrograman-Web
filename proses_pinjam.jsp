<%@ page import="java.sql.*" %>
<%
    String id_buku = request.getParameter("id_buku");
    String id_peminjam = request.getParameter("id_peminjam");

    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
        String sql = "INSERT INTO transaksi (id_buku, id_peminjam, tanggal_pinjam, status) VALUES (?, ?, CURDATE(), 'Dipinjam')";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id_buku);
        stmt.setString(2, id_peminjam);
        stmt.executeUpdate();
        
        conn.close();
        out.println("<script>alert('Buku berhasil dipinjam! 🔥'); window.location.href='daftar_pinjam.jsp';</script>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>