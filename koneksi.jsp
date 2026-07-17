<%@ page import="java.sql.*" %>
<%
    // KITA PAKAI PORT 3310 SESUAI KONDISI XAMPP LU BRO!
    String url = "jdbc:mysql://localhost:3310/perpustakaan_db"; 
    String username = "root";
    String password = ""; // Default XAMPP emang kosong
    Connection conn = null;

    out.println("<html><body>");
    
    try {
        // Manggil file .jar yang udah lu masukin di awal tadi
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Mencoba ngetuk pintu database
        conn = DriverManager.getConnection(url, username, password);
        out.println("<h2 style='color: green;'>BOOOM! Koneksi Database Sukses Bro! 🔥</h2>");
        out.println("<p>Java lu udah berhasil ngobrol sama MySQL.</p>");
        
    } catch (Exception e) {
        out.println("<h2 style='color: red;'>Waduh, Koneksi Gagal Bro!</h2>");
        out.println("<p>Errornya: " + e.getMessage() + "</p>");
    } finally {
        // Tutup pintu kalau udah selesai
        if (conn != null) {
            try { conn.close(); } catch (Exception ignore) {}
        }
    }
    
    out.println("</body></html>");
%>