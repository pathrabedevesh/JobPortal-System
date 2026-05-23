<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>All Applications</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<style>
    * {
        font-family: 'Inter', sans-serif;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
        min-height: 100vh;
        color: #e2e8f0;
    }
    
    .main-container {
        padding: 40px;
        min-height: 100vh;
    }
    
    /* Back Button */
    .back-btn {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 12px 24px;
        background: rgba(30, 41, 59, 0.8);
        border: 1px solid rgba(148, 163, 184, 0.2);
        border-radius: 12px;
        color: #94a3b8;
        text-decoration: none;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.3s ease;
    }
    
    .back-btn:hover {
        background: rgba(56, 189, 248, 0.1);
        border-color: rgba(56, 189, 248, 0.3);
        color: #38bdf8;
    }
    
    /* Page Header */
    .page-header {
        margin: 32px 0 36px;
    }
    
    .page-title {
        font-size: 2.25rem;
        font-weight: 700;
        color: #06b6d4;
        margin-bottom: 8px;
    }
    
    .page-subtitle {
        color: #94a3b8;
        font-size: 1rem;
    }
    
    /* Table Card */
    .table-card {
        background: rgba(15, 23, 42, 0.6);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(148, 163, 184, 0.1);
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    }
    
    .table-responsive {
        overflow-x: auto;
    }
    
    /* Table */
    .modern-table {
        margin: 0;
        border-collapse: collapse;
        width: 100%;
        min-width: 1100px;
        background: transparent;
    }
    
    .modern-table thead {
        background: rgba(30, 41, 59, 0.9);
    }
    
    .modern-table thead th {
        padding: 18px 16px;
        font-weight: 700;
        font-size: 0.75rem;
        text-transform: uppercase;
        letter-spacing: 1px;
        color: #06b6d4;
        border: none;
        border-bottom: 1px solid rgba(56, 189, 248, 0.15);
        white-space: nowrap;
        text-align: left;
        background: transparent;
    }
    
    .modern-table tbody {
        background: transparent;
    }
    
    .modern-table tbody tr {
        transition: all 0.3s ease;
        border-bottom: 1px solid rgba(148, 163, 184, 0.08);
        background: transparent;
    }
    
    .modern-table tbody tr:hover {
        background: rgba(56, 189, 248, 0.05);
    }
    
    .modern-table tbody td {
        padding: 16px;
        vertical-align: middle;
        color: #e2e8f0;
        font-size: 0.9rem;
        border: none;
        background: transparent;
    }
    
    /* User Cell */
    .user-cell {
        display: flex;
        align-items: center;
        gap: 12px;
        min-width: 180px;
    }

    .user-avatar {
        width: 42px;
        height: 42px;
        border-radius: 10px;
        background: linear-gradient(135deg, #06b6d4, #3b82f6);
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 700;
        font-size: 1rem;
        color: white;
        flex-shrink: 0;
    }
    
    .user-name {
        font-weight: 600;
        color: #f1f5f9;
        font-size: 0.95rem;
    }
    
    /* Email & Phone */
    .email-cell {
        color: #94a3b8;
        font-size: 0.85rem;
    }
    
    .phone-cell {
        color: #cbd5e1;
        font-size: 0.9rem;
    }
    
    /* Location Badge */
    .location-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 6px 12px;
        background: rgba(139, 92, 246, 0.15);
        border: 1px solid rgba(139, 92, 246, 0.3);
        border-radius: 8px;
        color: #a78bfa;
        font-size: 0.8rem;
        font-weight: 600;
    }
    
    /* Skills Tags */
    .skills-tags {
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
        max-width: 250px;
    }
    
    .skill-tag {
        padding: 4px 10px;
        background: rgba(16, 185, 129, 0.15);
        border: 1px solid rgba(16, 185, 129, 0.3);
        border-radius: 6px;
        color: #34d399;
        font-size: 0.72rem;
        font-weight: 600;
    }
    
    /* Resume Button */
    .btn-resume {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 8px 14px;
        background: rgba(6, 182, 212, 0.15);
        border: 1px solid rgba(6, 182, 212, 0.3);
        border-radius: 8px;
        color: #22d3ee;
        font-size: 0.8rem;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.3s ease;
    }
    
    .btn-resume:hover {
        background: rgba(6, 182, 212, 0.25);
        color: #fff;
    }
    
    /* Status Badge */
    .status-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 6px 14px;
        border-radius: 50px;
        font-size: 0.75rem;
        font-weight: 700;
        text-transform: uppercase;
    }
    
    .status-accepted {
        background: rgba(16, 185, 129, 0.15);
        border: 1px solid rgba(16, 185, 129, 0.3);
        color: #34d399;
    }
    
    .status-rejected {
        background: rgba(244, 63, 94, 0.15);
        border: 1px solid rgba(244, 63, 94, 0.3);
        color: #fb7185;
    }
    
    .status-pending {
        background: rgba(245, 158, 11, 0.15);
        border: 1px solid rgba(245, 158, 11, 0.3);
        color: #fbbf24;
    }
    
    .status-dot {
        width: 6px;
        height: 6px;
        border-radius: 50%;
    }
    
    .status-accepted .status-dot { background: #34d399; }
    .status-rejected .status-dot { background: #fb7185; }
    .status-pending .status-dot { background: #fbbf24; }
    
    /* Action Buttons */
    .action-buttons {
        display: flex;
        gap: 6px;
    }
    
    .btn-action {
        display: inline-flex;
        align-items: center;
        gap: 5px;
        padding: 8px 12px;
        border-radius: 8px;
        font-size: 0.78rem;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.3s ease;
        border: 1px solid transparent;
    }
    
    .btn-accept {
        background: rgba(16, 185, 129, 0.15);
        border-color: rgba(16, 185, 129, 0.3);
        color: #34d399;
    }
    
    .btn-accept:hover {
        background: #10b981;
        color: #fff;
    }
    
    .btn-reject {
        background: rgba(244, 63, 94, 0.15);
        border-color: rgba(244, 63, 94, 0.3);
        color: #fb7185;
    }
    
    .btn-reject:hover {
        background: #f43f5e;
        color: #fff;
    }
    
    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 80px 40px;
    }
    
    .empty-icon {
        width: 80px;
        height: 80px;
        border-radius: 20px;
        background: rgba(56, 189, 248, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 24px;
    }

    .empty-icon i {
        font-size: 2.5rem;
        color: #38bdf8;
    }
    
    .empty-state h3 {
        color: #f1f5f9;
        margin-bottom: 8px;
    }

    .empty-state p {
        color: #94a3b8;
    }

    /* Scrollbar */
    ::-webkit-scrollbar {
        height: 6px;
    }

    ::-webkit-scrollbar-track {
        background: rgba(30, 41, 59, 0.5);
    }

    ::-webkit-scrollbar-thumb {
        background: rgba(56, 189, 248, 0.3);
        border-radius: 3px;
    }
</style>
</head>
<body>

<div class="main-container">
    
    <a href="Employeedashboard" class="back-btn">
        <i class="bi bi-arrow-left"></i>
        Dashboard
    </a>
    
    <div class="page-header">
        <h1 class="page-title">All Applications</h1>
        <p class="page-subtitle">Review and manage candidate applications</p>
    </div>

    <div class="table-card">
        <div class="table-responsive">
            <c:choose>
                <c:when test="${empty applications}">
                    <div class="empty-state">
                        <div class="empty-icon">
                            <i class="bi bi-inbox"></i>
                        </div>
                        <h3>No Applications Yet</h3>
                        <p>When candidates apply for your job postings, they will appear here.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="table modern-table">
                        <thead>
                            <tr>
                                <th>Applicant</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Location</th>
                                <th>Skills</th>
                                <th>Resume</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="app" items="${applications}">
                                <tr>
                                    <td>
                                        <div class="user-cell">
                                            <div class="user-avatar">${app.name.substring(0,1)}</div>
                                            <span class="user-name">${app.name}</span>
                                        </div>
                                    </td>
                                    <td class="email-cell">${app.email}</td>
                                    <td class="phone-cell">${app.phone}</td>
                                    <td>
                                        <span class="location-badge">
                                            <i class="bi bi-geo-alt-fill"></i>
                                            ${app.location}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="skills-tags">
                                            <c:forEach var="skill" items="${app.skills.split(',')}">
                                                <span class="skill-tag">${skill}</span>
                                            </c:forEach>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="viewResume?file=${app.resume}" target="_blank" class="btn-resume">
                                            <i class="bi bi-file-earmark-text"></i>
                                            View
                                        </a>
                                    </td>
                                    <td>
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
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="updateStatus?id=${app.id}&status=Accepted" class="btn-action btn-accept">
                                                <i class="bi bi-check-lg"></i>
                                                Accept
                                            </a>
                                            <a href="updateStatus?id=${app.id}&status=Rejected" class="btn-action btn-reject">
                                                <i class="bi bi-x-lg"></i>
                                                Reject
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>

</body>
</html>