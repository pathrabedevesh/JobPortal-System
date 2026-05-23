package com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;

import com.model.LoginModel;
import com.model.UserModel;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	JavaMailSender mailSender;

	@Override
	public void DeleteUser(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<String> getUserName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getCountries() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getStateByCountries(String country) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getCityByState(String state) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int SaveUser(UserModel user) {

	    Session session = sessionFactory.getCurrentSession();

	    Query<UserModel> query = session.createQuery(
	        "FROM UserModel WHERE email = :email",
	        UserModel.class);

	    query.setParameter("email", user.getEmail());

	    List<UserModel> list = query.list();

	    if (!list.isEmpty()) {
	        return 1; // ❌ email already exist
	    } else {

	        session.save(user);

	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setFrom("pathrabedevesh@gmail.com");
	        message.setTo(user.getEmail());
	        message.setSubject("Registration Successful");
	        message.setText("Welcome to Career Link!\n\nYour account has been created successfully.");

	        mailSender.send(message);

	        return 0; // ✅ success
	    }
	}

	@Override
	public UserModel getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserModel> getUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void UpdateUser(UserModel user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
	    session.update(user);
	}

	@Override
	public List<UserModel> doLogin(LoginModel lm) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery(
				"from UserModel U where U.email='" + lm.getEmail() +"' and U.password='" + lm.getPassword() + "'");
		List<UserModel> list = query.list();

		if (list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	@Override
	public UserModel getUserByEmail(String email){

	    Session session = sessionFactory.getCurrentSession();

	    Query<UserModel> query = session.createQuery(
	        "FROM UserModel WHERE email = :email",
	        UserModel.class);

	    query.setParameter("email", email);

	    List<UserModel> list = query.list();

	    return list.isEmpty() ? null : list.get(0);
	}

}
