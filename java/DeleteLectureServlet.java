import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.uploadDao;

@WebServlet("/DeleteLectureServlet")
public class DeleteLectureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    RequestDispatcher dispatcher=null;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve lectureId from request parameters
       String email=request.getParameter("email");
       int course_id=Integer.parseInt(request.getParameter("course_id"));
       uploadDao udao=new uploadDao();
       udao.updateCourseMerged(course_id, "No");
        // Delete the lecture record from the database
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004")) {
            String sql = "DELETE FROM lectures WHERE email=?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, email);
                int rowsAffected = pstmt.executeUpdate();
                if (rowsAffected > 0) {
                    dispatcher=request.getRequestDispatcher("/lectures.jsp");
                    dispatcher.forward(request, response);
                   
                } else {
                    
                }
            }
        } catch (SQLException e) {
            
            e.printStackTrace();
            
        }
        udao.deleteEnrollment(course_id);
    }
}
