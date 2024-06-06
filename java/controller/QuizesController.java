package controller;
import java.sql.*;
import util.DBConnection;
import model.Quizes;
import dao.quizDAO;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QuizesController
 */
@WebServlet("/QuizesController")
public class QuizesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RequestDispatcher dispatcher=null;
    quizDAO qdao=new quizDAO();
    
    public QuizesController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch(action){
		case "EDIT" : 
			try {
				editQuiz(request,response);
			} catch (NumberFormatException | ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "DELETE": 
			deleteQuiz(request,response);
			break;
		}
	}
	
	private void deleteQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String quiz_id=request.getParameter("quiz_id");
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("quiz_id");
		String type=request.getParameter("type");
		qdao.deleteQuiz(Integer.parseInt(quiz_id),type);
		int total=0;
		try{String sql= "select count(*) as total from quizz where id="+id;
		Connection connection = DBConnection.openConnection();
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		if(resultSet.next()){
		total =resultSet.getInt("total");
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		qdao.updateTotal(total, id);
			dispatcher=request.getRequestDispatcher("/QuizesLecture.jsp");
			dispatcher.forward(request, response);
		
		
	}


	private void editQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException, SQLException {
		String quiz_id=request.getParameter("quiz_id");
		String type=request.getParameter("type");
		Quizes quiz=qdao.getQuiz(Integer.parseInt(quiz_id), type);
		request.setAttribute("quiz", quiz);
		switch(type) {
		case "true": 
			dispatcher=request.getRequestDispatcher("/QuizTrueFalse.jsp");
			dispatcher.forward(request, response);
			break;
		case "multiple":
			dispatcher=request.getRequestDispatcher("/QuizMultipleChoice.jsp");
			dispatcher.forward(request, response);
			break;
		
		case "blank":
			dispatcher=request.getRequestDispatcher("/QuizBlank.jsp");
			dispatcher.forward(request, response);
		    break;
		}
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
