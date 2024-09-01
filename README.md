# Online LMS

## Overview
This Online Learning Management System (LMS) supports four user roles: Admin, Registered User, Student, and Instructor. Each role has specific functionalities to manage and participate in courses efficiently.

## User Roles and Functionalities

### Admin
**Default Login:**
- Username: Admin
- Password: admin@123!

**Capabilities:**
- Add courses.
- Assign instructors to courses (default password: lect@123!).
- View and manage registered users, courses, and instructors (both total counts and detailed lists).
- Change password.
---
### Instructor
**Default Login Credentials:** Provided by Admin.
- Default Password: lect@123!

**Capabilities:**
- Upload course materials (any file type, including .java, .pptx, .mp4, etc.).
- Enter material types (Assignment, Lecture Book, etc.).
- Create quizzes (future update).
- Provide Announcements.
- Score assignments submitted by enrolled students.
- Change password.
- Create and manage quizzes.
- View each student's Quiz Result inculding Started and Ended Datetime,Time taken,etc..
- Also be able to review each enrolled Student's quiz answers.
---
### Registered User
**Capabilities:**
- Register on the platform.
- Browse available courses.
- Enroll in courses before the enrollment deadline.
---
### Student
**Capabilities:**
- Download course materials.
- View Announcements.
- Submit assignments.
- View submission status and scores.
- Attempt quizzes.
- View quiz results.
- Review their own quiz answers for the previous attempt.
---
# Database Model
## userlist
| Field     | Type         | Null | Key | Default | Extra |
|-----------|--------------|------|-----|---------|-------|
| user_name | varchar(350) | YES  |     | NULL    |       |
| password  | varchar(250) | YES  |     | NULL    |       |
| email     | varchar(250) | YES  |     | NULL    |       |

## student
| Field    | Type         | Null | Key | Default | Extra          |
|----------|--------------|------|-----|---------|----------------|
| id       | int          | NO   | PRI | NULL    | auto_increment |
| name     | varchar(100) | YES  |     | NULL    |                |
| email    | varchar(250) | YES  |     | NULL    |                |
| password | varchar(100) | YES  |     | NULL    |                |

## enrollment
| Field     | Type         | Null | Key | Default | Extra |
|-----------|--------------|------|-----|---------|-------|
| name      | varchar(100) | YES  |     | NULL    |       |
| email     | varchar(250) | YES  |     | NULL    |       |
| course_id | int          | YES  | MUL | NULL    |       |
| date      | date         | YES  |     | NULL    |       |

## courses
| Field               | Type         | Null | Key | Default | Extra          |
|---------------------|--------------|------|-----|---------|----------------|
| course_id           | int          | NO   | PRI | NULL    | auto_increment |
| title               | varchar(350) | YES  |     | NULL    |                |
| level               | varchar(100) | YES  |     | NULL    |                |
| category            | varchar(100) | YES  |     | NULL    |                |
| description         | varchar(350) | YES  |     | NULL    |                |
| duration            | varchar(50)  | YES  |     | NULL    |                |
| start_date          | date         | YES  |     | NULL    |                |
| enrollment_deadline | date         | YES  |     | NULL    |                |
| merged              | varchar(5)   | YES  |     | NULL    |                |

## lectures
| Field         | Type         | Null | Key | Default | Extra |
|---------------|--------------|------|-----|---------|-------|
| email         | varchar(100) | YES  | PRI | NULL    |       |
| password      | varchar(100) | YES  |     | NULL    |       |
| name          | varchar(250) | YES  |     | NULL    |       |
| qualification | varchar(150) | YES  |     | NULL    |       |
| filename      | varchar(600) | YES  |     | NULL    |       |
| path          | varchar(750) | YES  |     | NULL    |       |
| course_id     | int          | YES  | MUL | NULL    |       |

## material
| Field     | Type         | Null | Key | Default | Extra          |
|-----------|--------------|------|-----|---------|----------------|
| id        | int          | NO   | PRI | NULL    | auto_increment |
| course_id | int          | YES  | MUL | NULL    |                |
| title     | varchar(350) | YES  |     | NULL    |                |
| m_type    | varchar(100) | YES  |     | NULL    |                |
| m_video   | longblob     | YES  |     | NULL    |                |
| f_type    | varchar(100) | YES  |     | NULL    |                |
| status    | varchar(50)  | YES  |     | NULL    |                |

## submission
| Field               | Type         | Null | Key | Default | Extra          |
|---------------------|--------------|------|-----|---------|----------------|
| submission_id       | int          | NO   | PRI | NULL    | auto_increment |
| id                  | int          | YES  | MUL | NULL    |                |
| course_id           | int          | YES  |     | NULL    |                |
| title               | varchar(100) | YES  |     | NULL    |                |
| student_email       | varchar(100) | YES  |     | NULL    |                |
| student_name        | varchar(50)  | YES  |     | NULL    |                |
| submission_datetime | date         | YES  |     | NULL    |                |
| status              | varchar(50)  | YES  |     | NULL    |                |
| file                | longblob     | YES  |     | NULL    |                |
| score               | int          | YES  |     | NULL    |                |
| comment             | varchar(500) | YES  |     | NULL    |                |
| f_type              | varchar(20)  | YES  |     | NULL    |                |

## quiz
| Field        | Type        | Null | Key | Default | Extra          |
|--------------|-------------|------|-----|---------|----------------|
| id           | int         | NO   | PRI | NULL    | auto_increment |
| course_id    | int         | YES  | MUL | NULL    |                |
| total_quizes | int         | YES  |     | NULL    |                |
| title        | varchar(50) | YES  |     | NULL    |                |
| deadline     | datetime    | YES  |     | NULL    |                |

## quizz
| Field    | Type         | Null | Key | Default | Extra          |
|----------|--------------|------|-----|---------|----------------|
| quiz_id  | int          | NO   | PRI | NULL    | auto_increment |
| id       | int          | YES  | MUL | NULL    |                |
| question | varchar(800) | YES  |     | NULL    |                |
| type     | varchar(50)  | YES  |     | NULL    |                |
| answer   | varchar(250) | YES  |     | NULL    |                |

## answer
| Field    | Type         | Null | Key | Default | Extra |
|----------|--------------|------|-----|---------|-------|
| answer   | varchar(500) | YES  |     | NULL    |       |
| quizz_id | int          | YES  | MUL | NULL    |       |

## announcements
| Field           | Type         | Null | Key | Default | Extra          |
|-----------------|--------------|------|-----|---------|----------------|
| announcement_id | int          | NO   | PRI | NULL    | auto_increment |
| title           | varchar(350) | YES  |     | NULL    |                |
| content         | varchar(800) | YES  |     | NULL    |                |
| created_at      | date         | YES  |     | NULL    |                |
| course_id       | int          | YES  | MUL | NULL    |                |
| course_title    | varchar(350) | YES  |     | NULL    |                |

## quizresult
| Field          | Type         | Null | Key | Default | Extra          |
|----------------|--------------|------|-----|---------|----------------|
| result_id      | int          | NO   | PRI | NULL    | auto_increment |
| quiz_id        | int          | YES  | MUL | NULL    |                |
| student_email  | varchar(100) | YES  |     | NULL    |                |
| start_datetime | datetime     | YES  |     | NULL    |                |
| end_datetime   | datetime     | YES  |     | NULL    |                |
| time_taken     | varchar(20)  | YES  |     | NULL    |                |
| state          | varchar(20)  | YES  |     | NULL    |                |
| score          | int          | YES  |     | NULL    |                |

## quizresultanswer
| Field     | Type         | Null | Key | Default | Extra |
|-----------|--------------|------|-----|---------|-------|
| result_id | int          | YES  | MUL | NULL    |       |
| answer    | varchar(300) | YES  |     | NULL    |       |
| quizz_id  | int          | YES  |     | NULL    |       |
| isCorrect | varchar(5)   | YES  |     | NULL    |       |

---
## Features
- **Course Management:** Admins can add courses and assign instructors.
- **User Management:** Admins can view the list of registered users, courses, and instructors.
- **Material Upload:** Instructors can upload various types of course materials and specify their type.
- **Assignment Submission:** Students can submit assignments and view their scores.Instructors give score of student's submission.
- **Enrollment Deadlines:** Courses have enrollment deadlines, after which students cannot enroll.
- **Quiz Creation and Management:** Instructors will be able to create and manage quizzes.
- **Quiz Attempt and Result Viewing:** Students will be able to attempt quizzes and view their results.Instructors can also track each student's quiz result and review student's quiz answers.
---

## Project Features to Add:

- !!!!!!! Password check
- !! **Primary Color and Logo**
- !! Pop Up format for View Details Result **no**
- !! Background image for all pop up 
- !! **Admin Design -> Lecture, list, Running course**
- !! Change Pwd Btn
- !! Quiz - Timer
- !! Profile Card Student **Done**
- !! Font size, color **In Progress**
- !! Material / Quiz/ Assignment if ==0 then **Mandantory**
- !! Log out button 
- !! Profile Card Student => Login , Change Pwd **Done**
- !! Change design of the course for each Course
- !! Animations 
- !! Design material, assignment, quiz, **Done**
- !! Design for register, student, LIst **Done**
- !! Course background images
- !! Result and review Design **Done**
- !! Login page **Done**
