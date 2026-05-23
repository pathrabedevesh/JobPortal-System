<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile - Career Link</title>

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
    background: #0a0e1a;
    color: #e2e8f0;
    min-height: 100vh;
    display: flex;
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
        radial-gradient(circle at 25% 25%, rgba(6, 182, 212, 0.08) 0%, transparent 50%),
        radial-gradient(circle at 75% 75%, rgba(59, 130, 246, 0.06) 0%, transparent 50%),
        radial-gradient(circle at 50% 50%, rgba(139, 92, 246, 0.04) 0%, transparent 40%);
    z-index: -1;
    animation: float 20s ease-in-out infinite;
}

@keyframes float {
    0%, 100% { transform: translate(0, 0) rotate(0deg); }
    50% { transform: translate(-20px, -20px) rotate(2deg); }
}

/* PARTICLES */
#particles-js {
    position: fixed;
    width: 100%;
    height: 100%;
    z-index: -1;
    pointer-events: none;
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

.logo h2 {
    font-weight: 700;
    font-size: 1.4rem;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    letter-spacing: -0.5px;
    margin: 0;
}

/* SIDEBAR */
.sidebar {
    width: 260px;
    min-height: 100vh;
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

/* MAIN */
.main {
    flex: 1;
    padding: 48px 60px;
}

/* PAGE HEADER */
.page-header {
    margin-bottom: 40px;
}

.page-header h2 {
    font-size: 2rem;
    font-weight: 700;
    color: #f1f5f9;
    letter-spacing: -0.5px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.page-header h2 span {
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.page-header p {
    color: #64748b;
    margin-top: 8px;
    font-size: 0.95rem;
}

/* PROFILE CARD */
.profile-card {
    background: rgba(15, 23, 42, 0.6);
    backdrop-filter: blur(20px);
    padding: 0;
    border-radius: 24px;
    border: 1px solid rgba(56, 189, 248, 0.1);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    max-width: 700px;
    overflow: hidden;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.profile-card:hover {
    border-color: rgba(56, 189, 248, 0.2);
    box-shadow: 0 16px 48px rgba(0, 0, 0, 0.4),
                0 0 60px rgba(6, 182, 212, 0.05);
    transform: translateY(-5px);
}

/* PROFILE HEADER */
.profile-header {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.15), rgba(59, 130, 246, 0.1));
    padding: 32px 40px;
    border-bottom: 1px solid rgba(56, 189, 248, 0.1);
    display: flex;
    align-items: center;
    gap: 24px;
}

.profile-avatar {
    width: 80px;
    height: 80px;
    border-radius: 20px;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2rem;
    font-weight: 700;
    color: white;
    box-shadow: 0 8px 24px rgba(6, 182, 212, 0.3);
}

.profile-name h3 {
    font-size: 1.5rem;
    font-weight: 700;
    color: #f1f5f9;
    margin: 0 0 6px 0;
}

.profile-name p {
    color: #64748b;
    font-size: 0.9rem;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 6px;
}

.profile-name p i {
    color: #38bdf8;
}

/* PROFILE BODY */
.profile-body {
    padding: 32px 40px;
}

/* INFO ROW */
.info-row {
    display: flex;
    align-items: flex-start;
    padding: 20px 0;
    border-bottom: 1px solid rgba(56, 189, 248, 0.08);
}

.info-row:last-of-type {
    border-bottom: none;
}

.info-icon {
    width: 44px;
    height: 44px;
    border-radius: 12px;
    background: rgba(56, 189, 248, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 20px;
    flex-shrink: 0;
}

.info-icon i {
    font-size: 1.2rem;
    color: #38bdf8;
}

.info-content {
    flex: 1;
}

.info-label {
    font-size: 0.8rem;
    color: #64748b;
    text-transform: uppercase;
    letter-spacing: 0.8px;
    font-weight: 600;
    margin-bottom: 6px;
}

.info-value {
    font-size: 1.05rem;
    font-weight: 500;
    color: #e2e8f0;
    line-height: 1.6;
}

/* SKILLS */
.skills-list {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 4px;
}

.skill-tag {
    background: rgba(6, 182, 212, 0.15);
    color: #22d3ee;
    padding: 8px 16px;
    border-radius: 10px;
    font-size: 0.85rem;
    font-weight: 600;
    border: 1px solid rgba(6, 182, 212, 0.25);
    transition: all 0.3s ease;
}

.skill-tag:hover {
    background: rgba(6, 182, 212, 0.25);
    transform: translateY(-2px);
}

/* EDIT BUTTON */
.btn-edit {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 16px 32px;
    border: none;
    border-radius: 14px;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    color: white;
    font-size: 0.95rem;
    font-weight: 600;
    letter-spacing: 0.3px;
    cursor: pointer;
    margin-top: 28px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 20px rgba(6, 182, 212, 0.3);
    text-decoration: none;
}

.btn-edit:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 30px rgba(6, 182, 212, 0.4);
    background: linear-gradient(135deg, #0891b2, #2563eb);
    color: white;
}

.btn-edit:active {
    transform: translateY(0);
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
@media (max-width: 992px) {
    .main {
        padding: 32px 24px;
    }
    
    .profile-header {
        padding: 24px;
    }
    
    .profile-body {
        padding: 24px;
    }
}

@media (max-width: 768px) {
    body {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        height: auto;
        min-height: auto;
        position: relative;
        padding: 20px;
    }
    
    .sidebar-nav {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 16px;
    }
    
    .sidebar a {
        padding: 10px 16px;
        margin: 0;
    }
    
    .profile-header {
        flex-direction: column;
        text-align: center;
    }
    
    .profile-name p {
        justify-content: center;
    }
}
</style>
</head>

<body>

<div id="particles-js"></div>

<!-- SIDEBAR -->
<div class="sidebar">
    <div class="logo">
        <img src="img/logo1.png" alt="Career Link Logo">
        <h2>Career Link</h2>
    </div>
    <nav class="sidebar-nav">
        <a href="Seekerdashboard"><i class="bi bi-house-door"></i> Home</a>
        <a href="appliedJobs"><i class="bi bi-briefcase"></i> Applied Jobs</a>
        <a href="SeekerProfileView"><i class="bi bi-person"></i> Profile</a>
        <a href="logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </nav>
</div>

<!-- MAIN -->
<div class="main">

    <!-- PAGE HEADER -->
    <div class="page-header">
        <h2><span>My</span> Profile</h2>
        <p>View and manage your profile information</p>
    </div>

    <!-- PROFILE CARD -->
    <div class="profile-card">

        <!-- PROFILE HEADER -->
        <div class="profile-header">
            <div class="profile-avatar">
                ${fn:substring(user.fullname, 0, 1)}
            </div>
            <div class="profile-name">
                <h3>${user.fullname}</h3>
                <p><i class="bi bi-geo-alt-fill"></i> ${user.location}</p>
            </div>
        </div>

        <!-- PROFILE BODY -->
        <div class="profile-body">

            <!-- SKILLS -->
            <div class="info-row">
                <div class="info-icon">
                    <i class="bi bi-code-slash"></i>
                </div>
                <div class="info-content">
                    <div class="info-label">Skills</div>
                    <div class="skills-list">
                        <c:forEach var="s" items="${fn:split(user.skills, ',')}">
                            <span class="skill-tag">${s}</span>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- EXPERIENCE -->
            <div class="info-row">
                <div class="info-icon">
                    <i class="bi bi-briefcase"></i>
                </div>
                <div class="info-content">
                    <div class="info-label">Experience</div>
                    <div class="info-value">${user.experience}</div>
                </div>
            </div>

            <!-- LOCATION -->
            <div class="info-row">
                <div class="info-icon">
                    <i class="bi bi-geo-alt"></i>
                </div>
                <div class="info-content">
                    <div class="info-label">Location</div>
                    <div class="info-value">${user.location}</div>
                </div>
            </div>

            <!-- ABOUT -->
            <div class="info-row">
                <div class="info-icon">
                    <i class="bi bi-person-lines-fill"></i>
                </div>
                <div class="info-content">
                    <div class="info-label">About</div>
                    <div class="info-value">${user.about}</div>
                </div>
            </div>

            <!-- EDIT BUTTON -->
            <a href="Editprofileseeker" class="btn-edit">
                <i class="bi bi-pencil-square"></i> Edit Profile
            </a>

        </div>

    </div>

</div>

<!-- PARTICLES -->
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>
<script>
particlesJS("particles-js", {
    particles: {
        number: { value: 60, density: { enable: true, value_area: 800 } },
        color: { value: "#38bdf8" },
        shape: { type: "circle" },
        opacity: { value: 0.3, random: true },
        size: { value: 3, random: true },
        line_linked: { enable: true, distance: 150, color: "#38bdf8", opacity: 0.1, width: 1 },
        move: { enable: true, speed: 1.5, direction: "none", random: true, out_mode: "out" }
    },
    interactivity: {
        detect_on: "canvas",
        events: { onhover: { enable: true, mode: "grab" }, resize: true },
        modes: { grab: { distance: 140, line_linked: { opacity: 0.3 } } }
    }
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>