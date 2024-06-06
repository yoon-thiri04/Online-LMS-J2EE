package controller;
import model.Quiz;
import dao.quizDAO;
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


@WebServlet("/QuizLectureController")
public class QuizLectureController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    quizDAO qDAO=new quizDAO();
    RequestDispatcher dispatcher=null;
    public QuizLectureController() {
       
    }
    private void listQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     dispatcher=request.getRequestDispatcher("/QuizLecture.jsp");
       dispatcher.forward(request, response);
    	}
    private void ViewQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       String id_st = request.getParameter("id");
       HttpSession session=request.getSession();
       int id=Integer.parseInt(id_st);
       session.setAttribute("quiz_id", id);
       List<Quiz> quizList=qDAO.get(id);
       request.setAttribute("qList", quizList);
       
       dispatcher=request.getRequestDispatcher("/QuizesLecture.jsp");
       dispatcher.forward(request, response);
    	}
    private void deleteQuiz(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
        
        
        if(qDAO.delete(Integer.parseInt(id))) {
          request.setAttribute("MSG", "Successfully Deleted");
        
        
          }
        listQuiz(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
	   
	    switch(action) {
	    case "View": ViewQuiz(request,response);

	    break;

	    case "DELETE":
	    deleteQuiz(request, response);
	    break;

	    
	    }}
        
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Quiz quiz=new Quiz();
		quiz.setTitle(request.getParameter("title"));
		quiz.setTime_allowed(request.getParameter("time"));
		quiz.setDeadline(request.getParameter("deadline"));
		quiz.setTotal_quizes(0);
		HttpSession session=request.getSession(false);
	    int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
	    quiz.setCourse_id(course_id);
	    if(qDAO.save(quiz)) {
	    	listQuiz(request,response);
	    }
	    
		}

}
