package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ApplicationDao;
import com.model.ApplicationModel;



@Repository
public class ApplicationServiceImpl implements ApplicationService {
	
	@Autowired
	ApplicationDao applicationDao;

	@Transactional
	@Override
	public List<ApplicationModel> getApplicationsByJobId(int jobId) {
		// TODO Auto-generated method stub
		return applicationDao.getApplicationsByJobId(jobId);
	}
	
	@Transactional
	@Override
	public void saveApplication(ApplicationModel app) {
	    applicationDao.save(app);
	}

	@Transactional
	@Override
	public boolean alreadyApplied(String email, int jobId) {
	    return applicationDao.alreadyApplied(email, jobId);
	}
	
	
	@Transactional
	@Override
	public void deleteApplication(int id) {
	    applicationDao.deleteApplication(id);
	}
	
	@Transactional
	@Override
	public List<ApplicationModel> getApplicationsByEmail(String email) {
	    return applicationDao.getApplicationsByEmail(email);
	}
	
	@Transactional
	@Override
	public void updateStatus(int id, String status) {
	    ApplicationModel app = applicationDao.getApplicationById(id);
	    app.setStatus(status);
	    applicationDao.update(app);
	}

}
