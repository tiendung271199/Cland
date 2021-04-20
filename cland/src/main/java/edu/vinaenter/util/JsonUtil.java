package edu.vinaenter.util;

import com.google.gson.Gson;

import edu.vinaenter.model.Category;

public class JsonUtil {
	
	public static String getCatJson(Category category) {
		return new Gson().toJson(category);
	}
	
}
