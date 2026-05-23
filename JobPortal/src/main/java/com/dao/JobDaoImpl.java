package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.model.ApplicationModel;
import com.model.JobModel;
import com.model.UserModel;

@Repository
public class JobDaoImpl implements JobDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void saveJob(JobModel job) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();

		session.save(job);
	}

	@Override
	public List<JobModel> getJobsByUser(int userId) {

		String sql = "SELECT * FROM JobModel WHERE userId=?";

		return jdbcTemplate.query(sql, new Object[] { userId }, new RowMapper<JobModel>() {

			@Override
			public JobModel mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				JobModel job = new JobModel();

				job.setId(rs.getInt("id"));
				job.setTitle(rs.getString("title"));
				job.setLocation(rs.getString("location"));
				job.setType(rs.getString("type"));

				return job;
			}
		});
	}

	
	@Override
	public List<JobModel> getAllJobs() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();

		return session.createQuery("from JobModel", JobModel.class).list();
	}

	@Override
	public JobModel getJobById(int id) {

	    String sql = "SELECT * FROM JobModel WHERE id=?";

	    List<JobModel> list = jdbcTemplate.query(
	            sql,
	            new BeanPropertyRowMapper<>(JobModel.class),
	            id
	    );

	    if(list.isEmpty()){
	        return null;
	    }

	    return list.get(0);
	}

	@Override
	public int updateJob(JobModel job) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(job);

	    return 1;
	}
	
	@Override
	public void saveApplication(int userId, int jobId) {

	    String sql = "INSERT INTO applications(user_id, job_id) VALUES (?, ?)";

	    jdbcTemplate.update(sql, userId, jobId);
	}
	
	@Override
	public void deleteJob(int id) {

	    JobModel job = sessionFactory.getCurrentSession().get(JobModel.class, id);

	    if (job != null) {
	        sessionFactory.getCurrentSession().delete(job);
	    }
	}
	
	@Override 
	public List<JobModel> searchJobs(String location,
	        String type, String category, String experience){

	    String hql = "from JobModel where 1=1";

	    if(location != null && !location.isEmpty()){
	        hql += " and location = '" + location + "'";
	    }

	    if(type != null && !type.isEmpty()){
	        hql += " and type = '" + type + "'";
	    }

	    if(category != null && !category.isEmpty()){
	        hql += " and category = '" + category + "'";
	    }

	    if(experience != null && !experience.isEmpty()){
	        hql += " and experience = '" + experience + "'";
	    }

	    return sessionFactory.getCurrentSession()
	            .createQuery(hql, JobModel.class)
	            .list();
	}
	
	@Override
	public List<JobModel> getJobsNotApplied(String email) {

	    String sql = "SELECT j.* FROM JobModel j " +
	                 "WHERE j.id NOT IN ( " +
	                 "   SELECT job_id FROM ApplicationModel WHERE email = ? " +
	                 ") " +
	                 "ORDER BY j.id DESC";

	    return jdbcTemplate.query(
	            sql,
	            new BeanPropertyRowMapper<>(JobModel.class),
	            email
	    );
	}
	
	

}
