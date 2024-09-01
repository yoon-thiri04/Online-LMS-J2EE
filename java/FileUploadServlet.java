  
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.UserDAO;
import dao.courseDAO;
import dao.uploadDao;
import model.Course;
import model.User;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {
    
	UserDAO udao=null;
	RequestDispatcher d = null; 
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    uploadDao upload=new uploadDao();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String  course_name=request.getParameter("course_name");
        PrintWriter out = response.getWriter();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int course_id = -1; 
        
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
            
            String query = "SELECT course_id FROM courses WHERE title = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, course_name);
            rs = stmt.executeQuery();
            if (rs.next()) {
                course_id = rs.getInt("course_id");
            }
        } catch (SQLException e) {
          
        } catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} finally {
           
            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
        }
       
        
        String name = request.getParameter("name");
       
        String email = request.getParameter("email");
        String qualification = request.getParameter("qualification");
        
        courseDAO cdao=new courseDAO();
        Course course=new Course();
        course.setStart_date(request.getParameter("startDate"));	
	    course.setEnrollment_deadline(request.getParameter("deadLine"));
	    course.setCourse_id(course_id);
	    if(cdao.updateDate(course)) {
	    	System.out.print("Success update");
	    }
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
        String sRootPath = new File(savePath).getAbsolutePath();
        part.write(savePath + File.separator);
        File fileSaveDir1 = new File(savePath);
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
            PreparedStatement pst = con.prepareStatement("insert into lectures values(?,?,?,?,?,?,?)");
           
            pst.setString(1, name);
            pst.setString(2, "lect@123!");
            pst.setString(3, email);
            pst.setString(4, qualification);
            pst.setString(5, dbFileName);
            pst.setString(6, savePath);
            pst.setInt(7, course_id);
            pst.executeUpdate();
            
          
        } catch (Exception e) {
            out.println(e);
        }
        if(upload.updateCourseMerged(course_id,"Yes")) {
        d = request.getRequestDispatcher("/lectures.jsp");
        d.forward(request, response);
        }
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}