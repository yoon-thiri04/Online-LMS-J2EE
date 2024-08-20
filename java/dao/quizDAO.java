package dao;
import model.QuizResultAnswer;

import java.util.*;
import java.util.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import util.DBConnection;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import model.Course;
import model.Quiz;
import model.QuizResult;
import model.Quizes;
public class quizDAO {
	Connection connection=null;
	Statement statement = null;
	PreparedStatement preparedStatement= null;
	ResultSet resultSet = null;
        public boolean save(Quiz quiz) {
        	boolean flag = false;
    		try {
    			String sql ="insert into quiz (course_id,total_quizes,title,deadline) values (?,?,?,?)";
    			connection = DBConnection.openConnection();
    			preparedStatement = connection.prepareStatement(sql);
    			preparedStatement.setInt(1, quiz.getCourse_id());
    			preparedStatement.setInt(2, quiz.getTotal_quizes());
    			preparedStatement.setString(3, quiz.getTitle());
    			preparedStatement.setString(4, quiz.getDeadline());
    			int rowInserted = preparedStatement.executeUpdate();
    			if(rowInserted >0) flag = true;
        }catch(SQLException e) {
        	e.printStackTrace();
        }
    		return flag;
}     public boolean updateQ(Quiz quiz,int quiz_id) {
	    boolean flag=false;
	    try {
	    	String sql="Update quiz set title = ?, deadline = ? WHERE id = ?";
	    	connection=DBConnection.openConnection();
	    	preparedStatement=connection.prepareStatement(sql);
	    	preparedStatement.setString(1,quiz.getTitle());
	    	preparedStatement.setString(2, quiz.getDeadline());
	    	preparedStatement.setInt(3, quiz_id);
	    	 int rowsAffected = preparedStatement.executeUpdate();
	    	 if(rowsAffected>0) {
	    		 flag=true;
	    	 }
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    return flag;
}
        public List<Quiz> get(int course_id){
	       Quiz quiz=null;
	       List <Quiz> list = null;
	       try {
	    	   list = new ArrayList<Quiz>();
				String sql = "select * from quiz where course_id="+course_id;
				connection = DBConnection.openConnection();
				statement = connection.createStatement();
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()) {
					quiz=new Quiz();
					quiz.setQuiz_id(resultSet.getInt("id"));
					quiz.setCourse_id(resultSet.getInt("course_id"));
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
         flag=deleteOverallQuiz(id) && deleteResult(id);
       }
     }catch(SQLException e) {
       e.printStackTrace();
     }
     return flag;
 }
  public Quiz getQuiz(int quiz_id) {
	  Quiz quiz=new Quiz();
	  try {
		  String sql="select * from quiz where id="+quiz_id;
		  connection = DBConnection.openConnection();
          statement = connection.createStatement();
          resultSet = statement.executeQuery(sql);
          if(resultSet.next()) {
        	  quiz.setQuiz_id(resultSet.getInt("id"));
        	  quiz.setCourse_id(resultSet.getInt("course_id"));
        	  quiz.setTitle(resultSet.getString("title"));
        	  quiz.setDeadline(resultSet.getString("deadline"));
          }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return quiz;
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
   
   public boolean deleteOverallQuiz(int quiz_id) throws SQLException {
	   boolean flag=false;
	   String deleteAnswersSQL = "DELETE FROM answer WHERE quizz_id IN (SELECT quiz_id FROM quizz WHERE id = ?)";
       String deleteQuizSQL = "DELETE FROM quizz WHERE id = ?";

       try (
    		   Connection conn=DBConnection.openConnection();
    		   
    		   PreparedStatement deleteAnswersStmt = conn.prepareStatement(deleteAnswersSQL);
               PreparedStatement deleteQuizStmt = conn.prepareStatement(deleteQuizSQL)) 
              {
              deleteAnswersStmt.setInt(1, quiz_id);
              int answersDeleted = deleteAnswersStmt.executeUpdate();
              deleteQuizStmt.setInt(1, quiz_id);
              
              int quizzesDeleted = deleteQuizStmt.executeUpdate();
              if(answersDeleted>=0 && quizzesDeleted>=0) {
            	  flag=true;
              }
       }
	   return flag;
   }
   public boolean deleteResult(int quiz_id) throws SQLException {
	   boolean flag=false;
	   
		   String sql="DELETE FROM quizresultanswer where result_id In(select result_id from quizresult where quiz_id=?)";
		   String deleteQuizSQL = "DELETE FROM quizresult WHERE quiz_id = ?";
		   try (
	    		   Connection conn=DBConnection.openConnection();
	    		   
	    		   PreparedStatement deleteAnswersStmt = conn.prepareStatement(sql);
	               PreparedStatement deleteQuizStmt = conn.prepareStatement(deleteQuizSQL)) 
	              {
	              deleteAnswersStmt.setInt(1, quiz_id);
	              int answersDeleted = deleteAnswersStmt.executeUpdate();
	              deleteQuizStmt.setInt(1, quiz_id);
	              
	              int quizzesDeleted = deleteQuizStmt.executeUpdate();
	              if(answersDeleted>=0 && quizzesDeleted>=0) {
	            	  flag=true;
	              }
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
  public boolean saveQuizResult(QuizResult result) {
	  boolean flag=false;
	  try {
	  String sql ="insert into quizresult (quiz_id,student_email,start_datetime,state) values (?,?,?,?)";
		connection = DBConnection.openConnection();
		preparedStatement = connection.prepareStatement(sql);
	    preparedStatement.setInt(1,result.getQuiz_id());
	    preparedStatement.setString(2,result.getStudent_email());
	    preparedStatement.setTimestamp(3, Timestamp.valueOf(result.getStartTime()));
	    preparedStatement.setString(4,result.getState());
	    int rowInserted=preparedStatement.executeUpdate();
	    if(rowInserted>0) {
	    	flag=true;
	    }
	  }catch(SQLException e) {
		  e.printStackTrace();
	  }
	  return flag;
  }
  public LocalDateTime getStartTime(int quiz_id) {
	  LocalDateTime startTime=null;
	  Timestamp timestamp=null;
	  try {
		  String sql="select start_datetime from quizresult where quiz_id="+quiz_id;
		  connection=DBConnection.openConnection();
		  statement = connection.createStatement();
	      resultSet = statement.executeQuery(sql);
	      if(resultSet.next()){
	    	   timestamp = resultSet.getTimestamp("start_datetime");
	      }
	      if (timestamp != null) {
              startTime = timestamp.toLocalDateTime();
	  }
  }catch(Exception e) {
	  e.printStackTrace();
  }
  return startTime;      
}
  public Map<Integer, String> getCorrectAnswers(int quiz_id) {
	  Map<Integer, String> correctAnswers = new HashMap<>();
	  try {
		  String sql="select quiz_id,answer from quizz where id="+quiz_id;
		  connection=DBConnection.openConnection();
		  statement=connection.createStatement();
		  resultSet=statement.executeQuery(sql);
		  while(resultSet.next()) {
			  int q_id=resultSet.getInt("quiz_id");
			  String answer=resultSet.getString("answer");
			  correctAnswers.put(q_id, answer);
		  }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return correctAnswers;
  }
  public int getResultId(int quiz_id,String email) {
	  int result_id=0;
	  try {
		  String sql="select result_id from quizresult where quiz_id=? and student_email=?";
		  connection=DBConnection.openConnection();
		  PreparedStatement preparedStatement = connection.prepareStatement(sql);
		  preparedStatement.setInt(1, quiz_id); 
		  preparedStatement.setString(2, email);
		  ResultSet resultSet = preparedStatement.executeQuery();
          if(resultSet.next()) {
        	  result_id=resultSet.getInt("result_id");
          }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return result_id;
  }
  public boolean saveStudentAnswer(int result_id,String answer,int quiz_id,String isCorrect) {
	  boolean flag=false;
	  try {
		  String sql="insert into quizresultanswer(result_id,answer,quizz_id,isCorrect)values (?,?,?,?)";
		  connection = DBConnection.openConnection();
		  preparedStatement = connection.prepareStatement(sql);
		  preparedStatement.setInt(1,result_id);
		  preparedStatement.setString(2,answer);
		  preparedStatement.setInt(3, quiz_id);
		  preparedStatement.setString(4, isCorrect);	  
		  int rowInserted=preparedStatement.executeUpdate();
		  if(rowInserted>0) {
			  flag=true;
		  }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return flag;
  }
  public int calculateScore(Map<Integer,String> userAnswers,Map<Integer,String> correctAnswers,int result_id) {
	  int score=0;
	  for (Map.Entry<Integer, String> entry : userAnswers.entrySet()) {
          int quizId = entry.getKey();
          String userAnswer = entry.getValue();
          String correctAnswer = correctAnswers.get(quizId);
          if (correctAnswer != null && correctAnswer.equals(userAnswer)) {
        	  saveStudentAnswer(result_id,userAnswer,quizId,"T");
              ++score;
          }
          else {
        	  saveStudentAnswer(result_id,userAnswer,quizId,"F");
          }
      }
	  return score;
  }
  public boolean updateQuizResult(QuizResult result) {
	  boolean flag=false;
	  try {
		  String sql = "UPDATE quizresult SET end_datetime=?, time_taken=?, state=?,score=? where result_id=? ";
		  connection = DBConnection.openConnection();
		  preparedStatement = connection.prepareStatement(sql);
		  preparedStatement.setTimestamp(1, Timestamp.valueOf(result.getEndTime()));
		  preparedStatement.setString(2, result.getTime_taken());
		  preparedStatement.setString(3,result.getState());
		  preparedStatement.setInt(4, result.getScore());
		  preparedStatement.setInt(5, result.getResult_id());
		  int rowUpdated=preparedStatement.executeUpdate();
		  if(rowUpdated>0) {
			  flag=true;
		  }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return flag;
  }
  public QuizResult getQuizResult(int result_id) {
	  QuizResult result=new QuizResult();
	  Timestamp start_time_stamp=null;
	  Timestamp end_time_stamp=null;
	  try {
		  String sql="select * from quizresult where result_id="+result_id;
		  connection=DBConnection.openConnection();
		  statement=connection.createStatement();
		  resultSet=statement.executeQuery(sql);
		  if(resultSet.next()) {
			  result.setResult_id(resultSet.getInt("result_id"));
			  result.setQuiz_id(resultSet.getInt("quiz_id"));
			  result.setStudent_email(resultSet.getString("student_email"));
			  start_time_stamp= resultSet.getTimestamp("start_datetime");
			  result.setStartTime(start_time_stamp.toLocalDateTime());
			  end_time_stamp=resultSet.getTimestamp("end_datetime");
			  result.setEndTime(end_time_stamp.toLocalDateTime());
			  result.setTime_taken(resultSet.getString("time_taken"));
			  result.setState(resultSet.getString("state"));
			  result.setScore(resultSet.getInt("score"));
		  }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return result;
  }
  public Map<Integer,QuizResultAnswer> getAnswers(int result_id) {
	  Map<Integer,QuizResultAnswer> Answer=new HashMap<>();
	 try {
		 String sql="select answer,quizz_id,isCorrect from quizresultanswer where result_id="+result_id;
		 connection=DBConnection.openConnection();
		 statement=connection.createStatement();
		 resultSet=statement.executeQuery(sql);
		 while(resultSet.next()) {
			 QuizResultAnswer result=new QuizResultAnswer(resultSet.getString("answer"),resultSet.getString("isCorrect"));
			 Answer.put(resultSet.getInt("quizz_id"), result);
		 }
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	 return Answer;
  }
  public List<QuizResult> getQuizResultList(int quiz_id){
	  List<QuizResult> list=new ArrayList<>();
	  QuizResult result=null;
	  Timestamp start_time_stamp=null;
	  Timestamp end_time_stamp=null;
	  try {
		  String sql="select * from quizresult where quiz_id="+quiz_id;
		  connection=DBConnection.openConnection();
		  statement=connection.createStatement();
		  resultSet=statement.executeQuery(sql);
		  while(resultSet.next()) {
			  result=new QuizResult();
			  result.setResult_id(resultSet.getInt("result_id"));
			  result.setQuiz_id(resultSet.getInt("quiz_id"));
			  result.setStudent_email(resultSet.getString("student_email"));
			  start_time_stamp=resultSet.getTimestamp("start_datetime");
			  result.setStartTime(start_time_stamp.toLocalDateTime());
			  end_time_stamp=resultSet.getTimestamp("end_datetime");
			  result.setEndTime(end_time_stamp.toLocalDateTime());
			  result.setTime_taken(resultSet.getString("time_taken"));
			  result.setState(resultSet.getString("state"));
			  result.setScore(resultSet.getInt("score"));
			  list.add(result);
		  }
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return list;
  }
  public static String formatDateTime(LocalDateTime dateTime) {
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	    return dateTime.format(formatter);
	}
  public boolean DeadlineReached(int quiz_id) {
 	 boolean deadlineReached = false;
	    String deadline = null;
	    
	    try {
	        
	        String sql = "SELECT deadline FROM quiz WHERE id=?";
	        Connection connection = DBConnection.openConnection();
	        PreparedStatement preparedstatement = connection.prepareStatement(sql);
	        preparedstatement.setInt(1, quiz_id);
	        ResultSet resultSet = preparedstatement.executeQuery();	        
	        if (resultSet.next()) {
	            deadline = resultSet.getString("deadline");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    String[] parts = deadline.split(" ");
        LocalDate deadlineDate = LocalDate.parse(parts[0]);  // Split date
        LocalTime deadlineTime = LocalTime.parse(parts[1]);  // Split time

        LocalDateTime deadlineDateTime = LocalDateTime.of(deadlineDate, deadlineTime);
        LocalDateTime now = LocalDateTime.now();

        // Compare current date and time with the deadline
        if (now.isBefore(deadlineDateTime)) {
            deadlineReached = false;
        }
        else {
        	deadlineReached= true;
        }
	    return deadlineReached;
  }
}
  
