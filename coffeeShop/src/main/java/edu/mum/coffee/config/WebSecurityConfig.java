package edu.mum.coffee.config;

import javax.sql.DataSource;

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
	
	
	@Autowired
	DataSource dataSource;
	
	@Override
	protected void configure(HttpSecurity httpSecurity)	throws Exception {
		
		httpSecurity.formLogin().loginPage("/login").usernameParameter("userId").passwordParameter("password");

		httpSecurity.formLogin().defaultSuccessUrl("/orders").failureUrl("/login?error");
		httpSecurity.logout().logoutSuccessUrl("/login?logout");
		httpSecurity.exceptionHandling().accessDeniedPage("/login?accessDenied");
		httpSecurity.authorizeRequests()
			.antMatchers("/").permitAll()
			.antMatchers("/**/orders/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/**/persons/**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/**/products/**").access("hasRole('ROLE_ADMIN')");
		
	}


	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		//auth.inMemoryAuthentication().withUser("super").password("pw").roles("ADMIN");
		//auth.inMemoryAuthentication().withUser("a").password("1").roles("USER");
		auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery("select user,password, enable from user where user=?")
		.authoritiesByUsernameQuery("select user,rol from user where user=?");
	}
}