package util;
import java.sql.*;
public class DBConnection {
      private static Connection con=null;
      public static Connection openConnection(){
    	  try {
    		  Class.forName("com.mysql.cj.jdbc.Driver");
  			con = DriverManager.getConnection("jdbc:mysql://localhost/onlinelearningsystem","root","yoonthiri@2004");
  			 }
    	  catch(ClassNotFoundException e) {
    		  e.printStackTrace();
    	  }catch(SQLException e) {
    		  e.printStackTrace();
    	  }
    	  return con;
      }
      
      
}
