package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Course;
import util.DBConnection;
public class courseDAO {
	Connection connection = null;
	Statement statement = null;
	PreparedStatement preparedStatement= null;
	ResultSet resultSet = null;
	public boolean save(Course course) {
		boolean flag = false;
		try {
			String sql ="insert into courses (title,level,category,description,duration,start_date,enrollment_deadline,merged) values (?,?,?,?,?,?,?,?)";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, course.getTitle());
			preparedStatement.setString(2, course.getLevel());
			preparedStatement.setString(3, course.getCategory());
			preparedStatement.setString(4,course.getDescription());
			preparedStatement.setString(5, course.getDuration());
			preparedStatement.setString(6, course.getStart_date());
			preparedStatement.setString(7,course.getEnrollment_deadline());
			preparedStatement.setString(8,course.getMerged());
			
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
				course.setStart_date(resultSet.getString("start_date"));
				course.setEnrollment_deadline(resultSet.getString("enrollment_deadline"));
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
}

