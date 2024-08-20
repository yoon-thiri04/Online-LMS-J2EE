package controller;
import java.sql.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.courseDAO;
import model.Course;
import util.DBConnection;
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
		
		case "SELECTION":
		runCourse(request,response);
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

	
	private void runCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Integer> runCourseList = new ArrayList<>();
	    ArrayList<Integer> otherCourseList = new ArrayList<>();
	    String deadline = null;
	    try {
	        String sql_ = "SELECT course_id, enrollment_deadline FROM courses";
	        Connection connection3 = DBConnection.openConnection();
	        Statement statement3 = connection3.createStatement();
	        ResultSet resultSet3 = statement3.executeQuery(sql_);

	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Date tdyDate = new Date();
	        String date = sdf.format(tdyDate);
	        Date TodayEnrollDate = sdf.parse(date);

	        while (resultSet3.next()) {
	            int courseId = resultSet3.getInt("course_id");
	            deadline = resultSet3.getString("enrollment_deadline");
	            Date DeadlineDate = sdf.parse(deadline);

	            if (TodayEnrollDate.compareTo(DeadlineDate) <= 0) {
	            	otherCourseList.add(courseId);
	            } else {
	            	runCourseList.add(courseId);
	            }

	        }
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    
	    String course_type=request.getParameter("type");
	    if (course_type.equalsIgnoreCase("run")) {
	    	List<Course> run_course= coursedao.getRunCourse(runCourseList);
	    	request.setAttribute("run_course", run_course);
			dispatcher = request.getRequestDispatcher("/RunCourses.jsp");
			dispatcher.forward(request, response);
	    }
	    
	    else {
	    	List<Course> other_course= coursedao.getRunCourse(otherCourseList);
	    	
	    	request.setAttribute("other_course", other_course);
			dispatcher = request.getRequestDispatcher("/OtherCourses.jsp");
			dispatcher.forward(request, response);
	    
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

		
	
	


