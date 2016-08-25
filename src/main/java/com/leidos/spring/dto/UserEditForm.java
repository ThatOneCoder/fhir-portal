package com.leidos.spring.dto;

import java.util.Set;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.leidos.spring.entities.User;

public class UserEditForm {
	
	@NotNull
	@Size(min=1, max= User.NAME_MAX, message="{nameSizeError}")
	private String name = "";
	
	private Set<User.Role> roles;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User.Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<User.Role> roles) {
		this.roles = roles;
	}
	
}
