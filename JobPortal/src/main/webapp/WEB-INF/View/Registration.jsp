<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Career Link - Register</title>

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
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 20px;
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
        transform: translateY(40px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes glow {
    0%, 100% { box-shadow: 0 0 30px rgba(0, 212, 255, 0.3); }
    50% { box-shadow: 0 0 50px rgba(0, 212, 255, 0.5); }
}

@keyframes slideIn {
    from {
        transform: translateX(100%);
        opacity: 0;
    }
    to {
        transform: translateX(0);
        opacity: 1;
    }
}

@keyframes slideOut {
    from {
        transform: translateX(0);
        opacity: 1;
    }
    to {
        transform: translateX(100%);
        opacity: 0;
    }
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
    background: radial-gradient(circle, rgba(0, 212, 255, 0.35), transparent 70%);
    top: -150px;
    left: -100px;
}

.orb-green {
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(16, 185, 129, 0.3), transparent 70%);
    bottom: -100px;
    right: -100px;
    animation-delay: -7s;
}

.orb-amber {
    width: 350px;
    height: 350px;
    background: radial-gradient(circle, rgba(245, 158, 11, 0.25), transparent 70%);
    top: 60%;
    left: 50%;
    animation-delay: -14s;
}

/* Glass Effect */
.glass {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 28px;
    transition: all 0.4s ease;
}

.glass:hover {
    border-color: rgba(255, 255, 255, 0.15);
}

/* Register Box */
.register-box {
    width: 100%;
    max-width: 460px;
    padding: 44px 40px;
    position: relative;
    z-index: 1;
    animation: fadeInUp 0.8s ease;
}

/* Logo */
.logo-section {
    text-align: center;
    margin-bottom: 32px;
}

.logo-icon {
    width: 70px;
    height: 70px;
    border-radius: 20px;
    background: linear-gradient(135deg, #00d4ff, #10b981);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    animation: glow 3s ease-in-out infinite;
}

.logo-icon i {
    font-size: 32px;
    color: #0a0a0f;
}

.logo-title {
    font-size: 30px;
    font-weight: 800;
    background: linear-gradient(135deg, #00d4ff, #10b981);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 8px;
}

.logo-subtitle {
    color: rgba(255, 255, 255, 0.5);
    font-size: 14px;
}

/* Form Groups */
.input-box {
    margin-bottom: 20px;
}

.input-box label {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 10px;
}

.input-box label i {
    color: #00d4ff;
    font-size: 14px;
}

/* Input Styles */
.input {
    width: 100%;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    color: #ffffff;
    font-size: 15px;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
    outline: none;
}

.input:focus {
    border-color: #00d4ff;
    box-shadow: 0 0 0 4px rgba(0, 212, 255, 0.1);
    background: rgba(255, 255, 255, 0.08);
}

.input::placeholder {
    color: rgba(255, 255, 255, 0.4);
}

/* Two Column Grid */
.two-col {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 16px;
}

@media (max-width: 500px) {
    .two-col {
        grid-template-columns: 1fr;
    }
}

/* Role Selection */
.role-section-label {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 12px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 14px;
}

.role-section-label i {
    color: #00d4ff;
}

.role-container {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
}

@media (max-width: 400px) {
    .role-container {
        grid-template-columns: 1fr;
    }
}

.role-card {
    padding: 18px;
    border-radius: 16px;
    background: rgba(255, 255, 255, 0.04);
    border: 1px solid rgba(255, 255, 255, 0.08);
    cursor: pointer;
    transition: all 0.3s ease;
    text-align: center;
}

.role-card:hover {
    background: rgba(255, 255, 255, 0.06);
    border-color: rgba(255, 255, 255, 0.15);
    transform: translateY(-3px);
}

.role-card.selected {
    border-color: #00d4ff;
    background: linear-gradient(135deg, rgba(0, 212, 255, 0.1), rgba(16, 185, 129, 0.1));
    box-shadow: 0 0 25px rgba(0, 212, 255, 0.2);
}

.role-icon {
    width: 50px;
    height: 50px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 12px;
    font-size: 22px;
    transition: all 0.3s ease;
}

.role-card:first-child .role-icon {
    background: rgba(0, 212, 255, 0.15);
    color: #00d4ff;
}

.role-card:last-child .role-icon {
    background: rgba(16, 185, 129, 0.15);
    color: #10b981;
}

.role-card.selected .role-icon {
    transform: scale(1.1);
}

.role-title {
    font-size: 15px;
    font-weight: 700;
    color: #ffffff;
    margin-bottom: 4px;
}

.role-desc {
    font-size: 12px;
    color: rgba(255, 255, 255, 0.5);
}

/* Divider */
.section-divider {
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
    margin: 24px 0;
}

/* Submit Button */
.btn {
    width: 100%;
    padding: 16px 32px;
    background: linear-gradient(135deg, #00d4ff, #00a8cc);
    border: none;
    border-radius: 16px;
    color: #0a0a0f;
    font-size: 16px;
    font-weight: 700;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    margin-top: 8px;
}

.btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(0, 212, 255, 0.35);
}

.btn i {
    font-size: 18px;
}

/* Extra Links */
.extra {
    text-align: center;
    margin-top: 24px;
}

.extra p {
    color: rgba(255, 255, 255, 0.6);
    font-size: 14px;
}

.extra a {
    color: #00d4ff;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.3s ease;
}

.extra a:hover {
    text-decoration: underline;
    text-shadow: 0 0 10px rgba(0, 212, 255, 0.5);
}

/* Toast */
.custom-toast {
    position: fixed;
    top: 24px;
    right: 24px;
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 16px 24px;
    background: rgba(239, 68, 68, 0.15);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(239, 68, 68, 0.3);
    border-radius: 14px;
    color: #ef4444;
    font-weight: 500;
    font-size: 14px;
    z-index: 9999;
    animation: slideIn 0.4s ease;
}

.custom-toast i {
    font-size: 18px;
}

.toast-close {
    margin-left: 8px;
    cursor: pointer;
    opacity: 0.7;
    transition: opacity 0.3s;
}

.toast-close:hover {
    opacity: 1;
}

/* Responsive */
@media (max-width: 480px) {
    .register-box {
        padding: 32px 24px;
    }
    
    .logo-title {
        font-size: 26px;
    }
    
    .logo-icon {
        width: 60px;
        height: 60px;
    }
    
    .logo-icon i {
        font-size: 26px;
    }
}
</style>
</head>

<body>

<!-- Toast Message -->
<c:if test="${not empty msg}">
    <div id="msgBox" class="custom-toast">
        <i class="bi bi-exclamation-triangle-fill"></i>
        <span>${msg}</span>
        <i class="bi bi-x toast-close" onclick="closeToast()"></i>
    </div>
    <% session.removeAttribute("msg"); %>
</c:if>

<!-- Animated Background Orbs -->
<div class="orb-container">
    <div class="orb orb-cyan"></div>
    <div class="orb orb-green"></div>
    <div class="orb orb-amber"></div>
</div>

<!-- Register Box -->
<div class="register-box glass">

    <!-- Logo Section -->
    <div class="logo-section">
        <div class="logo-icon">
            <i class="bi bi-briefcase-fill"></i>
        </div>
        <h1 class="logo-title">Career Link</h1>
        <p class="logo-subtitle">Create your account to get started</p>
    </div>

    <!-- Register Form -->
    <form action="regsubmit" method="post">

        <!-- Full Name -->
        <div class="input-box">
            <label>
                <i class="bi bi-person"></i>
                Full Name
            </label>
            <input type="text" class="input" name="fullname" placeholder="Enter your full name" required>
        </div>

        <!-- Email -->
        <div class="input-box">
            <label>
                <i class="bi bi-envelope"></i>
                Email
            </label>
            <input type="email" class="input" name="email" placeholder="Enter your email" required>
        </div>

        <!-- Password & Confirm Password -->
        <div class="two-col">
            <div class="input-box">
                <label>
                    <i class="bi bi-lock"></i>
                    Password
                </label>
                <input type="password" class="input" name="password" placeholder="Create password" required>
            </div>

            <div class="input-box">
                <label>
                    <i class="bi bi-shield-lock"></i>
                    Confirm
                </label>
                <input type="password" class="input" name="cpassword" placeholder="Confirm password" required>
            </div>
        </div>

        <div class="section-divider"></div>

        <!-- Role Selection -->
        <div class="input-box">
            <div class="role-section-label">
                <i class="bi bi-person-badge"></i>
                I am a...
            </div>

            <div class="role-container">
                <!-- Job Seeker -->
                <div class="role-card selected" onclick="selectRole('Job Seeker', this)">
                    <div class="role-icon">
                        <i class="bi bi-person-fill"></i>
                    </div>
                    <div class="role-title">Job Seeker</div>
                    <div class="role-desc">Looking for a job</div>
                </div>

                <!-- Recruiter -->
                <div class="role-card" onclick="selectRole('Employer', this)">
                    <div class="role-icon">
                        <i class="bi bi-briefcase-fill"></i>
                    </div>
                    <div class="role-title">Recruiter</div>
                    <div class="role-desc">Hiring talent</div>
                </div>
            </div>

            <!-- Hidden Input -->
            <input type="hidden" name="role" id="roleInput" value="Job Seeker">
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn">
            <i class="bi bi-person-plus-fill"></i>
            Create Account
        </button>

    </form>

    <!-- Login Link -->
    <div class="extra">
        <p>Already have an account? <a href="login">Sign In</a></p>
    </div>

</div>

<script>
// Role Selection
function selectRole(role, element) {
    document.querySelectorAll('.role-card').forEach(card => {
        card.classList.remove('selected');
    });
    element.classList.add('selected');
    document.getElementById("roleInput").value = role;
}

// Auto-hide toast after 3 seconds
setTimeout(() => {
    closeToast();
}, 3000);

function closeToast() {
    let box = document.getElementById("msgBox");
    if (box) {
        box.style.animation = "slideOut 0.4s ease forwards";
        setTimeout(() => box.remove(), 400);
    }
}
</script>

</body>
</html>