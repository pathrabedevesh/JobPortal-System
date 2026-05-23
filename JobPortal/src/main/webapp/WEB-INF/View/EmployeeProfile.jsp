<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<html>
<head>
<meta charset="UTF-8">
<title>Recruiter Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: 'Inter', sans-serif;
    background: #0a0f1a;
    min-height: 100vh;
    position: relative;
    overflow-x: hidden;
}
/* Animated Background Orbs */
.bg-orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.5;
    z-index: 0;
    animation: float 8s ease-in-out infinite;
}
.bg-orb-1 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #00d4ff, #0099cc);
    top: -100px;
    right: -100px;
    animation-delay: 0s;
}
.bg-orb-2 {
    width: 350px;
    height: 350px;
    background: linear-gradient(135deg, #00ffaa, #00cc88);
    bottom: -80px;
    left: -80px;
    animation-delay: -3s;
}
.bg-orb-3 {
    width: 250px;
    height: 250px;
    background: linear-gradient(135deg, #6366f1, #8b5cf6);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation-delay: -5s;
}
@keyframes float {
    0%, 100% { transform: translateY(0) scale(1); }
    50% { transform: translateY(-30px) scale(1.05); }
}
/* Container */
.wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 40px 20px;
    position: relative;
    z-index: 1;
}
/* Card */
.profile-box {
    width: 100%;
    max-width: 580px;
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    padding: 0;
    border-radius: 24px;
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
    overflow: hidden;
    animation: slideUp 0.6s ease-out;
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
/* Card Header */
.card-header {
    background: linear-gradient(135deg, rgba(0, 212, 255, 0.15), rgba(0, 255, 170, 0.1));
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
    padding: 30px 40px;
    text-align: center;
}
.header-icon {
    width: 70px;
    height: 70px;
    background: linear-gradient(135deg, #00d4ff, #00ffaa);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    box-shadow: 0 10px 30px rgba(0, 212, 255, 0.3);
}
.header-icon svg {
    width: 36px;
    height: 36px;
    color: #0a0f1a;
}
.profile-box h2 {
    color: #ffffff;
    font-size: 26px;
    font-weight: 700;
    margin-bottom: 8px;
}
.profile-box .subtitle {
    color: rgba(255, 255, 255, 0.5);
    font-size: 14px;
}
/* Form Content */
.form-content {
    padding: 35px 40px 40px;
}
/* Input Box */
.input-box {
    margin-bottom: 22px;
}
.input-box label {
    display: block;
    font-size: 13px;
    font-weight: 500;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 8px;
    letter-spacing: 0.3px;
}
.input-box input,
.input-box textarea,
.input-box select {
    width: 100%;
    padding: 14px 18px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 12px;
    color: #ffffff;
    font-size: 15px;
    font-family: 'Inter', sans-serif;
    outline: none;
    transition: all 0.3s ease;
}
.input-box input:focus,
.input-box textarea:focus,
.input-box select:focus {
    border-color: #00d4ff;
    background: rgba(0, 212, 255, 0.05);
    box-shadow: 0 0 0 3px rgba(0, 212, 255, 0.1);
}
.input-box input::placeholder,
.input-box textarea::placeholder {
    color: rgba(255, 255, 255, 0.3);
}
.input-box input[readonly] {
    background: rgba(255, 255, 255, 0.02);
    color: rgba(255, 255, 255, 0.5);
    cursor: not-allowed;
}
/* Textarea */
textarea {
    resize: none;
    min-height: 100px;
}
/* Select */
select {
    background: rgba(255, 255, 255, 0.05);
    cursor: pointer;
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='rgba(255,255,255,0.5)' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 18px;
    padding-right: 45px;
}
select option {
    background: #1a1f2e;
    color: #ffffff;
    padding: 10px;
}
/* Button */
.btn {
    width: 100%;
    margin-top: 10px;
    padding: 16px 30px;
    border: none;
    border-radius: 14px;
    background: linear-gradient(135deg, #00d4ff, #00ffaa);
    color: #0a0f1a;
    font-size: 16px;
    font-weight: 600;
    font-family: 'Inter', sans-serif;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    box-shadow: 0 10px 30px rgba(0, 212, 255, 0.3);
}
.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 15px 40px rgba(0, 212, 255, 0.4);
}
.btn:active {
    transform: translateY(0);
}
.btn svg {
    width: 20px;
    height: 20px;
}
/* Input Icons */
.input-with-icon {
    position: relative;
}
.input-with-icon .icon {
    position: absolute;
    left: 16px;
    top: 50%;
    transform: translateY(-50%);
    width: 18px;
    height: 18px;
    color: rgba(255, 255, 255, 0.4);
    pointer-events: none;
}
.input-with-icon input,
.input-with-icon select {
    padding-left: 48px;
}
/* Responsive */
@media (max-width: 600px) {
    .profile-box {
        border-radius: 20px;
    }
    
    .card-header {
        padding: 25px 25px;
    }
    
    .form-content {
        padding: 25px 25px 30px;
    }
    
    .profile-box h2 {
        font-size: 22px;
    }
}
</style>
</head>
<body>
<div class="bg-orb bg-orb-1"></div>
<div class="bg-orb bg-orb-2"></div>
<div class="bg-orb bg-orb-3"></div>
<div class="wrapper">
<div class="profile-box">
    <div class="card-header">
        <div class="header-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                <polyline points="9 22 9 12 15 12 15 22"></polyline>
            </svg>
        </div>
        <h2>Create Recruiter Profile</h2>
        <p class="subtitle">Set up your company details to start hiring</p>
    </div>
    <div class="form-content">
        <form action="saveRecruiterProfile" method="post">
            <div class="input-box">
                <label>Company Name</label>
                <div class="input-with-icon">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                        <polyline points="9 22 9 12 15 12 15 22"></polyline>
                    </svg>
                    <input type="text" name="company" placeholder="Enter company name" required>
                </div>
            </div>
            <div class="input-box">
                <label>HR Name</label>
                <div class="input-with-icon">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                        <circle cx="12" cy="7" r="4"></circle>
                    </svg>
                    <input type="text" name="hrname" value="${user.fullname}" readonly>
                </div>
            </div>
            <div class="input-box">
                <label>Email</label>
                <div class="input-with-icon">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                        <polyline points="22,6 12,13 2,6"></polyline>
                    </svg>
                    <input type="email" name="email" value="${user.email}" readonly>
                </div>
            </div>
            <div class="input-box">
                <label>Phone</label>
                <div class="input-with-icon">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                    </svg>
                    <input type="text" name="phone" placeholder="Enter phone number" required>
                </div>
            </div>
            <div class="input-box">
                <label>Location</label>
                <div class="input-with-icon">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                        <circle cx="12" cy="10" r="3"></circle>
                    </svg>
                    <select name="location">
                        <option value="Pune">Pune</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value="Delhi">Delhi</option>
                    </select>
                </div>
            </div>
            <div class="input-box">
                <label>About Company</label>
                <textarea name="about" rows="4" placeholder="Write about your company, culture, and what makes it great..."></textarea>
            </div>
            <button type="submit" class="btn">
                Save & Continue
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="5" y1="12" x2="19" y2="12"></line>
                    <polyline points="12 5 19 12 12 19"></polyline>
                </svg>
            </button>
        </form>
    </div>
</div>
</div>
</body>
</html>