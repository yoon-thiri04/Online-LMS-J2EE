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
      public boolean updatePwd_lect(String name,String pwd) throws ClassNotFoundException {
    	  boolean flag = false;
    	 
	      try {
	          String sql = "Update lectures set password=? WHERE name=?";
	          Class.forName("com.mysql.cj.jdbc.Driver");
  	        try (Connection connection = DBConnection.openConnection();
  	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
  	            preparedStatement.setString(1, pwd);
  	            preparedStatement.setString(2, name);
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
      public boolean updatePwd_stud(String name, String pwd) throws ClassNotFoundException {
    	    boolean flag = false;
    	    try {
    	        String sql = "UPDATE student SET password=? WHERE name=?";
    	        Class.forName("com.mysql.cj.jdbc.Driver");
    	        try (Connection connection = DBConnection.openConnection();
    	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
    	            preparedStatement.setString(1, pwd);
    	            preparedStatement.setString(2, name);
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

    	public boolean updatePwd(String name, String pwd) throws ClassNotFoundException {
    	    boolean flag = false;
    	    try {
    	        String sql = "UPDATE userlist SET password=? WHERE name=?";
    	        Class.forName("com.mysql.cj.jdbc.Driver");
    	        try (Connection connection = DBConnection.openConnection();
    	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
    	            preparedStatement.setString(1, pwd);
    	            preparedStatement.setString(2, name);
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
    	 public boolean updatePwd_User(String name,String pwd) throws ClassNotFoundException {
       	  boolean flag = false;
       	 
   	      try {
   	          String sql = "Update userlist set password=? WHERE user_name=?";
   	          Class.forName("com.mysql.cj.jdbc.Driver");
     	        try (Connection connection = DBConnection.openConnection();
     	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
     	            preparedStatement.setString(1, pwd);
     	            preparedStatement.setString(2, name);
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
    	 public boolean updatePwdAdmin(String name, String pwd) throws ClassNotFoundException {
     	    boolean flag = false;
     	    try {
     	        String sql = "UPDATE userlist SET password=? WHERE user_name=?";
     	        Class.forName("com.mysql.cj.jdbc.Driver");
     	        try (Connection connection = DBConnection.openConnection();
     	             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
     	            preparedStatement.setString(1, pwd);
     	            preparedStatement.setString(2, name);
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
