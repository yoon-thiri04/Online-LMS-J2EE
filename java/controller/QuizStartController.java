package controller;
import model.Quizes;
import model.QuizResult;
import dao.quizDAO;
import java.util.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;

import util.DBConnection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/QuizStartController")
public class QuizStartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    quizDAO qdao=new quizDAO();
    RequestDispatcher dispatcher=null;
    
    public QuizStartController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); 
		String userEmail = (String) session.getAttribute("stuEmail"); 
		String quiz_id=request.getParameter("quiz_id");
		String title=null;
		String query="select title from quiz where id="+quiz_id;
		Connection connection1 = DBConnection.openConnection();
		Statement statement1 = null;
		try {
			statement1 = connection1.createStatement();
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		ResultSet resultSet1 = null;
		try {
			resultSet1 = statement1.executeQuery(query);
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		try {
			if(resultSet1.next()){
			title=resultSet1.getString("title");
			}
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		}
		QuizResult result=new QuizResult();
		
		result.setQuiz_id(Integer.parseInt(quiz_id));
		result.setStudent_email(userEmail);
		LocalDateTime startTime = LocalDateTime.now();
        result.setStartTime(startTime);
        result.setState("Started");
        qdao.saveQuizResult(result);
        
		List<Quizes> quizzes=qdao.getQuizes(Integer.parseInt(quiz_id));
		int total=0;
		try{
			String sql= "select count(*) as total from quizz where id="+quiz_id;
		Connection connection = DBConnection.openConnection();
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		if(resultSet.next()){
		total =resultSet.getInt("total");
		}
		}catch(SQLException e) {
			e.printStackTrace();
			}
		request.setAttribute("quiz_id", quiz_id);
		request.setAttribute("total", total);
		request.setAttribute("quizzlist", quizzes);
		request.setAttribute("title", title);
		dispatcher=request.getRequestDispatcher("/QuizesStudent.jsp");
		dispatcher.forward(request, response);	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
