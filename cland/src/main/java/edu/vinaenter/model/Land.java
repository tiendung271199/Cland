package edu.vinaenter.model;

import java.util.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Land {
	private int lid;
	
	@NotEmpty
	@Size(min = 20, max = 100)
	private String lname;
	
	@NotEmpty
	private String description;
	
	private Date dateCreate;
	
	private Category cat;
	
	private String picture;
	
	@Min(10)
	private int area;
	
	@NotEmpty
	@Size(min = 20, max = 60)
	private String address;
	
	private int countView;
	
}
