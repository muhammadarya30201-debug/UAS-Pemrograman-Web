<%@ page import="java.sql.*" %>
<%
    // Tangkap data baru dari form
    String id_buku = request.getParameter("id_buku");
    String judul = request.getParameter("judul");
    String pengarang = request.getParameter("pengarang");
    String penerbit = request.getParameter("penerbit");
    String tahun = request.getParameter("tahun");

    // Koneksi ke port 3310
    String url = "jdbc:mysql://localhost:3310/perpustakaan_db";
    String username = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // Perintah SQL buat UPDATE data
        String sql = "UPDATE buku SET judul=?, pengarang=?, penerbit=?, tahun_terbit=? WHERE id_buku=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, judul);
        stmt.setString(2, pengarang);
        stmt.setString(3, penerbit);
        stmt.setString(4, tahun);
        stmt.setString(5, id_buku);

        stmt.executeUpdate();
        
        stmt.close();
        conn.close();

        // Lempar notif sukses dan balik ke index
        out.println("<script>alert('Sedap! Data buku berhasil di-update! 🚀'); window.location.href='index.jsp';</script>");

    } catch (Exception e) {
        out.println("<h3>Waduh, Gagal update data: " + e.getMessage() + "</h3>");
    }
%>