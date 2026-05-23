<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<html>
<head>
<meta charset="UTF-8">
<title>Career Link Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<script>
setTimeout(() => {
    let box = document.getElementById("msgBox");
    if(box){
        box.style.opacity = "0";
        box.style.transform = "translateY(-20px)";
        setTimeout(() => box.remove(), 500);
    }
}, 2500);
</script>
<script>
function closeToast(){
    document.getElementById("toastMsg").style.display = "none";
}

setTimeout(() => {
    let toast = document.getElementById("toastMsg");
    if(toast){
        toast.style.display = "none";
    }
}, 3000);
</script>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: #0a0e1a;
    font-family: 'Inter', sans-serif;
    color: #e2e8f0;
    min-height: 100vh;
    position: relative;
    overflow-x: hidden;
}

body::before {
    content: '';
    position: fixed;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: 
        radial-gradient(circle at 20% 20%, rgba(6, 182, 212, 0.08) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(59, 130, 246, 0.06) 0%, transparent 50%),
        radial-gradient(circle at 50% 50%, rgba(139, 92, 246, 0.04) 0%, transparent 50%);
    z-index: -1;
    animation: float 20s ease-in-out infinite;
}

@keyframes float {
    0%, 100% { transform: translate(0, 0) rotate(0deg); }
    50% { transform: translate(-20px, -20px) rotate(5deg); }
}

/* LOGO */
.logo {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 8px 0;
    margin-bottom: 20px;
}

.logo img {
    width: 48px;
    height: 48px;
    border-radius: 12px;
    object-fit: contain;
}

.logo h4 {
    font-weight: 700;
    font-size: 1.4rem;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    letter-spacing: -0.5px;
}

/* SIDEBAR */
.sidebar {
    height: 100vh;
    background: rgba(15, 23, 42, 0.8);
    backdrop-filter: blur(20px);
    border-right: 1px solid rgba(56, 189, 248, 0.1);
    padding: 28px 24px;
    position: sticky;
    top: 0;
}

.sidebar-nav {
    margin-top: 30px;
}

.sidebar a {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 14px 18px;
    margin: 6px 0;
    text-decoration: none;
    color: #94a3b8;
    font-weight: 500;
    font-size: 0.95rem;
    border-radius: 12px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
}

.sidebar a::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 3px;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    transform: scaleY(0);
    transition: transform 0.3s ease;
}

.sidebar a:hover {
    color: #38bdf8;
    background: rgba(56, 189, 248, 0.08);
}

.sidebar a:hover::before {
    transform: scaleY(1);
}

.sidebar a i {
    font-size: 1.2rem;
    width: 24px;
    text-align: center;
}

/* GLASS BOX */
.glass {
    background: rgba(15, 23, 42, 0.6);
    backdrop-filter: blur(20px);
    border-radius: 20px;
    border: 1px solid rgba(56, 189, 248, 0.1);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
}

/* HEADER SECTION */
.page-header {
    margin-bottom: 32px;
}

.page-header h3 {
    font-size: 2rem;
    font-weight: 700;
    color: #f1f5f9;
    letter-spacing: -0.5px;
}

.page-header h3 span {
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

/* FILTER BAR */
.filter-bar {
    padding: 24px 28px;
    margin-bottom: 32px;
}

.filter-bar select,
.filter-bar .form-control {
    background: rgba(30, 41, 59, 0.8);
    color: #e2e8f0;
    border: 1px solid rgba(56, 189, 248, 0.15);
    border-radius: 12px;
    padding: 12px 18px;
    font-size: 0.9rem;
    font-weight: 500;
    transition: all 0.3s ease;
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%2394a3b8' viewBox='0 0 16 16'%3E%3Cpath d='M8 11L3 6h10l-5 5z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 14px center;
    padding-right: 40px;
}

.filter-bar select:hover,
.filter-bar .form-control:hover {
    border-color: rgba(56, 189, 248, 0.4);
    background-color: rgba(30, 41, 59, 1);
}

.filter-bar select:focus,
.filter-bar .form-control:focus {
    outline: none;
    border-color: #38bdf8;
    box-shadow: 0 0 0 3px rgba(56, 189, 248, 0.15);
}

.filter-bar select option {
    background: #1e293b;
    color: #e2e8f0;
    padding: 10px;
}

/* BUTTONS */
.btn-primary {
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    border: none;
    border-radius: 12px;
    padding: 12px 32px;
    font-weight: 600;
    font-size: 0.95rem;
    letter-spacing: 0.3px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 15px rgba(6, 182, 212, 0.3);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px rgba(6, 182, 212, 0.4);
    background: linear-gradient(135deg, #0891b2, #2563eb);
}

.btn-primary:active {
    transform: translateY(0);
}

/* JOB CARD */
.job-card {
    background: rgba(15, 23, 42, 0.7);
    backdrop-filter: blur(16px);
    border: 1px solid rgba(56, 189, 248, 0.08);
    border-radius: 20px;
    color: #e2e8f0;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    overflow: hidden;
    position: relative;
}

.job-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, #06b6d4, #3b82f6, #8b5cf6);
    opacity: 0;
    transition: opacity 0.3s ease;
}

.job-card:hover {
    transform: translateY(-8px);
    border-color: rgba(56, 189, 248, 0.25);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.4),
                0 0 60px rgba(6, 182, 212, 0.1);
}

.job-card:hover::before {
    opacity: 1;
}

.job-card .card-body {
    padding: 28px;
}

.job-card h5 {
    font-size: 1.2rem;
    font-weight: 700;
    color: #f1f5f9;
    margin-bottom: 8px;
    letter-spacing: -0.3px;
}

.job-card .company-name {
    color: #94a3b8;
    font-weight: 500;
    font-size: 0.95rem;
    margin-bottom: 12px;
}

.job-card .location-text {
    color: #64748b;
    font-size: 0.85rem;
    display: flex;
    align-items: center;
    gap: 6px;
}

.job-card .location-text i {
    color: #38bdf8;
}

.job-card .description {
    color: #64748b;
    font-size: 0.85rem;
    line-height: 1.6;
    margin: 16px 0;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
}

/* BADGES */
.badge {
    padding: 8px 14px;
    border-radius: 8px;
    font-weight: 600;
    font-size: 0.75rem;
    letter-spacing: 0.3px;
    text-transform: uppercase;
}

.badge.bg-info {
    background: rgba(6, 182, 212, 0.15) !important;
    color: #22d3ee !important;
    border: 1px solid rgba(6, 182, 212, 0.3);
}

.badge.bg-success {
    background: rgba(34, 197, 94, 0.15) !important;
    color: #4ade80 !important;
    border: 1px solid rgba(34, 197, 94, 0.3);
}

/* VIEW DETAILS BUTTON */
.job-card .btn-primary {
    background: transparent;
    border: 2px solid rgba(56, 189, 248, 0.4);
    color: #38bdf8;
    box-shadow: none;
    padding: 12px 24px;
}

.job-card .btn-primary:hover {
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    border-color: transparent;
    color: #fff;
    box-shadow: 0 4px 15px rgba(6, 182, 212, 0.4);
}

/* PAGINATION */
.pagination-wrapper {
    margin-top: 48px;
    padding: 20px;
}

.pagination-wrapper .btn {
    border-radius: 10px;
    padding: 10px 18px;
    font-weight: 600;
    font-size: 0.85rem;
    margin: 0 4px;
    transition: all 0.3s ease;
}

.btn-outline-light {
    border: 1px solid rgba(148, 163, 184, 0.3);
    color: #94a3b8;
    background: transparent;
}

.btn-outline-light:hover {
    background: rgba(56, 189, 248, 0.1);
    border-color: #38bdf8;
    color: #38bdf8;
}

/* TOAST STYLES */
.toast {
    border-radius: 16px !important;
    background: linear-gradient(135deg, rgba(34, 197, 94, 0.95), rgba(22, 163, 74, 0.95)) !important;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.1);
    box-shadow: 0 10px 40px rgba(34, 197, 94, 0.3);
}

.alert-success {
    background: linear-gradient(135deg, rgba(34, 197, 94, 0.95), rgba(22, 163, 74, 0.95));
    border: none;
    border-radius: 16px;
    backdrop-filter: blur(10px);
    box-shadow: 0 10px 40px rgba(34, 197, 94, 0.3);
}

/* MAIN CONTENT */
.main-content {
    padding: 40px 48px;
}

/* SECTION TITLE */
.section-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: #64748b;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    margin-bottom: 24px;
}

/* STATS ROW */
.stats-row {
    display: flex;
    gap: 20px;
    margin-bottom: 32px;
}

.stat-card {
    flex: 1;
    padding: 24px;
    border-radius: 16px;
    background: rgba(15, 23, 42, 0.6);
    border: 1px solid rgba(56, 189, 248, 0.1);
}

.stat-card h4 {
    font-size: 2rem;
    font-weight: 700;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.stat-card p {
    color: #64748b;
    font-size: 0.9rem;
    margin: 0;
}

/* SCROLLBAR */
::-webkit-scrollbar {
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
    .sidebar {
        height: auto;
        position: relative;
    }
    
    .main-content {
        padding: 24px 16px;
    }
    
    .filter-bar {
        padding: 16px;
    }
    
    .filter-bar select {
        min-width: 100%;
        margin-bottom: 10px;
    }
}
</style>
</head>

<body>
<c:if test="${not empty msg1}">
    <div id="msgBox"
         class="alert alert-success position-fixed top-0 end-0 m-4 shadow"
         style="z-index:9999; transition:0.5s;">
        ${msg1}
        <% session.removeAttribute("msg1"); %>
    </div>
</c:if>

<c:if test="${not empty msg}">
    <div id="toastMsg" 
         class="toast align-items-center text-bg-success border-0 position-fixed top-0 end-0 m-4 show"
         style="z-index: 99999;"
         role="alert">
        <div class="d-flex">
            <div class="toast-body">
                ${msg}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" onclick="closeToast()"></button>
        </div>
        <% session.removeAttribute("msg"); %>
    </div>
</c:if>

<div class="container-fluid">
    <div class="row">

        <!-- SIDEBAR -->
        <div class="col-md-2 sidebar">
            <div class="logo">
                <img src="img/logo1.png" alt="Career Link Logo">
                <h4>Career Link</h4>
            </div>
            <nav class="sidebar-nav">
                <a href="#"><i class="bi bi-house-door"></i> Home</a>
                <a href="appliedJobs"><i class="bi bi-briefcase"></i> Applied Jobs</a>
                <a href="seekerprofile"><i class="bi bi-person"></i> Profile</a>
                <a href="logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
            </nav>
        </div>

        <!-- MAIN -->
        <div class="col-md-10 main-content">

            <!-- HEADER -->
            <div class="page-header">
                <h3>Welcome <span>Back</span></h3>
                <p class="text-secondary mt-2">Find your dream job today</p>
            </div>

            <!-- FILTER -->
            <form action="searchJobs" method="get">
                <div class="glass filter-bar">
                    <div class="d-flex flex-wrap gap-3 align-items-center">
                        <select name="location" class="form-control" style="max-width:160px;">
                            <option value="">All Locations</option>
                            <option>Pune</option>
                            <option>Mumbai</option>
                            <option>Bangalore</option>
                        </select>

                        <select name="type" class="form-control" style="max-width:160px;">
                            <option value="">Job Type</option>
                            <option>Full Time</option>
                            <option>Part Time</option>
                            <option>Internship</option>
                        </select>

                        <select name="category" class="form-control" style="max-width:180px;">
                            <option value="">Category</option>
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
                        </select>

                        <select name="experience" class="form-control" style="max-width:160px;">
                            <option value="">Experience</option>
                            <option>Fresher</option>
                            <option>1 Year</option>
                            <option>2 Years</option>
                            <option>3 Years</option>
                            <option>4+ Years</option>
                        </select>

                        <button class="btn btn-primary px-4" type="submit">
                            <i class="bi bi-search me-2"></i>Search Jobs
                        </button>
                    </div>
                </div>
            </form>

            <!-- JOB LIST -->
            <p class="section-title mt-4">Available Positions</p>
            <div class="row g-4">

                <c:set var="pageSize" value="6"/>
                <c:set var="currentPage" value="${empty param.page ? 0 : param.page}"/>
                <c:set var="start" value="${currentPage * pageSize}"/>
                <c:set var="end" value="${start + pageSize}"/>

                <c:forEach var="job" items="${jobs}" varStatus="status">
                    <c:if test="${status.index >= start && status.index < end}">
                        <div class="col-md-4">
                            <div class="card h-100 border-0 job-card">
                                <div class="card-body d-flex flex-column">

                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <span class="badge bg-info">${job.type}</span>
                                        <span class="badge bg-success">${job.salary} LPA</span>
                                    </div>

                                    <h5>${job.title}</h5>
                                    <p class="company-name">${job.company}</p>

                                    <p class="location-text">
                                        <i class="bi bi-geo-alt-fill"></i> ${job.location}
                                    </p>

                                    <p class="description">
                                        ${job.description}
                                    </p>

                                    <div class="mt-auto pt-3">
                                        <a href="jobDetails?jobId=${job.id}" class="btn btn-primary w-100">
                                            View Details <i class="bi bi-arrow-right ms-2"></i>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>

            </div>

            <!-- PAGINATION -->
            <c:set var="totalPages" value="${(jobs.size() + pageSize - 1) / pageSize}"/>

            <div class="pagination-wrapper text-center">
                <c:if test="${currentPage > 0}">
                    <a href="viewhandler?page=${currentPage-1}&location=${param.location}&type=${param.type}&category=${param.category}&experience=${param.experience}" 
                       class="btn btn-outline-light btn-sm">
                        <i class="bi bi-chevron-left me-1"></i> Prev
                    </a>
                </c:if>

                <c:forEach begin="0" end="${totalPages-1}" var="i">
                    <a href="viewhandler?page=${i}&location=${param.location}&type=${param.type}&category=${param.category}&experience=${param.experience}"
                       class="btn btn-sm ${i == currentPage ? 'btn-primary' : 'btn-outline-light'}">
                        ${i+1}
                    </a>
                </c:forEach>

                <c:if test="${currentPage < totalPages-1}">
                    <a href="viewhandler?page=${currentPage+1}&location=${param.location}&type=${param.type}&category=${param.category}&experience=${param.experience}" 
                       class="btn btn-outline-light btn-sm">
                        Next <i class="bi bi-chevron-right ms-1"></i>
                    </a>
                </c:if>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>