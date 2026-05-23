package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.JobDao;
import com.model.JobModel;

@Repository
public class JobServiceImpl implements JobService {

	@Autowired
	JobDao jobDao;
	
	@Transactional
	@Override
	public void saveJob(JobModel job) {
		// TODO Auto-generated method stub
		jobDao.saveJob(job);
	}

	@Transactional
	@Override
	public List<JobModel> getJobsByUser(int userId) {
		// TODO Auto-generated method stub
		return jobDao.getJobsByUser(userId);
	}

	

	@Transactional
	@Override
	public List<JobModel> getAllJobs() {
		// TODO Auto-generated method stub
		return jobDao.getAllJobs();
	}

	@Transactional
	@Override
	public JobModel getJobById(int id) {
		// TODO Auto-generated method stub
		return jobDao.getJobById(id);
	}

	@Transactional
	@Override
	public int updateJob(JobModel job) {
		// TODO Auto-generated method stub
		return jobDao.updateJob(job);
	}
	
	@Transactional
	@Override
	public void applyJob(int userId, int jobId) {
	    jobDao.saveApplication(userId, jobId);
	}
	
	@Transactional
	@Override
	public void deleteJob(int id) {
	    jobDao.deleteJob(id);
	}
	
	
	@Transactional
	@Override
	public List<JobModel> searchJobs(String location,
	        String type, String category, String experience){

	    return jobDao.searchJobs(location, type, category, experience);
	}

	@Transactional
	@Override
	public List<JobModel> getJobsNotApplied(String email) {
		// TODO Auto-generated method stub
		return jobDao.getJobsNotApplied(email);
	}

	
}
