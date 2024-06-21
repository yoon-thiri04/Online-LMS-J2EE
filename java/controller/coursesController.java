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
import dao.courseDAO;
import model.Course;
/**
 * Servlet implementation class coursesController
 */
@WebServlet("/coursesController")
public class coursesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
       courseDAO coursedao = null;
        public coursesController() {
        coursedao = new courseDAO();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if(action == null) {
		action = "LIST";
		}
		switch(action) {
		case "LIST":
			
			try {
				listCourse(request, response);
			} catch (SQLException | ServletException | IOException e1) {
				
				e1.printStackTrace();
			}
			
		break;

		case "EDIT":
		getCourse(request, response);
		break;

		case "DELETE":
		deleteCourse(request, response);
		break;

		default:
			
			try {
				listCourse(request, response);
			} catch (SQLException | ServletException | IOException e) {
				
				e.printStackTrace();
			}
			
		break;
		}
	}

	
	private void listCourse(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		List<Course> courselist = coursedao.get();
			request.setAttribute("courselist", courselist);
			dispatcher = request.getRequestDispatcher("/CourseAdmin.jsp");
			dispatcher.forward(request, response);
		
		
	}

	private void getCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String course_id = request.getParameter("course_id");
		Course course = coursedao.get(Integer.parseInt(course_id));
		request.setAttribute("course", course);
		dispatcher = request.getRequestDispatcher("courseEdit.jsp");
		dispatcher.forward(request, response);
	}
	private void deleteCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String course_id = request.getParameter("course_id");
		coursedao.delete(Integer.parseInt(course_id));
		dispatcher = request.getRequestDispatcher("/CourseAdmin.jsp");
		dispatcher.forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String course_id = request.getParameter("course_id");
	    Course course = new Course();
	    course.setCourse_id(course_id != null && !course_id.isEmpty() ? Integer.parseInt(course_id) : 0);
	    course.setTitle(request.getParameter("title"));
	    course.setDuration(request.getParameter("duration"));
	    course.setLevel(request.getParameter("level"));
	    course.setCategory(request.getParameter("category"));
	    course.setDescription(request.getParameter("description"));
	    course.setStart_date(request.getParameter("startDate"));	
	    course.setEnrollment_deadline(request.getParameter("deadLine"));
	    course.setMerged("No");
	    	 try {
	        if (course.getCourse_id() == 0) {
	            if (coursedao.save(course)) {
	                request.setAttribute("MSG", "Successfully Saved!");
	               
	            }
	        } else {
	            if (coursedao.update(course)) {
	                request.setAttribute("MSG", "Successfully Updated!");
	            }
	        }
	        listCourse(request, response);
	    } catch (SQLException e) {
	        e.printStackTrace();
	       
	    }
	}
}

		
	
	


