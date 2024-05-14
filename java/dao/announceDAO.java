package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Announcement;
import model.Material;
import util.DBConnection;

public class announceDAO {
	 Connection connection = null;
	  ResultSet resultSet = null;
	  Statement statement = null;
	  PreparedStatement preparedStatement = null;
	    
	  public List<Announcement> getfor(int course_id) {
	      List<Announcement> list = null;
	     Announcement announce=null;
	      try {
	          list = new ArrayList<Announcement>();
	          String sql = "SELECT * FROM announcements where course_id="+course_id;
	          connection = DBConnection.openConnection();
	          statement = connection.createStatement();
	          resultSet = statement.executeQuery(sql);
	          while(resultSet.next()) {
	         announce=new Announcement();
	         announce.setAnnouncement_id(resultSet.getInt("announcement_id"));
	         announce.setTitle(resultSet.getString("title"));
	         announce.setContent(resultSet.getString("content"));
	         announce.setDate(resultSet.getString("created_at"));
	         announce.setCourse_id(resultSet.getInt("course_id"));
	         announce.setCourse_name(resultSet.getString("course_title"));
	        
	        list.add(announce);
	                }
	         }catch(SQLException e) {
	         e.printStackTrace();
	      }
	      return list;
	      }
	  public boolean delete(int id) {
	        boolean flag=false;
	        try {
	          String sql="Delete from announcements where announcement_id="+id;
	          connection=DBConnection.openConnection();
	          preparedStatement=connection.prepareStatement(sql);
	          int rowDeleted=preparedStatement.executeUpdate();
	          if(rowDeleted>0) {
	            flag=true;
	          }
	        }catch(SQLException e) {
	          e.printStackTrace();
	        }
	        return flag;
	      }
	      
}
