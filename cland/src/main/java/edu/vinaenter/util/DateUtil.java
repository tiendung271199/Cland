package edu.vinaenter.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	
	public static Date convertStringToDate(String str) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		date = sdf.parse(str);
		return date;
	}
	
	public static String[] getDayMonthYear(Date dateCreate) {
		String date = dateCreate.toString();
		String[] arr = date.split("\\s");
		return arr[0].split("\\-");
	}
	
	public static String getDay(Date dateCreate) {
		return getDayMonthYear(dateCreate)[2];
	}
	
	public static String getMonth(Date dateCreate) {
		return getDayMonthYear(dateCreate)[1];
	}
	
}
