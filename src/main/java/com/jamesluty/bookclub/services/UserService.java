package com.jamesluty.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.jamesluty.bookclub.models.LoginUser;
import com.jamesluty.bookclub.models.User;
import com.jamesluty.bookclub.repos.UserRepo;

@Service
public class UserService {

	@Autowired
	private UserRepo userRepo;
	
//	Login and Registration
	public User register(User newUser, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		
		if(userRepo.findByEmail(newUser.getEmail()).isPresent()) {
			result.rejectValue("email", "unique", "Email already exist!");
		}
		
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "match", "Password must match");
		}
		
		if(result.hasErrors()) {
			return null;
		}
		
		String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashedPassword);
		
		return userRepo.save(newUser);
	}
	
	public User login(LoginUser newLogin, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		
		Optional<User> optUser = userRepo.findByEmail(newLogin.getEmail());
		if(!optUser.isPresent()) {
			result.rejectValue("email", "unique", "Invalid Credentials");
			return null;
		}
		
		User user = optUser.get();
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "match", "Invalid Credentials");
			return null;
		}
		
		return user;
	}
	
//	Create and update
	public User saveUser(User user) {
		return userRepo.save(user);
	}
	
//	Read
	public List<User> getAllUsers(){
		return userRepo.findAll();
	}
	
	public User getUser(Long id) {
		return userRepo.findById(id).orElse(null);
	}
	
//	Delete
	public void deleteUser(Long id) {
		userRepo.deleteById(id);
	}
}
