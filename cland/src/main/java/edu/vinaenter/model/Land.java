package edu.vinaenter.model;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Land {
	private int lid;
	
	@NotEmpty
	private String lname;
	
	@NotEmpty
	private String description;
	
	private Date dateCreate;
	
	private Category cat;
	
	private String picture;
	
	@Min(10)
	private int area;
	
	@NotEmpty
	private String address;
	
	private int countView;
	
}
