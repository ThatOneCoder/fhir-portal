package com.leidos.spring.repositories;

import com.leidos.spring.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
	
	User findByEmail(String email);

	User findByForgotPasswordCode(String forgotPasswordCode);

}
