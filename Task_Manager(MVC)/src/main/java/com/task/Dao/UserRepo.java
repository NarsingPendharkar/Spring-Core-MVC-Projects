package com.task.Dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.task.Model.User;

@Repository
public interface UserRepo extends JpaRepository<User,Integer> {

	User findByUsernameAndPassword(String username, String password);
	
	@Query(value = "SELECT count(username) FROM users where username=?1" , nativeQuery = true)
	public Integer existByUsername(String user);
	Optional<User> findByUsername(String username);
	

}
