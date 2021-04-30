package edu.vinaenter.constant;

public class URLConstant {

	public static final String URL_EMPTY = "";
	
	public static final String URL_ADMIN = "admin";
	public static final String URL_ADMIN_CAT = "admin/cat";
	public static final String URL_ADMIN_LAND = "admin/land";
	public static final String URL_ADMIN_CONTACT = "admin/contact";
	public static final String URL_ADMIN_USER = "admin/user";
	
	public static final String URL_ADMIN_ADD = "add";
	public static final String URL_ADMIN_EDIT = "edit/{id}";
	public static final String URL_ADMIN_EDIT_CAT = "edit/{cid}";
	public static final String URL_ADMIN_EDIT_LAND = "edit/{lid}";
	public static final String URL_ADMIN_DELETE = "delete/{id}";
	
	public static final String URL_ADMIN_PROFILE = "profile";

	public static final String URL_ADMIN_SEARCH = "search";
	
	public static final String URL_AUTH_LOGIN = "auth/login";
	public static final String URL_AUTH_LOGOUT = "auth/logout";
	public static final String URL_AUTH_SIGNUP = "auth/signup";
	
	public static final String URL_CLAND = "";
	public static final String URL_CLAND_CAT = "danh-muc/{cname}/{cid}";
	public static final String URL_CLAND_DETAIL = "chi-tiet/{lname}/{lid}";
	public static final String URL_CLAND_CONTACT = "lien-he";
	public static final String URL_CLAND_SEARCH = "tim-kiem";
	
	public static final String URL_ERROR = "error";
	public static final String URL_ERROR_STATUS_403 = "403";
	public static final String URL_ERROR_STATUS_404 = "404";
	
}
