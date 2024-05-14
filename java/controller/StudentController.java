package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
    UserDAO userDAO = null;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentController() {
        userDAO = new UserDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		listUser(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<User> stuList = userDAO.get();
		request.setAttribute("studentlist", stuList);
		dispatcher = request.getRequestDispatcher("/Admin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = new User();
		user.setUser_name(request.getParameter("user_name"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		
		if(userDAO.save(user)) {
			System.out.print("yes");
		}
		else System.out.print("no");
			
			
		
		listUser(request,response);
	   
	
		
}

}
