<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="clearfix sidebar_container floatright">
	<div class="clearfix sidebar">
		<div class="clearfix single_sidebar category_items">
			<h2>Danh mục bất động sản</h2>
			<ul>
				<c:if test="${not empty catList}">
					<c:forEach items="${catList}" var="objCat">
						<c:set value="${objCat.cname}" var="catName" ></c:set>
						<li class="cat-item"><a href="${urlCat}/${stringUtil.makeSlug(catName)}/${objCat.cid}">${catName}</a>(${objCat.totalLand})</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>

		<div class="clearfix single_sidebar">
			<div class="popular_post">
				<div class="sidebar_title"><h2>Xem nhiều</h2></div>
				<ul>
					<c:if test="${not empty landListByView}">
						<c:forEach items="${landListByView}" var="objLand">
							<c:set value="${objLand.lname}" var="landName" ></c:set>
							<li><a href="${urlDetail}/${stringUtil.makeSlug(landName)}/${objLand.lid}">${landName}</a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
			</div>
		
		<div class="clearfix single_sidebar">
			<h2>Danh mục hot</h2>
			<ul>
				<c:if test="${not empty catList}">
					<c:forEach items="${catList}" var="objCat">
						<c:set value="${objCat.cname}" var="catName" ></c:set>
						<li><a href="${urlCat}/${stringUtil.makeSlug(catName)}/${objCat.cid}">${catName}<span>(${objCat.totalLand})</span></a></li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
</div>