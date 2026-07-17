<%@ page import="java.sql.*" %>
<%
    String id_transaksi = request.getParameter("id");

    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
        String sql = "UPDATE transaksi SET status = 'Dikembalikan' WHERE id_transaksi = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id_transaksi);
        stmt.executeUpdate();
        
        conn.close();
        out.println("<script>alert('Buku berhasil dikembalikan! ✅'); window.location.href='daftar_pinjam.jsp';</script>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>