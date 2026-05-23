package com.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.JobModel;

@Service
public interface JobService {

	public void saveJob(JobModel job);

    public List<JobModel> getJobsByUser(int userId);

    

    public List<JobModel> getAllJobs();

    public JobModel getJobById(int id);

    public int updateJob(JobModel job);
    
    public void applyJob(int userId, int jobId);
    
    public void deleteJob(int id);
    
    public List<JobModel> searchJobs(String location,String type, String category, String experience);
    
    List<JobModel> getJobsNotApplied(String email);
    
    
}
