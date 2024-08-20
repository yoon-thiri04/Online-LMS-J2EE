package model;

import java.io.InputStream;
import java.sql.Blob;

public class Material {
     private int id;
     private String title;
     private String type;
     private Blob file;
     private int course_id;
     private String ftype;
     private String status;
     
     private String deadline;
  public String getFtype() {
    return ftype;
  }
  public void setFtype(String ftype) {
    this.ftype = ftype;
  }
  
  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getType() {
    return type;
  }
  public void setType(String type) {
    this.type = type;
  }
  public Blob getFile() {
    return file;
  }
  public void setFile(InputStream fileContent) {
    this.file = (Blob) fileContent;
  }
  public int getCourse_id() {
    return course_id;
  }
  public void setCourse_id(int course_id) {
    this.course_id = course_id;
  }
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

public String getDeadline() {
	return deadline;
}
public void setDeadline(String deadline) {
	this.deadline = deadline;
}
 
}