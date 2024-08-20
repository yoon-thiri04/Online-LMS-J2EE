package dao;
import java.io.InputStream;

import util.DBConnection;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import javax.servlet.http.Part;

import model.Material;

public class uploadDao {
  Connection connection = null;
  ResultSet resultSet = null;
  Statement statement = null;
  PreparedStatement preparedStatement = null;
    
  
      public boolean delete(int id,String type) {
        boolean flag=false;
        try {
          
          String sql="Delete from material where id="+id;
          if("assignment".equalsIgnoreCase(type)) {
          connection=DBConnection.openConnection();
          preparedStatement=connection.prepareStatement(sql);
          int rowDeleted=preparedStatement.executeUpdate();
          flag=rowDeleted>0 && deleteSubmission(id);
          }
          else {
        	  connection=DBConnection.openConnection();
              preparedStatement=connection.prepareStatement(sql);
              int rowDeleted=preparedStatement.executeUpdate();
              if(rowDeleted>0) {
            	  flag=true;
             }
          }
        }catch(SQLException e) {
          e.printStackTrace();
        }
        return flag;
        
      }
      public boolean deleteSubmission(int id) {
    	  boolean flag=false;
    	  try {
    		  String sql="delete from submission where id="+id;
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
      
      public List<Material> getfor(int course_id) {
      List<Material> list = null;
      Material material = null;
      try {
          list = new ArrayList<Material>();
          String sql = "SELECT id,course_id,title,m_type,f_type,status FROM material where course_id=? and m_type <> 'Assignment' ";
          connection = DBConnection.openConnection();
          preparedStatement = connection.prepareStatement(sql);
          preparedStatement.setInt(1,course_id);
          
          resultSet = preparedStatement.executeQuery(); 
          
          while(resultSet.next()) {
	        material=new Material();
	        material.setId(resultSet.getInt("id"));
	        material.setCourse_id(resultSet.getInt("course_id"));
	        material.setTitle(resultSet.getString("title"));
	        material.setType(resultSet.getString("m_type"));
	        material.setFtype(resultSet.getString("f_type"));
	        material.setStatus(resultSet.getString("status"));

        list.add(material);
                }
         }catch(SQLException e) {
         e.printStackTrace();
      }
      return list;
      }
     
      public boolean updateCourseMerged(int course_id,String merged) {
    	  boolean flag = false;
		   try {
			String sql = "UPDATE courses SET merged = ? where course_id = ?";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,merged);
			preparedStatement.setInt(2, course_id);
			
			int rowUpdated = preparedStatement.executeUpdate();
			if (rowUpdated>0) flag = true;
			}catch(SQLException e) {
			e.printStackTrace();
			}
			return flag;
		   }
      public List<Material> getforAssignment(int course_id) {
          List<Material> list = null;
          Material material = null;
          try {
              list = new ArrayList<Material>();
              String sql = "SELECT id,course_id,title,m_type,f_type,status,deadline FROM material where course_id=? and m_type = 'Assignment' ";
              connection = DBConnection.openConnection();
              preparedStatement = connection.prepareStatement(sql);
              preparedStatement.setInt(1,course_id);
              
              resultSet = preparedStatement.executeQuery(); 
              
              while(resultSet.next()) {
    	        material=new Material();
    	        material.setId(resultSet.getInt("id"));
    	        material.setCourse_id(resultSet.getInt("course_id"));
    	        material.setTitle(resultSet.getString("title"));
    	        material.setType(resultSet.getString("m_type"));
    	        material.setFtype(resultSet.getString("f_type"));
    	        material.setStatus(resultSet.getString("status"));
    	        material.setDeadline(resultSet.getString("deadline"));

            list.add(material);
                    }
             }catch(SQLException e) {
             e.printStackTrace();
          }
          return list;
          }
         public boolean DeadlineReached(int mat_id) {
        	 boolean deadlineReached = false;
     	    String deadline = null;
     	    
     	    try {
     	        
     	        String sql = "SELECT deadline FROM material WHERE id=?";
     	        Connection connection = DBConnection.openConnection();
     	        PreparedStatement preparedstatement = connection.prepareStatement(sql);
     	        preparedstatement.setInt(1, mat_id);
     	        ResultSet resultSet = preparedstatement.executeQuery();
     	        
     	        if (resultSet.next()) {
     	            deadline = resultSet.getString("deadline");
     	        }
     	    } catch (SQLException e) {
     	        e.printStackTrace();
     	    }
     	    
     	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
     	    Date tdyDate = new Date();
     	    String date = sdf.format(tdyDate);

     	    Date todayEnrollDate = null;
     	    Date deadlineDate = null;

     	    try {
     	        todayEnrollDate = sdf.parse(date);
     	        deadlineDate = sdf.parse(deadline);
     	    } catch (ParseException e1) {
     	        e1.printStackTrace();
     	    }
     	    
     	    if (todayEnrollDate != null && deadlineDate != null) {
     	        if (todayEnrollDate.compareTo(deadlineDate) > 0) {
     	            deadlineReached = true;
     	        }
     	    }
     	    return deadlineReached;
         }
      }
      