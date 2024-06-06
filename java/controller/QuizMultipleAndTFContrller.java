package controller;
import dao.quizDAO;
import model.Quizes;
import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/QuizMultipleAndTFContrller")
public class QuizMultipleAndTFContrller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher=null;
    quizDAO qdao=new quizDAO();
    public QuizMultipleAndTFContrller() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
        String quizz_id=request.getParameter("quizz_id");
      
		Quizes quiz=new Quizes();
		quiz.setQuestion(request.getParameter("question"));
		String q_type=request.getParameter("qtype");
		
		quiz.setType(q_type);
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("quiz_id");
		int total=0;
		quiz.setId(id);
		
		String choice=request.getParameter("correctAns");
		String answer=null;
		if(q_type.equalsIgnoreCase("true")) {
			switch(choice) {
			case "true":answer="True"; break;
			case "false":answer="False"; break;
			}
			
			quiz.setCorrect_answer(answer);
		}
		else if(q_type.equalsIgnoreCase("multiple")){
			String option1=request.getParameter("option1");
			String option2=request.getParameter("option2");
			String option3=request.getParameter("option3");
			String option4=request.getParameter("option4");
			if(option3.equalsIgnoreCase("-") && option4.equalsIgnoreCase("-")) {
				
			switch(choice) {
			case "op1":answer=option1; break;
			case "op2":answer=option2; break;
			}
			quiz.setAnswer( List.of(option1,option2));
			quiz.setCorrect_answer(answer);
			}
			else if(option4.equalsIgnoreCase("-") ) {
				switch(choice) {
				case "op1":answer=option1; break;
				case "op2":answer=option2; break;
				case "op3":answer=option3; break;
				}
				quiz.setAnswer(List.of(option1,option2,option3));
				quiz.setCorrect_answer(answer);
				
			}
			else {
				switch(choice) {
				case "op1":answer=option1; break;
				case "op2":answer=option2; break;
				case "op3":answer=option3; break;
				case "op4":answer=option4; break;
			}
				quiz.setAnswer(List.of(option1,option2,option3,option4));
				quiz.setCorrect_answer(answer);
			
		}
			}
		else {
			quiz.setCorrect_answer(choice);
		}
		if(quizz_id==null || quizz_id.isEmpty()) {
		
		if(qdao.saveQuiz(quiz)) {
		
			try{
		    String sql= "select count(*) as total from quizz where id="+id;
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
			
		   
		    }
		
		}else {
			if(qdao.updateQuiz(Integer.parseInt(quizz_id), quiz)) {
				System.out.print("succes");
			}
			
			
		}
		 if("Save Quiz".equals(action)) {
				
				dispatcher=request.getRequestDispatcher("/QuizTypeChoose.jsp");
				dispatcher.forward(request, response);
			}
			    else {
			    	dispatcher=request.getRequestDispatcher("/QuizesLecture.jsp");
					dispatcher.forward(request, response);
				
			    }
			
	}

	
	}
