package edu.vinaenter.model;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
	private int cid;
	
	@NotEmpty
	private String cname;
	
	private int totalLand;

	public Category(int cid, @NotEmpty String cname) {
		super();
		this.cid = cid;
		this.cname = cname;
	}
	
}
