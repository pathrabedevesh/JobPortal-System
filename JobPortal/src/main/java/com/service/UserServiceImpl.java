package com.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.UserDao;

import com.model.LoginModel;
import com.model.UserModel;

@Repository
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;
	
	@Transactional
	@Override
	public void DeleteUser(int id) {
		// TODO Auto-generated method stub

	}

	@Transactional
	@Override
	public List<String> getUserName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public List<String> getCountries() {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public List<String> getStateByCountries(String country) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public List<String> getCityByState(String state) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public int SaveUser(UserModel user) {
		int status = dao.SaveUser(user);
		return status;
	}

	@Transactional
	@Override
	public UserModel getUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public List<UserModel> getUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	@Override
	public void UpdateUser(UserModel user) {
		dao.UpdateUser(user);
		
	}

	@Transactional
	@Override
	public List<UserModel> doLogin(LoginModel lm) {
		// TODO Auto-generated method stub
		return dao.doLogin(lm);
	}
	
	@Transactional
	@Override
	public UserModel getUserByEmail(String email) {
		return dao.getUserByEmail(email);
	}

}
