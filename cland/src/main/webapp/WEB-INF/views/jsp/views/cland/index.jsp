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
		<c:if test="${not empty urlError}">
			<p style="background: #FF3333; border-radius: 7px; padding: 5px; color: white; margin-bottom: 10px">${urlError}</p>
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
						<c:set value="${currentPage - 1}" var="pagePrevious"></c:set>
					   	<c:if test="${currentPage == 1}">
					   	  	<c:set value="${currentPage}" var="pagePrevious"></c:set>
					    </c:if>
				      	<li><a href="${urlIndex}${pagePrevious}"> &lt;&lt; </a></li>
				        
				        <c:choose>
					      <c:when test="${totalPage > 5}">
					      	  <c:if test="${currentPage > 3 and currentPage < (totalPage - 2)}">
					      	  	  <li><a href="${urlIndex}1">Fi</a></li>
							      <li><a href="javascript:void(0)">...</a></li>
							      <c:forEach begin="${currentPage - 2}" end="${currentPage + 2}" var="page">
							      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
							      	  	  <a href="${urlIndex}${page}">${page}</a>
							      	  </li>
							      </c:forEach>
							      <li><a href="javascript:void(0)">...</a></li>
							      <li><a href="${urlIndex}${totalPage}">La</a></li>
						      </c:if>
					      	  <c:if test="${currentPage <= 3}">
							      <c:forEach begin="1" end="5" var="page">
							      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
							      	  	  <a href="${urlIndex}${page}">${page}</a>
							      	  </li>
							      </c:forEach>
							      <li><a href="javascript:void(0)">...</a></li>
							      <li><a href="${urlIndex}${totalPage}">La</a></li>
						      </c:if>
					      	  <c:if test="${currentPage >= (totalPage - 2)}">
					      	  	  <li><a href="${urlIndex}1">Fi</a></li>
							      <li><a href="javascript:void(0)">...</a></li>
							      <c:forEach begin="${totalPage - 4}" end="${totalPage}" var="page">
							      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
							      	  	  <a href="${urlIndex}${page}">${page}</a>
							      	  </li>
							      </c:forEach>
						      </c:if>
					      </c:when>
					      <c:otherwise>
					      	  <c:forEach begin="1" end="${totalPage}" var="page">
						      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
						      	  	  <a href="${urlIndex}${page}">${page}</a>
						      	  </li>
						      </c:forEach>
					      </c:otherwise>
					    </c:choose>
				        
				        <c:set value="${currentPage + 1}" var="pageNext"></c:set>
					    <c:if test="${currentPage == totalPage}">
					      	<c:set value="${currentPage}" var="pageNext"></c:set>
					    </c:if>
				      	<li><a href="${urlIndex}${pageNext}"> &gt;&gt; </a></li>
					</ul>
				</c:if>
			</nav>
		</div>
	</c:if>
</div>