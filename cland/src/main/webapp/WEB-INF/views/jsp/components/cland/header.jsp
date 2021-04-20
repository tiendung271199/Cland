<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<section id="header_area">
	<div class="wrapper header">
		<div class="clearfix header_top">
			<div class="clearfix logo floatleft">
				<a href="${urlIndex}"><h1><span>C</span>Land</h1></a>
			</div>
			<div class="clearfix search floatright">
				<form action="${urlSearch}" method="get" >
					<span style="color: red; font-style: italic; margin-right: 10px">${searchError}</span>
					<input type="text" name="searchContent" placeholder="Search"/>
					<input type="submit" />
				</form>
			</div>
		</div>
		<div class="header_bottom">
			<nav>
				<ul id="nav">
					<li><a href="${urlIndex}">Trang chủ</a></li>
					<li id="dropdown"><a href="javascript:void(0)">Bất động sản</a>
						<ul>
							<c:if test="${not empty catList}">
								<c:forEach items="${catList}" var="objCat">
									<c:set value="${objCat.cname}" var="catName" ></c:set>
									<li><a href="${urlCat}/${stringUtil.makeSlug(catName)}/${objCat.cid}">${catName}</a></li>
								</c:forEach>
							</c:if>
						</ul>
					</li>
					<li><a href="${urlContact}">Liên hệ</a></li>
				</ul>
			</nav>
		</div>
	</div>
</section>