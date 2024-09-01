import java.io.File;
import java.lang.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.courseDAO;
import dao.uploadDao;
import model.Course;
import model.Lect;
import util.DBConnection;

@WebServlet("/Edit")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

public class Edit extends HttpServlet {
 private static final long serialVersionUID = 1L;
 public static final String UPLOAD_DIR = "images";
 public String dbFileName = "";
 courseDAO cdao=new courseDAO();
 uploadDao upload=new uploadDao();
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String lectureEmail = request.getParameter("email");
     String  course_name=request.getParameter("course_name");
    
     Lect lecture = getLectureByEmail(lectureEmail);
     
      request.setAttribute("lecture", lecture);
      request.setAttribute("courseTitle", course_name);  
     response.sendRedirect("lecturesEditForm.jsp");  
      
      
 }

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     // Retrieve form parameters
	 
	 Connection con=DBConnection.openConnection();
	 courseDAO cdao=new courseDAO();
	 Course course=new Course();
	 int prev_course_id=Integer.parseInt(request.getParameter("prev_course_id"));
     String name = request.getParameter("name"); 
     
     String email = request.getParameter("email");
     String qualification = request.getParameter("qualification");
     String course_name=request.getParameter("course_name");
     course.setStart_date(request.getParameter("startDate"));	
	 course.setEnrollment_deadline(request.getParameter("deadLine"));
	 course.setCourse_title(course_name);
	 
     int course_id = cdao.getCourse_id(course_name); 
     course.setCourse_id(course_id);
     Part part = request.getPart("file");
     String fileName = extractFileName(part);
    
     String applicationPath = getServletContext().getRealPath("");
     String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
     System.out.println("applicationPath:" + applicationPath);
     File fileUploadDirectory = new File(uploadPath);
     if (!fileUploadDirectory.exists()) {
         fileUploadDirectory.mkdirs();
     }
     String savePath = uploadPath + File.separator + fileName;
     System.out.println("savePath: " + savePath);
     String sRootPath = new File(savePath).getAbsolutePath();
     System.out.println("sRootPath: " + sRootPath);
     part.write(savePath + File.separator);
     File fileSaveDir1 = new File(savePath);
      dbFileName = UPLOAD_DIR + File.separator + fileName;
     part.write(savePath + File.separator);
     
     boolean course_updated;
     if(course_id == prev_course_id) {
    	 try {
			updateLecture1( name, email, qualification, dbFileName, savePath,course_id);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
    	 
    	 cdao.updateDate(course);
    	 
         response.sendRedirect("lectures.jsp");
    	 
     }
    
     else {
    	 try {
			updateLecture2( name, email, qualification, dbFileName, savePath,course_id);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
    	 
    	 course_updated=upload.updateCourseMerged(course_id, "Yes") && upload.updateCourseMerged(prev_course_id, "No");
         cdao.updateDate(course);
        
         response.sendRedirect("lectures.jsp");
         
     }
 }

 private String extractFileName(Part part) {//This method will print the file name.
     String contentDisp = part.getHeader("content-disposition");
     String[] items = contentDisp.split(";");
     for (String s : items) {
         if (s.trim().startsWith("filename")) {
             return s.substring(s.indexOf("=") + 2, s.length() - 1);
         }
     }
     return "";
 }
 private Lect getLectureByEmail(String email) {
     Lect lecture = null;
     try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinelearningsystem", "root", "yoonthiri@2004")) {
    	    
         String sql = "SELECT * FROM lectures WHERE email=?";
         try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
             pstmt.setString(1, email);
             try (ResultSet rs = pstmt.executeQuery()) {
                 if (rs.next()) {
                     lecture = new Lect();
                     lecture.setName(rs.getString("name"));
                     lecture.setPassword(rs.getString("password"));
                     lecture.setEmail(rs.getString("email"));
                     lecture.setQualification(rs.getString("qualification"));
                     lecture.setFilename(rs.getString("filename")); // Update filename
                     lecture.setPath(rs.getString("path"));
                     lecture.setCourse_id(rs.getInt("course_id"));
                    
                 }
             }
         }
     } catch (SQLException e) {
         // Handle database errors
         e.printStackTrace();
     }
     return lecture;
 }

 private boolean updateLecture1(String name, String email, String qualification, String filename, String path,int course_id) throws SQLException {
	    boolean updated = false;
	    Connection connection = null;
	    try {
	        connection = DBConnection.openConnection();
	        String sql = "UPDATE lectures SET name=?, email=?, qualification=?, filename=?, path=?,course_id=? WHERE email=?";
	        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
	            pstmt.setString(1, name); // Updated lecture name
	            
	            pstmt.setString(2, email);
	            pstmt.setString(3, qualification);
	            pstmt.setString(4, filename);
	            pstmt.setString(5, path);
	            pstmt.setInt(6, course_id);
	            pstmt.setString(7, email);
	            
	            int rowsAffected = pstmt.executeUpdate();
	            updated=rowsAffected>0;
	        }
	    } finally {
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                
	                e.printStackTrace();
	            }
	        }
	    }
	    return updated;
	}

	    
private boolean updateLecture2(String name, String email, String qualification, String filename, String path,int course_id) throws SQLException {
    boolean updated = false;
    Connection connection = null;
    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost/onlinelearningsystem", "root", "yoonthiri@2004");
        String sql = "UPDATE lectures SET name=?,  email=?, qualification=?, filename=?, path=?,course_id=? WHERE email=?";
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, name);
            
            pstmt.setString(2, email);
            pstmt.setString(3, qualification);
            pstmt.setString(4, filename);
            pstmt.setString(5, path);
            pstmt.setInt(6, course_id);
            pstmt.setString(7, email);
            
            int rowsAffected = pstmt.executeUpdate();
            updated = rowsAffected > 0;
            
        }
    } catch(Exception e) {
    	e.printStackTrace();
    }
    return updated;
}

    }
