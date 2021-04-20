<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="clearfix main_content floatleft">
	<div class="clearfix content">
		<div class="content_title">
			<h2>	
				${titleName}
			</h2>
		</div>
		<div class="clearfix single_work_container">
			<c:if test="${not empty landListByCatId}">
				<c:set value="${landListByCatId}" var="landList" ></c:set>
			</c:if>
			<c:if test="${not empty searchLandList}">
				<c:set value="${searchLandList}" var="landList" ></c:set>
			</c:if>
			<c:choose>
				<c:when test="${not empty landList}">
					<c:forEach items="${landList}" var="objLand" >
						<c:set value="${objLand.lname}" var="landName" ></c:set>
						<div class="clearfix single_work">
							<img class="img_top" src="${contextPath}/images/lands/${objLand.picture}" alt=""/>
							<img class="img_bottom" src="${contextPath}/images/work_bg2.png" alt=""/>
							<h2>${objLand.address}</h2>
							<a href="${urlDetail}/${stringUtil.makeSlug(landName)}/${objLand.lid}"><p class="caption">${landName}</p></a>
						</div>
					</c:forEach>
					
					<div class="clearfix work_pagination">
						<nav>
							<c:set value="${currentPage - 1}" var="pagePrevious"></c:set>
							<c:set value="${currentPage + 1}" var="pageNext"></c:set>
							<c:if test="${currentPage == 1}">
								<c:set value="${currentPage}" var="pagePrevious"></c:set>
							</c:if>
							<c:if test="${currentPage == totalPage}">
								<c:set value="${currentPage}" var="pageNext"></c:set>
							</c:if>
							<a class="newer floatleft" href="${urlCat}/${stringUtil.makeSlug(objCat.cname)}/${objCat.cid}/${pagePrevious}"> &lt; -- Trang trước</a>
							<a class="older floatright" href="${urlCat}/${stringUtil.makeSlug(objCat.cname)}/${objCat.cid}/${pageNext}">Trang kế -- &gt;</a>
						</nav>
					</div>
				</c:when>
				<c:otherwise>
					<p style="background: #CCC; padding: 5px 25px; color: red">Không có dữ liệu</p>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>