package controller;
import model.QuizResultAnswer;

import model.Quizes;
import util.DBConnection;

import java.time.*;
import model.QuizResult;
import dao.quizDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/QuizResultController")
public class QuizResultController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    quizDAO qdao=new quizDAO();
    RequestDispatcher dispatcher=null;
    
    public QuizResultController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		switch(action) {
		case "RESULT":
			showResult(request,response);
			break;
		case "REVIEW":
			reviewAnswers(request,response);
			break;
		
		case "LectureView":
			lectureQuizView(request,response);
			break;
		
	    case "REVIEWLECT":
		    reviewAnswersLecture(request,response);
		    break;
	    case "RESULTLECT":
		    showResultLecture(request,response);
		    break;
		}
		}

	private void showResultLecture(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("quiz_id",Integer.parseInt(request.getParameter("quiz_id")));
		request.setAttribute("result_id",Integer.parseInt(request.getParameter("result_id")));
		dispatcher=request.getRequestDispatcher("/ViewQuizResultLecture.jsp");
		dispatcher.forward(request, response);
		
	}


	private void reviewAnswersLecture(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result_id=Integer.parseInt(request.getParameter("result_id"));
		int quiz_id=Integer.parseInt(request.getParameter("quiz_id"));
		List<Quizes> quizzes=qdao.getQuizes(quiz_id);
		Map<Integer,QuizResultAnswer> result=qdao.getAnswers(result_id);
		
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
		request.setAttribute("quizzList", quizzes);
		request.setAttribute("answerList", result);
		request.setAttribute("result_id", result_id);
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("total", total);
		dispatcher=request.getRequestDispatcher("/ReviewQuizAnswerLecture.jsp");
		dispatcher.forward(request, response);
	}


	private void lectureQuizView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int quiz_id=Integer.parseInt(request.getParameter("quiz_id"));
		List<QuizResult> result=qdao.getQuizResultList(quiz_id);
		request.setAttribute("resultList", result);
		dispatcher=request.getRequestDispatcher("/QuizResultListLecture.jsp?quiz_id="+quiz_id);
		dispatcher.forward(request, response);
		
	}


	private void reviewAnswers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result_id=Integer.parseInt(request.getParameter("result_id"));
		int quiz_id=Integer.parseInt(request.getParameter("quiz_id"));
		List<Quizes> quizzes=qdao.getQuizes(quiz_id);
		Map<Integer,QuizResultAnswer> result=qdao.getAnswers(result_id);
		
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
		request.setAttribute("quizzList", quizzes);
		request.setAttribute("answerList", result);
		request.setAttribute("result_id", result_id);
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("total", total);
		dispatcher=request.getRequestDispatcher("/ReviewQuizAnswer.jsp");
		dispatcher.forward(request, response);
		
	}


	private void showResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("quiz_id",Integer.parseInt(request.getParameter("quiz_id")));
		request.setAttribute("result_id",Integer.parseInt(request.getParameter("result_id")));
		dispatcher=request.getRequestDispatcher("/ViewQuizResult.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDateTime endTime = LocalDateTime.now();
		
		QuizResult result=new QuizResult();
		result.setEndTime(endTime);
		
		int quiz_id=Integer.parseInt(request.getParameter("id"));
		
		
		LocalDateTime startTime=qdao.getStartTime(quiz_id);
		
		Duration duration = Duration.between(startTime, endTime);
        long hours = duration.toHours();
        long minutes = duration.toMinutesPart();
        long seconds = duration.toSecondsPart();
        String timeTaken = String.format("%02d:%02d:%02d",hours, minutes, seconds);
        result.setTime_taken(timeTaken);
        result.setState("Finished");
        
        HttpSession session = request.getSession(); 
		String userEmail = (String) session.getAttribute("stuEmail"); 
		int result_id=qdao.getResultId(quiz_id, userEmail);
		result.setResult_id(result_id);
		
        Map<Integer, String> userAnswers = new HashMap<>();
        Map<String, String[]> parameterMap = request.getParameterMap();
        for (String parameterName : parameterMap.keySet()) {
            if (parameterName != null && parameterName.startsWith("quiz_")) {
            	String id_string=parameterName.substring(5);
                int quizId = Integer.parseInt(id_string);
                String answer = request.getParameter(parameterName);
                userAnswers.put(quizId, answer);
            }
            else {
            	
            }
        }
        Map<Integer, String> correctAnswers = qdao.getCorrectAnswers(quiz_id);
        int score =qdao.calculateScore(userAnswers, correctAnswers,result_id);
        result.setScore(score);
        qdao.updateQuizResult(result);
        	request.setAttribute("quiz_id", Integer.parseInt(request.getParameter("id")));
        	request.setAttribute("result_id",result_id);
        	dispatcher=request.getRequestDispatcher("/ViewQuizResult.jsp");
        	dispatcher.forward(request, response);
 
	}

}
