package controller;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import dao.uploadDao;
import model.Material;

import util.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/MaterialController")
@MultipartConfig(maxFileSize = 52428800)
public class MaterialController extends HttpServlet {
  private static final long serialVersionUID = 1L;
    RequestDispatcher dispatcher=null;
    uploadDao mDAO=null;
    public MaterialController() {
      mDAO=new uploadDao();
    }
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if(action == null) {
    action = "LIST";
    }
    switch(action) {
    

    case "DOWNLOAD":
      try {
        downMaterial(request, response);
      } catch (ServletException | IOException | SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
      }
    break;

    
    }
  }
  
     private void downMaterial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
       int id=Integer.parseInt(request.getParameter("id"));
       
       String mtitle=request.getParameter("title");
       String f_type=request.getParameter("ftype");
       
       
       try {
       Connection con=DBConnection.openConnection();
       
       String sql = "SELECT m_video FROM material WHERE id = ?";
         PreparedStatement statement = con.prepareStatement(sql);
         statement.setInt(1,id);
         ResultSet resultSet = statement.executeQuery();

         if (resultSet.next()) {
             
             Blob blob = resultSet.getBlob("m_video");
             InputStream inputStream = blob.getBinaryStream();
             response.setContentType("application/octet-stream");
             response.setHeader("Content-Disposition", "attachment; filename=\"" + mtitle + "." + f_type + "\"");

             
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
       
     
   
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  Connection conn=null;
	     String status=null;
	      PreparedStatement pstmt = null;
	     String title=request.getParameter("title");
	     String type=request.getParameter("mtype");
	     if(type.equalsIgnoreCase("assignment")) {
	    	 status="Not Submitted Yet";
	     }else {
	    	 status="-";
	     }
	     HttpSession session=request.getSession(false);
	     int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
	     Part filePart = request.getPart("file");
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
	                     pstmt = conn.prepareStatement("INSERT INTO material(course_id,title,m_type,m_video,f_type,status) values (?,?,?,?,?,?)" );
	                     pstmt.setInt(1,course_id);
	                     pstmt.setString(2, title);
	                     pstmt.setString(3, type);
	                     pstmt.setBlob(4, fileContent);
	                     pstmt.setString(5, f_type);
	                     pstmt.setString(6, status);
	                     pstmt.executeUpdate();
	                 } catch (Exception ex) {
	                     ex.printStackTrace(); 
	                     }
	               
	                 
	                 }
	              
	                 }
	         
	             }
  
}