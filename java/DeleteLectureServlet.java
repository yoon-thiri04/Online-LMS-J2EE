import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteLectureServlet")
public class DeleteLectureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve lectureId from request parameters
       String name=request.getParameter("lectureName");
        // Delete the lecture record from the database
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004")) {
            String sql = "DELETE FROM lectures WHERE name=?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, name);
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    // Lecture deleted successfully, redirect to dashboard or show success message
                    response.sendRedirect("lectures.jsp");
                } else {
                    // No rows affected, handle appropriately (e.g., show error message)
                }
            }
        } catch (SQLException e) {
            // Handle database errors
            e.printStackTrace();
            // Redirect or show error message
        }
    }
}
