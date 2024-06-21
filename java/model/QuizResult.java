package model;

import java.time.LocalDateTime;

public class QuizResult {
 private int result_id;
 private int quiz_id; //Main quiz_id Quiz-3 Quiz-4
 private String student_email;
 private LocalDateTime startTime;
 private LocalDateTime endTime;
 private String time_taken;
 private String state;
 private int score;
public int getResult_id() {
	return result_id;
}
public void setResult_id(int result_id) {
	this.result_id = result_id;
}
public int getQuiz_id() {
	return quiz_id;
}
public void setQuiz_id(int quiz_id) {
	this.quiz_id = quiz_id;
}
public String getStudent_email() {
	return student_email;
}
public void setStudent_email(String student_email) {
	this.student_email = student_email;
}
public LocalDateTime getStartTime() {
	return startTime;
}
public void setStartTime(LocalDateTime startTime) {
	this.startTime = startTime;
}
public LocalDateTime getEndTime() {
	return endTime;
}
public void setEndTime(LocalDateTime endTime) {
	this.endTime = endTime;
}
public String getTime_taken() {
	return time_taken;
}
public void setTime_taken(String time_taken) {
	this.time_taken = time_taken;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public int getScore() {
	return score;
}
public void setScore(int score) {
	this.score = score;
}
}
