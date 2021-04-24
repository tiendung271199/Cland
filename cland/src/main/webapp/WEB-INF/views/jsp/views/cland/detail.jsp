<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="clearfix main_content floatleft">
	<div class="clearfix content">
		<c:choose>
			<c:when test="${not empty objLand}">
				<h1>${objLand.lname}</h1>
				<div class="clearfix post-meta">
					<p style="margin-bottom: 15px">
						<span><i class="fa fa-clock-o"></i> Địa chỉ: ${objLand.address}</span>
					</p>
					<p>
						<span><i class="fa fa-folder"></i> Diện tích: ${objLand.area}m2</span>
						<span><i class="fa fa-eye"></i> Lượt xem: ${objLand.countView}</span>
					</p>
				</div>
				
				<div class="vnecontent">
					<p>${objLand.description}</p>
				</div>
				
				<a class="btn" href="${urlDetail}/${stringUtil.makeSlug(objLand.lname)}/${objLand.lid}/0">Bài trước</a>
				<a class="btn" href="${urlDetail}/${stringUtil.makeSlug(objLand.lname)}/${objLand.lid}/1">Bài kế</a>
			</c:when>
			<c:otherwise>
				<div style="padding-left: 20px">
					<p>Không có bài viết</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="more_themes">
		<h2>Bất động sản liên quan <i class="fa fa-thumbs-o-up"></i></h2>
		<div class="more_themes_container">
			<c:choose>
				<c:when test="${not empty landListRelate}">
					<c:forEach items="${landListRelate}" var="objLand" >
						<c:set value="${objLand.lname}" var="landName" ></c:set>
						<div class="single_more_themes floatleft">
							<img src="${contextPath}/images/lands/${objLand.picture}" alt=""/>
							<a href="${urlDetail}/${stringUtil.makeSlug(landName)}/${objLand.lid}"><h2>${landName}</h2></a>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div style="padding-left: 20px">
						<p>Không có bài viết liên quan</p>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>