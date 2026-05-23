package com.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.ApplicationModel;

@Service
public interface ApplicationDao {

	public List<ApplicationModel> getApplicationsByJobId(int jobId);
	public void save(ApplicationModel app);
	public boolean alreadyApplied(String email, int jobId);
	public void deleteApplication(int id);
	public List<ApplicationModel> getApplicationsByEmail(String email);
	public ApplicationModel getApplicationById(int id);
	public void update(ApplicationModel app);
}
