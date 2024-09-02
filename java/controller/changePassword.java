package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dao.changePwdDAO;
import dao.lectureDAO;
import dao.studDAO;

/**
 * Servlet implementation class changePassword
 */
@WebServlet("/changePassword")
public class changePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher=null;
    RequestDispatcher dispatcher1=null;
    RequestDispatcher dispatcher2=null;
    studDAO sdao=null;
    UserDAO userdao = null;
    changePwdDAO changedao=null;
    lectureDAO idao=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassword() {
    	sdao=new studDAO();
		idao=new lectureDAO();
    	changedao = new  changePwdDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email=request.getParameter("email");
	    String newPwd = request.getParameter("newPwd");
	    String retype = request.getParameter("reTypePwd");

	    	if (sdao.isExist(email)) {
	    		if(newPwd.equals(retype)) {
	            try {
					changedao.updatePwd_stud(email, newPwd);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            try {
					changedao.updatePwd_User(email, newPwd);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            request.setAttribute("Success", "Successfully Updated!");
	            dispatcher = request.getRequestDispatcher("login.jsp");
	            dispatcher.forward(request, response);
	    		}
	    		else {
	    			request.setAttribute("notMatch","Passwords do not match");
	    			dispatcher=request.getRequestDispatcher("changePwd.jsp");
	    		    dispatcher.forward(request, response);
	    			
	        }}
	    	else if (idao.isExist(email)) {
	        	if(newPwd.equals(retype)) {
	            try {
					changedao.updatePwd_lect(email, newPwd);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            request.setAttribute("Success", "Successfully Updated!");
	            dispatcher = request.getRequestDispatcher("login.jsp");
	            dispatcher.forward(request, response);
	        
	        }else {
	        	request.setAttribute("notMatch","Passwords do not match");
    			dispatcher=request.getRequestDispatcher("changePwdLecture.jsp");
    		    dispatcher.forward(request, response);
	        }
	    } 
	    
	}
	}

