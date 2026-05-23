<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Details</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: 'Inter', sans-serif;
    background: #0a0f1a;
    min-height: 100vh;
    color: #f1f5f9;
    overflow-x: hidden;
}
/* Animated Background Orbs */
.bg-orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.5;
    pointer-events: none;
    z-index: 0;
}
.orb-1 {
    width: 500px;
    height: 500px;
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    top: -150px;
    right: -100px;
    animation: float1 8s ease-in-out infinite;
}
.orb-2 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #10b981, #059669);
    bottom: -100px;
    left: -100px;
    animation: float2 10s ease-in-out infinite;
}
.orb-3 {
    width: 300px;
    height: 300px;
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: float3 12s ease-in-out infinite;
}
@keyframes float1 {
    0%, 100% { transform: translate(0, 0) scale(1); }
    50% { transform: translate(-30px, 30px) scale(1.1); }
}
@keyframes float2 {
    0%, 100% { transform: translate(0, 0) scale(1); }
    50% { transform: translate(40px, -20px) scale(1.05); }
}
@keyframes float3 {
    0%, 100% { transform: translate(-50%, -50%) scale(1); }
    50% { transform: translate(-50%, -50%) scale(1.15); }
}
/* Wrapper */
.wrapper {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: center;
    padding: 60px 20px;
    min-height: 100vh;
}
/* Main Card */
.container {
    width: 100%;
    max-width: 900px;
    background: rgba(15, 23, 42, 0.7);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.1);
    padding: 0;
    border-radius: 24px;
    box-shadow: 0 25px 80px rgba(0, 0, 0, 0.5);
    overflow: hidden;
    animation: slideUp 0.6s ease-out;
}
@keyframes slideUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
/* Gradient Top Bar */
.gradient-bar {
    height: 4px;
    background: linear-gradient(90deg, #06b6d4, #10b981, #8b5cf6);
    background-size: 200% 100%;
    animation: gradientMove 3s ease infinite;
}
@keyframes gradientMove {
    0%, 100% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
}
.content {
    padding: 40px;
}
/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    gap: 20px;
    flex-wrap: wrap;
}
.header-left {
    flex: 1;
}
.title {
    font-size: 32px;
    font-weight: 700;
    background: linear-gradient(135deg, #ffffff, #94a3b8);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    line-height: 1.2;
}
.sub {
    color: #64748b;
    margin-top: 12px;
    font-size: 16px;
    display: flex;
    align-items: center;
    gap: 8px;
}
.sub svg {
    width: 18px;
    height: 18px;
    color: #06b6d4;
}
.dot {
    width: 4px;
    height: 4px;
    background: #475569;
    border-radius: 50%;
}
/* Back Button */
.btn-back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    background: rgba(51, 65, 85, 0.5);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    color: #e2e8f0;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s ease;
}
.btn-back:hover {
    background: rgba(71, 85, 105, 0.6);
    transform: translateX(-3px);
    border-color: rgba(255, 255, 255, 0.2);
}
.btn-back svg {
    width: 18px;
    height: 18px;
}
/* Badges */
.badges {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-top: 28px;
}
.badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: rgba(51, 65, 85, 0.5);
    border: 1px solid rgba(255, 255, 255, 0.08);
    padding: 10px 18px;
    border-radius: 50px;
    font-size: 14px;
    color: #e2e8f0;
    transition: all 0.3s ease;
}
.badge:hover {
    background: rgba(71, 85, 105, 0.6);
    border-color: rgba(6, 182, 212, 0.3);
    transform: translateY(-2px);
}
.badge-icon {
    width: 20px;
    height: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    border-radius: 6px;
    font-size: 12px;
}
/* Section */
.section {
    margin-top: 40px;
}
.section-header {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 16px;
}
.section-icon {
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.2), rgba(16, 185, 129, 0.2));
    border-radius: 10px;
    border: 1px solid rgba(6, 182, 212, 0.3);
}
.section-icon svg {
    width: 18px;
    height: 18px;
    color: #06b6d4;
}
.section h3 {
    font-size: 18px;
    font-weight: 600;
    color: #f1f5f9;
}
/* Skills Tags */
.skills-wrap {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
}
.skill-tag {
    display: inline-block;
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.15), rgba(16, 185, 129, 0.15));
    border: 1px solid rgba(6, 182, 212, 0.3);
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 14px;
    color: #67e8f9;
    transition: all 0.3s ease;
}
.skill-tag:hover {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.25), rgba(16, 185, 129, 0.25));
    transform: translateY(-2px);
}
/* Description */
.desc {
    color: #94a3b8;
    line-height: 1.9;
    font-size: 15px;
    background: rgba(30, 41, 59, 0.5);
    padding: 24px;
    border-radius: 16px;
    border: 1px solid rgba(255, 255, 255, 0.05);
}
/* Footer */
.footer {
    margin-top: 40px;
    padding-top: 30px;
    border-top: 1px solid rgba(255, 255, 255, 0.08);
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 20px;
}
.posted-date {
    display: flex;
    align-items: center;
    gap: 10px;
    font-size: 14px;
    color: #64748b;
}
.posted-date svg {
    width: 18px;
    height: 18px;
    color: #475569;
}
/* Action Buttons */
.actions {
    display: flex;
    gap: 12px;
}
.btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 14px 28px;
    border: none;
    border-radius: 12px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.3s ease;
}
.btn-primary {
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    color: #0a0f1a;
    box-shadow: 0 4px 20px rgba(6, 182, 212, 0.3);
}
.btn-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 30px rgba(6, 182, 212, 0.4);
}
.btn-secondary {
    background: rgba(51, 65, 85, 0.5);
    border: 1px solid rgba(255, 255, 255, 0.1);
    color: #e2e8f0;
}
.btn-secondary:hover {
    background: rgba(71, 85, 105, 0.6);
    border-color: rgba(255, 255, 255, 0.2);
    transform: translateY(-3px);
}
.btn svg {
    width: 18px;
    height: 18px;
}
/* Responsive */
@media (max-width: 600px) {
    .content {
        padding: 24px;
    }
    .header {
        flex-direction: column;
        align-items: flex-start;
    }
    .title {
        font-size: 24px;
    }
    .footer {
        flex-direction: column;
        align-items: flex-start;
    }
    .actions {
        width: 100%;
        flex-direction: column;
    }
    .btn {
        width: 100%;
        justify-content: center;
    }
}
</style>
</head>
<body>
<!-- Background Orbs -->
<div class="bg-orb orb-1"></div>
<div class="bg-orb orb-2"></div>
<div class="bg-orb orb-3"></div>
<div class="wrapper">
<div class="container">
<div class="gradient-bar"></div>
<div class="content">
<!-- Header -->
<div class="header">
    <div class="header-left">
        <div class="title">${job.title}</div>
        <div class="sub">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
            ${job.location}
            <span class="dot"></span>
            ${job.type}
        </div>
    </div>
    <a href="Employeedashboard" class="btn-back">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
        </svg>
        Back
    </a>
</div>
<!-- Badges -->
<div class="badges">
    <span class="badge">
        <span class="badge-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none" viewBox="0 0 24 24" stroke="white" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
            </svg>
        </span>
        ${job.category}
    </span>
    <span class="badge">
        <span class="badge-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none" viewBox="0 0 24 24" stroke="white" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
            </svg>
        </span>
        ${job.experience}
    </span>
    <span class="badge">
        <span class="badge-icon">
            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="none" viewBox="0 0 24 24" stroke="white" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
        </span>
        ₹ ${job.salary}
    </span>
</div>
<!-- Skills Section -->
<div class="section">
    <div class="section-header">
        <div class="section-icon">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z" />
            </svg>
        </div>
        <h3>Skills Required</h3>
    </div>
    <div class="skills-wrap">
        <span class="skill-tag">${job.skills}</span>
    </div>
</div>
<!-- Description Section -->
<div class="section">
    <div class="section-header">
        <div class="section-icon">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
        </div>
        <h3>Job Description</h3>
    </div>
    <p class="desc">${job.description}</p>
</div>
<!-- Footer -->
<div class="footer">
    <div class="posted-date">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
        </svg>
        Posted on: ${job.postDate}
    </div>
    <div class="actions">
        <a href="viewApplications?jobId=${job.id}" class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
            </svg>
            Applications
        </a>
        <a href="editJob?jobId=${job.id}" class="btn btn-secondary">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
            </svg>
            Edit
        </a>
    </div>
</div>
</div>
</div>
</div>
</body>
</html>