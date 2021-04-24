package edu.vinaenter.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int id;
	
	@NotEmpty
	@Size(min = 5, max = 20)
	private String username;
	
	@NotEmpty
	@Size(min = 6, max = 30)
	private String fullname;
	
	private String rememberToken;
	
	@NotEmpty
	@Size(min = 6, max = 16)
	private String password;
	
	private int roleId;
	
}
