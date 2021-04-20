package edu.vinaenter.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.Normalizer;
import java.util.regex.Pattern;

public class StringUtil {

	public static String md5(String str) {
		MessageDigest md;
		String result = "";
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			BigInteger bi = new BigInteger(1, md.digest());

			result = bi.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String makeSlug(String title) {
		String slug = Normalizer.normalize(title, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		slug = pattern.matcher(slug).replaceAll("");
		slug = slug.toLowerCase();
		// Replace 'đ' to 'd'
		slug = slug.replaceAll("đ", "d");
		// Delete special characters
		slug = slug.replaceAll("([^0-9a-z-\\s])", "");
		// Replace 'space' to '-'
		slug = slug.replaceAll("[\\s]", "-");
		// Converts multiple characters '-' consecutively to 1 character '-'
		slug = slug.replaceAll("(-+)", "-");
		// Delete characters '-' at the begin and the end
		slug = slug.replaceAll("^-+", "");
		slug = slug.replaceAll("-+$", "");
		return slug;
	}

}
