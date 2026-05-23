<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Applicants - Career Link</title>

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
    background: #0a0e1a;
    color: #e2e8f0;
    min-height: 100vh;
    position: relative;
    overflow-x: auto;
}

body::before {
    content: '';
    position: fixed;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: 
        radial-gradient(circle at 20% 30%, rgba(6, 182, 212, 0.08) 0%, transparent 50%),
        radial-gradient(circle at 80% 70%, rgba(59, 130, 246, 0.06) 0%, transparent 50%),
        radial-gradient(circle at 50% 50%, rgba(139, 92, 246, 0.04) 0%, transparent 40%);
    z-index: -1;
    animation: float 25s ease-in-out infinite;
}

@keyframes float {
    0%, 100% { transform: translate(0, 0) rotate(0deg); }
    50% { transform: translate(-20px, -20px) rotate(2deg); }
}

/* WRAPPER */
.wrapper {
    padding: 48px;
    min-height: 100vh;
}

/* CONTAINER */
.container {
    width: 100%;
    max-width: 1400px;
    margin: 0 auto;
    background: rgba(15, 23, 42, 0.7);
    backdrop-filter: blur(20px);
    padding: 40px;
    border-radius: 24px;
    border: 1px solid rgba(56, 189, 248, 0.1);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    overflow-x: hidden;
}

/* HEADER */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 32px;
    flex-wrap: wrap;
    gap: 16px;
}

/* TITLE */
.title {
    font-size: 1.75rem;
    font-weight: 700;
    color: #f1f5f9;
    display: flex;
    align-items: center;
    gap: 12px;
}

.title i {
    color: #38bdf8;
    font-size: 1.5rem;
}

.title span {
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

/* BACK BUTTON */
.btn-back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: rgba(51, 65, 85, 0.8);
    color: #e2e8f0;
    text-decoration: none;
    padding: 12px 24px;
    border-radius: 12px;
    font-size: 0.9rem;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    border: 1px solid rgba(56, 189, 248, 0.1);
}

.btn-back:hover {
    background: rgba(56, 189, 248, 0.15);
    border-color: rgba(56, 189, 248, 0.3);
    color: #38bdf8;
    transform: translateX(-4px);
}

/* STATS BAR */
.stats-bar {
    display: flex;
    gap: 20px;
    margin-bottom: 32px;
    flex-wrap: wrap;
}

.stat-item {
    background: rgba(30, 41, 59, 0.6);
    padding: 16px 24px;
    border-radius: 14px;
    border: 1px solid rgba(56, 189, 248, 0.08);
    display: flex;
    align-items: center;
    gap: 12px;
}

.stat-icon {
    width: 44px;
    height: 44px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
}

.stat-icon.total { background: rgba(56, 189, 248, 0.15); color: #38bdf8; }
.stat-icon.pending { background: rgba(234, 179, 8, 0.15); color: #facc15; }
.stat-icon.accepted { background: rgba(34, 197, 94, 0.15); color: #22c55e; }

.stat-content h4 {
    font-size: 1.5rem;
    font-weight: 700;
    color: #f1f5f9;
    line-height: 1;
}

.stat-content p {
    font-size: 0.8rem;
    color: #64748b;
    margin-top: 4px;
}

/* TABLE WRAPPER */
.table-wrapper {
    border-radius: 16px;
    overflow: hidden;
    border: 1px solid rgba(56, 189, 248, 0.1);
    overflow-x: auto;
    width: 100%;
    
    scroll-behavior: smooth;
}

/* TABLE */
.table {
    width: 100%;
    min-width: 1200px;
    border-collapse: collapse;
    
}

/* HEADER */
.table thead {
    background: linear-gradient(135deg, rgba(51, 65, 85, 0.9), rgba(30, 41, 59, 0.9));
}

.table th {
    padding: 18px 16px;
    text-align: left;
    color: #38bdf8;
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.8px;
    border-bottom: 1px solid rgba(56, 189, 248, 0.15);
}

.table th:last-child {
    text-align: center;
}

/* ROWS */
.table td {
    padding: 18px 16px;
    border-bottom: 1px solid rgba(56, 189, 248, 0.06);
    color: #cbd5e1;
    font-size: 0.9rem;
    font-weight: 500;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 180px;
}

.table td:last-child {
    text-align: center;
}

/* ROW NUMBER */
.row-num {
    width: 40px;
    height: 40px;
    border-radius: 10px;
    background: rgba(56, 189, 248, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    color: #38bdf8;
    font-size: 0.85rem;
}

/* NAME CELL */
.name-cell {
    display: flex;
    align-items: center;
    gap: 12px;
}

.avatar {
    width: 40px;
    height: 40px;
    border-radius: 10px;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    color: white;
    font-size: 0.9rem;
    flex-shrink: 0;
}

.name-text {
    font-weight: 600;
    color: #f1f5f9;
}

/* EMAIL */
.email-cell {
    color: #64748b;
    font-size: 0.85rem;
}

/* SKILLS */
.skills-cell {
    display: flex;
    gap: 6px;
    flex-wrap: wrap;
    max-width: 200px;
}

.skill-tag {
    background: rgba(6, 182, 212, 0.12);
    color: #22d3ee;
    padding: 4px 10px;
    border-radius: 6px;
    font-size: 0.75rem;
    font-weight: 600;
    border: 1px solid rgba(6, 182, 212, 0.2);
}

/* LOCATION */
.location-cell {
    display: flex;
    align-items: center;
    gap: 6px;
    color: #94a3b8;
}

.location-cell i {
    color: #38bdf8;
    font-size: 0.9rem;
}

/* EXPERIENCE */
.exp-badge {
    background: rgba(139, 92, 246, 0.12);
    color: #a78bfa;
    padding: 6px 12px;
    border-radius: 8px;
    font-size: 0.8rem;
    font-weight: 600;
    display: inline-block;
}

/* STRIPED */
.table tbody tr:nth-child(even) {
    background: rgba(30, 41, 59, 0.4);
}

/* HOVER */
.table tbody tr {
    transition: all 0.3s ease;
}

.table tbody tr:hover {
    background: rgba(56, 189, 248, 0.06);
}

/* BUTTONS */
.btn {
    padding: 10px 18px;
    border: none;
    border-radius: 10px;
    font-size: 0.8rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    display: inline-flex;
    align-items: center;
    gap: 6px;
    text-decoration: none;
}

.btn-view {
    background: rgba(56, 189, 248, 0.15);
    color: #38bdf8;
    border: 1px solid rgba(56, 189, 248, 0.3);
}

.btn-view:hover {
    background: rgba(56, 189, 248, 0.25);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(56, 189, 248, 0.2);
}

.btn-accept {
    background: rgba(34, 197, 94, 0.15);
    color: #22c55e;
    border: 1px solid rgba(34, 197, 94, 0.3);
}

.btn-accept:hover {
    background: rgba(34, 197, 94, 0.25);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(34, 197, 94, 0.2);
}

.btn-reject {
    background: rgba(239, 68, 68, 0.15);
    color: #ef4444;
    border: 1px solid rgba(239, 68, 68, 0.3);
}

.btn-reject:hover {
    background: rgba(239, 68, 68, 0.25);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);
}

/* ACTIONS */
.actions {
    display: flex;
    justify-content: center;
    gap: 8px;
}

/* EMPTY STATE */
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
    font-size: 1.25rem;
    font-weight: 600;
    color: #f1f5f9;
    margin-bottom: 8px;
}

.empty-state p {
    color: #64748b;
    font-size: 0.95rem;
}

/* SCROLLBAR */
::-webkit-scrollbar {
    height: 8px;
    width: 8px;
}

::-webkit-scrollbar-track {
    background: rgba(15, 23, 42, 0.5);
}

::-webkit-scrollbar-thumb {
    background: rgba(56, 189, 248, 0.3);
    border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
    background: rgba(56, 189, 248, 0.5);
}

/* RESPONSIVE */
@media (max-width: 768px) {
    .wrapper {
        padding: 20px;
    }
    
    .container {
        padding: 24px;
    }
    
    .header {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .stats-bar {
        flex-direction: column;
    }
    
    .stat-item {
        width: 100%;
    }
}
</style>
</head>

<body>

<div class="wrapper">
<div class="container">

    <!-- HEADER -->
    <div class="header">
        <div class="title">
            <i class="bi bi-people-fill"></i>
            <span>Applicants</span> List
        </div>
        <a href="Employeedashboard" class="btn-back">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
    </div>

    <!-- STATS BAR -->
    <div class="stats-bar">
        <div class="stat-item">
            <div class="stat-icon total">
                <i class="bi bi-people"></i>
            </div>
            <div class="stat-content">
                <h4>${applications.size()}</h4>
                <p>Total Applicants</p>
            </div>
        </div>
        
    </div>

    <c:choose>

        <c:when test="${empty applications}">
            <div class="empty-state">
                <div class="empty-icon">
                    <i class="bi bi-inbox"></i>
                </div>
                <h3>No Applicants Yet</h3>
                <p>When candidates apply for your job postings, they will appear here.</p>
            </div>
        </c:when>

        <c:otherwise>

            <div class="table-wrapper">
            <table class="table">

                <thead>
                    <tr>
                        <th>#</th>
                        <th>Applicant</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Location</th>
                        <th>Skills</th>
                        <th>Experience</th>
                        <th>About</th>
                        <th>Resume</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                    <c:forEach var="app" items="${applications}" varStatus="s">
                        <tr>

                            <td>
                                <div class="row-num">${s.count}</div>
                            </td>

                            <td>
                                <div class="name-cell">
                                    <div class="avatar">${app.name.substring(0,1)}</div>
                                    <span class="name-text">${app.name}</span>
                                </div>
                            </td>

                            <td class="email-cell">${app.email}</td>

                            <td>${app.phone}</td>

                            <td>
                                <div class="location-cell">
                                    <i class="bi bi-geo-alt-fill"></i>
                                    ${app.location}
                                </div>
                            </td>

                            <td>
                                <div class="skills-cell">
                                    <span class="skill-tag">${app.skills}</span>
                                </div>
                            </td>

                            <td>
                                <span class="exp-badge">${app.experience}</span>
                            </td>

                            <td>${app.about}</td>

                            <td>
                                <a href="viewResume?file=${app.resume}" target="_blank" class="btn btn-view">
                                    <i class="bi bi-file-earmark-text"></i> View
                                </a>
                            </td>

                            <td>
                                <div class="actions">

                                    <form action="updateStatus" method="post">
                                        <input type="hidden" name="id" value="${app.id}">
                                        <input type="hidden" name="status" value="Accepted">
                                        <button class="btn btn-accept">
                                            <i class="bi bi-check-lg"></i> Accept
                                        </button>
                                    </form>

                                    <form action="updateStatus" method="post">
                                        <input type="hidden" name="id" value="${app.id}">
                                        <input type="hidden" name="status" value="Rejected">
                                        <button class="btn btn-reject">
                                            <i class="bi bi-x-lg"></i> Reject
                                        </button>
                                    </form>

                                </div>
                            </td>

                        </tr>
                    </c:forEach>

                </tbody>

            </table>
            </div>

        </c:otherwise>

    </c:choose>

</div>
</div>

</body>
</html>