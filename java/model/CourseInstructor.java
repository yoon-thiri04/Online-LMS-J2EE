package model;

public class CourseInstructor {
	private int course_id;
	  private int instructor_id;
	  private String instructor_name;
	    private String title;
	    private String duration;
	    private String level;
	    private String category;
	    private String description;
	    private String filename;
	  public String getFilename() {
			return filename;
		}
		public void setFilename(String filename) {
			this.filename = filename;
		}
	public int getCourse_id() {
	    return course_id;
	  }
	  public void setCourse_id(int course_id) {
	    this.course_id = course_id;
	  }
	  public int getInstructor_id() {
	    return instructor_id;
	  }
	  public void setInstructor_id(int instructor_id) {
	    this.instructor_id = instructor_id;
	  }
	  public String getInstructor_name() {
	    return instructor_name;
	  }
	  public void setInstructor_name(String instructor_name) {
	    this.instructor_name = instructor_name;
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

}
