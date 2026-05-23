<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Career Link - Profile</title>

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

@keyframes glow {
    0%, 100% { box-shadow: 0 0 20px rgba(0, 212, 255, 0.3); }
    50% { box-shadow: 0 0 40px rgba(0, 212, 255, 0.5); }
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
    top: 60%;
    right: -100px;
    animation-delay: -7s;
}

.orb-amber {
    width: 350px;
    height: 350px;
    background: radial-gradient(circle, rgba(245, 158, 11, 0.2), transparent 70%);
    bottom: -100px;
    left: 30%;
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

/* Animations */
.animate-fade-in-up {
    animation: fadeInUp 0.6s ease both;
}

.delay-100 { animation-delay: 0.1s; }
.delay-200 { animation-delay: 0.2s; }

/* Main Container */
.main-container {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 24px;
    position: relative;
    z-index: 1;
}

/* Profile Card */
.profile-card {
    width: 100%;
    max-width: 580px;
    padding: 48px 40px;
}

/* Avatar Section */
.avatar-section {
    text-align: center;
    margin-bottom: 36px;
}

.avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background: linear-gradient(135deg, #00d4ff, #10b981);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    font-size: 40px;
    font-weight: 700;
    color: #0a0a0f;
    position: relative;
    animation: glow 3s ease-in-out infinite;
}

.avatar::after {
    content: '';
    position: absolute;
    inset: -4px;
    border-radius: 50%;
    background: linear-gradient(135deg, #00d4ff, #10b981);
    z-index: -1;
    opacity: 0.3;
    filter: blur(10px);
}

.profile-title {
    font-size: 28px;
    font-weight: 800;
    background: linear-gradient(135deg, #ffffff, rgba(255, 255, 255, 0.8));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 8px;
}

.profile-subtitle {
    color: rgba(255, 255, 255, 0.5);
    font-size: 14px;
}

/* Form Groups */
.form-group {
    margin-bottom: 24px;
}

.form-label {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 13px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 10px;
}

.form-label i {
    color: #00d4ff;
    font-size: 14px;
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
    min-height: 120px;
    resize: vertical;
    line-height: 1.6;
}

/* Skills Checkboxes */
.skills-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-bottom: 14px;
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
    border-color: rgba(255, 255, 255, 0.15);
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
    flex-shrink: 0;
}

.skill-checkbox input:checked + label::before {
    background: #10b981;
    border-color: #10b981;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 24 24' fill='none' stroke='%230a0a0f' stroke-width='3' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='20 6 9 17 4 12'%3E%3C/polyline%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: center;
}

/* Section Divider */
.section-divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
    margin: 28px 0;
}

/* Two Column Grid */
.two-col {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
}

@media (max-width: 500px) {
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
    margin-top: 8px;
}

.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(0, 212, 255, 0.35);
}

.btn-submit i {
    font-size: 18px;
}

/* Back Link */
.back-link {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: rgba(255, 255, 255, 0.6);
    text-decoration: none;
    font-size: 14px;
    margin-top: 24px;
    transition: all 0.3s ease;
}

.back-link:hover {
    color: #00d4ff;
    transform: translateX(-4px);
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
@media (max-width: 600px) {
    .profile-card {
        padding: 32px 24px;
    }
    
    .profile-title {
        font-size: 24px;
    }
    
    .avatar {
        width: 80px;
        height: 80px;
        font-size: 32px;
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

<!-- Main Content -->
<div class="main-container">
    <div class="glass profile-card animate-fade-in-up">

        <!-- Avatar Section -->
        <div class="avatar-section">
            <div class="avatar">
                <i class="bi bi-person-fill"></i>
            </div>
            <h1 class="profile-title">Create Your Profile</h1>
            <p class="profile-subtitle">Complete your profile to get discovered by recruiters</p>
        </div>

        <form action="saveProfile" method="post">

            <!-- Full Name -->
            <div class="form-group">
                <label class="form-label">
                    <i class="bi bi-person"></i>
                    Full Name
                </label>
                <input type="text" class="input" name="fullname" value="${user.fullname}" placeholder="Enter your full name">
            </div>

            <div class="section-divider"></div>

            <!-- Skills -->
            <div class="form-group">
                <label class="form-label">
                    <i class="bi bi-code-slash"></i>
                    Skills
                </label>
                <div class="skills-grid">
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-java" name="skills" value="Java">
                        <label for="skill-java">Java</label>
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
                        <input type="checkbox" id="skill-spring" name="skills" value="Spring">
                        <label for="skill-spring">Spring</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-react" name="skills" value="React">
                        <label for="skill-react">React</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-python" name="skills" value="Python">
                        <label for="skill-python">Python</label>
                    </div>
                    <div class="skill-checkbox">
                        <input type="checkbox" id="skill-js" name="skills" value="JavaScript">
                        <label for="skill-js">JavaScript</label>
                    </div>
                </div>
                <input type="text" class="input" name="customSkills" placeholder="Add more skills (comma separated e.g. Python, React)">
            </div>

            <div class="section-divider"></div>

            <!-- Two Column: Experience & Location -->
            <div class="two-col">
                <div class="form-group">
                    <label class="form-label">
                        <i class="bi bi-bar-chart"></i>
                        Experience
                    </label>
                    <select class="input" name="experience">
                        <option value="">Select Experience</option>
                        <option value="Fresher">Fresher</option>
                        <option value="1">1 Year</option>
                        <option value="2">2 Years</option>
                        <option value="3">3 Years</option>
                        <option value="4">4+ Years</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="form-label">
                        <i class="bi bi-geo-alt"></i>
                        Location
                    </label>
                    <select class="input" name="location">
                        <option>Select City</option>
                        <option value="mumbai">Mumbai</option>
                        <option value="pune">Pune</option>
                        <option value="bangalore">Bangalore</option>
                        <option value="delhi">Delhi</option>
                        <option value="hyderabad">Hyderabad</option>
                        <option value="chennai">Chennai</option>
                        <option value="nagpur">Nagpur</option>
                        <option value="nashik">Nashik</option>
                    </select>
                </div>
            </div>

            <div class="section-divider"></div>

            <!-- About -->
            <div class="form-group">
                <label class="form-label">
                    <i class="bi bi-chat-text"></i>
                    About
                </label>
                <textarea class="input" name="about" placeholder="Tell us about yourself, your goals and interests..."></textarea>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn-submit">
                <i class="bi bi-check-circle-fill"></i>
                Save Profile
            </button>

            <!-- Back Link -->
            <div style="text-align: center;">
                <a href="Seekerdashboard" class="back-link">
                    <i class="bi bi-arrow-left"></i>
                    Back to Dashboard
                </a>
            </div>

        </form>
    </div>
</div>

</body>
</html>