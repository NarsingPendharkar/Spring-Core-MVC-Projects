package com.task.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.task.Dao.UserRepo;
import com.task.Exceptions.InvalidUserException;
import com.task.Model.Tasks;
import com.task.Model.User;


public interface UserService extends UserDetailsService {

	void saveUser(User user) throws InvalidUserException;
	public User findByUsernameAndPassword(String username, String password) ;
	public List<User> allUsers();

	public User userbyid(int long1);

	public List<User> getAllUsers();
	
	// find user by username
	public Optional<User>  userByname(String username);

	

}
