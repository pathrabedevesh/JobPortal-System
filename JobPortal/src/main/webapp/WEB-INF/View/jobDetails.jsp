<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Details - ${job.title}</title>

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

@keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.7; }
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
    top: 40%;
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

.glass-light {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 16px;
}

/* Animations */
.animate-fade-in-up {
    animation: fadeInUp 0.6s ease both;
}

.delay-100 { animation-delay: 0.1s; }
.delay-200 { animation-delay: 0.2s; }
.delay-300 { animation-delay: 0.3s; }
.delay-400 { animation-delay: 0.4s; }

/* Main Container */
.main-container {
    max-width: 900px;
    margin: 0 auto;
    padding: 40px 24px;
    position: relative;
    z-index: 1;
}

/* Header */
.page-header {
    margin-bottom: 32px;
}

/* Back Button */
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

/* Job Card */
.job-card {
    padding: 40px;
}

/* Job Header */
.job-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 24px;
    margin-bottom: 32px;
    flex-wrap: wrap;
}

.job-title {
    font-size: 36px;
    font-weight: 800;
    background: linear-gradient(135deg, #ffffff, rgba(255, 255, 255, 0.8));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 12px;
    line-height: 1.2;
}

.job-meta {
    display: flex;
    align-items: center;
    gap: 16px;
    color: rgba(255, 255, 255, 0.6);
    font-size: 15px;
    flex-wrap: wrap;
}

.job-meta-item {
    display: flex;
    align-items: center;
    gap: 6px;
}

.job-meta-divider {
    width: 4px;
    height: 4px;
    background: rgba(255, 255, 255, 0.3);
    border-radius: 50%;
}

/* Salary Badge */
.salary-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 14px 28px;
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(16, 185, 129, 0.1));
    border: 1px solid rgba(16, 185, 129, 0.3);
    border-radius: 16px;
    color: #10b981;
    font-size: 20px;
    font-weight: 700;
}

/* Company Section */
.company-section {
    padding: 24px;
    margin-bottom: 24px;
}

.company-label {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: rgba(255, 255, 255, 0.5);
    margin-bottom: 8px;
}

.company-name {
    font-size: 24px;
    font-weight: 700;
    color: #ffffff;
}

/* Info Grid */
.info-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-bottom: 32px;
}

.info-card {
    padding: 24px;
}

.info-icon {
    width: 44px;
    height: 44px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 16px;
    font-size: 20px;
}

.info-icon.cyan {
    background: rgba(0, 212, 255, 0.15);
    color: #00d4ff;
}

.info-icon.green {
    background: rgba(16, 185, 129, 0.15);
    color: #10b981;
}

.info-icon.amber {
    background: rgba(245, 158, 11, 0.15);
    color: #f59e0b;
}

.info-label {
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: rgba(255, 255, 255, 0.5);
    margin-bottom: 6px;
}

.info-value {
    font-size: 18px;
    font-weight: 600;
    color: #ffffff;
}

/* Badges Section */
.badges-section {
    margin-bottom: 32px;
}

.section-title {
    font-size: 18px;
    font-weight: 700;
    margin-bottom: 16px;
    color: #ffffff;
}

.badges-container {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
}

.badge-custom {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 20px;
    background: rgba(0, 212, 255, 0.1);
    border: 1px solid rgba(0, 212, 255, 0.2);
    border-radius: 30px;
    color: #00d4ff;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.badge-custom:hover {
    background: rgba(0, 212, 255, 0.2);
    transform: translateY(-2px);
}

.badge-category {
    background: rgba(245, 158, 11, 0.1);
    border-color: rgba(245, 158, 11, 0.2);
    color: #f59e0b;
}

.badge-experience {
    background: rgba(139, 92, 246, 0.1);
    border-color: rgba(139, 92, 246, 0.2);
    color: #a78bfa;
}

/* Skills Section */
.skills-section {
    margin-bottom: 32px;
}

.skill-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 14px 24px;
    background: rgba(16, 185, 129, 0.1);
    border: 1px solid rgba(16, 185, 129, 0.2);
    border-radius: 30px;
    color: #10b981;
    font-size: 15px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.skill-badge:hover {
    background: rgba(16, 185, 129, 0.2);
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(16, 185, 129, 0.15);
}

/* Description Section */
.description-section {
    margin-bottom: 40px;
}

.description-text {
    color: rgba(255, 255, 255, 0.8);
    font-size: 16px;
    line-height: 1.8;
    padding: 24px;
}

/* Footer / CTA */
.job-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: 32px;
    border-top: 1px solid rgba(255, 255, 255, 0.08);
    flex-wrap: wrap;
    gap: 20px;
}

.cta-text {
    color: rgba(255, 255, 255, 0.6);
    font-size: 16px;
}

.cta-text span {
    font-size: 20px;
}

.btn-apply {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 16px 36px;
    background: linear-gradient(135deg, #00d4ff, #00a8cc);
    border: none;
    border-radius: 16px;
    color: #0a0a0f;
    font-size: 16px;
    font-weight: 700;
    text-decoration: none;
    transition: all 0.3s ease;
    cursor: pointer;
}

.btn-apply:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(0, 212, 255, 0.35);
    color: #0a0a0f;
}

.btn-apply i {
    font-size: 18px;
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
    .main-container {
        padding: 20px 16px;
    }
    
    .job-card {
        padding: 24px;
    }
    
    .job-title {
        font-size: 28px;
    }
    
    .job-header {
        flex-direction: column;
    }
    
    .salary-badge {
        font-size: 18px;
        padding: 12px 24px;
    }
    
    .info-grid {
        grid-template-columns: 1fr;
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

    <!-- Back Button -->
    <div class="page-header animate-fade-in-up">
        <a href="Seekerdashboard" class="btn-back">
            <i class="bi bi-arrow-left"></i>
            Back to Dashboard
        </a>
    </div>

    <!-- Job Details Card -->
    <div class="glass job-card animate-fade-in-up delay-100">

        <!-- Header -->
        <div class="job-header">
            <div>
                <h1 class="job-title">${job.title}</h1>
                <div class="job-meta">
                    <span class="job-meta-item">
                        <i class="bi bi-geo-alt-fill"></i>
                        ${job.location}
                    </span>
                    <span class="job-meta-divider"></span>
                    <span class="job-meta-item">
                        <i class="bi bi-briefcase-fill"></i>
                        ${job.type}
                    </span>
                </div>
            </div>
            <div class="salary-badge">
                <i class="bi bi-currency-rupee"></i>
                ${job.salary} LPA
            </div>
        </div>

        <!-- Company -->
        <div class="glass-light company-section animate-fade-in-up delay-200">
            <div class="company-label">Company</div>
            <div class="company-name">${job.company}</div>
        </div>

        <!-- Info Grid -->
        <div class="info-grid animate-fade-in-up delay-200">
            <div class="glass-light info-card">
                <div class="info-icon cyan">
                    <i class="bi bi-calendar-event"></i>
                </div>
                <div class="info-label">Posted Date</div>
                <div class="info-value">${job.postDate}</div>
            </div>
            <div class="glass-light info-card">
                <div class="info-icon green">
                    <i class="bi bi-geo-alt"></i>
                </div>
                <div class="info-label">Location</div>
                <div class="info-value">${job.location}</div>
            </div>
            <div class="glass-light info-card">
                <div class="info-icon amber">
                    <i class="bi bi-bar-chart"></i>
                </div>
                <div class="info-label">Experience</div>
                <div class="info-value">${job.experience}</div>
            </div>
        </div>

        <!-- Category & Experience Badges -->
        <div class="badges-section animate-fade-in-up delay-300">
            <div class="badges-container">
                <span class="badge-custom badge-category">
                    <i class="bi bi-briefcase"></i>
                    ${job.category}
                </span>
                <span class="badge-custom badge-experience">
                    <i class="bi bi-graph-up-arrow"></i>
                    ${job.experience}
                </span>
            </div>
        </div>

        <!-- Skills Required -->
        <div class="skills-section animate-fade-in-up delay-300">
            <h5 class="section-title">Skills Required</h5>
            <div class="badges-container">
                <c:forEach var="skill" items="${fn:split(job.skills, ',')}">
                    <span class="skill-badge">
                        <i class="bi bi-code-slash"></i>
                        ${fn:trim(skill)}
                    </span>
                </c:forEach>
            </div>
        </div>

        <!-- Job Description -->
        <div class="description-section animate-fade-in-up delay-400">
            <h5 class="section-title">Job Description</h5>
            <div class="glass-light description-text">
                ${job.description}
            </div>
        </div>

        <!-- Footer / Apply CTA -->
        <div class="job-footer animate-fade-in-up delay-400">
            <div class="cta-text">
                Ready to take the next step? <span>🚀</span>
            </div>
            <a href="applyPage?jobId=${job.id}" class="btn-apply">
                <i class="bi bi-send-fill"></i>
                Apply Now
            </a>
        </div>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>