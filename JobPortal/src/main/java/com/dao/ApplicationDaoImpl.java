package com.dao;

import java.sql.ResultSet;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.model.ApplicationModel;
import com.model.JobModel;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List<ApplicationModel> getApplicationsByJobId(int jobId) {

	    String hql = "from ApplicationModel where job_id=:jobId";

	    return sessionFactory.getCurrentSession()
	            .createQuery(hql, ApplicationModel.class)
	            .setParameter("jobId", jobId)
	            .list();
	}
	
	@Override
	public void save(ApplicationModel app) {

		sessionFactory.getCurrentSession().save(app);
	}
	
	@Override
	public boolean alreadyApplied(String email, int jobId) {

	    String sql = "SELECT COUNT(*) FROM ApplicationModel WHERE email=? AND job_id=?";
	    
	    Integer count = jdbcTemplate.queryForObject(sql, Integer.class, email, jobId);

	    return count > 0;
	}
	
	@Override
	public void deleteApplication(int id) {

	    ApplicationModel app = sessionFactory.getCurrentSession().get(ApplicationModel.class, id);

	    if (app != null) {
	        sessionFactory.getCurrentSession().delete(app);
	    }
	}
	
	@Override
	public List<ApplicationModel> getApplicationsByEmail(String email) {

	    String hql = "FROM ApplicationModel WHERE email = :email ORDER BY id DESC";

	    List<ApplicationModel> list = sessionFactory.getCurrentSession()
	            .createQuery(hql, ApplicationModel.class)
	            .setParameter("email", email)
	            .list();

	   
	    for (ApplicationModel app : list) {

	        JobModel job = sessionFactory.getCurrentSession()
	                .get(JobModel.class, app.getJob_id());

	        if (job != null) {
	            app.setJobTitle(job.getTitle());
	            app.setCompany(job.getCompany());
	            app.setLocation(job.getLocation());
	            app.setSalary(job.getSalary());
	            app.setType(job.getType());
	            app.setDescription(job.getDescription());
	        }
	    }

	    return list;
	}
	
	public ApplicationModel getApplicationById(int id) {
	    return sessionFactory.getCurrentSession().get(ApplicationModel.class, id);
	}

	public void update(ApplicationModel app) {
	    sessionFactory.getCurrentSession().update(app);
	}
	

}
