package com.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.model.ApplicationModel;
import com.model.JobModel;
import com.model.UserModel;

@Service
public interface JobDao {

	public void saveJob(JobModel job);

    public List<JobModel> getJobsByUser(int userId);

    public void deleteJob(int id);

    public List<JobModel> getAllJobs();

    public JobModel getJobById(int id);

    public int updateJob(JobModel job);
    
    public void saveApplication(int userId, int jobId);
    
    public List<JobModel> searchJobs(String location,String type, String category, String experience);
    
    public List<JobModel> getJobsNotApplied(String email);
    
    
}
