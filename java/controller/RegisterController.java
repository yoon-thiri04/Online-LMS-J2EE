package controller;
import model.Student;
import model.User;
import dao.UserDAO;
import dao.studDAO;
import util.DBConnection;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
  private static final long serialVersionUID = 1L;
    RequestDispatcher dispatcher=null;
    studDAO sdao=null;
    UserDAO userdao = null;
    public RegisterController() {
    	sdao=new studDAO();
        // TODO Auto-generated constructor stub
    }

  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }
  

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Student stu=new Student();
    User stu1 = new User();
    String name=request.getParameter("username");
    stu.setName(name);
    String email=request.getParameter("email");
    stu.setEmail(request.getParameter("email"));
    stu.setAddress(request.getParameter("address"));

    String password=request.getParameter("password");
    String conPassword=request.getParameter("confirmPassword");
    stu1.setUser_name(request.getParameter("username"));
    stu1.setPassword(request.getParameter("password"));
    stu1.setEmail(request.getParameter("email"));
    
    
    
    if(password.equals(conPassword)) {
      stu.setPassword(password);  
     
      
      HttpSession session = request.getSession();
      session.setAttribute("stuName",name);
      session.setAttribute("email",email);
      sdao.save1(stu1);
      sdao.save(stu);
      dispatcher=request.getRequestDispatcher("login.jsp");
      dispatcher.forward(request, response);
    }
    else {
      request.setAttribute("errorMessage","Passwords do not match");
      request.setAttribute("username", request.getParameter("username"));
      request.setAttribute("email",request.getParameter("email"));
       dispatcher=request.getRequestDispatcher("index.jsp");
      dispatcher.forward(request, response);
    }
    
    
  }

}