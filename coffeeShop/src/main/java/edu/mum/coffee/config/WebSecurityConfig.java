package edu.mum.coffee.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        /*
		http.formLogin().loginPage("/login")
		 .usernameParameter("userId")
		 .passwordParameter("password");
		
		http.authorizeRequests()
        .antMatchers("/", "/home", "/index").permitAll()
        .anyRequest().authenticated();
        */
		/*
		http.authorizeRequests()
                .antMatchers("/", "/home", "/index").permitAll()
                .anyRequest().authenticated()
                .and()            
            .logout()
            	.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            	.logoutSuccessUrl("/")
                .permitAll();
         */
    }

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("super").password("pw").roles("ADMIN");
	}
}