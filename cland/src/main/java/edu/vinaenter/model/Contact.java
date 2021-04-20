package edu.vinaenter.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Contact {
	private int cid;
	
	@NotEmpty
	private String fullname;
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty
	private String subject;
	
	@NotEmpty
	private String content;
	
}
