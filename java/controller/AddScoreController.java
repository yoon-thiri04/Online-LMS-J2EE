package controller;
import dao.submitDAO;
import model.Submission;

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

@WebServlet("/AddScoreController")
public class AddScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    submitDAO sdao=new submitDAO();
    RequestDispatcher dispatcher=null;
    public AddScoreController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	private void listSubmission(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
   	 int id=Integer.parseInt(request.getParameter("id"));
   	 
		 HttpSession session=request.getSession(false);
	     int course_id = Integer.parseInt(session.getAttribute("course_id").toString());
	     String title=sdao.getAssignmentName(id);
	     try {
			List<Submission> submitList=sdao.get(id);
			request.setAttribute("submitList", submitList);
			request.setAttribute("title", title);
			dispatcher=request.getRequestDispatcher("/SubmissionLecture.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
     }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int submit_id=Integer.parseInt(request.getParameter("sub_id"));
		int score=Integer.parseInt(request.getParameter("myscore"));
		String comment=request.getParameter("comment");
		String status="Evaluated";
		
		sdao.updateStatusSub(status, submit_id);
		if(sdao.GiveScore(submit_id,score) && sdao.GiveComment(submit_id, comment)
				) {
			listSubmission(request,response);
		}
		else {
			dispatcher=request.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
