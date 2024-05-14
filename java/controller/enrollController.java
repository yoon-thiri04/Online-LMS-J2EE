package controller;
import dao.EnrollStudentDAO;
import model.Course;
import model.EnrollStudent;
import util.DBConnection;

import java.util.Date;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/enrollController")
public class enrollController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    EnrollStudentDAO edao=new EnrollStudentDAO();
    RequestDispatcher dispatcher=null;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch(action) {
        

        case "Delete":
          try {
            DeleteEnrollment(request, response);
          } catch (ServletException | IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
          }
        break;
        }}
    private void DeleteEnrollment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String stu_email=request.getParameter("email");   
        HttpSession session=request.getSession(false);
        int course_id=(int) session.getAttribute("course_id");
      if(edao.delete(stu_email,course_id)) {
    	  listEnrollStudent(request,response);
        }
        
          
        }
    private void listEnrollStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	HttpSession session=request.getSession(false);
    	int course_id=(int) session.getAttribute("course_id");
        EnrollStudentDAO edao=new EnrollStudentDAO();
        List<EnrollStudent> stu = edao.get_enroll(course_id);
        request.setAttribute("stuList",stu);
        dispatcher=request.getRequestDispatcher("/EnrollStudent.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
    	
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        Date tdyDate=new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        String date = sdf.format(tdyDate);
        int course_id = Integer.parseInt(request.getParameter("course_id"));
        Statement statement1 = null;
    	PreparedStatement preparedStatement= null;
    	ResultSet resultSet = null;
    	String coursedate=null;
        try {
			
			String sql = "SELECT enrollment_deadline FROM courses where course_id="+course_id;
			Connection connection = DBConnection.openConnection();
			statement1 = connection.createStatement();
			resultSet = statement1.executeQuery(sql);
			if(resultSet.next()) {
			
				coursedate=resultSet.getString("enrollment_deadline");
				}
			}catch(SQLException e) {
			e.printStackTrace();
		      }
        Date TodayEnrollDate = null;
		try {
			TodayEnrollDate = sdf.parse(date);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Date DeadlineDate = null;
		try {
			DeadlineDate = sdf.parse(coursedate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        if(TodayEnrollDate.compareTo(DeadlineDate)<=0) {
        	
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:/onlinelearningsystem", "root", "yoonthiri@2004");
            String sql = "INSERT INTO enrollment (name, email, course_id,date) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setInt(3, course_id);
            statement.setString(4, date);
            statement.executeUpdate();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
              }

        response.sendRedirect("student1.jsp");
    }
    else {
    	 request.setAttribute("deadlineReached", true);
    	request.getRequestDispatcher("enrollform.jsp").forward(request, response);
    }
    }
}
