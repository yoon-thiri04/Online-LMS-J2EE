package dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Material;
import model.Course;
import model.EnrollStudent;
import model.Submission;
import util.DBConnection;
public class submitDAO {
	 Connection connection = null;
	  ResultSet resultSet = null;
	  Statement statement = null;
	  PreparedStatement preparedStatement = null;
	  public boolean updateStatus(String Status,int id){
		  boolean flag=false;
		  try {
				String sql = "UPDATE material SET status = ? where id = ?";
				connection = DBConnection.openConnection();
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, Status);
				
				preparedStatement.setInt(2,id);
				
				int rowUpdated = preparedStatement.executeUpdate();
				if (rowUpdated>0) flag = true;
				}catch(SQLException e) {
				e.printStackTrace();
				}
				return flag;
			   }
	  public boolean updateStatusSub(String Status,int id){
		  boolean flag=false;
		  try {
				String sql = "UPDATE submission SET status = ? where submission_id = ?";
				connection = DBConnection.openConnection();
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, Status);
				
				preparedStatement.setInt(2,id);
				
				int rowUpdated = preparedStatement.executeUpdate();
				if (rowUpdated>0) flag = true;
				}catch(SQLException e) {
				e.printStackTrace();
				}
				return flag;
			   }
			
	  
public List<Material> get(int course_id,String m_type) throws SQLException{
	List <Material> list = null;
	
	Material mat = null;
	try {
		list = new ArrayList<Material>();
		String sql = "select id,course_id,title,m_type from material where course_id=? and m_type=?";
		connection = DBConnection.openConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, course_id);
		preparedStatement.setString(2, m_type);
		resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			mat=new Material();
			mat.setId(resultSet.getInt("id"));
			mat.setCourse_id(resultSet.getInt("course_id"));
			mat.setTitle(resultSet.getString("title"));
			mat.setType(resultSet.getString("m_type"));
			
			list.add(mat);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
		return list;
}
public List<Submission> get(int id,int course_id) throws SQLException{
	List <Submission> list = null;
	Submission submit = null;
	try {
		list = new ArrayList<Submission>();
		String sql = "select submission_id,id,course_id,title,student_email,student_name,submission_datetime,status,score,comment,f_type from submission where id=? and course_id=?";
		connection = DBConnection.openConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		preparedStatement.setInt(2, course_id);
		resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			submit=new Submission();
			submit.setSubmission_id(resultSet.getInt("submission_id"));
			submit.setId(resultSet.getInt("id"));
			submit.setCourse_id(resultSet.getInt("course_id"));
			submit.setTitle(resultSet.getString("title"));
			submit.setStudent_email(resultSet.getString("student_email"));
			submit.setStudent_name(resultSet.getString("student_name"));
			submit.setSubmission_date(resultSet.getString("submission_datetime"));
			submit.setStatus(resultSet.getString("status"));
			submit.setScore(resultSet.getInt("score"));	
			submit.setComment(resultSet.getString("comment"));
			submit.setF_type(resultSet.getString("f_type"));
			list.add(submit);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
		return list;
}
  public Submission getmySumission(int id,String email) {
	  Submission submit = null;
	   try {
		submit=new Submission();
		String sql = "SELECT * FROM submission where id=? and student_email=?";
		
        connection = DBConnection.openConnection();
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1,id);
        preparedStatement.setString(2, email);
        resultSet = preparedStatement.executeQuery(); 
        
        if (resultSet != null && resultSet.next()) {
        	submit.setSubmission_id(resultSet.getInt("submission_id"));
        	submit.setId(resultSet.getInt("id"));
        	submit.setCourse_id(resultSet.getInt("course_id"));
        	submit.setTitle(resultSet.getString("title"));
        	submit.setStudent_email(resultSet.getString("student_email"));
        	submit.setStudent_name(resultSet.getString("student_name"));
        	submit.setSubmission_date(resultSet.getString("submission_datetime"));
        	submit.setStatus(resultSet.getString("status"));
        	submit.setScore(resultSet.getInt("score"));
        	submit.setComment(resultSet.getString("comment"));
        	submit.setF_type(resultSet.getString("f_type"));
			}
        
		}catch(SQLException e) {
		e.printStackTrace();
	      }
	    return submit;
  }
  public boolean GiveScore(int id,int score) {
	  boolean flag=false;
	  try {
			String sql = "UPDATE submission SET score = ? where submission_id = ?";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, score);
			
			preparedStatement.setInt(2,id);
			
			int rowUpdated = preparedStatement.executeUpdate();
			if (rowUpdated>0) flag = true;
			}catch(SQLException e) {
			e.printStackTrace();
			}
			return flag;
		   }
  
public boolean GiveComment(int id,String comment) {
	  boolean flag=false;
	  try {
			String sql = "UPDATE submission SET comment = ? where submission_id = ?";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, comment);
			
			preparedStatement.setInt(2,id);
			
			int rowUpdated = preparedStatement.executeUpdate();
			if (rowUpdated>0) flag = true;
			}catch(SQLException e) {
			e.printStackTrace();
			}
			return flag;
		   }
public String getAssignmentName(int id) {
	String title=null;
	try {
		String sql = "select title from material where id = ?";
		connection = DBConnection.openConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, id);
		
		resultSet = preparedStatement.executeQuery(); 
		
		
		if (resultSet.next()) {
			title=resultSet.getString("title");
		}
		}catch(SQLException e) {
		e.printStackTrace();
		}
	return title;
}
}
