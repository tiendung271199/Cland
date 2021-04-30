<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
<div class="sidebar content-box" style="display: block;">
	<ul class="nav">
	    <li id="func_index">
	    	<a href="${urlIndex}"><i class="glyphicon glyphicon-home"></i> Trang chủ</a>
	    </li>
	    <li id="func_category">
	    	<a href="${urlCat}"><i class="glyphicon glyphicon-list"></i> Danh mục</a>
	    </li>
	    <li id="func_land">
	    	<a href="${urlLand}"><i class="glyphicon glyphicon-book"></i> Land</a>
	    </li>
	    <li id="func_user">
	    	<a href="${urlUser}"><i class="glyphicon glyphicon-book"></i> Người dùng</a>
	    </li>
	    <li id="func_contact">
	    	<a href="${urlContact}"><i class="glyphicon glyphicon-book"></i> Liên hệ</a>
	    </li>
	</ul>
</div>