package controller;

import java.io.*;




import javax.servlet.*;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.studDAO;
import model.Lect;
import model.Student;
import dao.UserDAO;
import dao.lectureDAO;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RequestDispatcher dispatcher=null;
    RequestDispatcher dispatcher1=null;
    RequestDispatcher dispatcher2=null;
    studDAO sdao=null;
    lectureDAO idao=null;
    UserDAO udao=null;
    public LoginController() {
        super();
        
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		sdao=new studDAO();
		idao=new lectureDAO();
	    udao=new UserDAO();
	    if(udao.isExist(email)) {
	    	if(sdao.isExist(email)) {
				String pwd=sdao.getPwd1(email);
				if (pwd != null && pwd.equals(password)) {
					
					HttpSession session=request.getSession();
					session.setAttribute("stuEmail", email);
					session.setAttribute("userEmail", email);
					dispatcher=request.getRequestDispatcher("sourceLogin.jsp");
					dispatcher.forward(request, response);
					}
				else {
					request.setAttribute("Incorrect","Your Password and Email doesn't match" );
					dispatcher=request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
				}
	    	}
	    	else {
	    	HttpSession session=request.getSession();
	    	session.setAttribute("userEmail", email);
	    	dispatcher=request.getRequestDispatcher("Admin.jsp");
			dispatcher.forward(request, response);
	    	}
	    }
	  
		else if(idao.isExist(email) ) {
			
		    String pwd = idao.getPwd(email);
		    if(pwd.equals(password)) {
		    	int course_id=idao.getCourseID(email);
		    	HttpSession session=request.getSession();
		    	session.setAttribute("course_id", course_id);
		    	session.setAttribute("userEmail", email);
		        dispatcher = request.getRequestDispatcher("lectureProfile.jsp");
		        dispatcher.forward(request, response);
		        
		    } else {
				request.setAttribute("Incorrect","Your Password and Email doesn't match" );
				dispatcher=request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		}
		else{
			request.setAttribute("username", request.getParameter("username"));
			request.setAttribute("Invalid","Your Email is invalid.Please Register First.");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		
	
	}}
