package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Course;
import model.EnrollStudent;
import util.DBConnection;
public class courseDAO {
	Connection connection = null;
	Statement statement = null;
	PreparedStatement preparedStatement= null;
	ResultSet resultSet = null;
	public boolean save(Course course) {
		boolean flag = false;
		try {
			String sql ="insert into courses (title,level,category,description,duration,merged) values (?,?,?,?,?,?)";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, course.getTitle());
			preparedStatement.setString(2, course.getLevel());
			preparedStatement.setString(3, course.getCategory());
			preparedStatement.setString(4,course.getDescription());
			preparedStatement.setString(5, course.getDuration());
			
			preparedStatement.setString(6,course.getMerged());
			
			int rowInserted = preparedStatement.executeUpdate();
			if(rowInserted >0) flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public List<Course> get() throws SQLException{
		List <Course> list = null;
		Course course = null;
		try {
			list = new ArrayList<Course>();
			String sql = "select * from courses";
			connection = DBConnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				course = new Course();
				
				course.setCourse_id(resultSet.getInt("course_id"));
				course.setTitle(resultSet.getString("title"));
				course.setDuration(resultSet.getString("duration"));
				course.setLevel(resultSet.getString("level"));
				course.setCategory(resultSet.getString("category"));
				course.setDescription(resultSet.getString("description"));
				course.setStart_date(resultSet.getString("start_date"));
				course.setEnrollment_deadline(resultSet.getString("enrollment_deadline"));
				course.setMerged(resultSet.getString("merged"));
				list.add(course);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
			return list;
		
	}
	public boolean updateDate(Course c) {
		boolean flag=false;
	    try {
	    	String sql="Update courses set start_date= ?, enrollment_deadline = ? WHERE course_id = ?";
	    	connection=DBConnection.openConnection();
	    	preparedStatement=connection.prepareStatement(sql);
	    	preparedStatement.setString(1,c.getStart_date());
	    	preparedStatement.setString(2, c.getEnrollment_deadline());
	    	preparedStatement.setInt(3, c.getCourse_id());
	    	int rowsAffected = preparedStatement.executeUpdate();
	    	 if(rowsAffected>0) {
	    		 flag=true;
	    	 }
	}
	    catch(Exception e) {
	    	e.printStackTrace();
	    	
	    }
	    return flag;
	}
	public Course get(int course_id) {
		   Course course = null;
		   try {
			course = new Course();
			String sql = "SELECT * FROM courses where course_id="+course_id;
			connection = DBConnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				course.setCourse_id(resultSet.getInt("course_id"));
				course.setTitle(resultSet.getString("title"));
				course.setLevel(resultSet.getString("level"));
				course.setCategory(resultSet.getString("category"));
				course.setDescription(resultSet.getString("description"));
				course.setDuration(resultSet.getString("duration"));
				course.setMerged(resultSet.getString("merged"));
				}
			}catch(SQLException e) {
			e.printStackTrace();
		      }
		    return course;
		}
	public boolean delete(int course_id) {
		   boolean flag = false;
		   try {
		   String sql = "DELETE FROM courses where course_id="+course_id;
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			int rowDeleted = preparedStatement.executeUpdate();
			if(rowDeleted>0) flag = true;
			}catch(SQLException e) {
			e.printStackTrace();
			}
		   return flag;
		}
	public boolean update(Course course) {
		   boolean flag = false;
		   try {
			String sql = "UPDATE courses SET title = ?, level = ?, category = ?, description = ?, duration = ?,start_date =?,enrollment_deadline=? where course_id = ?";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, course.getTitle());
			preparedStatement.setString(2, course.getLevel());
			preparedStatement.setString(3, course.getCategory());
			preparedStatement.setString(4, course.getDescription());
			preparedStatement.setString(5, course.getDuration());
			preparedStatement.setString(6, course.getStart_date());
			preparedStatement.setString(7,course.getEnrollment_deadline() );
			preparedStatement.setInt(8, course.getCourse_id());
			int rowUpdated = preparedStatement.executeUpdate();
			if (rowUpdated>0) flag = true;
			}catch(SQLException e) {
			e.printStackTrace();
			}
			return flag;
		   }
	public String getTitle(int course_id) {
		String title=null;
		try {
			
			String sql = "select title from courses where course_id="+course_id;
			connection = DBConnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				title=resultSet.getString("title");
			}
	}catch(Exception e) {
		e.printStackTrace();
	}
		return title;
	}
	public int getCourse_id(String title) {
		int course_id=0;
		try {
			String sql = "select course_id from courses where title=?";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, title);
			resultSet=preparedStatement.executeQuery();
			if(resultSet.next()) {
				course_id=resultSet.getInt("course_id");
			}
	}catch(Exception e) {
		e.printStackTrace();
	}
		return course_id;
	}
	
	public List<Course> getRunCourse(ArrayList<Integer> runList){
		List<Course> list=new ArrayList<Course>();
		Course course=null;
		try {
			String query = /*"SELECT l.name, c.title,l.course_id " +
                    "FROM courses c " +
                    "LEFT JOIN lectures l ON c.course_id = l.course_id " +
                    "WHERE l.course_id = ?";*/
			
			"SELECT l.name, c.title, l.course_id, COALESCE(COUNT(e.course_id), 0) AS student_count " +
            "FROM courses c " +
            "LEFT JOIN lectures l ON c.course_id = l.course_id " +
            "LEFT JOIN enrollment e ON c.course_id = e.course_id " +
            "WHERE l.course_id = ? " +
            "GROUP BY l.name, c.title, l.course_id";
			connection = DBConnection.openConnection();
			PreparedStatement pstmt = connection.prepareStatement(query);
			for (Integer courseId : runList) {
                pstmt.setInt(1, courseId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    
                    while (rs.next()) {
                    	course = new Course();
                    	 course.setCourse_id(rs.getInt("course_id"));
        				 course.setLecture_name(rs.getString("name"));
                         course.setCourse_title(rs.getString("title"));
                         course.setStudent_count(rs.getInt("student_count"));
                         list.add(course);
        				
                    }
                    }catch (SQLException e) {
                        e.printStackTrace();
                    }}
                
	
			}catch (SQLException e) {
        e.printStackTrace();
    }
		return list;
}
	
	
	public List<EnrollStudent> getEnrollStudent(int course_id) throws SQLException{
		List <EnrollStudent> list = null;
		EnrollStudent e = null;
		try {
			list = new ArrayList<EnrollStudent>();
			String sql = "select * from enrollment where course_id="+course_id;
			connection = DBConnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
			    e = new EnrollStudent();
			    e.setName(resultSet.getString("name"));
				e.setEmail(resultSet.getString("email"));
				e.setDate(resultSet.getString("date"));
				list.add(e);
			}
		}catch(SQLException e1) {
			e1.printStackTrace();
		}
		
			return list;
		
	}
}
