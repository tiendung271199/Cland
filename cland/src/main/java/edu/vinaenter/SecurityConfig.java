package edu.vinaenter;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication()
				.dataSource(dataSource)
				.passwordEncoder(passwordEncoder())
				.usersByUsernameQuery("SELECT username,password,enabled FROM users WHERE username = ?")
				.authoritiesByUsernameQuery("SELECT username,name FROM users u INNER JOIN roles r ON u.roleId = r.id WHERE username = ?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/admin/cat/add").access("hasAnyRole('ROLE_ADMIN','ROLE_MOD')")
				.antMatchers("/admin/cat/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MOD')")
				.antMatchers("/admin/cat/delete/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/admin/land/add").access("hasAnyRole('ROLE_ADMIN','ROLE_MOD')")
				.antMatchers("/admin/land/edit/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MOD')")
				.antMatchers("/admin/land/delete/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/admin/user/add").access("hasAnyRole('ROLE_ADMIN','ROLE_MOD')")
				.antMatchers("/admin/user/edit/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/admin/user/delete/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/admin/contact/delete/**").access("hasAnyRole('ROLE_ADMIN','ROLE_MOD')")
				.antMatchers("/admin/**").access("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_MOD')")
				.antMatchers("/").permitAll()
				.and()
				.formLogin()
				.loginPage("/auth/login")
				.loginProcessingUrl("/auth/login")
				.usernameParameter("username")
				.passwordParameter("password")
				.failureUrl("/auth/login?msg=Error")
				.defaultSuccessUrl("/admin", false)
				.and()
				.logout()
				.logoutUrl("/auth/logout")
				.logoutSuccessUrl("/auth/login")
				.and()
				.exceptionHandling()
				.accessDeniedPage("/error/403")
				.and()
				.csrf().disable();
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
}
