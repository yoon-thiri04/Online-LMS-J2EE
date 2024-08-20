package model;

public class Course {
	private int course_id;
   
    private String title;
    private String duration;
    private String level;
    private String category;
    private String description;
    private String start_date;
    private String enrollment_deadline;
    private String merged;
    private String lecture_name;
    private String course_title;
    private String student_name;
    private int student_count;
    public String getCourse_title() {
        return course_title;
    }

    public void setCourse_title(String course_title) {
        this.course_title = course_title;
    }
    public int getStudent_count() {
        return student_count;
    }

    public void setStudent_count(int student_count) {
        this.student_count = student_count;
    }
    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }
	public int getCourse_id() {
		return course_id;
	}
	 public String getLecture_name() {
         return lecture_name;
     }

     public void setLecture_name(String lecture_name) {
         this.lecture_name = lecture_name;
     }
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnrollment_deadline() {
		return enrollment_deadline;
	}
	public void setEnrollment_deadline(String enrollment_deadline) {
		this.enrollment_deadline = enrollment_deadline;
	}
	public String getMerged() {
		return merged;
	}
	public void setMerged(String merged) {
		this.merged = merged;
	}

	
	
}
