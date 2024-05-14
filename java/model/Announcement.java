package model;

public class Announcement {
    private int announcement_id;
    private String title;
    private String content;
    private String date;
    private String course_name;
    private int course_id;
    
	public int getAnnouncement_id() {
		return announcement_id;
	}
	public void setAnnouncement_id(int announcement_id) {
		this.announcement_id = announcement_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
}
