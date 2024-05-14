package dao;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.EnrollStudent;
import util.DBConnection;
public class EnrollStudentDAO {
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	public boolean save(EnrollStudent stu) {
	    boolean flag = false;
	    try {
	        String sql = "INSERT INTO enrollment(name, email, course_id) VALUES (?,?,?,?)";
	        connection = DBConnection.openConnection();
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1, stu.getName());
	        preparedStatement.setString(2, stu.getEmail());
	        // Should be stu.getDate()
	        preparedStatement.setInt(4, stu.getCourse_id());
	        int rowInserted = preparedStatement.executeUpdate();
	        if (rowInserted > 0) flag = true;
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	    } finally {
	        // Close resources
	        try {
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }
	    return flag;
	}

	public List<EnrollStudent> get_enroll(int course_id) {
		List<EnrollStudent> list = null;
		EnrollStudent student = null;
		try {
		    list = new ArrayList<EnrollStudent >();
		    String sql = "SELECT * FROM enrollment where course_id="+course_id;
		    connection = DBConnection.openConnection();
		    statement = connection.createStatement();
		    resultSet = statement.executeQuery(sql);
		    while(resultSet.next()) {
			student = new EnrollStudent();
			
			student.setName(resultSet.getString("name"));
			
			student.setEmail(resultSet.getString("email"));
			
			
			list.add(student);
		          }
		   }catch(SQLException e) {
		   e.printStackTrace();
		}
		return list;
		}
	 public boolean delete(String email,int course_id) {
	        boolean flag=false;
	        try {
	          String sql="delete from enrollment where email= ? and course_id=?";
	          connection=DBConnection.openConnection();
	          preparedStatement=connection.prepareStatement(sql);
		         
	          preparedStatement.setString(1, email);
	          preparedStatement.setInt(2,course_id);
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
