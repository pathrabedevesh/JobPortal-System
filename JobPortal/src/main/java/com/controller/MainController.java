package com.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.model.ApplicationModel;
import com.model.JobModel;
import com.model.LoginModel;
import com.model.UserModel;
import com.service.ApplicationService;
import com.service.JobService;
import com.service.UserService;

@Controller
public class MainController {
	
	@Autowired
	UserService userservice;
	
	@Autowired
	JobService jobservice;
	
	@Autowired
	ApplicationService applicationservice;
	
	@Autowired
	JavaMailSender mailSender;

	@RequestMapping("login")
	public String loginpage() {
		return "login";
	}
	
	@RequestMapping("registration")
	public String regpage() {
		return "Registration";
	}
	
	@RequestMapping(value = "regsubmit", method = RequestMethod.POST)
	public String savelogin(@ModelAttribute("user") UserModel user, HttpSession session) {
		int res = userservice.SaveUser(user);
		if(res == 0) {
			session.setAttribute("msg", "Success Register ✅");
			user.setProfileStatus("NO");
		    return "login";
		} else {
			session.setAttribute("msg", "Email already registered ❌"); 
		    return "redirect:/registration";
		}
	}
	
	@RequestMapping(value = "submitlogin", method = RequestMethod.POST)
	public String DashboardLogin(@ModelAttribute("lm") LoginModel lm, HttpSession session, RedirectAttributes ra) {

	    List<UserModel> list = userservice.doLogin(lm);

	    if(list != null && list.size() > 0) {

	        UserModel user = list.get(0);

	        session.setAttribute("user", user);

	       
	        if(user.getRole().equalsIgnoreCase("Job Seeker")) {

	            if(user.getProfileStatus() == null || user.getProfileStatus().equals("NO")) {
	            	ra.addFlashAttribute("msg", "Please Complete your profile ✅");
	                return "JobSeekerProfile";
	            } else {
	            	ra.addFlashAttribute("msg", "Login Successful ✅");
	                return "redirect:/viewhandler";
	            }

	        } 
	        
	        
	        else {

	            if(user.getProfileStatus() == null || user.getProfileStatus().equals("NO")) {
	            	ra.addFlashAttribute("msg", "Please Complete your profile ✅");
	            	session.setAttribute("user", user);
	                return "EmployeeProfile";   
	            } else {
	            	ra.addFlashAttribute("msg", "Login Successful ✅");
	                return "redirect:/Employeedashboard"; 
	            }

	        }

	    } else {
	    	ra.addFlashAttribute("msg", "Invalid Email or Password ❌");
	        return "redirect:/login";
	    }
	}
	
	@RequestMapping(value = "saveProfile", method = RequestMethod.POST)
	public String saveProfile(
	        @ModelAttribute UserModel formUser,
	        @RequestParam(value = "skills", required = false) String[] skills,
	        @RequestParam(value = "customSkills", required = false) String customSkills,
	        HttpSession session) throws Exception {

	    UserModel user = (UserModel) session.getAttribute("user");

	    user.setFullname(formUser.getFullname());
	    user.setExperience(formUser.getExperience());
	    user.setLocation(formUser.getLocation());
	    user.setAbout(formUser.getAbout());

	    StringBuilder finalSkills = new StringBuilder();

	    if (skills != null && skills.length > 0) {
	        finalSkills.append(String.join(",", skills));
	    }

	    if (customSkills != null && !customSkills.trim().isEmpty()) {

	        customSkills = customSkills.replaceAll("\\s+", "");

	        if (finalSkills.length() > 0) {
	            finalSkills.append(",");
	        }

	        finalSkills.append(customSkills);
	    }

	    user.setSkills(finalSkills.toString());

	    

	    user.setProfileStatus("YES");
	    session.setAttribute("user", user);

	    userservice.UpdateUser(user);

	    return "redirect:/viewhandler";
	}
	
	@RequestMapping("seekerprofile")
	public String profilepage(HttpSession session) {
		UserModel user = (UserModel) session.getAttribute("user");
		return "SeekerProfileview";
	}
	
	@RequestMapping(value = "saveRecruiterProfile", method = RequestMethod.POST)
	public String saveRecruiterProfile(
	        @ModelAttribute UserModel formUser,
	        HttpSession session, RedirectAttributes ra) {

	    UserModel user = (UserModel) session.getAttribute("user");

	    user.setCompany(formUser.getCompany());
	    user.setHrname(formUser.getHrname());
	    user.setPhone(formUser.getPhone());
	    user.setLocation(formUser.getLocation());
	    user.setAbout(formUser.getAbout());

	    user.setProfileStatus("YES");
	    session.setAttribute("user", user);

	    userservice.UpdateUser(user);
	    ra.addFlashAttribute("msg", "Profile Updated Successful ✅");
	    return "redirect:/Employeedashboard";
	}
	
	@RequestMapping("Employeedashboard")
	public String dashboard(Model model, HttpSession session){

	    UserModel user = (UserModel) session.getAttribute("user");

	    if(user == null){
	        return "redirect:/login";
	    }

	    // Jobs by recruiter
	    List<JobModel> jobs = jobservice.getJobsByUser(user.getId());

	    // 🔥 TOTAL APPLICATION COUNT
	    int totalApplications = 0;

	    for(JobModel job : jobs){
	        List<ApplicationModel> apps = 
	            applicationservice.getApplicationsByJobId(job.getId());

	        totalApplications += apps.size();
	    }

	    model.addAttribute("jobs", jobs);
	    model.addAttribute("count", jobs.size());
	    model.addAttribute("totalApplications", totalApplications); 

	    return "Employeedashboard";
	}
	
	@RequestMapping("JobPostPage")
	public String Jobpost(HttpSession session, Model model) {
			
		UserModel user = (UserModel) session.getAttribute("user");

		if(user == null){
		    return "redirect:/login";
		}
		
		model.addAttribute("companyName", user.getCompany());
		return "Jobpost";	
	}
	
	@RequestMapping(value="saveJob", method=RequestMethod.POST)
	public String saveJob(
	        @ModelAttribute JobModel job,
	        @RequestParam(value = "skills", required = false) String[] skills,
	        @RequestParam(value = "customSkills", required = false) String customSkills,
	        @RequestParam("postDate") String postDate,
	        HttpSession session,
	        RedirectAttributes ra){

	    UserModel user = (UserModel) session.getAttribute("user");

	    
	    

	    job.setUserId(user.getId());

	    
	    StringBuilder finalSkills = new StringBuilder();

	    if (skills != null && skills.length > 0) {
	        finalSkills.append(String.join(",", skills));
	    }

	    if (customSkills != null && !customSkills.trim().isEmpty()) {
	        customSkills = customSkills.replaceAll("\\s+", "");
	        if (finalSkills.length() > 0) {
	            finalSkills.append(",");
	        }
	        finalSkills.append(customSkills);
	    }

	    job.setSkills(finalSkills.toString());

	    jobservice.saveJob(job);
	    
	    session.setAttribute("user", user);
	    ra.addFlashAttribute("msg", "Job Posted Successfully ✅");
	    return "redirect:/Employeedashboard";
	}
	
	@RequestMapping("profileemp")
	public String seeProfile() {
		return "Employeeprofilesee";
	}
	
	@RequestMapping("logout")
	public String logout(RedirectAttributes ra) {
		ra.addFlashAttribute("msg", "Log Out Successful ✅");
		return "redirect:/";
	}
	
	@RequestMapping("Editprofileseeker")
	public String editProfile(){
	    return "SeekerProfileEdit";
	}
	
	

	@RequestMapping("viewhandler")
	public String seekerDashboardshow(Model model, HttpSession session){

	    UserModel user = (UserModel) session.getAttribute("user");

	    List<JobModel> jobs = jobservice.getJobsNotApplied(user.getEmail());

	    System.out.println("Jobs size: " + jobs.size());
	    model.addAttribute("jobs", jobs);

	    return "Seekerdashboard";
	}
	
	@RequestMapping("/viewJob")
	public String viewJob(@RequestParam("jobId") int id, Model model) {

	    JobModel job = null;

	    try {
	        job = jobservice.getJobById(id);
	    } catch (Exception e) {
	        return "redirect:/viewhandler";
	    }

	    model.addAttribute("job", job);
	    return "EmpJobDetailView";
	}
	
	@RequestMapping("/viewApplications")
	public String viewApplications(@RequestParam("jobId") int jobId, Model model) {

	    List<ApplicationModel> apps = applicationservice.getApplicationsByJobId(jobId);

	    model.addAttribute("applications", apps);

	    return "ViewApplication";
	}
	
	@RequestMapping("/jobDetails")
	public String jobDetails(@RequestParam("jobId") int id, Model model) {

	    JobModel job = null;

	    try {
	        job = jobservice.getJobById(id);
	    } catch (Exception e) {
	        return "redirect:/viewhandler";
	    }

	    model.addAttribute("job", job);
	    return "jobDetails";
	}
	@RequestMapping("/applyPage")
	public String applyPage(@RequestParam("jobId") int jobId,
	                        HttpSession session,
	                        Model model) {

	    UserModel user = (UserModel) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    JobModel job = null;

	    try {
	        job = jobservice.getJobById(jobId);
	    } catch (Exception e) {
	        return "redirect:/viewhandler";
	    }

	    model.addAttribute("job", job);
	    model.addAttribute("user", user);

	    return "applyPage";
	}
	
	@RequestMapping("/submitApplication")
	public String submitApplication(
	        @ModelAttribute ApplicationModel app,
	        @RequestParam("resumeFile") CommonsMultipartFile file,
	        
	        HttpServletRequest request,
	        HttpSession session,
	        RedirectAttributes ra) throws Exception {

	    
	    UserModel user = (UserModel) session.getAttribute("user");

	    if (user == null) {
	        return "redirect:/login";
	    }

	    
	    if (applicationservice.alreadyApplied(user.getEmail(), app.getJob_id())) {
	        ra.addFlashAttribute("msg", "Already Applied ❗");
	        return "redirect:/viewhandler";
	    }
	    
	    String phone = request.getParameter("phone");
	    System.out.println("PHONE = " + user.getPhone());
	    
	    
	    app.setName(user.getFullname());
	    app.setEmail(user.getEmail());
	    app.setPhone(phone);
	    app.setLocation(user.getLocation());
	    app.setSkills(user.getSkills());
	    app.setExperience(user.getExperience());

	    
	    if (!file.isEmpty()) {

	    	String path = "/opt/uploads/";

	    	File dir = new File(path);
	    	if (!dir.exists()) {
	    	    dir.mkdirs();
	    	}

	    	String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();

	    	File saveFile = new File(path + filename);
	    	file.transferTo(saveFile);
	    	app.setResume(filename);
	    }

	    
	    applicationservice.saveApplication(app);

	    
	    ra.addFlashAttribute("msg", "Applied Successfully ✅");

	    return "redirect:/viewhandler";
	}
	
	@RequestMapping("/viewResume")
	public void viewResume(@RequestParam("file") String fileName,
	                       HttpServletResponse response) throws Exception {

	    if (fileName.contains("..")) {
	        response.getWriter().write("Invalid file path");
	        return;
	    }

	    String path = "/opt/uploads/" + fileName;

	    File file = new File(path);

	    if (!file.exists()) {
	        response.setContentType("text/plain");
	        response.getWriter().write("File not found");
	        return;
	    }

	    if (!fileName.toLowerCase().endsWith(".pdf")) {
	        response.setContentType("text/plain");
	        response.getWriter().write("Invalid file type");
	        return;
	    }

	    response.setContentType("application/pdf");
	    response.setHeader("Content-Disposition", "inline; filename=\"" + fileName + "\"");

	    try (FileInputStream fis = new FileInputStream(file);
	         OutputStream os = response.getOutputStream()) {

	        byte[] buffer = new byte[1024];
	        int bytes;

	        while ((bytes = fis.read(buffer)) != -1) {
	            os.write(buffer, 0, bytes);
	        }
	    }
	}
	
	
	@RequestMapping("/deleteApplication")
	public String deleteApplication(@RequestParam("id") int id,
	                                RedirectAttributes ra) {

	    System.out.println(id); 

	    applicationservice.deleteApplication(id);

	    ra.addFlashAttribute("msg", "Application Deleted ❌");

	    return "redirect:/viewhandler";
	}
	
	@RequestMapping("/deleteJob")
	public String deleteJob(@RequestParam("id") int id,
	                        RedirectAttributes ra) {

	    jobservice.deleteJob(id);

	    ra.addFlashAttribute("msg", "Job Deleted Successfully ❌");

	    return "redirect:/Employeedashboard";
	}
	
	@RequestMapping("/searchJobs")
	public String searchJobs(
	        @RequestParam(required=false) String location,
	        @RequestParam(required=false) String type,
	        @RequestParam(required=false) String category,
	        @RequestParam(required=false) String experience,
	        @RequestParam(defaultValue = "0") int page,
	        Model model,
	        RedirectAttributes ra){

	    List<JobModel> jobs = jobservice.searchJobs(
	            location, type, category, experience);

	    System.out.println(jobs);
	    model.addAttribute("jobs", jobs);
	    model.addAttribute("currentPage", page);
	    if(jobs.isEmpty()){
	        model.addAttribute("msg1","No jobs found 😢");
	    }else {
	    	 model.addAttribute("msg1","Filter Applied Successfully ✅");
	    }
	    return "Seekerdashboard";
	}
	
	@RequestMapping("Seekerdashboard")
	public String seekerDashboard(Model model, HttpSession session) {

	    UserModel user = (UserModel) session.getAttribute("user");

	    List<JobModel> jobs = jobservice.getJobsNotApplied(user.getEmail());

	    model.addAttribute("jobs", jobs);

	    return "Seekerdashboard"; 
	}
	
	@RequestMapping("/appliedJobs")
	public String appliedJobs(HttpSession session, Model model){

	    UserModel user = (UserModel) session.getAttribute("user");

	    List<ApplicationModel> apps =
	            applicationservice.getApplicationsByEmail(user.getEmail());

	    model.addAttribute("applications", apps);

	    return "AppliedJobs";
	}
	
	@RequestMapping("forgotPassword")
	public String forgotPage() {
	    return "ForgotPassword";
	}
	
	@RequestMapping(value="sendPassword", method=RequestMethod.POST)
	public String sendPassword(@RequestParam("email") String email,
	                           RedirectAttributes ra) {

	    UserModel user = userservice.getUserByEmail(email);

	    if(user == null){
	        ra.addFlashAttribute("msg", "Email not found ❌");
	        return "redirect:/forgotPassword";
	    }

	    
	    SimpleMailMessage message = new SimpleMailMessage();
	    message.setTo(email);
	    message.setSubject("Your Password");
	    message.setText("Your password is: " + user.getPassword());

	    mailSender.send(message);

	    ra.addFlashAttribute("msg", "Password sent to email ✅");
	    return "redirect:/login";
	}
	
	@RequestMapping("/allApplications")
	public String allApplications(Model model, HttpSession session){

	    UserModel user = (UserModel) session.getAttribute("user");

	    if(user == null){
	        return "redirect:/login";
	    }

	
	    List<JobModel> jobs = jobservice.getJobsByUser(user.getId());

	    
	    List<ApplicationModel> allApps = new ArrayList<>();

	    for(JobModel job : jobs){
	        List<ApplicationModel> apps = 
	            applicationservice.getApplicationsByJobId(job.getId());

	        allApps.addAll(apps);
	    }

	    model.addAttribute("applications", allApps);

	    return "AllApplications"; 
	}
	
	@RequestMapping("/updateStatus")
	public String updateStatus(@RequestParam int id, @RequestParam String status) {
	    applicationservice.updateStatus(id, status);
	    return "redirect:/allApplications";
	}	
	
	@RequestMapping("/editJob")
	public String editJob(@RequestParam("jobId") int id, Model model) {

	    JobModel job = null;

	    try {
	        job = jobservice.getJobById(id);
	    } catch (Exception e) {
	        return "redirect:/Employeedashboard";
	    }

	    model.addAttribute("job", job);
	    return "EditJob";
	}
	
	@RequestMapping(value="/updateJob", method=RequestMethod.POST)
	public String updateJob(@ModelAttribute JobModel job,
	                        HttpSession session,
	                        RedirectAttributes ra) {

	    UserModel user = (UserModel) session.getAttribute("user");

	    
	    job.setUserId(user.getId());

	    jobservice.updateJob(job);

	    ra.addFlashAttribute("msg", "Job Updated Successfully ✅");

	    return "redirect:/Employeedashboard";
	}
 }
