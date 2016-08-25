package com.leidos.spring.services;

import com.leidos.spring.dto.ForgotPasswordForm;
import com.leidos.spring.dto.ResetPasswordForm;
import com.leidos.spring.entities.User;
import org.springframework.validation.BindingResult;

import com.leidos.spring.dto.SignupForm;
import com.leidos.spring.dto.UserEditForm;

public interface UserService {
	
	public abstract void signup(SignupForm signupForm, boolean skip);

	public abstract void verify(String verificationCode);

	public abstract void forgotPassword(ForgotPasswordForm forgotPasswordForm);

	public abstract void resetPassword(String forgotPasswordCode,
									   ResetPasswordForm resetPasswordForm, BindingResult result);

	public abstract User findOne(long userId);

	public abstract void update(long userId, UserEditForm userEditForm);

}
