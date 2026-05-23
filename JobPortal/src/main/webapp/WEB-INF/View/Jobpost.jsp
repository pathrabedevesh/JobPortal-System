<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post Job - Career Link</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

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

/* Animated Orbs */
@keyframes float {
    0%, 100% { transform: translate(0, 0) scale(1); }
    25% { transform: translate(30px, -30px) scale(1.05); }
    50% { transform: translate(-20px, 20px) scale(0.95); }
    75% { transform: translate(20px, 30px) scale(1.02); }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.orb-container {
    position: fixed;
    inset: 0;
    overflow: hidden;
    pointer-events: none;
    z-index: 0;
}

.orb {
    position: absolute;
    border-radius: 50%;
    filter: blur(80px);
    animation: float 20s ease-in-out infinite;
}

.orb-cyan {
    width: 500px;
    height: 500px;
    background: radial-gradient(circle, rgba(0, 212, 255, 0.3), transparent 70%);
    top: -150px;
    left: -100px;
}

.orb-green {
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.25), transparent 70%);
    top: 50%;
    right: -100px;
    animation-delay: -7s;
}

.orb-amber {
    width: 350px;
    height: 350px;
    background: radial-gradient(circle, rgba(245, 158, 11, 0.2), transparent 70%);
    bottom: -100px;
    left: 40%;
    animation-delay: -14s;
}

/* Glass Effect */
.glass {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 24px;
    transition: all 0.3s ease;
}

.glass:hover {
    border-color: rgba(255, 255, 255, 0.12);
}

.glass-header {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 20px;
}

/* Animations */
.animate-fade-in-up {
    animation: fadeInUp 0.6s ease both;
}

.delay-100 { animation-delay: 0.1s; }
.delay-200 { animation-delay: 0.2s; }
.delay-300 { animation-delay: 0.3s; }

/* Header */
.header {
    margin: 24px;
    padding: 16px 24px;
}

.logo-section {
    display: flex;
    align-items: center;
    gap: 12px;
}

.logo-icon {
    width: 44px;
    height: 44px;
    border-radius: 14px;
    background: linear-gradient(135deg, #00d4ff, #10b981);
    display: flex;
    align-items: center;
    justify-content: center;
}

.logo-text {
    font-size: 20px;
    font-weight: 700;
    background: linear-gradient(135deg, #00d4ff, #10b981);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.btn-back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    font-weight: 500;
    font-size: 14px;
    transition: all 0.3s ease;
}

.btn-back:hover {
    background: rgba(255, 255, 255, 0.1);
    color: #ffffff;
    transform: translateX(-4px);
}

/* Main Container */
.main-container {
    max-width: 750px;
    margin: 0 auto;
    padding: 0 24px 60px;
    position: relative;
    z-index: 1;
}

/* Form Card */
.form-card {
    padding: 40px;
}

.form-title {
    font-size: 32px;
    font-weight: 800;
    margin-bottom: 8px;
    background: linear-gradient(135deg, #ffffff, rgba(255, 255, 255, 0.8));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.form-subtitle {
    color: rgba(255, 255, 255, 0.5);
    font-size: 15px;
    margin-bottom: 36px;
}

/* Form Groups */
.form-group {
    margin-bottom: 28px;
}

.form-label {
    display: block;
    font-size: 13px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 10px;
}

/* Input Styles */
.input {
    width: 100%;
    padding: 16px 20px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    color: #ffffff;
    font-size: 15px;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
    outline: none;
}

.input:focus {
    border-color: #00d4ff;
    box-shadow: 0 0 0 4px rgba(0, 212, 255, 0.1);
    background: rgba(255, 255, 255, 0.08);
}

.input::placeholder {
    color: rgba(255, 255, 255, 0.4);
}

.input:read-only {
    background: rgba(255, 255, 255, 0.03);
    color: rgba(255, 255, 255, 0.6);
}

/* Select Styles */
select.input {
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(255,255,255,0.5)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 16px center;
    background-size: 18px;
    padding-right: 50px;
    cursor: pointer;
}

select.input option {
    background: #1a1a2e;
    color: #ffffff;
    padding: 12px;
}

/* Textarea */
textarea.input {
    min-height: 140px;
    resize: vertical;
    line-height: 1.6;
}

/* Tags */
.tags-container {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
}

.tag {
    padding: 12px 24px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 30px;
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
}

.tag:hover {
    background: rgba(255, 255, 255, 0.08);
    border-color: rgba(255, 255, 255, 0.15);
}

.tag.active {
    background: linear-gradient(135deg, rgba(0, 212, 255, 0.2), rgba(16, 185, 129, 0.2));
    border-color: #00d4ff;
    color: #00d4ff;
    box-shadow: 0 0 20px rgba(0, 212, 255, 0.15);
}

/* Skills Checkboxes */
.skills-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-bottom: 16px;
}

.skill-checkbox {
    position: relative;
}

.skill-checkbox input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

.skill-checkbox label {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 12px 20px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 30px;
    color: rgba(255, 255, 255, 0.7);
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
}

.skill-checkbox label:hover {
    background: rgba(255, 255, 255, 0.08);
}

.skill-checkbox input:checked + label {
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(16, 185, 129, 0.1));
    border-color: #10b981;
    color: #10b981;
}

.skill-checkbox label::before {
    content: '';
    width: 18px;
    height: 18px;
    border: 2px solid rgba(255, 255, 255, 0.3);
    border-radius: 5px;
    transition: all 0.3s ease;
}

.skill-checkbox input:checked + label::before {
    background: #10b981;
    border-color: #10b981;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%230a0a0f' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: center;
}

/* Two Column Grid */
.two-col {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
}

@media (max-width: 600px) {
    .two-col {
        grid-template-columns: 1fr;
    }
}

/* Submit Button */
.btn-submit {
    width: 100%;
    padding: 18px 32px;
    background: linear-gradient(135deg, #00d4ff, #00a8cc);
    border: none;
    border-radius: 16px;
    color: #0a0a0f;
    font-size: 16px;
    font-weight: 700;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    margin-top: 16px;
}

.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(0, 212, 255, 0.35);
}

.btn-submit i {
    font-size: 18px;
}

/* Section Divider */
.section-divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
    margin: 32px 0;
}

/* Scrollbar */
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
    background: rgba(255, 255, 255, 0.2);
}

/* Responsive */
@media (max-width: 768px) {
    .header {
        margin: 16px;
        padding: 14px 18px;
    }
    
    .form-card {
        padding: 28px 20px;
    }
    
    .form-title {
        font-size: 26px;
    }
    
    .main-container {
        padding: 0 16px 40px;
    }
}
</style>
</head>

<body>

<!-- Animated Background Orbs -->
<div class="orb-container">
    <div class="orb orb-cyan"></div>
    <div class="orb orb-green"></div>
    <div class="orb orb-amber"></div>
</div>

<!-- Header -->
<header class="header glass-header animate-fade-in-up">
    <div class="d-flex justify-content-between align-items-center">
        <div class="logo-section">
            <div class="logo-icon">
                <i class="bi bi-briefcase-fill text-dark" style="font-size: 20px;"></i>
            </div>
            <span class="logo-text">Career Link</span>
        </div>
        <a href="Employeedashboard" class="btn-back">
            <i class="bi bi-arrow-left"></i>
            Dashboard
        </a>
    </div>
</header>

<!-- Main Content -->
<div class="main-container">
    <div class="glass form-card animate-fade-in-up delay-100">
        
        <h1 class="form-title">Post a New Job</h1>
        <p class="form-subtitle">Fill in the details below to create a job listing</p>

        <form action="saveJob" method="post">

            <!-- Job Title -->
            <div class="form-group">
                <label class="form-label">Job Title</label>
                <select class="input" name="title" required>
                    <option value="">-- Select Job Title --</option>
                    <option>Software Engineer</option>
                    <option>Java Developer</option>
                    <option>Frontend Developer</option>
                    <option>Backend Developer</option>
                    <option>Full Stack Developer</option>
                    <option>Data Analyst</option>
                    <option>Data Scientist</option>
                    <option>AI Engineer</option>
                    <option>DevOps Engineer</option>
                    <option>UI/UX Designer</option>
                    <option>HR Executive</option>
                    <option>Marketing Manager</option>
                    <option>Other</option>
                </select>
            </div>

            <!-- Company -->
            <div class="form-group">
                <label class="form-label">Company</label>
                <input class="input" value="${companyName}" name="company" readonly>
            </div>

            <!-- Two Column: Category & Location -->
            <div class="two-col">
                <div class="form-group">
                    <label class="form-label">Category</label>
                    <select class="input" name="category" required>
                        <option value="">-- Select Category --</option>
                        <option>IT</option>
                        <option>Software Development</option>
                        <option>Data Science</option>
                        <option>AI / ML</option>
                        <option>Web Development</option>
                        <option>Cyber Security</option>
                        <option>Cloud Computing</option>
                        <option>HR</option>
                        <option>Marketing</option>
                        <option>Finance</option>
                        <option>Sales</option>
                        <option>Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">Location</label>
                    <select class="input" name="location" required>
                        <option>Pune</option>
                        <option>Mumbai</option>
                        <option>Bangalore</option>
                        <option>Hyderabad</option>
                        <option>Chennai</option>
                        <option>Delhi NCR</option>
                        <option>Remote</option>
                    </select>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- Job Type Tags -->
            <div class="form-group">
                <label class="form-label">Employment Type</label>
                <div class="tags-container" id="typeTags">
                    <div class="tag active">Full Time</div>
                    <div class="tag">Part Time</div>
                    <div class="tag">Internship</div>
                    
                </div>
                <input type="hidden" name="type" id="typeValue">
            </div>

            <!-- Experience Tags -->
            <div class="form-group">
                <label class="form-label">Experience Required</label>
                <div class="tags-container" id="expTags">
                    <div class="tag active">Fresher</div>
                    <div class="tag">1 Year</div>
                    <div class="tag">2 Years</div>
                    <div class="tag">3 Years</div>
                    <div class="tag">4+ Years</div>
                </div>
                <input type="hidden" name="experience" id="expValue">
            </div>

            <div class="section-divider"></div>

            <!-- Skills -->
            <div class="form-group">
                <label class="form-label">Required Skills</label>
                <div class="skills-grid">
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-java" name="skills" value="Java">
                        <label for="skill-java">Java</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-spring" name="skills" value="Spring">
                        <label for="skill-spring">Spring</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-sql" name="skills" value="SQL">
                        <label for="skill-sql">SQL</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-html" name="skills" value="HTML">
                        <label for="skill-html">HTML</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-css" name="skills" value="CSS">
                        <label for="skill-css">CSS</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-js" name="skills" value="JavaScript">
                        <label for="skill-js">JavaScript</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-react" name="skills" value="React">
                        <label for="skill-react">React</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-python" name="skills" value="Python">
                        <label for="skill-python">Python</label>
                    </div>
                </div>
                <input type="text" name="customSkills" class="input" placeholder="Add more skills (e.g., Node.js, AWS, Docker)">
            </div>

            <div class="section-divider"></div>

            <!-- Two Column: Date & Salary -->
            <div class="two-col">
                <div class="form-group">
                    <label class="form-label">Posting Date</label>
                    <input type="date" class="input" name="postDate" required>
                </div>

                <div class="form-group">
                    <label class="form-label">Salary (LPA)</label>
                    <input type="number" class="input" name="salary" placeholder="e.g., 12" required>
                </div>
            </div>

            <!-- Description -->
            <div class="form-group">
                <label class="form-label">Job Description</label>
                <textarea class="input" name="description" placeholder="Describe the role, responsibilities, and requirements..." required></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-submit">
                <i class="bi bi-rocket-takeoff-fill"></i>
                Post Job
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
    
    document.getElementById(hidden).value = document.querySelector("#" + id + " .active").innerText;
}

setupTags("typeTags", "typeValue");
setupTags("expTags", "expValue");
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>