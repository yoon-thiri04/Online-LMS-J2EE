package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.User;
import util.DBConnection;
public class UserDAO {
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	PreparedStatement preparedStatement = null;
	public List<User> get(){
		List<User> list = null;
		User user = null;
		try {
			list = new ArrayList<User>();
			String sql = "Select * from userlist";
			connection = DBConnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				user = new User();
				user.setUser_name(resultSet.getString("user_name"));
				user.setPassword(resultSet.getString("password"));
				user.setEmail(resultSet.getString("email"));
				
				list.add(user);
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	
	public User get(int id) {
		   User student = null;
		   try {
			student = new User();
			String sql = "SELECT * FROM tbl_student where id="+id;
			Connection connection = DBConnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				student.setUser_name(resultSet.getString("user_name"));
				student.setPassword(resultSet.getString("password"));
				student.setEmail(resultSet.getString("email"));
				
				}
			}catch(SQLException e) {
			e.printStackTrace();
		      }
		    return student;
		}

	public boolean save(User user) {
		boolean flag = false;
		try {
			String sql = "Insert into userlist(user_name,password,email) values (?,?,?)";
			Connection connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
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
public boolean isExistUsers(String name) {
		
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
public String getName(String email) {
	 String username = null;
	    try {
	        String sql = "SELECT user_name FROM userlist WHERE email=?";
	        connection = DBConnection.openConnection();
	        preparedStatement = connection.prepareStatement(sql);
	        preparedStatement.setString(1,email);
	        resultSet = preparedStatement.executeQuery(); 
	        
	        if (resultSet.next()) {
	            username = resultSet.getString("user_name");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    return username;
}

}

