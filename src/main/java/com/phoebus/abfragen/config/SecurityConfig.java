package com.phoebus.abfragen.config;

import javax.inject.Inject;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private static final String PASSWORD = "test"; //"dk%MV*(z)]3DC0GQ+";
    private static final String ADMIN_PASSWORD = "admin"; //"dk%MV*(z)]3DC0GQ+";
    
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
        	.authorizeRequests()
        		.antMatchers("/resources/**").permitAll()
        		.anyRequest().authenticated()
        		.and()
        	.formLogin()
        		.loginPage("/login").permitAll()
        		.and()
        	.logout()
        		.logoutSuccessUrl("/")
        		.and()
        	.httpBasic() 
        		.and()
        	.csrf().disable();
        
        /*
        .authorizeRequests()
        	.anyRequest().authenticated()
        	.anyRequest().access("hasRole('ROLE_USER')")
        	.and()
        .formLogin()
        	.loginPage("/login").permitAll()
        	.and()
        .logout()
        	.logoutSuccessUrl("/")
        	.and()
        .httpBasic()
        	.and()
        .csrf().disable();
    	
    	/*
    	 http.authorizeRequests().anyRequest().permitAll()
         .and().httpBasic()
         .and().csrf().disable();
    	*/
    }
    
    @Inject
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("tester").password(PASSWORD).roles("USER").and()
                .withUser("guest").password(PASSWORD).roles("USER").and()
                .withUser("admin").password(ADMIN_PASSWORD).roles("USER", "ADMIN");
    }
    
    

}

