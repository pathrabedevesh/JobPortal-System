<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Career Link</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
	rel="stylesheet">
<!-- PARTICLE JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/particles.js"></script>
<script>
function closeToast(){
    document.getElementById("toastMsg").style.display = "none";
}
// auto hide after 3 sec
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
#toastMsg {
	z-index: 99999 !important;
}
body {
	font-family: 'Inter', sans-serif;
	background: #0a0f1a;
	color: white;
	overflow-x: hidden;
	min-height: 100vh;
}
/* GRADIENT ORBS */
.orb {
    position: fixed;
    border-radius: 50%;
    filter: blur(80px);
    opacity: 0.4;
    z-index: -1;
    animation: float 8s ease-in-out infinite;
}
.orb-1 {
    width: 500px;
    height: 500px;
    background: linear-gradient(135deg, #00eaff, #0099ff);
    top: -150px;
    left: -100px;
}
.orb-2 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #00ffae, #00d4aa);
    bottom: -100px;
    right: -100px;
    animation-delay: -4s;
}
.orb-3 {
    width: 300px;
    height: 300px;
    background: linear-gradient(135deg, #6366f1, #8b5cf6);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    opacity: 0.2;
    animation-delay: -2s;
}
@keyframes float {
    0%, 100% { transform: translateY(0) scale(1); }
    50% { transform: translateY(-30px) scale(1.05); }
}
/* PARTICLE BACKGROUND */
#particles-js {
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: -1;
}
/* NAVBAR */
header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px 80px;
	background: rgba(10, 15, 26, 0.8);
	backdrop-filter: blur(20px);
	border-bottom: 1px solid rgba(255, 255, 255, 0.06);
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
}
/* LOGO */
.logo {
	display: flex;
	align-items: center;
	gap: 14px;
}
.logo img {
	width: 48px;
	height: 48px;
	border-radius: 12px;
}
.logo-icon {
    width: 48px;
    height: 48px;
    background: linear-gradient(135deg, #00eaff, #00ffae);
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    box-shadow: 0 8px 32px rgba(0, 234, 255, 0.3);
}
.logo h2 {
	font-weight: 700;
	font-size: 24px;
	background: linear-gradient(135deg, #fff, #94a3b8);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	letter-spacing: -0.5px;
}
/* NAV LINKS */
nav {
    display: flex;
    align-items: center;
    gap: 8px;
}
nav a {
	text-decoration: none;
	color: #94a3b8;
	padding: 10px 20px;
	border-radius: 10px;
	transition: all 0.3s ease;
	font-weight: 500;
	font-size: 15px;
}
nav a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.06);
}
nav a.nav-cta {
    background: linear-gradient(135deg, #00eaff, #00ffae);
    color: #0a0f1a;
    font-weight: 600;
    padding: 10px 24px;
}
nav a.nav-cta:hover {
    box-shadow: 0 8px 32px rgba(0, 234, 255, 0.4);
    transform: translateY(-2px);
}
/* HERO */
.hero {
	text-align: center;
	padding-top: 200px;
	padding-bottom: 80px;
	position: relative;
}
.hero-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 8px 18px;
    background: rgba(0, 234, 255, 0.1);
    border: 1px solid rgba(0, 234, 255, 0.2);
    border-radius: 50px;
    font-size: 14px;
    color: #00eaff;
    margin-bottom: 32px;
    font-weight: 500;
}
.hero h1 {
	font-size: 64px;
	font-weight: 700;
	line-height: 1.1;
	margin-bottom: 24px;
	letter-spacing: -2px;
}
.hero h1 .gradient-text {
    background: linear-gradient(135deg, #00eaff, #00ffae);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
.hero h1 .white-text {
    color: #fff;
}
/* TYPING */
.typing {
	font-size: 22px;
	color: #94a3b8;
	min-height: 34px;
	font-weight: 400;
}
.typing-cursor {
    animation: blink 1s infinite;
}
@keyframes blink {
    0%, 50% { opacity: 1; }
    51%, 100% { opacity: 0; }
}
/* BUTTONS */
.btn-group {
    display: flex;
    justify-content: center;
    gap: 16px;
    margin-top: 48px;
}
.btn {
	padding: 16px 36px;
	background: linear-gradient(135deg, #00eaff, #00ffae);
	color: #0a0f1a;
	border: none;
	border-radius: 14px;
	cursor: pointer;
	transition: all 0.4s ease;
	font-weight: 600;
	font-size: 16px;
	text-decoration: none;
	display: inline-flex;
	align-items: center;
	gap: 10px;
}
.btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 20px 40px rgba(0, 234, 255, 0.35);
}
.btn-secondary {
    background: rgba(255, 255, 255, 0.06);
    color: #fff;
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.btn-secondary:hover {
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}
/* CARDS */
.cards {
	display: flex;
	justify-content: center;
	padding: 40px 80px 100px;
	gap: 28px;
	flex-wrap: wrap;
}
.card {
	width: 320px;
}
/* GLASS CARD */
.card a {
	display: flex;
	flex-direction: column;
	text-decoration: none;
	color: white;
	padding: 32px;
	border-radius: 24px;
	background: rgba(255, 255, 255, 0.03);
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, 0.06);
	transition: all 0.4s ease;
	height: 100%;
}
.card-icon {
    width: 56px;
    height: 56px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 26px;
    margin-bottom: 20px;
}
.card:nth-child(1) .card-icon {
    background: linear-gradient(135deg, rgba(0, 234, 255, 0.2), rgba(0, 234, 255, 0.05));
    border: 1px solid rgba(0, 234, 255, 0.2);
}
.card:nth-child(2) .card-icon {
    background: linear-gradient(135deg, rgba(0, 255, 174, 0.2), rgba(0, 255, 174, 0.05));
    border: 1px solid rgba(0, 255, 174, 0.2);
}
.card:nth-child(3) .card-icon {
    background: linear-gradient(135deg, rgba(139, 92, 246, 0.2), rgba(139, 92, 246, 0.05));
    border: 1px solid rgba(139, 92, 246, 0.2);
}
.card h3 {
    font-size: 22px;
    font-weight: 600;
    margin-bottom: 12px;
    letter-spacing: -0.5px;
}
.card p {
    color: #64748b;
    font-size: 15px;
    line-height: 1.6;
    margin-bottom: 20px;
}
.card-arrow {
    display: flex;
    align-items: center;
    gap: 8px;
    color: #00eaff;
    font-size: 14px;
    font-weight: 500;
    margin-top: auto;
    opacity: 0;
    transform: translateX(-10px);
    transition: all 0.3s ease;
}
/* HOVER */
.card a:hover {
	transform: translateY(-8px);
	border-color: rgba(0, 234, 255, 0.3);
	background: rgba(255, 255, 255, 0.05);
	box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(0, 234, 255, 0.1);
}
.card a:hover .card-arrow {
    opacity: 1;
    transform: translateX(0);
}
/* FOOTER */
footer {
	text-align: center;
	padding: 32px 80px;
	background: rgba(10, 15, 26, 0.9);
	backdrop-filter: blur(20px);
	border-top: 1px solid rgba(255, 255, 255, 0.06);
	color: #64748b;
	display: flex;
	justify-content: space-between;
	align-items: center;
	font-size: 14px;
}
footer a {
    color: #00eaff;
    text-decoration: none;
    transition: color 0.3s ease;
}
footer a:hover {
    color: #00ffae;
}
/* RESPONSIVE */
@media (max-width: 900px) {
    header {
        padding: 16px 24px;
    }
    
    .hero h1 {
        font-size: 42px;
    }
    
    .cards {
        padding: 40px 24px;
    }
    
    footer {
        flex-direction: column;
        gap: 12px;
        padding: 24px;
    }
}
@media (max-width: 600px) {
    nav a:not(.nav-cta) {
        display: none;
    }
    
    .hero h1 {
        font-size: 32px;
        padding: 0 20px;
    }
    
    .typing {
        font-size: 18px;
        padding: 0 20px;
    }
    
    .btn-group {
        flex-direction: column;
        padding: 0 40px;
    }
    
    .card {
        width: 100%;
        max-width: 340px;
    }
}
</style>
</head>
<body>
	<c:if test="${not empty msg}">
		<div id="toastMsg" class="alert alert-success position-fixed top-0 end-0 m-4" style="background: linear-gradient(135deg, #00eaff, #00ffae); color: #0a0f1a; padding: 16px 24px; border-radius: 12px; font-weight: 500;">
			${msg}
			<button onclick="closeToast()" style="background: none; border: none; margin-left: 12px; cursor: pointer; font-size: 18px;">&times;</button>
		</div>
	</c:if>
	
	<!-- GRADIENT ORBS -->
	<div class="orb orb-1"></div>
	<div class="orb orb-2"></div>
	<div class="orb orb-3"></div>
	
	<!-- PARTICLES -->
	<div id="particles-js"></div>
	<header>
		<div class="logo">
			<div class="logo-icon">C</div>
			<h2>Career Link</h2>
		</div>
		<nav>
			<a href="">Home</a>
			<a href="login">Jobs</a>
			<a href="login">Login</a>
			<a href="registration" class="nav-cta">Register</a>
		</nav>
	</header>
	<div class="hero">
	    <div class="hero-badge">
	        <span>New</span> Discover Amazing Opportunities
	    </div>
		<h1>
		    <span class="white-text">Welcome to</span><br>
		    <span class="gradient-text">Career Link</span>
		</h1>
		<div class="typing" id="typing"></div>
        <div class="btn-group">
		    <a href="login" class="btn">
			    Explore Jobs
			    <span>&#8594;</span>
		    </a>
		    <a href="registration" class="btn btn-secondary">
		        Create Account
		    </a>
		</div>
	</div>
	<div class="cards">
		<div class="card">
			<a href="registration">
			    <div class="card-icon">&#128188;</div>
				<h3>Find Jobs</h3>
				<p>Browse thousands of job openings from top companies. Filter by location, salary, and experience level.</p>
				<div class="card-arrow">
				    Get Started <span>&#8594;</span>
				</div>
			</a>
		</div>
		<div class="card">
			<a href="login">
			    <div class="card-icon">&#128640;</div>
				<h3>Post Jobs</h3>
				<p>Employers can easily post job openings and reach qualified candidates in minutes.</p>
				<div class="card-arrow">
				    Post Now <span>&#8594;</span>
				</div>
			</a>
		</div>
		<div class="card">
			<a href="registration">
			    <div class="card-icon">&#127775;</div>
				<h3>Get Hired</h3>
				<p>Connect directly with recruiters and land your dream job at leading companies.</p>
				<div class="card-arrow">
				    Join Now <span>&#8594;</span>
				</div>
			</a>
		</div>
	</div>
	<footer>
	    <div>&copy; 2026 Career Link. All rights reserved.</div>
	    <div>
	        <a href="mailto:pathrabedevesh@gmail.com">pathrabedevesh@gmail.com</a>
	    </div>
	</footer>
	<script>
/* TYPING EFFECT */
const text = ["Find Your Dream Job", "Apply Easily", "Get Hired Faster"];
let i = 0, j = 0, current = "", isDeleting = false;
function type() {
    current = text[i];
    if (!isDeleting) {
        document.getElementById("typing").innerHTML = current.substring(0, j++) + '<span class="typing-cursor">|</span>';
    } else {
        document.getElementById("typing").innerHTML = current.substring(0, j--) + '<span class="typing-cursor">|</span>';
    }
    if (j == current.length + 1) {
        isDeleting = true;
        setTimeout(type, 1500);
        return;
    }
    if (j == 0) {
        isDeleting = false;
        i = (i + 1) % text.length;
    }
    setTimeout(type, isDeleting ? 30 : 70);
}
type();
/* PARTICLE CONFIG */
particlesJS("particles-js", {
    "particles": {
        "number": { "value": 60, "density": { "enable": true, "value_area": 800 } },
        "color": { "value": "#00eaff" },
        "shape": { "type": "circle" },
        "opacity": { "value": 0.3, "random": true },
        "size": { "value": 2, "random": true },
        "line_linked": {
            "enable": true,
            "distance": 150,
            "color": "#00eaff",
            "opacity": 0.15,
            "width": 1
        },
        "move": {
            "enable": true,
            "speed": 1.5,
            "direction": "none",
            "random": true,
            "out_mode": "out"
        }
    },
    "interactivity": {
        "detect_on": "canvas",
        "events": {
            "onhover": { "enable": true, "mode": "grab" },
            "onclick": { "enable": true, "mode": "push" }
        },
        "modes": {
            "grab": { "distance": 140, "line_linked": { "opacity": 0.4 } },
            "push": { "particles_nb": 3 }
        }
    },
    "retina_detect": true
});
</script>
</body>
</html>