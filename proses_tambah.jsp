<%@ page import="java.sql.*" %>
<%
    // 1. Ambil data yang diketik di form tadi
    String judul = request.getParameter("judul");
    String pengarang = request.getParameter("pengarang");
    String penerbit = request.getParameter("penerbit");
    String tahun = request.getParameter("tahun");

    // 2. Info koneksi database lu (Pakai port 3310)
    String url = "jdbc:mysql://localhost:3310/perpustakaan_db";
    String username = "root";
    String password = "";

    try {
        // 3. Buka koneksi ke MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, username, password);

        // 4. Siapin perintah SQL buat masukin data
        String sql = "INSERT INTO buku (judul, pengarang, penerbit, tahun_terbit) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, judul);
        stmt.setString(2, pengarang);
        stmt.setString(3, penerbit);
        stmt.setString(4, tahun);

        // 5. Eksekusi penyimpanan!
        stmt.executeUpdate();
        
        // 6. Tutup pintu koneksi
        stmt.close();
        conn.close();

        // 7. Kalau sukses, munculin popup dan balikin ke halaman awal
        out.println("<script>alert('Mantap Bro! Buku berhasil disimpan! 🔥'); window.location.href='index.jsp';</script>");

    } catch (Exception e) {
        // Kalau gagal, kasih tau errornya apa
        out.println("<h3>Waduh, Gagal simpan data: " + e.getMessage() + "</h3>");
    }
%>