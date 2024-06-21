package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

import model.Material;
import model.Submission;
import util.DBConnection;
import dao.submitDAO;

@WebServlet("/SubmissionLectureController")
public class SubmissionLectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	submitDAO sdao=new submitDAO();
	RequestDispatcher dispatcher=null;
    public SubmissionLectureController() {
        
    }
    private void listSubmission(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	 int id=Integer.parseInt(request.getParameter("id"));
	     try {
			List<Submission> submitList=sdao.get(id);
			request.setAttribute("id", String.valueOf(id));
			request.setAttribute("submitList", submitList);
			
			dispatcher=request.getRequestDispatcher("/SubmissionLecture.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
      }
    private void downSubmission(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	int id=Integer.parseInt(request.getParameter("id"));
      String stitle=request.getParameter("title");
        String f_type=request.getParameter("f_type");
        
        
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
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
		    
		    switch(action) {
		    case "View": listSubmission(request,response);

		    case "DOWNLOAD":
		      try {
		        downSubmission(request, response);
		      } catch (ServletException | IOException e) {
		        
		        e.printStackTrace();
		      }
		    break;
		   
		    }
		
	     }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   
	}

}
