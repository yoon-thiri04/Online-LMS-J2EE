package dao;
import java.io.InputStream;

import util.DBConnection;

import java.sql.*;

import java.util.*;

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
          String sql = "SELECT id,course_id,title,m_type,f_type,status FROM material where course_id="+course_id;
          connection = DBConnection.openConnection();
          statement = connection.createStatement();
          resultSet = statement.executeQuery(sql);
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
      }
      