<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
<head>
<title>Forgot Password</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: 'Inter', sans-serif;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #0a0a0f 0%, #1a1a2e 50%, #0a0a0f 100%);
    overflow: hidden;
    position: relative;
}
/* Animated gradient orbs */
.orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.5;
    animation: float 8s ease-in-out infinite;
    pointer-events: none;
}
.orb-1 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #00eaff, #0080ff);
    top: -100px;
    right: -100px;
    animation-delay: 0s;
}
.orb-2 {
    width: 350px;
    height: 350px;
    background: linear-gradient(135deg, #00ffae, #00d4aa);
    bottom: -80px;
    left: -80px;
    animation-delay: -3s;
}
.orb-3 {
    width: 250px;
    height: 250px;
    background: linear-gradient(135deg, #7c3aed, #a855f7);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation-delay: -5s;
    opacity: 0.3;
}
@keyframes float {
    0%, 100% {
        transform: translate(0, 0) scale(1);
    }
    33% {
        transform: translate(30px, -30px) scale(1.05);
    }
    66% {
        transform: translate(-20px, 20px) scale(0.95);
    }
}
/* Toast notification */
.custom-toast {
    position: fixed;
    top: 24px;
    right: 24px;
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;
    padding: 16px 24px;
    border-radius: 12px;
    box-shadow: 0 10px 40px rgba(239, 68, 68, 0.4);
    z-index: 9999;
    animation: slideIn 0.4s cubic-bezier(0.16, 1, 0.3, 1);
    display: flex;
    align-items: center;
    gap: 12px;
    font-weight: 500;
}
.custom-toast::before {
    content: '';
    width: 20px;
    height: 20px;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='white'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z'%3E%3C/path%3E%3C/svg%3E");
    background-size: contain;
    flex-shrink: 0;
}
@keyframes slideIn {
    from {
        transform: translateX(120%);
        opacity: 0;
    }
    to {
        transform: translateX(0);
        opacity: 1;
    }
}
/* Main card */
.card {
    width: 420px;
    padding: 48px 40px;
    border-radius: 24px;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    box-shadow: 0 25px 80px rgba(0, 0, 0, 0.5);
    position: relative;
    z-index: 10;
    animation: cardAppear 0.6s cubic-bezier(0.16, 1, 0.3, 1);
}
@keyframes cardAppear {
    from {
        opacity: 0;
        transform: translateY(30px) scale(0.95);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}
/* Icon container */
.icon-container {
    width: 80px;
    height: 80px;
    margin: 0 auto 24px;
    border-radius: 20px;
    background: linear-gradient(135deg, rgba(0, 234, 255, 0.15), rgba(0, 255, 174, 0.15));
    border: 1px solid rgba(0, 234, 255, 0.2);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}
.icon-container::before {
    content: '';
    position: absolute;
    inset: -1px;
    border-radius: 20px;
    background: linear-gradient(135deg, #00eaff, #00ffae);
    opacity: 0;
    transition: opacity 0.3s ease;
    z-index: -1;
}
.icon-container:hover::before {
    opacity: 0.1;
}
.icon-container svg {
    width: 40px;
    height: 40px;
    stroke: #00eaff;
}
/* Typography */
.title {
    color: #ffffff;
    font-size: 28px;
    font-weight: 700;
    margin-bottom: 8px;
    text-align: center;
    letter-spacing: -0.5px;
}
.subtitle {
    color: rgba(255, 255, 255, 0.5);
    font-size: 15px;
    text-align: center;
    margin-bottom: 32px;
    line-height: 1.5;
}
/* Form elements */
.input-group {
    position: relative;
    margin-bottom: 24px;
}
.input-group svg {
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    width: 20px;
    height: 20px;
    stroke: rgba(255, 255, 255, 0.4);
    transition: stroke 0.3s ease;
    pointer-events: none;
}
.input-group input {
    width: 100%;
    padding: 16px 16px 16px 52px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    background: rgba(255, 255, 255, 0.05);
    color: #ffffff;
    font-size: 15px;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
    outline: none;
}
.input-group input::placeholder {
    color: rgba(255, 255, 255, 0.4);
}
.input-group input:focus {
    border-color: rgba(0, 234, 255, 0.5);
    background: rgba(0, 234, 255, 0.05);
    box-shadow: 0 0 0 4px rgba(0, 234, 255, 0.1);
}
.input-group input:focus + svg,
.input-group:focus-within svg {
    stroke: #00eaff;
}
/* Submit button */
.btn-submit {
    width: 100%;
    padding: 16px 24px;
    border: none;
    border-radius: 14px;
    background: linear-gradient(135deg, #00eaff, #00d4aa);
    color: #0a0a0f;
    font-size: 16px;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    position: relative;
    overflow: hidden;
}
.btn-submit::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, #00ffae, #00eaff);
    opacity: 0;
    transition: opacity 0.3s ease;
}
.btn-submit:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 30px rgba(0, 234, 255, 0.4);
}
.btn-submit:hover::before {
    opacity: 1;
}
.btn-submit span,
.btn-submit svg {
    position: relative;
    z-index: 1;
}
.btn-submit svg {
    width: 20px;
    height: 20px;
    transition: transform 0.3s ease;
}
.btn-submit:hover svg {
    transform: translateX(4px);
}
/* Back link */
.back-link {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    margin-top: 24px;
    color: rgba(255, 255, 255, 0.5);
    font-size: 14px;
    text-decoration: none;
    transition: color 0.3s ease;
}
.back-link:hover {
    color: #00eaff;
}
.back-link svg {
    width: 16px;
    height: 16px;
    transition: transform 0.3s ease;
}
.back-link:hover svg {
    transform: translateX(-4px);
}
/* Decorative elements */
.glow-line {
    position: absolute;
    top: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 60%;
    height: 1px;
    background: linear-gradient(90deg, transparent, #00eaff, #00ffae, transparent);
    border-radius: 1px;
}
/* Responsive */
@media (max-width: 480px) {
    .card {
        width: calc(100% - 32px);
        margin: 16px;
        padding: 32px 24px;
    }
    
    .title {
        font-size: 24px;
    }
    
    .orb-1, .orb-2 {
        width: 250px;
        height: 250px;
    }
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
    setTimeout(() => {
        let box = document.getElementById("msgBox");
        if(box) {
            box.style.transform = "translateX(120%)";
            box.style.opacity = "0";
            setTimeout(() => box.remove(), 400);
        }
    }, 3000);
});
</script>
</head>
<body>
<!-- Animated orbs -->
<div class="orb orb-1"></div>
<div class="orb orb-2"></div>
<div class="orb orb-3"></div>
<!-- MESSAGE -->
<c:if test="${not empty msg}">
    <div id="msgBox" class="custom-toast">
        ${msg}
    </div>
    <c:remove var="msg"/>
</c:if>
<div class="card">
    <div class="glow-line"></div>
    
    <div class="icon-container">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25a3 3 0 013 3m3 0a6 6 0 01-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1121.75 8.25z" />
        </svg>
    </div>
    <h1 class="title">Forgot Password</h1>
    <p class="subtitle">Enter your registered email address and we'll send your password</p>
    <form action="sendPassword" method="post">
        <div class="input-group">
            <input type="email" name="email" placeholder="Enter your email address" required>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
            </svg>
        </div>
        <button type="submit" class="btn-submit">
            <span>Send Password</span>
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" />
            </svg>
        </button>
    </form>
    <a href="login" class="back-link">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
        </svg>
        Back to Login
    </a>
</div>
</body>
</html>