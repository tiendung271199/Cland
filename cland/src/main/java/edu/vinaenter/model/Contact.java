package edu.vinaenter.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Contact {
	private int cid;
	
	@NotEmpty
	@Size(min = 6, max = 30)
	private String fullname;
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty
	@Size(max = 50)
	private String subject;
	
	@NotEmpty
	private String content;
	
}
