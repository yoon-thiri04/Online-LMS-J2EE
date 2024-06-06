package controller;
import model.Material;


import model.Submission;
import dao.UserDAO;
import dao.submitDAO;
import dao.uploadDao;
import util.DBConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.lang.*;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class SubmissionController
 */
@WebServlet("/SubmissionController")
@MultipartConfig(maxFileSize = 52428800)
public class SubmissionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    submitDAO sdao=new submitDAO();
    uploadDao mDAO=null;
    RequestDispatcher dispatcher=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmissionController() {
        mDAO=new uploadDao();
    }

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
	    
	    switch(action) {
	    

	    case "DOWNLOAD":
	      try {
	        downSubmission(request, response);
	      } catch (ServletException | IOException e) {
	        
	        e.printStackTrace();
	      }
	    break;
		}
	}
	private void downSubmission(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       String stitle=request.getParameter("title");
        
        String f_type=request.getParameter("f_type");
        int id=Integer.parseInt(request.getParameter("id"));
        
        try {
        Connection con=DBConnection.openConnection();
        
        String sql = "SELECT file FROM submission WHERE submission_id = ?";
          PreparedStatement statement = con.prepareStatement(sql);
          statement.setInt(1,id);
          ResultSet resultSet = statement.executeQuery();

          if (resultSet.next()) {
              
              Blob blob = resultSet.getBlob("file");
              InputStream inputStream = blob.getBinaryStream();
              response.setContentType("application/octet-stream");
              response.setHeader("Content-Disposition", "attachment; filename=\"" + stitle + "." + f_type + "\"");

              OutputStream outputStream = response.getOutputStream();
              byte[] buffer = new byte[4096];
              int bytesRead = -1;
              while ((bytesRead = inputStream.read(buffer)) != -1) {
                  outputStream.write(buffer, 0, bytesRead);
              }
 
              inputStream.close();
              outputStream.close();
          }
        }catch(SQLException e) {
          e.printStackTrace();
        }
     }
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Connection conn=null;
	     PreparedStatement pstmt = null;
	     String title=request.getParameter("title");
	     
	     Date tdyDate=new Date();
	     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        
	     String date = sdf.format(tdyDate);
	    
	     String status="Submitted for Evaluation";
	     
	     int id=Integer.parseInt(request.getParameter("mat_id"));
	     System.out.print(id);
	     HttpSession session=request.getSession(false);
	     int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
	     String userEmail = (String) session.getAttribute("stuEmail"); 
	     UserDAO udao=new UserDAO();
	     String studname=udao.getName(userEmail);
	     int score=0;
	     String comment=null;
	     Part filePart = request.getPart("myfile");
	     String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	     String f_type = "";
	     int dotIndex = fileName.lastIndexOf('.');
	     if (dotIndex > 0) {
	         f_type = fileName.substring(dotIndex + 1);
	     }
	     if (filePart != null) {
           InputStream fileContent = filePart.getInputStream();
           if (fileContent != null) {
             
               try {
                
                  conn = DBConnection.openConnection();
                   pstmt = conn.prepareStatement("INSERT INTO submission(id,course_id,title,student_email,student_name,submission_datetime,status,file,score,comment,f_type) values (?,?,?,?,?,?,?,?,?,?,?)" );
                   pstmt.setInt(1,id);
                   pstmt.setInt(2, course_id);
                   pstmt.setString(3, title);
                   pstmt.setString(4, userEmail);
                   pstmt.setString(5, studname);
                   pstmt.setString(6, date);
                   pstmt.setString(7, status);
                   pstmt.setBlob(8, fileContent);
                   pstmt.setInt(9, score);
                   pstmt.setString(10, comment);
                   pstmt.setString(11, f_type);
                   pstmt.executeUpdate();
                   
               } catch (Exception ex) {
                   ex.printStackTrace(); 
                   }
                
                if(sdao.updateStatus(status, id)) {
                
                response.sendRedirect("Material.jsp?course_id="+course_id);
                }
               }
            
               }
		
	     
         
	}

}
