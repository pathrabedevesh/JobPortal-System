<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Career Link - Login</title>

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
    overflow: hidden;
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
    top: 50%;
    left: 60%;
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
    transform: translateY(-4px);
}

/* Login Box */
.login-box {
    width: 100%;
    max-width: 420px;
    padding: 48px 40px;
    position: relative;
    z-index: 1;
    animation: fadeInUp 0.8s ease;
}

/* Logo */
.logo-section {
    text-align: center;
    margin-bottom: 36px;
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
    font-size: 32px;
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
    margin-bottom: 24px;
}

.input-box label {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 13px;
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
    padding: 16px 20px;
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

/* Submit Button */
.btn {
    width: 100%;
    padding: 18px 32px;
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

/* Divider */
.divider {
    display: flex;
    align-items: center;
    margin: 28px 0;
    gap: 16px;
}

.divider-line {
    flex: 1;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
}

.divider-text {
    color: rgba(255, 255, 255, 0.4);
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.1em;
}

/* Extra Links */
.extra {
    text-align: center;
    margin-top: 24px;
}

.extra p {
    color: rgba(255, 255, 255, 0.6);
    font-size: 14px;
    margin-bottom: 12px;
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

.forgot-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: rgba(255, 255, 255, 0.5);
    font-size: 13px;
    text-decoration: none;
    transition: all 0.3s ease;
}

.forgot-link:hover {
    color: #f59e0b;
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
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(245, 158, 11, 0.3);
    border-radius: 14px;
    color: #f59e0b;
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
    .login-box {
        margin: 20px;
        padding: 36px 24px;
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

<!-- Login Box -->
<div class="login-box glass">

    <!-- Logo Section -->
    <div class="logo-section">
        <div class="logo-icon">
            <i class="bi bi-briefcase-fill"></i>
        </div>
        <h1 class="logo-title">Career Link</h1>
        <p class="logo-subtitle">Sign in to continue to your account</p>
    </div>

    <!-- Login Form -->
    <form action="submitlogin" method="post">

        <div class="input-box">
            <label>
                <i class="bi bi-envelope"></i>
                Email
            </label>
            <input type="email" class="input" name="email" placeholder="Enter your email" required>
        </div>

        <div class="input-box">
            <label>
                <i class="bi bi-lock"></i>
                Password
            </label>
            <input type="password" class="input" name="password" placeholder="Enter your password" required>
        </div>

        <div style="text-align: right; margin-bottom: 8px;">
            <a href="forgotPassword" class="forgot-link">
                <i class="bi bi-key"></i>
                Forgot Password?
            </a>
        </div>

        <button type="submit" class="btn">
            <i class="bi bi-box-arrow-in-right"></i>
            Sign In
        </button>

    </form>

    <!-- Divider -->
    <div class="divider">
        <div class="divider-line"></div>
        <span class="divider-text">or</span>
        <div class="divider-line"></div>
    </div>

    <!-- Register Link -->
    <div class="extra">
        <p>Don't have an account? <a href="registration">Create Account</a></p>
    </div>

</div>

<script>
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