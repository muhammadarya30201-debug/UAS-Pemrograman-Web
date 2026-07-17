<%@ page import="java.sql.*" %>
<%
    String nama = request.getParameter("nama");
    String nim = request.getParameter("nim");
    String jurusan = request.getParameter("jurusan");

    try {
        // Ingat, tetep pakai port 3310 bro!
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3310/perpustakaan_db", "root", "");
        String sql = "INSERT INTO peminjam (nama_peminjam, nim, jurusan) VALUES (?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, nama);
        stmt.setString(2, nim);
        stmt.setString(3, jurusan);
        stmt.executeUpdate();
        
        stmt.close();
        conn.close();
        out.println("<script>alert('Peminjam berhasil ditambah!'); window.location.href='peminjam.jsp';</script>");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>