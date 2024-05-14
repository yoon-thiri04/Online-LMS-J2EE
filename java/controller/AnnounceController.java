package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import dao.announceDAO;
import model.Announcement;
import util.DBConnection;

/**
 * Servlet implementation class AnnounceController
 */
@WebServlet("/AnnounceController")
public class AnnounceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     announceDAO andao=null;
     Announcement anno=null;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnnounceController() {
        andao=new announceDAO();
        anno=new Announcement();
        // TODO Auto-generated constructor stub
    }
    private void listAnnouncement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
   	    HttpSession session=request.getSession(false);
        int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
      List<Announcement> announce=andao.getfor(course_id);
      request.setAttribute("aList", announce);
      RequestDispatcher dispatcher = request.getRequestDispatcher("/AnnouncementLecture.jsp");
      dispatcher.forward(request, response);
      }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
	    if(action == null) {
	    action = "LIST";
	    }
	    switch(action) {
	    case "LIST":
	        listAnnouncement(request,response);
	        break; // Add break statement here

	    case "DELETE":
	        deleteAnnouncement(request, response);
	        break;
	}

	  }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

private void deleteAnnouncement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     String id = request.getParameter("announcement_id");
     
     
   if(andao.delete(Integer.parseInt(id))) {
     request.setAttribute("MSG", "Successfully Deleted");
   }
   listAnnouncement(request, response);
   
     }
     
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection conn = null;
    PreparedStatement pstmt = null;

    String title = request.getParameter("title");
    String course_name = request.getParameter("course_name");
    String content = request.getParameter("contents");
    String date = request.getParameter("date");
    HttpSession session=request.getSession(false);
    int course_id=(int)session.getAttribute("course_id");

    try {
       
            conn = DBConnection.openConnection();
           
            pstmt = conn.prepareStatement("INSERT INTO announcements(title,content,created_at,course_id,course_title) VALUES (?,?,?,?,?)");
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, date);
            pstmt.setInt(4, course_id);
            pstmt.setString(5, course_name);
            pstmt.executeUpdate();

            conn.commit(); // Commit transaction if successful
        
    } catch (NumberFormatException ex) {
        // Handle the case where course_Id is not a valid integer
        ex.printStackTrace();
    } catch (SQLException ex) {
        // Handle database-related errors
        ex.printStackTrace();
    } finally {
        // Close resources and rollback transaction if necessary
        try {
            if (conn != null) {
                conn.rollback(); // Rollback if transaction failed
                conn.setAutoCommit(true); // Restore auto-commit mode
                
            }
            if (pstmt != null) {
                pstmt.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }


    listAnnouncement(request, response);
}

	}


