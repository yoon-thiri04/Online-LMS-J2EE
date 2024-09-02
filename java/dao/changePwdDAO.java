package dao;
import java.sql.Connection
;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBConnection;
public class changePwdDAO {
	 Connection connection=null;
	 PreparedStatement preparedstatement=null;
	 ResultSet resultSet=null;
      public boolean updatePwd_lect(String email,String pwd) throws ClassNotFoundException {
    	  boolean flag = false;
    	 
	      try {
	          String sql = "Update lectures set password=? WHERE email=?";
	          Class.forName("com.mysql.cj.jdbc.Driver");
  	        try (Connection connection = DBConnection.openConnection();
  	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
  	            preparedStatement.setString(1, pwd);
  	            preparedStatement.setString(2, email);
  	            int rowsAffected = preparedStatement.executeUpdate();
  	            flag = rowsAffected > 0;
  	        } catch (SQLException e) {
  	            e.printStackTrace();
  	        }
  	    } catch (ClassNotFoundException e) {
  	        e.printStackTrace();
  	        throw e; // Re-throw ClassNotFoundException to indicate failure to load driver
  	    }
  	    return flag;
  	}
      public boolean updatePwd_stud(String email, String pwd) throws ClassNotFoundException {
    	    boolean flag = false;
    	    try {
    	        String sql = "UPDATE student SET password=? WHERE email=?";
    	        Class.forName("com.mysql.cj.jdbc.Driver");
    	        try (Connection connection = DBConnection.openConnection();
    	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
    	            preparedStatement.setString(1, pwd);
    	            preparedStatement.setString(2, email);
    	            int rowsAffected = preparedStatement.executeUpdate();
    	            flag = rowsAffected > 0;
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	        }
    	    } catch (ClassNotFoundException e) {
    	        e.printStackTrace();
    	        throw e; // Re-throw ClassNotFoundException to indicate failure to load driver
    	    }
    	    return flag;
    	}

    	public boolean updatePwd(String email, String pwd) throws ClassNotFoundException {
    	    boolean flag = false;
    	    try {
    	        String sql = "UPDATE userlist SET password=? WHERE email=?";
    	        Class.forName("com.mysql.cj.jdbc.Driver");
    	        try (Connection connection = DBConnection.openConnection();
    	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
    	            preparedStatement.setString(1, pwd);
    	            preparedStatement.setString(2, email);
    	            int rowsAffected = preparedStatement.executeUpdate();
    	            flag = rowsAffected > 0;
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	        }
    	    } catch (ClassNotFoundException e) {
    	        e.printStackTrace();
    	        throw e; // Re-throw ClassNotFoundException to indicate failure to load driver
    	    }
    	    return flag;
    	}
    	 public boolean updatePwd_User(String email,String pwd) throws ClassNotFoundException {
       	  boolean flag = false;
       	 
   	      try {
   	          String sql = "Update userlist set password=? WHERE email=?";
   	          Class.forName("com.mysql.cj.jdbc.Driver");
     	        try (Connection connection = DBConnection.openConnection();
     	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
     	            preparedStatement.setString(1, pwd);
     	            preparedStatement.setString(2, email);
     	            int rowsAffected = preparedStatement.executeUpdate();
     	            flag = rowsAffected > 0;
     	        } catch (SQLException e) {
     	            e.printStackTrace();
     	        }
     	    } catch (ClassNotFoundException e) {
     	        e.printStackTrace();
     	        throw e; // Re-throw ClassNotFoundException to indicate failure to load driver
     	    }
     	    return flag;
     	}

}
