<%@ page import="java.sql.*" %>
<%
    // 1. Tangkap ID buku yang mau dihapus dari tombol tadi
    String id_buku = request.getParameter("id");

    // 2. Setup koneksi database (Ingat, pakai port 3310 lu!)
    String url = "jdbc:mysql://localhost:3310/perpustakaan_db";
    String username = "root";
    String password = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // 3. Perintah SQL buat ngehapus data berdasarkan ID
        String sql = "DELETE FROM buku WHERE id_buku = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id_buku);
        
        // 4. Eksekusi eksekusi!
        stmt.executeUpdate();

        stmt.close();
        conn.close();

        // 5. Kalau udah kehapus, langsung lempar balik ke halaman depan
        response.sendRedirect("index.jsp");

    } catch (Exception e) {
        out.println("<h3>Waduh, Gagal hapus data bro: " + e.getMessage() + "</h3>");
    }
%>