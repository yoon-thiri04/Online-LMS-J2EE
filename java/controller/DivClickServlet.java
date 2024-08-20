package controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;

/**
 * Servlet implementation class DivClickServlet
 */
@WebServlet("/DivClickServlet")
public class DivClickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RequestDispatcher dispatcher=null;
    
    public DivClickServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean deadlineReached=false;
		String deadline=null;
		 try {
		        int quiz_id = Integer.parseInt(request.getParameter("quiz_id"));
		        String sql = "SELECT deadline FROM quiz WHERE id=?";
		        Connection connection = DBConnection.openConnection();
		        PreparedStatement preparedstatement = connection.prepareStatement(sql);
		        preparedstatement.setInt(1, quiz_id);
		        ResultSet resultSet = preparedstatement.executeQuery(); 
		        if(resultSet.next()) {
		        	deadline=resultSet.getString("deadline");
		        }
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    Date tdyDate=new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String date = sdf.format(tdyDate);
	        Date TodayEnrollDate = null;
			try {
				TodayEnrollDate = sdf.parse(date);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
	        Date DeadlineDate = null;
			try {
				DeadlineDate = sdf.parse(deadline);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			if(TodayEnrollDate.compareTo(DeadlineDate)<=0) {
				response.getWriter().write(String.valueOf(deadlineReached));
			}
			else {
				deadlineReached=true;
				response.getWriter().write(String.valueOf(deadlineReached));
		    }
		}
		
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean deadlineReached=false;
		String deadline=null;
		 try {
		        int course_id = Integer.parseInt(request.getParameter("course_id"));
		        String sql = "SELECT enrollment_deadline FROM courses WHERE course_id=?";
		        Connection connection = DBConnection.openConnection();
		        PreparedStatement preparedstatement = connection.prepareStatement(sql);
		        preparedstatement.setInt(1, course_id);
		        ResultSet resultSet = preparedstatement.executeQuery(); 
		        if(resultSet.next()) {
		        	deadline=resultSet.getString("enrollment_deadline");
		        }
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    Date tdyDate=new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        String date = sdf.format(tdyDate);
	        Date TodayEnrollDate = null;
			try {
				TodayEnrollDate = sdf.parse(date);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
	        Date DeadlineDate = null;
			try {
				DeadlineDate = sdf.parse(deadline);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			if(TodayEnrollDate.compareTo(DeadlineDate)<=0) {
				response.getWriter().write(String.valueOf(deadlineReached));
			}
			else {
				deadlineReached=true;
				response.getWriter().write(String.valueOf(deadlineReached));
		    }
		}
		    

	}


