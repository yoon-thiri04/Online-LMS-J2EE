package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QuizTypeController
 */
@WebServlet("/QuizTypeController")
public class QuizTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RequestDispatcher dispatcher=null;
    public QuizTypeController() {
        super();
          }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String quiz_type=request.getParameter("qType");
		
		if(quiz_type.equalsIgnoreCase("multiple")) {
			
			dispatcher=request.getRequestDispatcher("/QuizMultipleChoice.jsp");
			
			dispatcher.forward(request, response);
		}
		else if(quiz_type.equalsIgnoreCase("true")) {
			
			dispatcher=request.getRequestDispatcher("/QuizTrueFalse.jsp");
			dispatcher.forward(request, response);
		}
		else {
			
			dispatcher=request.getRequestDispatcher("/QuizBlank.jsp");
			dispatcher.forward(request, response);
		}
	}

}
