<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Applied Jobs</title>
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
    background: #0a0f1a;
    font-family: 'Inter', sans-serif;
    color: #e2e8f0;
    min-height: 100vh;
    overflow-x: hidden;
}
/* Animated Background */
.bg-gradient-orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.5;
    z-index: 0;
    animation: float 8s ease-in-out infinite;
}
.orb-1 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    top: -100px;
    left: -100px;
    animation-delay: 0s;
}
.orb-2 {
    width: 300px;
    height: 300px;
    background: linear-gradient(135deg, #10b981, #059669);
    bottom: -50px;
    right: -50px;
    animation-delay: 2s;
}
.orb-3 {
    width: 250px;
    height: 250px;
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    top: 50%;
    left: 30%;
    animation-delay: 4s;
}
@keyframes float {
    0%, 100% { transform: translate(0, 0) scale(1); }
    50% { transform: translate(30px, -30px) scale(1.05); }
}
/* Sidebar */
.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 260px;
    height: 100vh;
    background: rgba(15, 23, 42, 0.8);
    backdrop-filter: blur(20px);
    border-right: 1px solid rgba(255, 255, 255, 0.08);
    padding: 30px 20px;
    z-index: 100;
    display: flex;
    flex-direction: column;
}
.sidebar-brand {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 40px;
    padding-bottom: 20px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}
.sidebar-brand-icon {
    width: 42px;
    height: 42px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    color: #0a0f1a;
    font-weight: 700;
}
.sidebar-brand-text {
    font-size: 20px;
    font-weight: 700;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}
.sidebar-nav {
    display: flex;
    flex-direction: column;
    gap: 8px;
    flex: 1;
}
.sidebar-link {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 14px 18px;
    color: #94a3b8;
    text-decoration: none;
    border-radius: 12px;
    transition: all 0.3s ease;
    font-weight: 500;
    font-size: 15px;
}
.sidebar-link i {
    font-size: 18px;
    width: 22px;
    text-align: center;
}
.sidebar-link:hover {
    background: rgba(6, 182, 212, 0.1);
    color: #06b6d4;
    transform: translateX(5px);
}
.sidebar-link.active {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.2), rgba(16, 185, 129, 0.2));
    color: #06b6d4;
    border: 1px solid rgba(6, 182, 212, 0.3);
}
.sidebar-link.logout {
    margin-top: auto;
    color: #f87171;
}
.sidebar-link.logout:hover {
    background: rgba(248, 113, 113, 0.1);
    color: #f87171;
}
/* Main Content */
.main-content {
    margin-left: 260px;
    padding: 40px;
    position: relative;
    z-index: 1;
    min-height: 100vh;
}
/* Page Header */
.page-header {
    margin-bottom: 40px;
}
.page-title {
    font-size: 32px;
    font-weight: 700;
    color: #f1f5f9;
    margin-bottom: 8px;
    display: flex;
    align-items: center;
    gap: 12px;
}
.page-title-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    color: #0a0f1a;
}
.page-subtitle {
    color: #64748b;
    font-size: 16px;
    margin-left: 60px;
}
/* Empty State */
.empty-state {
    text-align: center;
    padding: 80px 40px;
    background: rgba(15, 23, 42, 0.6);
    backdrop-filter: blur(20px);
    border-radius: 24px;
    border: 1px solid rgba(255, 255, 255, 0.08);
}
.empty-state-icon {
    width: 100px;
    height: 100px;
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.2), rgba(16, 185, 129, 0.2));
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 24px;
    font-size: 48px;
}
.empty-state h4 {
    font-size: 24px;
    font-weight: 600;
    color: #f1f5f9;
    margin-bottom: 12px;
}
.empty-state p {
    color: #64748b;
    font-size: 16px;
}
/* Job Cards Grid */
.jobs-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(360px, 1fr));
    gap: 24px;
}
/* Job Card */
.job-card {
    background: rgba(15, 23, 42, 0.6);
    backdrop-filter: blur(20px);
    border-radius: 20px;
    border: 1px solid rgba(255, 255, 255, 0.08);
    padding: 24px;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    display: flex;
    flex-direction: column;
    height: 100%;
}
.job-card:hover {
    transform: translateY(-8px);
    border-color: rgba(6, 182, 212, 0.4);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3), 0 0 60px rgba(6, 182, 212, 0.1);
}
/* Card Header */
.card-header-row {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 16px;
    gap: 12px;
}
.card-badges {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
}
.badge-type {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.2), rgba(6, 182, 212, 0.1));
    color: #06b6d4;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    border: 1px solid rgba(6, 182, 212, 0.3);
}
.badge-salary {
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(16, 185, 129, 0.1));
    color: #10b981;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    border: 1px solid rgba(16, 185, 129, 0.3);
}
/* Status Badge */
.status-badge {
    display: flex;
    align-items: center;
    gap: 6px;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    white-space: nowrap;
}
.status-accepted {
    background: linear-gradient(135deg, rgba(34, 197, 94, 0.2), rgba(34, 197, 94, 0.1));
    color: #22c55e;
    border: 1px solid rgba(34, 197, 94, 0.3);
}
.status-rejected {
    background: linear-gradient(135deg, rgba(239, 68, 68, 0.2), rgba(239, 68, 68, 0.1));
    color: #ef4444;
    border: 1px solid rgba(239, 68, 68, 0.3);
}
.status-pending {
    background: linear-gradient(135deg, rgba(245, 158, 11, 0.2), rgba(245, 158, 11, 0.1));
    color: #f59e0b;
    border: 1px solid rgba(245, 158, 11, 0.3);
}
.status-dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    animation: pulse 2s infinite;
}
.status-accepted .status-dot { background: #22c55e; }
.status-rejected .status-dot { background: #ef4444; }
.status-pending .status-dot { background: #f59e0b; }
@keyframes pulse {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: 0.5; transform: scale(0.8); }
}
/* Job Info */
.job-title {
    font-size: 20px;
    font-weight: 700;
    color: #f1f5f9;
    margin-bottom: 8px;
    line-height: 1.3;
}
.job-company {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 14px;
}
.company-icon {
    width: 36px;
    height: 36px;
    background: linear-gradient(135deg, #1e293b, #334155);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    color: #94a3b8;
}
.company-name {
    font-size: 15px;
    color: #94a3b8;
    font-weight: 500;
}
.job-location {
    display: flex;
    align-items: center;
    gap: 8px;
    color: #64748b;
    font-size: 14px;
    margin-bottom: 14px;
}
.job-location i {
    color: #06b6d4;
}
.job-description {
    color: #94a3b8;
    font-size: 14px;
    line-height: 1.6;
    margin-bottom: 20px;
    flex: 1;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
/* Applied Button */
.btn-applied {
    width: 100%;
    padding: 14px 24px;
    background: linear-gradient(135deg, #22c55e, #16a34a);
    border: none;
    border-radius: 12px;
    color: white;
    font-weight: 600;
    font-size: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    cursor: default;
    box-shadow: 0 4px 20px rgba(34, 197, 94, 0.3);
}
.btn-applied i {
    font-size: 18px;
}
/* Responsive */
@media (max-width: 992px) {
    .sidebar {
        width: 80px;
        padding: 20px 10px;
    }
    
    .sidebar-brand-text,
    .sidebar-link span {
        display: none;
    }
    
    .sidebar-brand {
        justify-content: center;
    }
    
    .sidebar-link {
        justify-content: center;
        padding: 14px;
    }
    
    .sidebar-link i {
        margin: 0;
    }
    
    .main-content {
        margin-left: 80px;
    }
}
@media (max-width: 768px) {
    .sidebar {
        width: 100%;
        height: auto;
        position: relative;
        flex-direction: row;
        padding: 15px 20px;
    }
    
    .sidebar-nav {
        flex-direction: row;
        gap: 5px;
    }
    
    .sidebar-brand {
        margin-bottom: 0;
        padding-bottom: 0;
        border-bottom: none;
    }
    
    .main-content {
        margin-left: 0;
        padding: 20px;
    }
    
    .jobs-grid {
        grid-template-columns: 1fr;
    }
    
    .page-title {
        font-size: 24px;
    }
    
    .page-subtitle {
        margin-left: 0;
    }
}
</style>
</head>
<body>
<!-- Background Orbs -->
<div class="bg-gradient-orb orb-1"></div>
<div class="bg-gradient-orb orb-2"></div>
<div class="bg-gradient-orb orb-3"></div>
<!-- Sidebar -->
<aside class="sidebar">
    <div class="sidebar-brand">
        <div class="sidebar-brand-icon">C</div>
        <span class="sidebar-brand-text">Career Link</span>
    </div>
    
    <nav class="sidebar-nav">
        <a href="viewhandler" class="sidebar-link">
            <i class="bi bi-house-door"></i>
            <span>Home</span>
        </a>
        <a href="appliedJobs" class="sidebar-link active">
            <i class="bi bi-briefcase"></i>
            <span>Applied Jobs</span>
        </a>
        <a href="seekerprofile" class="sidebar-link">
            <i class="bi bi-person"></i>
            <span>Profile</span>
        </a>
        <a href="logout" class="sidebar-link logout">
            <i class="bi bi-box-arrow-right"></i>
            <span>Logout</span>
        </a>
    </nav>
</aside>
<!-- Main Content -->
<main class="main-content">
    <!-- Page Header -->
    <div class="page-header">
        <h1 class="page-title">
            <div class="page-title-icon">
                <i class="bi bi-briefcase-fill"></i>
            </div>
            Your Applied Jobs
        </h1>
        <p class="page-subtitle">Track all your job applications and their status</p>
    </div>
    <!-- Empty State -->
    <c:if test="${empty applications}">
        <div class="empty-state">
            <div class="empty-state-icon">
                <i class="bi bi-inbox"></i>
            </div>
            <h4>No Applied Jobs Yet</h4>
            <p>Start exploring opportunities and apply to your dream jobs!</p>
        </div>
    </c:if>
    <!-- Job Cards Grid -->
    <div class="jobs-grid">
        <c:forEach var="app" items="${applications}">
            <div class="job-card">
                <!-- Header Row -->
                <div class="card-header-row">
                    <div class="card-badges">
                        <span class="badge-type">${app.type}</span>
                        <span class="badge-salary">${app.salary} LPA</span>
                    </div>
                    <!-- Status -->
                    <c:choose>
                        <c:when test="${app.status == 'Accepted'}">
                            <span class="status-badge status-accepted">
                                <span class="status-dot"></span>
                                Accepted
                            </span>
                        </c:when>
                        <c:when test="${app.status == 'Rejected'}">
                            <span class="status-badge status-rejected">
                                <span class="status-dot"></span>
                                Rejected
                            </span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-badge status-pending">
                                <span class="status-dot"></span>
                                Pending
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
                <!-- Job Title -->
                <h3 class="job-title">${app.jobTitle}</h3>
                <!-- Company -->
                <div class="job-company">
                    <div class="company-icon">
                        <i class="bi bi-building"></i>
                    </div>
                    <span class="company-name">${app.company}</span>
                </div>
                <!-- Location -->
                <div class="job-location">
                    <i class="bi bi-geo-alt-fill"></i>
                    <span>${app.location}</span>
                </div>
                <!-- Description -->
                <p class="job-description">${app.description}</p>
                <!-- Applied Button -->
                <button class="btn-applied">
                    <i class="bi bi-check-circle-fill"></i>
                    Applied
                </button>
            </div>
        </c:forEach>
    </div>
</main>
</body>
</html>