package model;

public class Submission {
 private int submission_id;
 private int id;//material
 private int course_id;
 private String student_email;
 private String submission_date;
 private String status;
 private String file;
 private String title;
 private String student_name;
 private int score;
 private String comment;
 private String f_type;
public int getSubmission_id() {
	return submission_id;
}
public void setSubmission_id(int submission_id) {
	this.submission_id = submission_id;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getCourse_id() {
	return course_id;
}
public void setCourse_id(int course_id) {
	this.course_id = course_id;
}
public String getStudent_email() {
	return student_email;
}
public void setStudent_email(String student_email) {
	this.student_email = student_email;
}
public String getSubmission_date() {
	return submission_date;
}
public void setSubmission_date(String submission_date) {
	this.submission_date = submission_date;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getStudent_name() {
	return student_name;
}
public void setStudent_name(String student_name) {
	this.student_name = student_name;
}
public int getScore() {
	return score;
}
public void setScore(int score) {
	this.score = score;
}

public String getComment() {
	return comment;
}
public void setComment(String comment) {
	this.comment = comment;
}
public String getF_type() {
	return f_type;
}
public void setF_type(String f_type) {
	this.f_type = f_type;
}
}
