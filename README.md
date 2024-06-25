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
| course_id | int          | YES  |     | NULL    |       |
| date      | date         | YES  |     | NULL    |       |


## Features
- **Course Management:** Admins can add courses and assign instructors.
- **User Management:** Admins can view the list of registered users, courses, and instructors.
- **Material Upload:** Instructors can upload various types of course materials and specify their type.
- **Assignment Submission:** Students can submit assignments and view their scores.Instructors give score of student's submission.
- **Enrollment Deadlines:** Courses have enrollment deadlines, after which students cannot enroll.
- **Quiz Creation and Management:** Instructors will be able to create and manage quizzes.
- **Quiz Attempt and Result Viewing:** Students will be able to attempt quizzes and view their results.Instructors can also track each student's quiz result and review student's quiz answers.


