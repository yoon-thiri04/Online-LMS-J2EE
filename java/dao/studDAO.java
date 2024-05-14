package dao;
import util.DBConnection;
import model.Student;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Student;

import model.EnrollStudent;
public class studDAO {
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	public List<EnrollStudent> get() {
		List<EnrollStudent> list = null;
		EnrollStudent stu = null;
		try {
		    list = new ArrayList<EnrollStudent>();
		    String sql = "SELECT id,name,email,enorllment_date FROM enrollment";
		    connection = DBConnection.openConnection();
		    statement = connection.createStatement();
		    resultSet = statement.executeQuery(sql);
		    while(resultSet.next()) {
			stu=new EnrollStudent();
			stu.setCourse_id(resultSet.getInt("course_id"));
			stu.setName(resultSet.getString("name"));
			stu.setEmail(resultSet.getString("email"));
			stu.setDate(resultSet.getString("enrollment_date"));
			
			list.add(stu);
		          }
		   }catch(SQLException e) {
		   e.printStackTrace();
		}
		return list;
		}
	
	public boolean isExist(String email) {
		
		boolean flag = false;
	    try {
	        String sql = "SELECT password FROM student WHERE email=?";
	        connection = DBConnection.openConnection();
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, email);
	        resultSet = preparedStatement.executeQuery();
	        flag = resultSet.next(); // If there is any result, set flag to true
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
		return flag;
	}
public boolean isExist1(String name) {
		
		boolean flag = false;
	    try {
	        String sql = "SELECT password FROM userlist WHERE user_name=?";
	        connection = DBConnection.openConnection();
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, name);
	        resultSet = preparedStatement.executeQuery();
	        flag = resultSet.next(); // If there is any result, set flag to true
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
		return flag;
	}
	 public boolean delete(int id) {
   	  boolean flag=false;
   	  try {
   		  String sql="Delete from enrollment where enrollment_id="+id;
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
	 public boolean save(Student stud) {
		   boolean flag = false;
		   try {
			String sql = "INSERT INTO student(name, email,password) VALUES (?,?,?)";
			connection = DBConnection.openConnection();
			preparedStatement = 	connection.prepareStatement(sql);
			preparedStatement.setString(1, stud.getName());
			preparedStatement.setString(2, stud.getEmail());
			preparedStatement.setString(3, stud.getPassword());
			int rowInserted = preparedStatement.executeUpdate();
			if (rowInserted > 0) flag = true;
			}catch(SQLException ex) {
			ex.printStackTrace();
		      }
		   return flag;
		
	 }
	 
	 public boolean save1(User user) {
		   boolean flag = false;
		   try {
			String sql = "INSERT INTO userlist(user_name,password, email) VALUES (?,?,?)";
			connection = DBConnection.openConnection();
			preparedStatement = 	connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUser_name());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getEmail());
			
			int rowInserted = preparedStatement.executeUpdate();
			if (rowInserted > 0) flag = true;
			}catch(SQLException ex) {
			ex.printStackTrace();
		      }
		   return flag;
		
	 }
	 public String getPwd(String email) {
		    String pwd = null;
		    try {
		        String sql = "SELECT password FROM student WHERE email=?";
		        connection = DBConnection.openConnection();
		        preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, email);
		        resultSet = preparedStatement.executeQuery(); 
		        
		        if (resultSet.next()) {
		            pwd = resultSet.getString("password");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 
		    return pwd;
		}
	 public String getPwdAdmin(String username) {
		    String pwd = null;
		    try {
		        String sql = "SELECT password FROM userlist WHERE user_name=?";
		        connection = DBConnection.openConnection();
		        preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, username);
		        resultSet = preparedStatement.executeQuery(); 
		        
		        if (resultSet.next()) {
		            pwd = resultSet.getString("password");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 
		    return pwd;
		}
	 public String getPwd1(String email) {
		    String pwd = null;
		    try {
		        String sql = "SELECT password FROM student WHERE email=?";
		        connection = DBConnection.openConnection();
		        preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, email);
		        resultSet = preparedStatement.executeQuery(); 
		        
		        if (resultSet.next()) {
		            pwd = resultSet.getString("password");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 
		    return pwd;
		}
	 public int getCourseID(String email) {
			int course_id = 0;
		    try {
		        String sql = "SELECT course_id FROM enrollment WHERE email=?";
		        connection = DBConnection.openConnection();
		        preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, email);
		        resultSet = preparedStatement.executeQuery(); 
		        
		        if (resultSet.next()) {
		            course_id = resultSet.getInt("course_id");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		       
		    }
		    return course_id;
		}
} 
