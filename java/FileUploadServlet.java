  
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
import model.User;

@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)

public class FileUploadServlet extends HttpServlet {
    /*
     create images folder at, C:\Users\Dharmesh Mourya\Documents\NetBeansProjects\ImageProject\build\web\images
     */
	UserDAO udao=null;
	RequestDispatcher d = null; 
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String  course_name=request.getParameter("course_name");
        PrintWriter out = response.getWriter();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        int course_id = -1; // Initialize with a default value

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
            // Handle database errors
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            // Close resources
            try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
        }
       
        
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String qualification = request.getParameter("qualification");
        
        Part part = request.getPart("file");
        String fileName = extractFileName(part);//file name
       /**
         * *** Get The Absolute Path Of The Web Application ****
         */
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
        /*if you may have more than one files with same name then you can calculate some random characters
         and append that characters in fileName so that it will  make your each image name identical.*/
        dbFileName = UPLOAD_DIR + File.separator + fileName;
        part.write(savePath + File.separator);
        //out.println(id+" "+firstName+" "+lastName+" "+fileName+" "+savePath);
        /*
         You need this loop if you submitted more than one file
         for (Part part : request.getParts()) {
         String fileName = extractFileName(part);
         part.write(savePath + File.separator + fileName);
         }*/
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
            PreparedStatement pst = con.prepareStatement("insert into lectures values(?,?,?,?,?,?,?)");
           
            pst.setString(1, name);
            pst.setString(2, password);
            pst.setString(3, email);
            pst.setString(4, qualification);
            pst.setString(5, dbFileName);
            pst.setString(6, savePath);
            pst.setInt(7, course_id);
            pst.executeUpdate();
            d = request.getRequestDispatcher("/lectures.jsp");
            d.forward(request, response);
          
        } catch (Exception e) {
            out.println(e);
        }

    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"

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
}