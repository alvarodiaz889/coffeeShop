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
	protected void configure(HttpSecurity httpSecurity)	throws Exception {
		
		httpSecurity.formLogin().loginPage("/login").usernameParameter("userId").passwordParameter("password");

		httpSecurity.formLogin().defaultSuccessUrl("/orders").failureUrl("/login?error");
		httpSecurity.logout().logoutSuccessUrl("/login?logout");
		httpSecurity.exceptionHandling().accessDeniedPage("/login?accessDenied");
		httpSecurity.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/**/orders/**").access("hasAnyRole('ADMIN','USER')")
			.antMatchers("/**/persons/**").access("hasAnyRole('ADMIN')")
			.antMatchers("/**/products/**").access("hasAnyRole('ADMIN')");
		
	}


	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("super").password("pw").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("a").password("1").roles("USER");
	}
}