<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Apply Job</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: 'Inter', sans-serif;
    background: linear-gradient(135deg, #0a0a1a 0%, #1a1a3e 50%, #0f0f2d 100%);
    color: #f0f0f0;
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
    pointer-events: none;
    z-index: 0;
}
.bg-orb-1 {
    width: 500px;
    height: 500px;
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    top: -150px;
    right: -100px;
    animation: float1 8s ease-in-out infinite;
}
.bg-orb-2 {
    width: 400px;
    height: 400px;
    background: linear-gradient(135deg, #10b981, #059669);
    bottom: -100px;
    left: -100px;
    animation: float2 10s ease-in-out infinite;
}
.bg-orb-3 {
    width: 300px;
    height: 300px;
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: float3 12s ease-in-out infinite;
}
@keyframes float1 {
    0%, 100% { transform: translate(0, 0) scale(1); }
    50% { transform: translate(-30px, 30px) scale(1.1); }
}
@keyframes float2 {
    0%, 100% { transform: translate(0, 0) scale(1); }
    50% { transform: translate(40px, -20px) scale(1.05); }
}
@keyframes float3 {
    0%, 100% { transform: translate(-50%, -50%) scale(1); }
    50% { transform: translate(-50%, -50%) scale(1.15); }
}
/* Main Container */
.main-container {
    position: relative;
    z-index: 1;
    padding: 60px 20px;
}
/* Back Button */
.back-link {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #94a3b8;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 30px;
    transition: all 0.3s ease;
    padding: 10px 20px;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 50px;
    border: 1px solid rgba(255, 255, 255, 0.1);
}
.back-link:hover {
    color: #00eaff;
    background: rgba(0, 234, 255, 0.1);
    border-color: rgba(0, 234, 255, 0.3);
    transform: translateX(-5px);
}
/* Page Header */
.page-header {
    text-align: center;
    margin-bottom: 50px;
}
.page-header h1 {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 10px;
    background: linear-gradient(135deg, #ffffff 0%, #00eaff 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}
.page-header p {
    color: #94a3b8;
    font-size: 1.1rem;
}
/* Job Info Card */
.job-card {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 24px;
    padding: 35px;
    margin-bottom: 30px;
    position: relative;
    overflow: hidden;
    transition: all 0.4s ease;
}
.job-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, #06b6d4, #10b981, #3b82f6);
}
.job-card:hover {
    transform: translateY(-5px);
    border-color: rgba(0, 234, 255, 0.2);
    box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
}
.job-title {
    font-size: 1.8rem;
    font-weight: 700;
    color: #ffffff;
    margin-bottom: 12px;
}
.job-company {
    display: flex;
    align-items: center;
    gap: 10px;
    color: #00eaff;
    font-size: 1.1rem;
    font-weight: 500;
    margin-bottom: 20px;
}
.job-company i {
    font-size: 1.2rem;
}
/* Job Badges */
.job-badges {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-bottom: 20px;
}
.job-badge {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 10px 18px;
    border-radius: 50px;
    font-size: 13px;
    font-weight: 600;
    border: none;
}
.badge-type {
    background: linear-gradient(135deg, rgba(6, 182, 212, 0.2), rgba(6, 182, 212, 0.1));
    color: #22d3ee;
    border: 1px solid rgba(6, 182, 212, 0.3);
}
.badge-salary {
    background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(16, 185, 129, 0.1));
    color: #34d399;
    border: 1px solid rgba(16, 185, 129, 0.3);
}
.badge-location {
    background: linear-gradient(135deg, rgba(148, 163, 184, 0.2), rgba(148, 163, 184, 0.1));
    color: #cbd5e1;
    border: 1px solid rgba(148, 163, 184, 0.3);
}
.job-posted {
    display: flex;
    align-items: center;
    gap: 8px;
    color: #64748b;
    font-size: 14px;
}
/* Apply Form Card */
.form-card {
    background: rgba(255, 255, 255, 0.03);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 24px;
    padding: 40px;
    position: relative;
    overflow: hidden;
}
.form-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 4px;
    background: linear-gradient(90deg, #3b82f6, #06b6d4);
}
.form-header {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 30px;
    padding-bottom: 20px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
}
.form-header-icon {
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.3rem;
    color: white;
}
.form-header h5 {
    font-size: 1.4rem;
    font-weight: 600;
    color: #ffffff;
    margin: 0;
}
/* Form Fields */
.form-group {
    margin-bottom: 24px;
}
.form-label {
    display: block;
    color: #94a3b8;
    font-size: 14px;
    font-weight: 500;
    margin-bottom: 10px;
    letter-spacing: 0.5px;
}
.form-control {
    width: 100%;
    padding: 16px 20px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 14px;
    color: #ffffff;
    font-size: 15px;
    font-family: 'Inter', sans-serif;
    transition: all 0.3s ease;
}
.form-control:focus {
    outline: none;
    border-color: #06b6d4;
    background: rgba(6, 182, 212, 0.05);
    box-shadow: 0 0 0 4px rgba(6, 182, 212, 0.1);
}
.form-control::placeholder {
    color: #64748b;
}
.form-control[readonly] {
    background: rgba(255, 255, 255, 0.02);
    color: #94a3b8;
    cursor: not-allowed;
}
textarea.form-control {
    resize: vertical;
    min-height: 120px;
}
/* File Input */
.file-input-wrapper {
    position: relative;
}
.file-input-wrapper input[type="file"] {
    position: absolute;
    width: 100%;
    height: 100%;
    opacity: 0;
    cursor: pointer;
    z-index: 2;
}
.file-input-display {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    padding: 30px;
    background: rgba(255, 255, 255, 0.03);
    border: 2px dashed rgba(255, 255, 255, 0.15);
    border-radius: 14px;
    color: #94a3b8;
    font-size: 15px;
    transition: all 0.3s ease;
}
.file-input-wrapper:hover .file-input-display {
    border-color: #06b6d4;
    background: rgba(6, 182, 212, 0.05);
    color: #06b6d4;
}
.file-icon {
    font-size: 2rem;
    color: #06b6d4;
}
/* Form Actions */
.form-actions {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 35px;
    padding-top: 25px;
    border-top: 1px solid rgba(255, 255, 255, 0.08);
}
.btn-back {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 14px 28px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.15);
    border-radius: 50px;
    color: #94a3b8;
    font-size: 15px;
    font-weight: 500;
    text-decoration: none;
    transition: all 0.3s ease;
}
.btn-back:hover {
    background: rgba(255, 255, 255, 0.1);
    color: #ffffff;
    transform: translateX(-5px);
}
.btn-submit {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 16px 35px;
    background: linear-gradient(135deg, #06b6d4, #3b82f6);
    border: none;
    border-radius: 50px;
    color: #ffffff;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 10px 30px rgba(6, 182, 212, 0.3);
}
.btn-submit:hover {
    transform: translateY(-3px);
    box-shadow: 0 15px 40px rgba(6, 182, 212, 0.4);
}
.btn-submit i {
    transition: transform 0.3s ease;
}
.btn-submit:hover i {
    transform: translateX(5px);
}
/* Grid Layout */
.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}
.form-grid-full {
    grid-column: 1 / -1;
}
/* Responsive */
@media (max-width: 768px) {
    .form-grid {
        grid-template-columns: 1fr;
    }
    
    .page-header h1 {
        font-size: 1.8rem;
    }
    
    .job-card, .form-card {
        padding: 25px;
    }
    
    .form-actions {
        flex-direction: column;
        gap: 15px;
    }
    
    .btn-back, .btn-submit {
        width: 100%;
        justify-content: center;
    }
}
</style>
</head>
<body>
    <!-- Background Orbs -->
    <div class="bg-orb bg-orb-1"></div>
    <div class="bg-orb bg-orb-2"></div>
    <div class="bg-orb bg-orb-3"></div>
    <div class="main-container">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <!-- Back Link -->
                    <a href="jobDetails?jobId=${job.id}" class="back-link">
                        <i class="bi bi-arrow-left"></i> Back to Job Details
                    </a>
                    <!-- Page Header -->
                    <div class="page-header">
                        <h1>Apply for Position</h1>
                        <p>Fill in your details and submit your application</p>
                    </div>
                    <!-- JOB INFO CARD -->
                    <div class="job-card">
                        <h3 class="job-title">${job.title}</h3>
                        
                        <div class="job-company">
                            <i class="bi bi-building"></i>
                            <span>${job.company}</span>
                        </div>
                        <div class="job-badges">
                            <span class="job-badge badge-type">
                                <i class="bi bi-briefcase"></i> ${job.type}
                            </span>
                            <span class="job-badge badge-salary">
                                <i class="bi bi-currency-rupee"></i> ${job.salary} LPA
                            </span>
                            <span class="job-badge badge-location">
                                <i class="bi bi-geo-alt"></i> ${job.location}
                            </span>
                        </div>
                        <div class="job-posted">
                            <i class="bi bi-clock"></i>
                            <span>Posted: ${job.postDate}</span>
                        </div>
                    </div>
                    <!-- APPLY FORM CARD -->
                    <div class="form-card">
                        <div class="form-header">
                            <div class="form-header-icon">
                                <i class="bi bi-send"></i>
                            </div>
                            <h5>Application Form</h5>
                        </div>
                        <form action="submitApplication" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="job_id" value="${job.id}">
                            <div class="form-grid">
                                <div class="form-group">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" class="form-control" value="${user.fullname}" readonly>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Email Address</label>
                                    <input type="email" class="form-control" value="${user.email}" readonly>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Phone Number</label>
                                    <input type="text" class="form-control" name="phone" value="${user.phone}" required placeholder="Enter your phone number">
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Location</label>
                                    <input type="text" class="form-control" value="${user.location}" readonly>
                                </div>
                                <div class="form-group form-grid-full">
                                    <label class="form-label">Skills</label>
                                    <input type="text" class="form-control" value="${user.skills}" readonly>
                                </div>
                                <div class="form-group form-grid-full">
                                    <label class="form-label">Experience</label>
                                    <input type="text" class="form-control" value="${user.experience}" readonly>
                                </div>
                                <div class="form-group form-grid-full">
                                    <label class="form-label">About You</label>
                                    <textarea class="form-control" rows="4" name="about" placeholder="Tell us about yourself...">${user.about}</textarea>
                                </div>
                                <div class="form-group form-grid-full">
                                    <label class="form-label">Upload Resume (PDF)</label>
                                    <div class="file-input-wrapper">
                                        <input type="file" name="resumeFile" required accept=".pdf">
                                        <div class="file-input-display">
                                            <i class="bi bi-cloud-upload file-icon"></i>
                                            <span>Drag & drop your resume or click to browse</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <a href="jobDetails?jobId=${job.id}" class="btn-back">
                                    <i class="bi bi-arrow-left"></i> Back
                                </a>
                                <button type="submit" class="btn-submit">
                                    <span>Submit Application</span>
                                    <i class="bi bi-arrow-right"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>