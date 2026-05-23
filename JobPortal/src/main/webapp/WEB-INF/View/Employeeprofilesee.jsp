<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Profile</title>
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
    color: #f0f0f0;
    min-height: 100vh;
    display: flex;
    overflow-x: hidden;
}
/* Animated Background */
.bg-orbs {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 0;
    overflow: hidden;
    pointer-events: none;
}
.orb {
    position: absolute;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.5;
    animation: float 20s ease-in-out infinite;
}
.orb-1 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    top: -100px;
    right: -100px;
    animation-delay: 0s;
}
.orb-2 {
    width: 350px;
    height: 350px;
    background: linear-gradient(135deg, #8b5cf6, #6366f1);
    bottom: -100px;
    left: -100px;
    animation-delay: -7s;
}
.orb-3 {
    width: 250px;
    height: 250px;
    background: linear-gradient(135deg, #10b981, #059669);
    top: 50%;
    left: 50%;
    animation-delay: -14s;
}
@keyframes float {
    0%, 100% { transform: translate(0, 0) scale(1); }
    25% { transform: translate(30px, -30px) scale(1.05); }
    50% { transform: translate(-20px, 20px) scale(0.95); }
    75% { transform: translate(-30px, -20px) scale(1.02); }
}
/* Sidebar */
.sidebar {
    width: 260px;
    min-height: 100vh;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border-right: 1px solid rgba(255, 255, 255, 0.08);
    padding: 30px 20px;
    position: fixed;
    left: 0;
    top: 0;
    z-index: 100;
    display: flex;
    flex-direction: column;
}
.sidebar-logo {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 50px;
    padding: 0 10px;
}
.logo-icon {
    width: 45px;
    height: 45px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    color: white;
    box-shadow: 0 8px 20px rgba(6, 182, 212, 0.3);
}
.logo-text {
    font-size: 22px;
    font-weight: 700;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}
.nav-links {
    display: flex;
    flex-direction: column;
    gap: 8px;
    flex: 1;
}
.nav-link {
    display: flex;
    align-items: center;
    gap: 14px;
    padding: 14px 18px;
    text-decoration: none;
    color: #9ca3af;
    border-radius: 12px;
    transition: all 0.3s ease;
    font-weight: 500;
    font-size: 15px;
}
.nav-link:hover {
    background: rgba(6, 182, 212, 0.1);
    color: #06b6d4;
    transform: translateX(5px);
}
.nav-link.active {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.2), rgba(16, 185, 129, 0.1));
    color: #06b6d4;
    border: 1px solid rgba(6, 182, 212, 0.3);
}
.nav-link i {
    font-size: 20px;
    width: 24px;
    text-align: center;
}
.nav-link.logout {
    margin-top: auto;
    color: #f87171;
}
.nav-link.logout:hover {
    background: rgba(248, 113, 113, 0.1);
    color: #f87171;
}
/* Main Content */
.main {
    flex: 1;
    margin-left: 260px;
    padding: 40px 50px;
    position: relative;
    z-index: 1;
    min-height: 100vh;
}
.page-header {
    margin-bottom: 40px;
}
.page-title {
    font-size: 32px;
    font-weight: 700;
    color: #fff;
    display: flex;
    align-items: center;
    gap: 15px;
}
.title-icon {
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
}
.page-subtitle {
    color: #6b7280;
    margin-top: 8px;
    font-size: 15px;
}
/* Profile Card */
.profile-card {
    max-width: 650px;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border-radius: 24px;
    border: 1px solid rgba(255, 255, 255, 0.08);
    overflow: hidden;
    animation: slideUp 0.6s ease;
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
.card-header {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.15), rgba(16, 185, 129, 0.1));
    padding: 30px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
    display: flex;
    align-items: center;
    gap: 20px;
}
.avatar {
    width: 80px;
    height: 80px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 32px;
    color: white;
    box-shadow: 0 10px 30px rgba(6, 182, 212, 0.3);
}
.header-info h3 {
    font-size: 20px;
    font-weight: 600;
    color: #fff;
    margin-bottom: 5px;
}
.header-info p {
    color: #9ca3af;
    font-size: 14px;
}
.card-body {
    padding: 35px;
}
/* Form Styles */
.form-group {
    margin-bottom: 25px;
}
.form-label {
    display: block;
    font-size: 14px;
    font-weight: 500;
    color: #9ca3af;
    margin-bottom: 10px;
}
.input-wrapper {
    position: relative;
}
.input-wrapper i {
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    color: #6b7280;
    font-size: 18px;
    transition: color 0.3s ease;
}
.form-input {
    width: 100%;
    padding: 16px 16px 16px 50px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    color: #fff;
    font-size: 15px;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
}
.form-input:focus {
    outline: none;
    border-color: #06b6d4;
    background: rgba(6, 182, 212, 0.05);
    box-shadow: 0 0 0 4px rgba(6, 182, 212, 0.1);
}
.form-input:focus + i,
.input-wrapper:focus-within i {
    color: #06b6d4;
}
.form-input::placeholder {
    color: #4b5563;
}
textarea.form-input {
    min-height: 130px;
    resize: vertical;
    padding-top: 16px;
}
.textarea-wrapper i {
    top: 18px;
    transform: none;
}
/* Submit Button */
.btn-submit {
    width: 100%;
    padding: 18px;
    background: linear-gradient(135deg, #06b6d4, #10b981);
    border: none;
    border-radius: 14px;
    color: #fff;
    font-size: 16px;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    transition: all 0.3s ease;
    margin-top: 15px;
    box-shadow: 0 10px 30px rgba(6, 182, 212, 0.3);
}
.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(6, 182, 212, 0.4);
}
.btn-submit i {
    font-size: 18px;
    transition: transform 0.3s ease;
}
.btn-submit:hover i {
    transform: translateX(5px);
}
/* Responsive */
@media (max-width: 992px) {
    .sidebar {
        width: 80px;
        padding: 20px 10px;
    }
    
    .logo-text, .nav-link span {
        display: none;
    }
    
    .sidebar-logo {
        justify-content: center;
    }
    
    .nav-link {
        justify-content: center;
        padding: 14px;
    }
    
    .main {
        margin-left: 80px;
        padding: 30px;
    }
}
@media (max-width: 768px) {
    .sidebar {
        display: none;
    }
    
    .main {
        margin-left: 0;
        padding: 20px;
    }
    
    .page-title {
        font-size: 24px;
    }
    
    .card-header {
        flex-direction: column;
        text-align: center;
    }
}
</style>
</head>
<body>
<div class="bg-orbs">
    <div class="orb orb-1"></div>
    <div class="orb orb-2"></div>
    <div class="orb orb-3"></div>
</div>
<!-- SIDEBAR -->
<div class="sidebar">
    <div class="sidebar-logo">
        <div class="logo-icon">
            <i class="bi bi-briefcase-fill"></i>
        </div>
        <span class="logo-text">Career Link</span>
    </div>
    
    <div class="nav-links">
        <a href="Employeedashboard" class="nav-link">
            <i class="bi bi-grid-1x2-fill"></i>
            <span>Dashboard</span>
        </a>
        <a href="JobPostPage" class="nav-link">
            <i class="bi bi-plus-circle-fill"></i>
            <span>Post Job</span>
        </a>
        <a href="#" class="nav-link active">
            <i class="bi bi-person-fill"></i>
            <span>Profile</span>
        </a>
        <a href="logout" class="nav-link logout">
            <i class="bi bi-box-arrow-right"></i>
            <span>Log out</span>
        </a>
    </div>
</div>
<!-- MAIN -->
<div class="main">
    <div class="page-header">
        <h1 class="page-title">
            <div class="title-icon">
                <i class="bi bi-person-badge-fill"></i>
            </div>
            Recruiter Profile
        </h1>
        <p class="page-subtitle">Manage your company information and profile details</p>
    </div>
    <div class="profile-card">
        
        <div class="card-header">
            <div class="avatar">
                <i class="bi bi-building"></i>
            </div>
            <div class="header-info">
                <h3>Company Profile</h3>
                <p>Update your organization details</p>
            </div>
        </div>
        <div class="card-body">
            <form action="saveRecruiterProfile" method="post">
                <div class="form-group">
                    <label class="form-label">Company Name</label>
                    <div class="input-wrapper">
                        <input type="text" class="form-input" name="company" value="${user.company}" placeholder="Enter company name">
                        <i class="bi bi-building"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">HR Name</label>
                    <div class="input-wrapper">
                        <input type="text" class="form-input" name="hrname" value="${user.hrname}" placeholder="Enter HR name">
                        <i class="bi bi-person"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Phone Number</label>
                    <div class="input-wrapper">
                        <input type="tel" class="form-input" name="phone" value="${user.phone}" placeholder="Enter phone number">
                        <i class="bi bi-telephone"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">Location</label>
                    <div class="input-wrapper">
                        <input type="text" class="form-input" name="location" value="${user.location}" placeholder="Enter location">
                        <i class="bi bi-geo-alt"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">About Company</label>
                    <div class="input-wrapper textarea-wrapper">
                        <textarea class="form-input" name="about" placeholder="Tell us about your company...">${user.about}</textarea>
                        <i class="bi bi-info-circle"></i>
                    </div>
                </div>
                <button type="submit" class="btn-submit">
                    Save Profile
                    <i class="bi bi-arrow-right"></i>
                </button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>