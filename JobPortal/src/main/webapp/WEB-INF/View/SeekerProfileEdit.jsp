<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile - Career Link</title>

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
        radial-gradient(circle at 20% 30%, rgba(6, 182, 212, 0.08) 0%, transparent 50%),
        radial-gradient(circle at 80% 70%, rgba(59, 130, 246, 0.06) 0%, transparent 50%),
        radial-gradient(circle at 40% 80%, rgba(139, 92, 246, 0.04) 0%, transparent 40%);
    z-index: -1;
    animation: float 25s ease-in-out infinite;
}

@keyframes float {
    0%, 100% { transform: translate(0, 0) rotate(0deg); }
    50% { transform: translate(-30px, -30px) rotate(3deg); }
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
    max-width: 900px;
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

/* CARD */
.card {
    background: rgba(15, 23, 42, 0.6);
    backdrop-filter: blur(20px);
    padding: 40px;
    border-radius: 24px;
    border: 1px solid rgba(56, 189, 248, 0.1);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.card:hover {
    border-color: rgba(56, 189, 248, 0.2);
    box-shadow: 0 16px 48px rgba(0, 0, 0, 0.4),
                0 0 60px rgba(6, 182, 212, 0.05);
}

/* INPUT BOX */
.input-box {
    margin-bottom: 28px;
}

.input-box label {
    display: block;
    color: #94a3b8;
    font-weight: 600;
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.8px;
    margin-bottom: 10px;
}

/* INPUT */
.input {
    width: 100%;
    padding: 16px 20px;
    border-radius: 14px;
    border: 1px solid rgba(56, 189, 248, 0.15);
    background: rgba(30, 41, 59, 0.8);
    color: #e2e8f0;
    font-size: 0.95rem;
    font-weight: 500;
    transition: all 0.3s ease;
    font-family: 'Inter', sans-serif;
}

.input::placeholder {
    color: #64748b;
}

.input:hover {
    border-color: rgba(56, 189, 248, 0.35);
    background: rgba(30, 41, 59, 1);
}

.input:focus {
    outline: none;
    border-color: #38bdf8;
    box-shadow: 0 0 0 4px rgba(56, 189, 248, 0.15);
}

textarea.input {
    min-height: 120px;
    resize: vertical;
    line-height: 1.6;
}

select.input {
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%2394a3b8' viewBox='0 0 16 16'%3E%3Cpath d='M8 11L3 6h10l-5 5z'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 18px center;
    padding-right: 48px;
}

select.input option {
    background: #1e293b;
    color: #e2e8f0;
    padding: 12px;
}

/* SKILLS CHECKBOX */
.checkbox-group {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
}

.checkbox-group label {
    display: flex;
    align-items: center;
    gap: 8px;
    background: rgba(30, 41, 59, 0.8);
    padding: 12px 18px;
    border-radius: 12px;
    border: 1px solid rgba(56, 189, 248, 0.1);
    cursor: pointer;
    transition: all 0.3s ease;
    font-size: 0.9rem;
    font-weight: 500;
    color: #94a3b8;
    text-transform: none;
    letter-spacing: 0;
    margin: 0;
}

.checkbox-group label:hover {
    border-color: rgba(56, 189, 248, 0.4);
    background: rgba(56, 189, 248, 0.08);
    color: #38bdf8;
}

.checkbox-group label:has(input:checked) {
    background: rgba(6, 182, 212, 0.15);
    border-color: rgba(6, 182, 212, 0.4);
    color: #22d3ee;
}

.checkbox-group input[type="checkbox"] {
    width: 18px;
    height: 18px;
    accent-color: #06b6d4;
    cursor: pointer;
}

/* BUTTON */
.btn-submit {
    width: 100%;
    padding: 18px 32px;
    border: none;
    border-radius: 14px;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    color: white;
    font-size: 1rem;
    font-weight: 600;
    letter-spacing: 0.3px;
    cursor: pointer;
    margin-top: 32px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 4px 20px rgba(6, 182, 212, 0.3);
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 30px rgba(6, 182, 212, 0.4);
    background: linear-gradient(135deg, #0891b2, #2563eb);
}

.btn-submit:active {
    transform: translateY(0);
}

/* SECTION DIVIDER */
.section-divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(56, 189, 248, 0.2), transparent);
    margin: 32px 0;
}

/* FORM GRID */
.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
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
    
    .form-grid {
        grid-template-columns: 1fr;
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
    
    .card {
        padding: 28px 24px;
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
        <h2><span>Edit</span> Profile</h2>
        <p>Update your profile information to help recruiters find you</p>
    </div>

    <!-- CARD -->
    <div class="card">

        <form action="saveProfile" method="post" enctype="multipart/form-data">

            <!-- FULL NAME -->
            <div class="input-box">
                <label>Full Name</label>
                <input class="input" name="fullname" value="${user.fullname}" placeholder="Enter your full name">
            </div>

            <!-- SKILLS -->
            <div class="input-box">
                <label>Skills</label>
                <div class="checkbox-group">
                    <label>
                        <input type="checkbox" name="skills" value="Java"
                            <c:if test="${fn:contains(user.skills,'Java')}">checked</c:if>> Java
                    </label>
                    <label>
                        <input type="checkbox" name="skills" value="SQL"
                            <c:if test="${fn:contains(user.skills,'SQL')}">checked</c:if>> SQL
                    </label>
                    <label>
                        <input type="checkbox" name="skills" value="HTML"
                            <c:if test="${fn:contains(user.skills,'HTML')}">checked</c:if>> HTML
                    </label>
                    <label>
                        <input type="checkbox" name="skills" value="CSS"
                            <c:if test="${fn:contains(user.skills,'CSS')}">checked</c:if>> CSS
                    </label>
                    <label>
                        <input type="checkbox" name="skills" value="Spring"
                            <c:if test="${fn:contains(user.skills,'Spring')}">checked</c:if>> Spring
                    </label>
                    <label>
                        <input type="checkbox" name="skills" value="React"
                            <c:if test="${fn:contains(user.skills,'React')}">checked</c:if>> React
                    </label>
                </div>
                <input class="input mt-3" name="customSkills" placeholder="Add more skills (comma separated)">
            </div>

            <div class="section-divider"></div>

            <!-- EXPERIENCE & LOCATION GRID -->
            <div class="form-grid">
                <div class="input-box">
                    <label>Experience</label>
                    <select class="input" name="experience">
                        <option value="Fresher" ${user.experience=='Fresher'?'selected':''}>Fresher</option>
                        <option value="1" ${user.experience=='1'?'selected':''}>1 Year</option>
                        <option value="2" ${user.experience=='2'?'selected':''}>2 Years</option>
                        <option value="3" ${user.experience=='3'?'selected':''}>3 Years</option>
                        <option value="4" ${user.experience=='4'?'selected':''}>4+ Years</option>
                    </select>
                </div>

                <div class="input-box">
                    <label>Location</label>
                    <select class="input" name="location">
                        <option value="pune" ${user.location=='pune'?'selected':''}>Pune</option>
                        <option value="mumbai" ${user.location=='mumbai'?'selected':''}>Mumbai</option>
                        <option value="bangalore" ${user.location=='bangalore'?'selected':''}>Bangalore</option>
                    </select>
                </div>
            </div>

            <!-- ABOUT -->
            <div class="input-box">
                <label>About</label>
                <textarea class="input" name="about" placeholder="Tell us about yourself...">${user.about}</textarea>
            </div>

            <!-- SUBMIT -->
            <button type="submit" class="btn-submit">
                <i class="bi bi-check2-circle"></i> Update Profile
            </button>

        </form>

    </div>

</div>

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