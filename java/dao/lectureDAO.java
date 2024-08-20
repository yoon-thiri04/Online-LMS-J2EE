package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.CourseInstructor;
import model.EnrollStudent;
import model.Lect;
import model.User;
import util.DBConnection;

public class lectureDAO {
	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	ResultSet resultSet=null;
	PreparedStatement preparedstatement = null;
	public List<Lect> get(){
		List<Lect> list = null;
		Lect lect = null;
		try {
			list = new ArrayList<Lect>();
			String sql = "select * from lectures";
			connection = DBConnection.openConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(sql);
			while(resultset.next()) {
				lect = new Lect();
				lect.setName(resultset.getString("name"));
				lect.setPassword(resultset.getString("password"));
				
				lect.setEmail(resultset.getString("email"));
				lect.setQualification(resultset.getString("qualification"));
				lect.setFilename(resultset.getString("filename"));
				lect.setPath(resultset.getString("path"));
				lect.setCourse_id(resultset.getInt("course_id"));
				list.add(lect);
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
	public boolean isExist(String email) {
	    
	    boolean flag = false;
	      try {
	          String sql = "SELECT password FROM lectures WHERE email=?";
	          connection = DBConnection.openConnection();
	          preparedstatement = connection.prepareStatement(sql);
	          preparedstatement.setString(1, email);
	          resultSet = preparedstatement.executeQuery();
	          flag = resultSet.next(); // If there is any result, set flag to true
	      } catch (SQLException e) {
	          e.printStackTrace();
	      } 
	    return flag;
	  }
	public List<CourseInstructor> get1(String category) {
	    List<CourseInstructor> list = new ArrayList<>();
	    CourseInstructor c_i = null;
	    
	    try (Connection connection = DBConnection.openConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(
	                 "SELECT  l.name,l.filename, l.course_id, c.title, c.duration, c.level, c.category, c.description " +
	                         "FROM lectures l INNER JOIN courses c ON l.course_id = c.course_id WHERE category=?")) {
	        preparedStatement.setString(1, category);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	                c_i = new CourseInstructor();
	               
	                c_i.setInstructor_name(resultSet.getString("name"));
	                c_i.setCourse_id(resultSet.getInt("course_id"));
	                c_i.setTitle(resultSet.getString("title"));
	                c_i.setDuration(resultSet.getString("duration"));
	                c_i.setLevel(resultSet.getString("level"));
	                c_i.setCategory(resultSet.getString("category"));
	                c_i.setDescription(resultSet.getString("description"));
	                c_i.setFilename(resultSet.getString("filename"));
	                list.add(c_i);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return list;
	}
	public List<CourseInstructor> get(int course_id) {
	    List<CourseInstructor> list = new ArrayList<>();
	    CourseInstructor c_i = null;
	    
	    try (Connection connection = DBConnection.openConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(
	                 "SELECT  l.name,l.filename, l.course_id, c.title, c.duration, c.level, c.category, c.description " +
	                         "FROM lectures l INNER JOIN courses c ON l.course_id = c.course_id WHERE c.course_id=?")) {
	        preparedStatement.setInt(1, course_id);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	                c_i = new CourseInstructor();
	               
	                c_i.setInstructor_name(resultSet.getString("name"));
	                c_i.setCourse_id(resultSet.getInt("course_id"));
	                c_i.setTitle(resultSet.getString("title"));
	                c_i.setDuration(resultSet.getString("duration"));
	                c_i.setLevel(resultSet.getString("level"));
	                c_i.setCategory(resultSet.getString("category"));
	                c_i.setDescription(resultSet.getString("description"));
	                c_i.setFilename(resultSet.getString("filename"));
	                list.add(c_i);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return list;
	}
	   public String getPwd(String email) {
	    String pwd = null;
	    try {
	        String sql = "SELECT password FROM lectures WHERE email=?";
	        connection = DBConnection.openConnection();
	        preparedstatement = connection.prepareStatement(sql);
	        preparedstatement.setString(1, email);
	        resultSet = preparedstatement.executeQuery(); 
	        
	        if (resultSet.next()) {
	            pwd = resultSet.getString("password");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	       
	    }
	    return pwd;
	}
	
	public int getCourseID(String email) {
		int course_id = 0;
	    try {
	        String sql = "SELECT course_id FROM lectures WHERE email=?";
	        connection = DBConnection.openConnection();
	        preparedstatement = connection.prepareStatement(sql);
	        preparedstatement.setString(1, email);
	        resultSet = preparedstatement.executeQuery(); 
	        
	        if (resultSet.next()) {
	            course_id = resultSet.getInt("course_id");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	       
	    }
	    return course_id;
	}

	public int checkEnrollment(int course_id,String name) {
		 boolean flag=false;
		 int course_id_from=0;
	    try {
	        String sql = "SELECT course_id FROM enrollment WHERE name=?";
	        connection = DBConnection.openConnection();
	        preparedstatement = connection.prepareStatement(sql);
	        preparedstatement.setString(1, name);
	        resultSet = preparedstatement.executeQuery(); 
	        
	        while(resultSet.next()) {
	            course_id_from = resultSet.getInt("course_id");
	            if(course_id_from==course_id) {
	            	flag=true;
	            	break;
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } 
	    
	    return course_id;
	}
	public String getName(String name) {
		String s_name=null;
		try {
	        String sql = "SELECT name FROM student WHERE name=?";
	        connection = DBConnection.openConnection();
	        preparedstatement = connection.prepareStatement(sql);
	        preparedstatement.setString(1, name);
	        resultSet = preparedstatement.executeQuery(); 
	        
	        while(resultSet.next()) {
	        	s_name=resultSet.getString("name");
	        }
	        
	}catch (SQLException e) {
        e.printStackTrace();
    } 
    
    return s_name;

}
	 public boolean save1(Lect user) {
		   boolean flag = false;
		   try {
			String sql = "INSERT INTO userlist(user_name,password, email) VALUES (?,?,?)";
			connection = DBConnection.openConnection();
			preparedstatement = 	connection.prepareStatement(sql);
			preparedstatement.setString(1, user.getName());
			preparedstatement.setString(2, user.getPassword());
			preparedstatement.setString(3, user.getEmail());
			
			int rowInserted = preparedstatement.executeUpdate();
			if (rowInserted > 0) flag = true;
			}catch(SQLException ex) {
			ex.printStackTrace();
		      }
		   return flag;
		
	 }

	 public List<EnrollStudent> getEnrollmentDetails(int course_id) {
		 
		    List<EnrollStudent> enrollStudentList = new ArrayList<>();
		    try {
		        Connection connection = DBConnection.openConnection();
		        PreparedStatement preparedStatement = connection.prepareStatement("SELECT name, email, date FROM enrollment WHERE course_id = ?");
		        preparedStatement.setInt(1, course_id);
		        ResultSet resultSet = preparedStatement.executeQuery();
		        
		        while (resultSet.next()) {
		        	EnrollStudent student = new EnrollStudent();
		             student.setName(resultSet.getString("name"));
		             student.setEmail(resultSet.getString("email"));
		             student.setDate(resultSet.getString("date"));
		            
		            enrollStudentList.add(student);
		        }
		        
		        
		        resultSet.close();
		        preparedStatement.close();
		        connection.close();
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return enrollStudentList;
		}
	 public String getNameLecture(String email) {
		 String username = null;
		    try {
		        String sql = "SELECT name FROM lectures WHERE email=?";
		        connection = DBConnection.openConnection();
		        preparedstatement = connection.prepareStatement(sql);
		        preparedstatement.setString(1,email);
		        resultSet = preparedstatement.executeQuery(); 
		        
		        if (resultSet.next()) {
		            username = resultSet.getString("name");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 
		    return username;
	}
	 public Lect getLecturerByEmail(String email) {
		    Lect lect = new Lect();
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    ResultSet resultSet = null;
		    
		    try {
		        String sql = "SELECT * FROM lectures WHERE email=?";
		        connection = DBConnection.openConnection();
		        preparedStatement = connection.prepareStatement(sql);
		        preparedStatement.setString(1, email);
		        resultSet = preparedStatement.executeQuery(); 
		        
		        if (resultSet != null && resultSet.next()) {
		            lect.setName(resultSet.getString("name"));
		            lect.setPassword(resultSet.getString("password"));
		            lect.setEmail(resultSet.getString("email"));
		            lect.setQualification(resultSet.getString("qualification"));
		            lect.setFilename(resultSet.getString("filename"));
		            lect.setPath(resultSet.getString("path"));
		            lect.setCourse_id(resultSet.getInt("course_id"));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        try {
		            if (resultSet != null) resultSet.close();
		            if (preparedStatement != null) preparedStatement.close();
		            if (connection != null) connection.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    
		    return lect;
		}
   public int material_count(int course_id) throws SQLException {
	   PreparedStatement preparedStatement = null;
	   int mat_count=0;
	   String sql = "SELECT count(*) as total FROM material where course_id=? and m_type <> 'Assignment' ";
	   Connection connection = DBConnection.openConnection();
	    preparedStatement = connection.prepareStatement(sql);
	   preparedStatement.setInt(1,course_id);
	   
	   ResultSet resultSet = preparedStatement.executeQuery(); 
	   
	   if(resultSet.next()){
		mat_count=resultSet.getInt("total");
	   }
	   return mat_count;
   }

}
