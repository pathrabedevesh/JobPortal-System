package com.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.model.LoginModel;
import com.model.UserModel;



@Service
public interface UserService {

	public int SaveUser(UserModel user);
	public UserModel getUserById(int id);
	public List<UserModel> getUserList();
	public void UpdateUser(UserModel user);
	public void DeleteUser(int id);
	public List<UserModel> doLogin(LoginModel lm);
	public List<String> getUserName();
	public List<String> getCountries();
	public List<String> getStateByCountries(String country);
	public List<String> getCityByState(String state);
	
	public UserModel getUserByEmail(String email);
	
}
