package com.leidos.spring.config;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
    private static final Logger logger = LoggerFactory.getLogger(WebSecurityConfig.class);

	@Value("${rememberMe.privateKey}")
	private String rememberMeKey;
	
	@Value("${spring.profiles.active}")
	private String env;
    
    @Resource
	private UserDetailsService userService;
    
    @Bean
    public RememberMeServices rememberMeServices() {
    	
        TokenBasedRememberMeServices rememberMeServices = new TokenBasedRememberMeServices(rememberMeKey, userService);
        return rememberMeServices;
        
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
      logger.info("Creating password encoder bean");
      return new BCryptPasswordEncoder();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers(
//                        "/",
//                		"/home",
                		"/error",
                		"/signup",
                		"/forgot-password",
                		"/reset-password/*",
                        "/spring/management/**",
//                        "/resource/*/view",
//                        "/resource/valueset",
//                        "/resource/valueset/*/view",
//                        "/resource/valueset/search",
//                        "/resource/valueset/*/code/*/view",
//                		"/users/*",
                        "/public/**"
                ).permitAll()
                .anyRequest().authenticated();
        http
            .formLogin()
                .loginPage("/login")
                .permitAll().and()
            .rememberMe().key(rememberMeKey).rememberMeServices(rememberMeServices()).and()
            .logout()
                .permitAll();

        // TODO find a way to allow CSRF for everything but API
        http.csrf().disable();
        
        if (!env.equals("dev"))
        	http.requiresChannel().anyRequest().requiresSecure();
    }
    
	@Autowired
    @Override
    protected void configure(AuthenticationManagerBuilder authManagerBuilder) throws Exception {
        authManagerBuilder.userDetailsService(userService).passwordEncoder(passwordEncoder());
    }

}