<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Job</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: 'Inter', sans-serif;
    background: #0a0a0f;
    color: #ffffff;
    min-height: 100vh;
    overflow-x: hidden;
}
/* Animated Background Orbs */
.orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.5;
    z-index: -1;
    animation: float 20s ease-in-out infinite;
}
.orb-1 {
    width: 600px;
    height: 600px;
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    top: -200px;
    right: -200px;
    animation-delay: 0s;
}
.orb-2 {
    width: 500px;
    height: 500px;
    background: linear-gradient(135deg, #10b981, #059669);
    bottom: -150px;
    left: -150px;
    animation-delay: -7s;
}
.orb-3 {
    width: 300px;
    height: 300px;
    background: linear-gradient(135deg, #3b82f6, #1d4ed8);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation-delay: -14s;
}
@keyframes float {
    0%, 100% { transform: translate(0, 0) scale(1); }
    25% { transform: translate(30px, -30px) scale(1.05); }
    50% { transform: translate(-20px, 20px) scale(0.95); }
    75% { transform: translate(-30px, -20px) scale(1.02); }
}
/* Header */
.header {
    padding: 1rem 2rem;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
    position: sticky;
    top: 0;
    z-index: 100;
}
.header-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.logo {
    display: flex;
    align-items: center;
    gap: 12px;
    text-decoration: none;
}
.logo-icon {
    width: 42px;
    height: 42px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
}
.logo-text {
    font-size: 1.4rem;
    font-weight: 700;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}
.back-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 20px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    color: #a1a1aa;
    text-decoration: none;
    font-size: 0.9rem;
    transition: all 0.3s ease;
}
.back-btn:hover {
    background: rgba(255, 255, 255, 0.1);
    color: #ffffff;
    border-color: rgba(6, 182, 212, 0.3);
}
/* Main Container */
.main-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 3rem 1.5rem;
}
/* Page Header */
.page-header {
    text-align: center;
    margin-bottom: 2.5rem;
}
.page-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 8px 16px;
    background: rgba(6, 182, 212, 0.1);
    border: 1px solid rgba(6, 182, 212, 0.2);
    border-radius: 50px;
    font-size: 0.85rem;
    color: #06b6d4;
    margin-bottom: 1rem;
}
.page-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
}
.page-title span {
    background: linear-gradient(135deg, #06b6d4, #10b981);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}
.page-subtitle {
    color: #71717a;
    font-size: 1rem;
}
/* Form Card */
.form-card {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.06);
    border-radius: 24px;
    padding: 2.5rem;
    position: relative;
    overflow: hidden;
}
.form-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, #06b6d4, #10b981, #3b82f6);
}
/* Section Dividers */
.section-title {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 1.1rem;
    font-weight: 600;
    color: #06b6d4;
    margin: 2rem 0 1.5rem;
    padding-bottom: 0.75rem;
    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
}
.section-title:first-of-type {
    margin-top: 0;
}
.section-title i {
    font-size: 1.2rem;
}
/* Form Groups */
.form-group {
    margin-bottom: 1.5rem;
}
.form-group label {
    display: block;
    font-size: 0.9rem;
    font-weight: 500;
    color: #d4d4d8;
    margin-bottom: 0.5rem;
}
.form-group label .required {
    color: #ef4444;
    margin-left: 2px;
}
/* Input Styles */
.input,
.form-control.input {
    width: 100%;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    color: #ffffff;
    font-size: 0.95rem;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
}
.input:focus,
.form-control.input:focus {
    outline: none;
    border-color: #06b6d4;
    background: rgba(6, 182, 212, 0.05);
    box-shadow: 0 0 0 3px rgba(6, 182, 212, 0.1);
}
.input::placeholder {
    color: #52525b;
}
.input[readonly] {
    background: rgba(255, 255, 255, 0.02);
    color: #71717a;
    cursor: not-allowed;
}
select.input {
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%2371717a'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    background-size: 18px;
    padding-right: 45px;
}
select.input option {
    background: #18181b;
    color: #ffffff;
    padding: 10px;
}
textarea.input {
    min-height: 120px;
    resize: vertical;
}
/* Tag Selector */
.tags-container {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}
.tag {
    padding: 10px 20px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 50px;
    color: #a1a1aa;
    font-size: 0.9rem;
    cursor: pointer;
    transition: all 0.3s ease;
    user-select: none;
}
.tag:hover {
    background: rgba(255, 255, 255, 0.08);
    border-color: rgba(255, 255, 255, 0.15);
}
.tag.active {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.2), rgba(16, 185, 129, 0.2));
    border-color: #06b6d4;
    color: #06b6d4;
}
/* Checkbox Skills */
.skills-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
}
.skill-checkbox {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 10px 16px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.skill-checkbox:hover {
    background: rgba(255, 255, 255, 0.08);
}
.skill-checkbox input[type="checkbox"] {
    width: 18px;
    height: 18px;
    accent-color: #06b6d4;
    cursor: pointer;
}
.skill-checkbox span {
    color: #d4d4d8;
    font-size: 0.9rem;
}
.skill-checkbox:has(input:checked) {
    background: rgba(6, 182, 212, 0.1);
    border-color: rgba(6, 182, 212, 0.3);
}
.skill-checkbox:has(input:checked) span {
    color: #06b6d4;
}
/* Row Layout */
.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.5rem;
}
@media (max-width: 640px) {
    .form-row {
        grid-template-columns: 1fr;
    }
}
/* Submit Button */
.btn-submit {
    width: 100%;
    padding: 16px 32px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border: none;
    border-radius: 14px;
    color: #0a0a0f;
    font-size: 1rem;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    margin-top: 2rem;
}
.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 40px rgba(6, 182, 212, 0.3);
}
.btn-submit:active {
    transform: translateY(0);
}
.btn-submit i {
    font-size: 1.1rem;
}
/* Input Icon Wrapper */
.input-icon-wrapper {
    position: relative;
}
.input-icon-wrapper .input {
    padding-left: 45px;
}
.input-icon-wrapper i {
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    color: #52525b;
    font-size: 1rem;
}
.input-icon-wrapper:focus-within i {
    color: #06b6d4;
}
/* Custom Scrollbar */
::-webkit-scrollbar {
    width: 8px;
}
::-webkit-scrollbar-track {
    background: rgba(255, 255, 255, 0.02);
}
::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.1);
    border-radius: 4px;
}
::-webkit-scrollbar-thumb:hover {
    background: rgba(255, 255, 255, 0.15);
}
</style>
</head>
<body>
<!-- Animated Orbs -->
<div class="orb orb-1"></div>
<div class="orb orb-2"></div>
<div class="orb orb-3"></div>
<!-- Header -->
<header class="header">
    <div class="header-content">
        <a href="Employeedashboard" class="logo">
            <div class="logo-icon">
                <i class="bi bi-briefcase-fill"></i>
            </div>
            <span class="logo-text">CareerLink</span>
        </a>
        <a href="Employeedashboard" class="back-btn">
            <i class="bi bi-arrow-left"></i>
            Back to Dashboard
        </a>
    </div>
</header>
<!-- Main Container -->
<div class="main-container">
    
    <!-- Page Header -->
    <div class="page-header">
        <div class="page-badge">
            <i class="bi bi-pencil-square"></i>
            Edit Mode
        </div>
        <h1 class="page-title">Edit <span>Job Listing</span></h1>
        <p class="page-subtitle">Update the job details below to keep your listing current</p>
    </div>
    <!-- Form Card -->
    <div class="form-card">
        <form action="updateJob" method="post">
            <!-- Hidden Fields -->
            <input type="hidden" name="userId" value="${job.userId}">
            <input type="hidden" name="id" value="${job.id}"/>
            <!-- Basic Information Section -->
            <div class="section-title">
                <i class="bi bi-info-circle"></i>
                Basic Information
            </div>
            <!-- Job Title -->
            <div class="form-group">
                <label>Job Title <span class="required">*</span></label>
                <select class="form-control input" name="title" required>
                    <option value="">-- Select Job Title --</option>
                    <option ${job.title=='Software Engineer'?'selected':''}>Software Engineer</option>
                    <option ${job.title=='Java Developer'?'selected':''}>Java Developer</option>
                    <option ${job.title=='Frontend Developer'?'selected':''}>Frontend Developer</option>
                    <option ${job.title=='Backend Developer'?'selected':''}>Backend Developer</option>
                    <option ${job.title=='Full Stack Developer'?'selected':''}>Full Stack Developer</option>
                    <option ${job.title=='Data Analyst'?'selected':''}>Data Analyst</option>
                    <option ${job.title=='Data Scientist'?'selected':''}>Data Scientist</option>
                    <option ${job.title=='AI Engineer'?'selected':''}>AI Engineer</option>
                    <option ${job.title=='DevOps Engineer'?'selected':''}>DevOps Engineer</option>
                    <option ${job.title=='UI/UX Designer'?'selected':''}>UI/UX Designer</option>
                    <option ${job.title=='HR Executive'?'selected':''}>HR Executive</option>
                    <option ${job.title=='Marketing Manager'?'selected':''}>Marketing Manager</option>
                    <option ${job.title=='Other'?'selected':''}>Other</option>
                </select>
            </div>
            <!-- Company -->
            <div class="form-group">
                <label>Company</label>
                <div class="input-icon-wrapper">
                    <i class="bi bi-building"></i>
                    <input class="form-control input" value="${job.company}" name="company" readonly>
                </div>
            </div>
            <div class="form-row">
                <!-- Category -->
                <div class="form-group">
                    <label>Category <span class="required">*</span></label>
                    <select class="form-control input" name="category" required>
                        <option value="">-- Select Category --</option>
                        <option ${job.category=='IT'?'selected':''}>IT</option>
                        <option ${job.category=='Software Development'?'selected':''}>Software Development</option>
                        <option ${job.category=='Data Science'?'selected':''}>Data Science</option>
                        <option ${job.category=='AI / ML'?'selected':''}>AI / ML</option>
                        <option ${job.category=='Web Development'?'selected':''}>Web Development</option>
                        <option ${job.category=='Cyber Security'?'selected':''}>Cyber Security</option>
                        <option ${job.category=='Cloud Computing'?'selected':''}>Cloud Computing</option>
                        <option ${job.category=='HR'?'selected':''}>HR</option>
                        <option ${job.category=='Marketing'?'selected':''}>Marketing</option>
                        <option ${job.category=='Finance'?'selected':''}>Finance</option>
                        <option ${job.category=='Sales'?'selected':''}>Sales</option>
                        <option ${job.category=='Other'?'selected':''}>Other</option>
                    </select>
                </div>
                <!-- Location -->
                <div class="form-group">
                    <label>Location <span class="required">*</span></label>
                    <select class="form-control input" name="location" required>
                        <option ${job.location=='Pune'?'selected':''}>Pune</option>
                        <option ${job.location=='Mumbai'?'selected':''}>Mumbai</option>
                        <option ${job.location=='Bangalore'?'selected':''}>Bangalore</option>
                    </select>
                </div>
            </div>
            <!-- Job Type Section -->
            <div class="section-title">
                <i class="bi bi-clock-history"></i>
                Employment Details
            </div>
            <!-- Type -->
            <div class="form-group">
                <label>Employment Type</label>
                <div class="tags-container" id="typeTags">
                    <div class="tag ${job.type=='Full-Time'?'active':''}">Full-Time</div>
                    <div class="tag ${job.type=='Part-Time'?'active':''}">Part-Time</div>
                    <div class="tag ${job.type=='Internship'?'active':''}">Internship</div>
                </div>
                <input type="hidden" name="type" id="typeValue" value="${job.type}">
            </div>
            <!-- Experience -->
            <div class="form-group">
                <label>Experience Required</label>
                <div class="tags-container" id="expTags">
                    <div class="tag ${job.experience=='Fresher'?'active':''}">Fresher</div>
                    <div class="tag ${job.experience=='1 Year'?'active':''}">1 Year</div>
                    <div class="tag ${job.experience=='2 Years'?'active':''}">2 Years</div>
                    <div class="tag ${job.experience=='3 Years'?'active':''}">3 Years</div>
                </div>
                <input type="hidden" name="experience" id="expValue" value="${job.experience}">
            </div>
            <div class="form-row">
                <!-- Date -->
                <div class="form-group">
                    <label>Post Date</label>
                    <div class="input-icon-wrapper">
                        <i class="bi bi-calendar3"></i>
                        <input type="date" class="form-control input" name="postDate" value="${job.postDate}">
                    </div>
                </div>
                <!-- Salary -->
                <div class="form-group">
                    <label>Salary (INR)</label>
                    <div class="input-icon-wrapper">
                        <i class="bi bi-currency-rupee"></i>
                        <input type="number" class="form-control input" name="salary" value="${job.salary}" placeholder="e.g. 50000">
                    </div>
                </div>
            </div>
            <!-- Skills Section -->
            <div class="section-title">
                <i class="bi bi-tools"></i>
                Skills Required
            </div>
            <div class="form-group">
                <label>Select Skills</label>
                
                <%
                com.model.JobModel jobObj = (com.model.JobModel) request.getAttribute("job");
                String skills = "";
                if(jobObj != null && jobObj.getSkills() != null){
                    skills = jobObj.getSkills();
                }
                %>
                <div class="skills-grid">
                    <label class="skill-checkbox">
                        <input type="checkbox" name="skills" value="Java"
                        <%= skills != null && skills.contains("Java") ? "checked" : "" %>>
                        <span>Java</span>
                    </label>
                    <label class="skill-checkbox">
                        <input type="checkbox" name="skills" value="Spring"
                        <%= skills != null && skills.contains("Spring") ? "checked" : "" %>>
                        <span>Spring</span>
                    </label>
                    <label class="skill-checkbox">
                        <input type="checkbox" name="skills" value="SQL"
                        <%= skills != null && skills.contains("SQL") ? "checked" : "" %>>
                        <span>SQL</span>
                    </label>
                    <label class="skill-checkbox">
                        <input type="checkbox" name="skills" value="HTML"
                        <%= skills != null && skills.contains("HTML") ? "checked" : "" %>>
                        <span>HTML</span>
                    </label>
                    <label class="skill-checkbox">
                        <input type="checkbox" name="skills" value="CSS"
                        <%= skills != null && skills.contains("CSS") ? "checked" : "" %>>
                        <span>CSS</span>
                    </label>
                </div>
            </div>
            <!-- Custom Skills -->
            <div class="form-group">
                <label>Additional Skills</label>
                <div class="input-icon-wrapper">
                    <i class="bi bi-plus-circle"></i>
                    <input type="text" name="customSkills" class="form-control input" placeholder="Add more skills (Python, Node, AWS...)">
                </div>
            </div>
            <!-- Description Section -->
            <div class="section-title">
                <i class="bi bi-file-text"></i>
                Job Description
            </div>
            <div class="form-group">
                <label>Description</label>
                <textarea class="form-control input" name="description" placeholder="Describe the job role, responsibilities, and requirements...">${job.description}</textarea>
            </div>
            <!-- Submit Button -->
            <button type="submit" class="btn-submit">
                <i class="bi bi-check2-circle"></i>
                Update Job Listing
            </button>
        </form>
    </div>
</div>
<!-- Tag Selection Script -->
<script>
function setupTags(id, hidden) {
    let tags = document.querySelectorAll("#" + id + " .tag");
    
    tags.forEach(tag => {
        tag.onclick = () => {
            tags.forEach(t => t.classList.remove("active"));
            tag.classList.add("active");
            document.getElementById(hidden).value = tag.innerText;
        }
    });
}
setupTags("typeTags", "typeValue");
setupTags("expTags", "expValue");
</script>
</body>
</html>