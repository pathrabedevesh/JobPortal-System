package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.ApplicationModel;

@Service
public interface ApplicationService {
	public List<ApplicationModel> getApplicationsByJobId(int jobId);
	public void saveApplication(ApplicationModel app);
	public boolean alreadyApplied(String email, int jobId);
	public void deleteApplication(int id);
	List<ApplicationModel> getApplicationsByEmail(String email);
	public void updateStatus(int id, String status);
}
