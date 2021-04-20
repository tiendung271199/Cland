<%@page import="edu.vinaenter.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="clearfix main_content floatleft">

	<div class="clearfix slider">
		<ul class="pgwSlider">
			<c:if test="${not empty landListByView}">
				<c:forEach items="${landListByView}" var="objLand">
					<li><img src="${contextPath}/images/lands/${objLand.picture}" alt="${objLand.address}" data-description="${objLand.lname}" data-large-src="${contextPath}/images/lands/${objLand.picture}"/></li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	
	<div class="clearfix content">
		<c:if test="${not empty pageError}">
			<p style="background: #FF3333; border-radius: 7px; padding: 5px; color: white; margin-bottom: 10px">${pageError}</p>
		</c:if>
		
		<div class="content_title"><h2>Bài viết mới</h2></div>
		
		<c:choose>
			<c:when test="${not empty landList}">
				<c:forEach items="${landList}" var="objLand">
					<c:set value="${objLand.lname}" var="landName" ></c:set>
					<div class="clearfix single_content">
						<div class="clearfix post_date floatleft">
							<div class="date">
								<c:set var="str" value="${objLand.dateCreate}" ></c:set>
								<h3>${dateUtil.getDay(str)}</h3>
								<p>Tháng ${dateUtil.getMonth(str)}</p>
							</div>
						</div>
						<div class="clearfix post_detail">
							<h2><a href="${urlDetail}/${stringUtil.makeSlug(landName)}/${objLand.lid}">${landName}</a></h2>
							<div class="clearfix post-meta">
								<p><span><i class="fa fa-clock-o"></i> Địa chỉ: ${objLand.address}</span> <span><i class="fa fa-folder"></i> Diện tích: ${objLand.area}m2</span></p>
							</div>
							<div class="clearfix post_excerpt">
								<img src="${contextPath}/images/lands/${objLand.picture}" alt=""/>
								<p>${objLand.description}</p>
							</div>
							<a href="${urlDetail}/${stringUtil.makeSlug(landName)}/${objLand.lid}">Đọc thêm</a>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p style="background: #CCC; padding: 5px 10px; color: red">Không có dữ liệu</p>
			</c:otherwise>
		</c:choose>
	</div>
	
	<c:if test="${not empty landList}">
		<div class="pagination">
			<nav>
				<c:if test="${totalPage > 0}">
					<ul>
						<c:if test="${currentPage > 1}">
				      		<li><a href="${urlIndex}${currentPage - 1}"> &lt;&lt; </a></li>
				        </c:if>
				        
				        <c:forEach begin="1" end="${totalPage}" var="page">
				      	    <li><a href="${urlIndex}${page}">${page}</a></li>
				        </c:forEach>
						
						<c:if test="${currentPage < totalPage}">
				      		<li><a href="${urlIndex}${currentPage + 1}"> &gt;&gt; </a></li>
				        </c:if>
					</ul>
				</c:if>
			</nav>
		</div>
	</c:if>
</div>