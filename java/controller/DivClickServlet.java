package controller;

import java.io.IOException;
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int course_id=Integer.parseInt(request.getParameter("id"));
		request.setAttribute("course_id",course_id);
		dispatcher=request.getRequestDispatcher("/EnrollForm.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean enrolled=false;
		 try {
		        // Retrieve course_id and name parameters from the request
		        int course_id = Integer.parseInt(request.getParameter("course_id"));
		        String email = request.getParameter("email");
		        String sql = "SELECT course_id FROM enrollment WHERE email=? AND course_id=?";
		        Connection connection = DBConnection.openConnection();
		        PreparedStatement preparedstatement = connection.prepareStatement(sql);
		        preparedstatement.setString(1, email);
		        preparedstatement.setInt(2, course_id);
		        ResultSet resultSet = preparedstatement.executeQuery(); 
		        
		        
		        enrolled = resultSet.next();
		        response.getWriter().write(String.valueOf(enrolled));
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    
		    

	}

}
