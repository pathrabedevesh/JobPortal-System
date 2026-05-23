<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recruiter Dashboard</title>
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
    color: #fff;
    min-height: 100vh;
    overflow-x: hidden;
}
/* Animated Background */
.bg-orbs {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    pointer-events: none;
    z-index: 0;
    overflow: hidden;
}
.orb {
    position: absolute;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.5;
    animation: float 20s ease-in-out infinite;
}
.orb-1 {
    width: 500px;
    height: 500px;
    background: linear-gradient(135deg, #00d4ff, #0099cc);
    top: -150px;
    right: -100px;
    animation-delay: 0s;
}
.orb-2 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #10b981, #059669);
    bottom: -100px;
    left: -100px;
    animation-delay: -7s;
}
.orb-3 {
    width: 300px;
    height: 300px;
    background: linear-gradient(135deg, #f59e0b, #d97706);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation-delay: -14s;
}
@keyframes float {
    0%, 100% { transform: translate(0, 0) scale(1); }
    25% { transform: translate(30px, -30px) scale(1.05); }
    50% { transform: translate(-20px, 20px) scale(0.95); }
    75% { transform: translate(20px, 30px) scale(1.02); }
}
/* Container */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 24px;
    position: relative;
    z-index: 1;
}
/* Header */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 28px;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 20px;
    margin-bottom: 32px;
}
.logo {
    display: flex;
    align-items: center;
    gap: 12px;
    font-size: 1.5rem;
    font-weight: 700;
    color: #fff;
}
.logo-icon {
    width: 42px;
    height: 42px;
    background: linear-gradient(135deg, #00d4ff, #10b981);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.logo-icon svg {
    width: 24px;
    height: 24px;
    color: #0a0a0f;
}
.header-actions {
    display: flex;
    gap: 12px;
}
.btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 12px 24px;
    border-radius: 12px;
    font-weight: 600;
    font-size: 0.9rem;
    text-decoration: none;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
}
.btn-primary {
    background: linear-gradient(135deg, #00d4ff, #0099cc);
    color: #0a0a0f;
}
.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 30px rgba(0, 212, 255, 0.4);
}
.btn-danger {
    background: rgba(239, 68, 68, 0.15);
    color: #ef4444;
    border: 1px solid rgba(239, 68, 68, 0.3);
}
.btn-danger:hover {
    background: rgba(239, 68, 68, 0.25);
    transform: translateY(-2px);
}
/* Stats Grid */
.stats-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 24px;
    margin-bottom: 32px;
}
@media (max-width: 768px) {
    .stats-grid {
        grid-template-columns: 1fr;
    }
}
.stat-card {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 20px;
    padding: 28px;
    text-align: center;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
}
.stat-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    border-radius: 20px 20px 0 0;
}
.stat-card:hover {
    transform: translateY(-4px);
    border-color: rgba(255, 255, 255, 0.15);
}
.stat-card.cyan::before {
    background: linear-gradient(90deg, #00d4ff, #0099cc);
}
.stat-card.green::before {
    background: linear-gradient(90deg, #10b981, #059669);
}
.stat-card.amber::before {
    background: linear-gradient(90deg, #f59e0b, #d97706);
}
.stat-card a {
    text-decoration: none;
    color: inherit;
    display: block;
}
.stat-icon {
    width: 56px;
    height: 56px;
    margin: 0 auto 16px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
}
.stat-card.cyan .stat-icon {
    background: rgba(0, 212, 255, 0.15);
    color: #00d4ff;
}
.stat-card.green .stat-icon {
    background: rgba(16, 185, 129, 0.15);
    color: #10b981;
}
.stat-card.amber .stat-icon {
    background: rgba(245, 158, 11, 0.15);
    color: #f59e0b;
}
.stat-icon svg {
    width: 28px;
    height: 28px;
}
.stat-value {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 8px;
}
.stat-card.cyan .stat-value { color: #00d4ff; }
.stat-card.green .stat-value { color: #10b981; }
.stat-card.amber .stat-value { color: #f59e0b; }
.stat-label {
    color: rgba(255, 255, 255, 0.6);
    font-size: 0.95rem;
    font-weight: 500;
}
/* Filters */
.filters {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr;
    gap: 16px;
    margin-bottom: 24px;
}
@media (max-width: 768px) {
    .filters {
        grid-template-columns: 1fr;
    }
}
.filter-input {
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    color: #fff;
    font-size: 0.95rem;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
}
.filter-input::placeholder {
    color: rgba(255, 255, 255, 0.4);
}
.filter-input:focus {
    outline: none;
    border-color: #00d4ff;
    background: rgba(0, 212, 255, 0.05);
    box-shadow: 0 0 0 3px rgba(0, 212, 255, 0.1);
}
.filter-input option {
    background: #1a1a24;
    color: #fff;
}
/* Table Card */
.table-card {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 20px;
    overflow: hidden;
}
.table-wrapper {
    overflow-x: auto;
}
table {
    width: 100%;
    border-collapse: collapse;
}
thead {
    background: rgba(255, 255, 255, 0.05);
}
th {
    padding: 18px 20px;
    text-align: left;
    font-weight: 600;
    font-size: 0.85rem;
    color: rgba(255, 255, 255, 0.6);
    text-transform: uppercase;
    letter-spacing: 0.5px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}
td {
    padding: 20px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    vertical-align: middle;
}
tbody tr {
    transition: all 0.3s ease;
}
tbody tr:hover {
    background: rgba(255, 255, 255, 0.03);
}
tbody tr:last-child td {
    border-bottom: none;
}
.row-number {
    width: 60px;
    color: rgba(255, 255, 255, 0.4);
    font-weight: 600;
}
.job-info {
    display: flex;
    flex-direction: column;
    gap: 4px;
}
.job-title {
    font-weight: 600;
    font-size: 1rem;
    color: #fff;
}
.job-company {
    font-size: 0.85rem;
    color: rgba(255, 255, 255, 0.5);
}
.type-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 6px 14px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 500;
    background: rgba(0, 212, 255, 0.1);
    color: #00d4ff;
    border: 1px solid rgba(0, 212, 255, 0.2);
}
.location-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: rgba(255, 255, 255, 0.7);
    font-size: 0.9rem;
}
.location-badge svg {
    width: 16px;
    height: 16px;
    color: #10b981;
}
.actions {
    display: flex;
    gap: 8px;
}
.btn-sm {
    padding: 8px 16px;
    font-size: 0.8rem;
    border-radius: 10px;
}
.btn-view {
    background: rgba(0, 212, 255, 0.1);
    color: #00d4ff;
    border: 1px solid rgba(0, 212, 255, 0.2);
}
.btn-view:hover {
    background: rgba(0, 212, 255, 0.2);
}
.btn-success {
    background: rgba(16, 185, 129, 0.1);
    color: #10b981;
    border: 1px solid rgba(16, 185, 129, 0.2);
}
.btn-success:hover {
    background: rgba(16, 185, 129, 0.2);
}
.btn-delete {
    background: rgba(239, 68, 68, 0.1);
    color: #ef4444;
    border: 1px solid rgba(239, 68, 68, 0.2);
}
.btn-delete:hover {
    background: rgba(239, 68, 68, 0.2);
}
/* Empty State */
.empty-state {
    text-align: center;
    padding: 60px 20px;
    color: rgba(255, 255, 255, 0.5);
}
.empty-state svg {
    width: 64px;
    height: 64px;
    margin-bottom: 16px;
    opacity: 0.3;
}
/* Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
.header { animation: fadeInUp 0.5s ease; }
.stats-grid { animation: fadeInUp 0.5s ease 0.1s both; }
.filters { animation: fadeInUp 0.5s ease 0.2s both; }
.table-card { animation: fadeInUp 0.5s ease 0.3s both; }
</style>
</head>
<body>
<!-- Animated Background -->
<div class="bg-orbs">
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>
</div>
<div class="container">
    <!-- HEADER -->
    <header class="header">
        <div class="logo">
            <div class="logo-icon">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
            </div>
            Career Link
        </div>
        <div class="header-actions">
            <a href="JobPostPage" class="btn btn-primary">
                <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                </svg>
                Post Job
            </a>
            
            <a href="profileemp" class="btn btn-primary">
        <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                d="M5.121 17.804A9 9 0 1118.879 17.804M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
        </svg>
        <span>Profile</span>
    </a>
            
            <a href="logout" class="btn btn-danger">
                <svg width="18" height="18" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
                </svg>
                Logout
            </a>
        </div>
    </header>
    <!-- STATS -->
    <div class="stats-grid">
        <div class="stat-card cyan">
            <div class="stat-icon">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                </svg>
            </div>
            <div class="stat-value">${fn:length(jobs)}</div>
            <div class="stat-label">Total Jobs</div>
        </div>
        <div class="stat-card green">
            <div class="stat-icon">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
            </div>
            <div class="stat-value">${count}</div>
            <div class="stat-label">Active Jobs</div>
        </div>
        <div class="stat-card amber">
            <a href="allApplications">
                <div class="stat-icon">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                    </svg>
                </div>
                <div class="stat-value">${totalApplications}</div>
                <div class="stat-label">Total Applications</div>
            </a>
        </div>
    </div>
    <!-- FILTERS -->
    <div class="filters">
        <input type="text" id="searchInput" class="filter-input" placeholder="Search by job title...">
        <select id="typeFilter" class="filter-input">
            <option value="">All Types</option>
            <option>Full Time</option>
            <option>Part Time</option>
            <option>Internship</option>
        </select>
        <input type="text" id="locationFilter" class="filter-input" placeholder="Filter by location...">
    </div>
    <!-- TABLE -->
    <div class="table-card">
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th class="row-number">#</th>
                        <th>Job</th>
                        <th>Type</th>
                        <th>Location</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="job" items="${jobs}" varStatus="status">
                    <tr>
                        <td class="row-number">${status.count}</td>
                        <td>
                            <div class="job-info">
                                <span class="job-title">${job.title}</span>
                                <span class="job-company">${job.company}</span>
                            </div>
                        </td>
                        <td>
                            <span class="type-badge">${job.type}</span>
                        </td>
                        <td>
                            <span class="location-badge">
                                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                                </svg>
                                ${job.location}
                            </span>
                        </td>
                        <td>
                            <div class="actions">
                                <a href="viewJob?jobId=${job.id}" class="btn btn-sm btn-view">View</a>
                                <a href="viewApplications?jobId=${job.id}" class="btn btn-sm btn-success">Applications</a>
                                <a href="deleteJob?id=${job.id}" class="btn btn-sm btn-delete">Delete</a>
                            </div>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- FILTER SCRIPT -->
<script>
const searchInput = document.getElementById("searchInput");
const typeFilter = document.getElementById("typeFilter");
const locationFilter = document.getElementById("locationFilter");
searchInput.addEventListener("keyup", filterTable);
typeFilter.addEventListener("change", filterTable);
locationFilter.addEventListener("keyup", filterTable);
function filterTable() {
    let search = searchInput.value.toLowerCase().trim();
    let type = typeFilter.value.toLowerCase().trim();
    let location = locationFilter.value.toLowerCase().trim();

    let rows = document.querySelectorAll("tbody tr");

    rows.forEach(row => {
        let title = row.children[1].innerText.toLowerCase().trim();
        let jobType = row.children[2].innerText.toLowerCase().trim();
        let jobLocation = row.children[3].innerText.toLowerCase().trim();

        let match = true;

        if (search && !title.includes(search)) match = false;
        if (type && jobType !== type) match = false;
        if (location && !jobLocation.includes(location)) match = false;

        row.style.display = match ? "" : "none";
    });
}
</script>
</body>
</html>