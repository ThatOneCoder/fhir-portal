package com.leidos.spring.services;

import ca.uhn.fhir.model.dstu2.resource.ValueSet;

import java.util.List;

public interface ValueSetService {

    public abstract List<ValueSet> findAllValueSets();

    public abstract List<ValueSet> findAllValueSetsBySearchString(String searchText);

    public abstract ValueSet findValueSetByValueSetId(String valuesetId);

    public abstract ValueSet findValueSetByValueSetIdAndVersion(String valuesetId, int version);

    public abstract ValueSet findValueSetByValueSetCode(String code);

    public abstract void updateValueSet(String id, String name, ValueSet valueSet);

    public abstract ValueSet findValueSetById(String valuesetId);

    public abstract ValueSet findValueSetByIdAndVersion(String valuesetId, int version);

    public abstract ValueSet findValueSetByCode(String code);

    public abstract List<Integer> findVersionsByValueSetId(String valuesetId);

//	public abstract void signup(SignupForm signupForm);
//
//	public abstract void verify(String verificationCode);
//
//	public abstract void forgotPassword(ForgotPasswordForm forgotPasswordForm);
//
//	public abstract void resetPassword(String forgotPasswordCode,
//									   ResetPasswordForm resetPasswordForm, BindingResult result);
//
//	public abstract User findOne(long userId);
//
//	public abstract void update(long userId, UserEditForm userEditForm);

}
