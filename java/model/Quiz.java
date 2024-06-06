package model;

public class Quiz {
   int quiz_id;
   String title;
   int course_id;
   String time_allowed;
   int total_quizes;
   String deadline;
public int getQuiz_id() {
	return quiz_id;
}
public void setQuiz_id(int quiz_id) {
	this.quiz_id = quiz_id;
}
public int getCourse_id() {
	return course_id;
}
public void setCourse_id(int course_id) {
	this.course_id = course_id;
}
public String getTime_allowed() {
	return time_allowed;
}
public void setTime_allowed(String time_allowed) {
	this.time_allowed = time_allowed;
}
public int getTotal_quizes() {
	return total_quizes;
}
public void setTotal_quizes(int total_quizes) {
	this.total_quizes = total_quizes ;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title =title;
}
public String getDeadline() {
	return deadline;
}
public void setDeadline(String deadline) {
	this.deadline = deadline;
}
   
}
