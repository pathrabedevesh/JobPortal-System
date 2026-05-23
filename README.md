<div align="center">

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&height=280&color=0:020617,35:0F172A,70:1D4ED8,100:38BDF8&text=JobPortal&fontColor=ffffff&fontSize=70&fontAlignY=38&desc=Full%20Stack%20Job%20Portal%20Web%20Application&descAlignY=58&descSize=22&animation=fadeIn" />

<br/>

<img src="https://readme-typing-svg.demolab.com?font=Inter&weight=700&size=26&duration=2600&pause=900&color=38BDF8&center=true&vCenter=true&width=950&lines=Search+Jobs.+Apply+Easily.+Hire+Efficiently.;Built+with+Java%2C+JSP%2C+Servlet%2C+MySQL.;Complete+Recruitment+Management+System." />

<br/>

<img src="https://img.shields.io/badge/Project-JobPortal-0F172A?style=for-the-badge&labelColor=1D4ED8" />
<img src="https://img.shields.io/badge/Domain-Recruitment%20System-0F172A?style=for-the-badge&labelColor=0284C7" />
<img src="https://img.shields.io/badge/Architecture-MVC-0F172A?style=for-the-badge&labelColor=0EA5E9" />
<img src="https://img.shields.io/badge/Status-Functional-0F172A?style=for-the-badge&labelColor=16A34A" />

<br/><br/>

<img src="https://skillicons.dev/icons?i=java,mysql,html,css,js,bootstrap,git,github" />

<br/><br/>

### A full-stack Job Portal system built with Java, JSP, Servlets, MySQL, and Apache Tomcat.

</div>

---

# JobPortal

**JobPortal** is a full-stack web application designed to connect **job seekers** and **recruiters** through a centralized hiring platform.

It provides a structured workflow where recruiters can post jobs, candidates can apply, and the system manages the entire hiring lifecycle.

---

## Overview

This is not just a CRUD project. It is a **real-world recruitment workflow system** including:

```text
User authentication system
Job posting system
Job application workflow
Recruiter dashboard
Candidate management
Database integration
Session-based authentication
Tomcat deployment
```

---

## Project Objective

```text
Build a real-world job portal system
Implement full-stack development
Demonstrate database integration
Show deployment-ready application
Create portfolio-level project
```

---

## Core Workflow

```text
User registers/login
        ↓
Recruiter posts job
        ↓
Job seekers search jobs
        ↓
Apply for job
        ↓
Recruiter reviews applicants
        ↓
Shortlist / Reject candidates
        ↓
Hiring process completed
```

---

## System Flow Diagram

```mermaid
flowchart TD
A[User Login/Register] --> B[Browse Jobs]
B --> C[Apply Job]
C --> D[Recruiter Reviews]
D --> E{Decision}
E -->|Selected| F[Shortlisted]
E -->|Rejected| G[Rejected]
F --> H[Hiring Completed]
```

---

## Key Features

### Job Seeker Features

```text
User Registration
Login System
Search Jobs
Apply for Jobs
View Job Details
```

### Recruiter Features

```text
Post Jobs
Manage Job Listings
View Applicants
Shortlist Candidates
Reject Applications
```

### System Features

```text
Secure Authentication
Session Management
Database Integration
MVC Architecture
Tomcat Deployment
```

---

## User Roles

### Job Seeker

* Search jobs
* Apply jobs
* Manage profile

### Recruiter

* Post jobs
* Manage candidates
* Review applications

---

## Technology Stack

| Layer        | Technology    |
| ------------ | ------------- |
| Language     | Java          |
| Backend      | Servlet / JSP |
| Frontend     | HTML, CSS, JS |
|              | , JSTL        |
| Database     | MySQL         |
| Server       | Apache Tomcat |
| Architecture | MVC           |

---

## Architecture

```text
Browser → JSP → Servlet → DAO → MySQL → Response
```

```mermaid
flowchart LR
A[Browser] --> B[Servlet]
B --> C[DAO Layer]
C --> D[(MySQL)]
D --> B
B --> E[JSP View]
E --> A
```

---

## Project Structure

```text
JobPortalWeb/
│── src/
│── WebContent/
│── database/
│── pom.xml
```

---

## Database Setup

```sql
CREATE DATABASE portal;
```

Update DB config:

```text
username=root
password=
```

---

## Local Setup Guide

### Clone Repository

```bash
git clone https://github.com/pathrabedevesh/JobPortalWeb.git
```

### Run Project

```text
Import into Eclipse
Configure Tomcat
Run project
```

---

## Deployment

```text
AWS EC2 instance
Apache Tomcat
Port 8080 enabled
```

## 🚀 Live URL:

```text


http://54.160.157.31:8080/JobPortal/

```

---

## Testing Flow

```text
Register user
Login
Search job
Apply job
Login recruiter
Post job
Review applicants
```

---

## Current Status

| Feature              | Status   |
| -------------------- | -------- |
| Login System         | Complete |
| Job Posting          | Complete |
| Job Search           | Complete |
| Apply System         | Complete |
| Database Integration | Complete |

---

## Future Enhancements

```text
AI Job Recommendation
Email Notifications
Mobile Responsive UI
Admin Dashboard
```

---

## Learning Outcomes

```text
Java Web Development
Servlet & JSP
MySQL Integration
MVC Architecture
Deployment on AWS
```

---

## Author

```text
Devesh Pathrabe
```

GitHub:

```text
https://github.com/pathrabedevesh
```

---

## License

```text
This project is for academic and portfolio use.
```

---

<div align="center">

<img width="90%" src="https://capsule-render.vercel.app/api?type=rect&height=3&color=0:020617,40:1D4ED8,75:38BDF8,100:FFFFFF" />

<br/><br/>

<img src="https://readme-typing-svg.demolab.com?font=Inter&weight=700&size=22&duration=2600&pause=900&color=38BDF8&center=true&vCenter=true&width=900&lines=This+is+a+real-world+Job+Portal+system.;Built+for+placements+and+portfolio.;Full-stack+Java+application." />

<br/><br/>

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&height=170&color=0:38BDF8,35:1D4ED8,70:0F172A,100:020617&section=footer" />

</div>
