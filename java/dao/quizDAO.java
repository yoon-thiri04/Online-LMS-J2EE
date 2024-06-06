package dao;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Course;
import model.Quiz;
import model.Quizes;
public class quizDAO {
	Connection connection=null;
	Statement statement = null;
	PreparedStatement preparedStatement= null;
	ResultSet resultSet = null;
        public boolean save(Quiz quiz) {
        	boolean flag = false;
    		try {
    			String sql ="insert into quiz (course_id,time_allowed,total_quizes,title,deadline) values (?,?,?,?,?)";
    			connection = DBConnection.openConnection();
    			preparedStatement = connection.prepareStatement(sql);
    			preparedStatement.setInt(1, quiz.getCourse_id());
    			preparedStatement.setString(2,quiz.getTime_allowed() );
    			preparedStatement.setInt(3, quiz.getTotal_quizes());
    			preparedStatement.setString(4, quiz.getTitle());
    			preparedStatement.setString(5, quiz.getDeadline());
    			int rowInserted = preparedStatement.executeUpdate();
    			if(rowInserted >0) flag = true;
        }catch(SQLException e) {
        	e.printStackTrace();
        }
    		return flag;
}     public List<Quiz> get(int course_id){
	       Quiz quiz=null;
	       List <Quiz> list = null;
	       try {
	    	   list = new ArrayList<Quiz>();
				String sql = "select * from quiz where course_id= "+course_id;
				connection = DBConnection.openConnection();
				statement = connection.createStatement();
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()) {
					quiz=new Quiz();
					quiz.setQuiz_id(resultSet.getInt("id"));
					quiz.setCourse_id(resultSet.getInt("course_id"));
					quiz.setTime_allowed(resultSet.getString("time_allowed"));
					quiz.setTotal_quizes(resultSet.getInt("total_quizes"));
					quiz.setTitle(resultSet.getString("title"));
					quiz.setDeadline(resultSet.getString("deadline"));
					list.add(quiz);
				}
	       }catch(SQLException e) {
	    	   e.printStackTrace();
					
					
	    	   
	       }   
	       return list;
}
 public boolean delete(int id) {
	 boolean flag=false;
     try {
       String sql="Delete from quiz where id="+id;
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
 
  public List<Quizes> getQuizes(int quizId) {
      List<Quizes> list = new ArrayList<>();
      Connection connection = null;
      Statement statement = null;
      ResultSet resultSet = null;

      try {
          String sql = "select * from quizz where id=" + quizId;
          connection = DBConnection.openConnection();
          statement = connection.createStatement();
          resultSet = statement.executeQuery(sql);

          while (resultSet.next()) {
              Quizes quizz = new Quizes();
              int quizzId = resultSet.getInt("quiz_id");
              String quizType = resultSet.getString("type");

              quizz.setQuiz_id(quizzId);
              quizz.setId(resultSet.getInt("id"));
              quizz.setQuestion(resultSet.getString("question"));
              quizz.setType(quizType);
              quizz.setCorrect_answer(resultSet.getString("answer"));

              if ("multiple".equalsIgnoreCase(quizType)) {
                  List<String> answers = fetchMultipleChoiceAnswers(quizzId);
                  quizz.setAnswer(answers);
              } else if ("true".equalsIgnoreCase(quizType)) {
                  quizz.setAnswer(List.of("True", "False"));
              }

              list.add(quizz);
          }
      } catch (SQLException e) {
          e.printStackTrace();
      } finally {
          try {
              if (resultSet != null) resultSet.close();
              if (statement != null) statement.close();
              if (connection != null) connection.close();
          } catch (SQLException e) {
              e.printStackTrace();
          }
      }

      return list;
  }

  private List<String> fetchMultipleChoiceAnswers(int quizId) {
      List<String> answers = new ArrayList<>();
      try {
          String sql = "select * from answer where quizz_id=" + quizId;
          connection = DBConnection.openConnection();
          statement = connection.createStatement();
          resultSet = statement.executeQuery(sql);

          while (resultSet.next()) {
              answers.add(resultSet.getString("answer"));
              
          }
      } catch (Exception e) {
          e.printStackTrace();
      }
      return answers;
  }
  public boolean saveQuiz(Quizes quiz) {
	  boolean flag=false;
	  ResultSet generatedKeys=null;
	  try {
			String sql ="insert into quizz (id,question,type,answer) values (?,?,?,?)";
			connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		    preparedStatement.setInt(1, quiz.getId());
			preparedStatement.setString(2,quiz.getQuestion() );
			preparedStatement.setString(3, quiz.getType());
			preparedStatement.setString(4, quiz.getCorrect_answer());
			int rowInserted = preparedStatement.executeUpdate();
			if(quiz.getType().equalsIgnoreCase("multiple")) {
			if(rowInserted >0) {
				generatedKeys = preparedStatement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    
                    int quizId = generatedKeys.getInt(1);
                      flag = insertAnswers(quizId, quiz.getAnswer());
			}
			}}
			else {
				flag=true;
			}
       }catch(SQLException e) {
  	e.printStackTrace();
  }
		return flag;
  }
  private boolean insertAnswers(int quizId, List<String> answers) {
	  boolean flag=false;
	  try {
		  String sql = "INSERT INTO answer (answer,quizz_id) VALUES (?, ?)";
          connection = DBConnection.openConnection();
          preparedStatement = connection.prepareStatement(sql);
          for (String answer : answers) {
              preparedStatement.setString(1, answer);
              preparedStatement.setInt(2, quizId);
              preparedStatement.addBatch();
          }
          int[] rowsInserted = preparedStatement.executeBatch();
          flag = rowsInserted.length == answers.size();
	  } catch (SQLException e) {
          e.printStackTrace();
      }
	  return flag;
  }
  public boolean updateTotal(int total,int quiz_id) {
	  boolean flag=false;
	  try{
		String sql = "UPDATE quiz SET total_quizes = ? where id = ?";
		connection = DBConnection.openConnection();
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, total);
		
		preparedStatement.setInt(2,quiz_id);
		
		int rowUpdated = preparedStatement.executeUpdate();
		if (rowUpdated>0) {
			flag = true;
		}
		}catch(SQLException e) {
		e.printStackTrace();
		}
		return flag;
  }
   public Quizes getQuiz(int quiz_id,String type) throws SQLException {
	   Quizes quiz=new Quizes();
	   
	   String sql="select * from quizz where quiz_id="+quiz_id;
	   connection = DBConnection.openConnection();
       statement = connection.createStatement();
       resultSet = statement.executeQuery(sql);
       if(resultSet.next()) {
    	   quiz.setQuiz_id(resultSet.getInt("quiz_id"));
    	   quiz.setId(resultSet.getInt("id"));
    	   quiz.setQuestion(resultSet.getString("question"));
    	   quiz.setType(resultSet.getString("type"));
    	   quiz.setCorrect_answer(resultSet.getString("answer"));
    	   
       }
       if(type.equalsIgnoreCase("multiple")){
    	   List<String> answers = new ArrayList<>();
    	      try {
    	          String query = "select * from answer where quizz_id=" + quiz_id;
    	          connection = DBConnection.openConnection();
    	          statement = connection.createStatement();
    	          resultSet = statement.executeQuery(query);

    	          while (resultSet.next()) {
    	              answers.add(resultSet.getString("answer"));
    	              
    	          }
    	      } catch (Exception e) {
    	          e.printStackTrace();
    	      }
    	      quiz.setAnswer(answers);
}
       return quiz;
   }
   public boolean updateQuiz(int quiz_id,Quizes quiz) {
	   boolean flag=false;
	   try {
		   String sql="Update quizz set question=?,answer=? where quiz_id=?";
		   connection = DBConnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, quiz.getQuestion());
			
			preparedStatement.setString(2,quiz.getCorrect_answer());
			preparedStatement.setInt(3, quiz_id);
			int rowUpdated = preparedStatement.executeUpdate();
			if (rowUpdated>0) {
				if(quiz.getType().equalsIgnoreCase("multiple"))
				{
				flag=updateAnswer(quiz_id,quiz.getAnswer());
				}
			}
			}catch(SQLException e) {
			e.printStackTrace();
			}
	   return flag;
   }
   public boolean updateAnswer(int quiz_id,List<String> answer) {
	   boolean deleteFlag=deleteAnswers(quiz_id);
	   boolean insertFlag=insertAnswers(quiz_id,answer);
	   return deleteFlag && insertFlag;
	   
   }
   public boolean deleteAnswers(int quiz_id) {
	    boolean flag = false;
	    String sql = "DELETE FROM answer WHERE quizz_id=?";
	    try{
	    	connection = DBConnection.openConnection();
	    preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, quiz_id);
	        int rows = preparedStatement.executeUpdate();
	        flag = rows > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return flag;
	}
   public boolean deleteQuiz(int quiz_id,String type) {
	   boolean flag=false;
	   try {
		   String sql="delete from quizz where quiz_id="+quiz_id;
		   connection=DBConnection.openConnection();
	       preparedStatement=connection.prepareStatement(sql);
	       int rowDeleted=preparedStatement.executeUpdate();
	       if(rowDeleted>0) {
	         flag=deleteAnswers(quiz_id);
	       }
	     }catch(SQLException e) {
	       e.printStackTrace();
	     }  
	   return flag;
   }
  
        
}
