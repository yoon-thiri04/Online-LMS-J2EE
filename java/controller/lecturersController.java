package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import dao.EnrollStudentDAO;
import dao.lectureDAO;
import model.EnrollStudent;
import model.Lect;

/**
 * Servlet implementation class lectureController
 */
@WebServlet("/lecturersController")
public class lecturersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	lectureDAO lecturerdao = null;
    RequestDispatcher dispatcher = null;
   
    
    public lecturersController() {
    	lecturerdao = new lectureDAO();
        
    	
    }
    private void listLect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Lect> lecList = lecturerdao.get();
		request.setAttribute("lectlist", lecList);
		dispatcher = request.getRequestDispatcher("/lectures.jsp");
		dispatcher.forward(request, response);
	}
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String action=request.getParameter("action");
    	if(action == null) {
    		action = "LIST";
    		}
    		switch(action) {
    		case "LIST":
    			
    			try {
    				listLect(request, response);
    			} catch (ServletException | IOException e1) {
    				// TODO Auto-generated catch block
    				e1.printStackTrace();
    			}
    			
    		break;

    		case "EDIT":
    		getLect(request, response);
    		break;

    		case "DELETE":
    		deleteLect(request, response);
    		break;

    		}
   
}

    

	private void getLect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String course_name=request.getParameter("course_name");
		Lect lecture=lecturerdao.getLecturerByEmail(email);
		request.setAttribute("lecture", lecture);
		request.setAttribute("course_name",course_name );
		dispatcher=request.getRequestDispatcher("/lecturesEditForm.jsp");
		dispatcher.forward(request, response);
		
	}
	private void deleteLect(HttpServletRequest request, HttpServletResponse response) {
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Lect lec = new Lect();
		lec.setLectureId(Integer.parseInt(request.getParameter("lectureId")));
		lec.setName(request.getParameter("name"));
		lec.setPassword(request.getParameter("password"));
		lec.setEmail(request.getParameter("email"));
		lec.setQualification(request.getParameter("qualification"));
		lec.setFilename(request.getParameter("filename"));
		lec.setPath(request.getParameter("path"));
		lec.setCourse_id(Integer.parseInt(request.getParameter("course_id")));
		
		listLect(request,response);
	}

}
