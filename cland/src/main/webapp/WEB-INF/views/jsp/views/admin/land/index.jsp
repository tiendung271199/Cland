<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý tin</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${urlLand}/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
					</div>
                	<div class="col-md-4">
                	<form action="${urlLand}" method="get">
                 	 <div class="input-group form">
                       <input type="text" name="searchContent" value="${searchContent}" class="form-control" placeholder="Search...">
                       <span class="input-group-btn">
                         <button class="btn btn-primary" type="submit">Search</button>
                       </span>
                  	 </div>
                  	 </form>
                  	</div>
				</div>

				<div class="row">
	  				<div class="panel-body">
	  					<c:if test="${not empty success}">
							<div class="alert alert-success" role="alert">
							    ${success}
							</div>
						</c:if>
						<c:if test="${not empty landError}">
							<div class="alert alert-danger" role="alert">
							    ${landError}
							</div>
						</c:if>
	  					<c:choose>
	  						<c:when test="${not empty landList}">
			  					<table class="table table-striped table-bordered" id="example">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên</th>
											<th>Danh mục</th>
											<th>Diện tích</th>
											<th>Địa chỉ</th>
											<th>Lượt đọc</th>
											<th>Hình ảnh</th>
											<th width="14%">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${landList}" var="objLand" >
											<tr class="odd gradeA">
												<td>${objLand.lid}</td>
												<td>${objLand.lname}</td>
												<td>${objLand.cat.cname}</td>
												<td>${objLand.area}m2</td>
												<td>${objLand.address}</td>
												<td class="center">${objLand.countView}</td>
												<td class="center text-center">
													<img width="180px" height="120px" src="${contextPathImage}/images/lands/${objLand.picture}" />
												</td>
												<td class="center text-center">
													<a href="${urlLand}/edit/${objLand.lid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>
				                                    <a href="${urlLand}/delete/${objLand.lid}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá tin này không?')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
			
								<nav class="text-center" aria-label="...">
									<c:if test="${totalPage > 0}">
									   <ul class="pagination">
									   	  <c:set value="${currentPage - 1}" var="pagePrevious"></c:set>
									   	  <c:if test="${currentPage == 1}">
									   	  	<c:set value="${currentPage}" var="pagePrevious"></c:set>
									      </c:if>
										  <li <c:if test='${currentPage == 1}'>class="disabled"</c:if>>
										  	<a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${pagePrevious}" aria-label="Previous" >
										  		<span aria-hidden="true">«</span>
										  	</a>
										  </li>
									      
									      <c:choose>
										      <c:when test="${totalPage > 5}">
										      	  <c:if test="${currentPage > 3 and currentPage < (totalPage - 2)}">
										      	  	  <li><a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/1">Fi</a></li>
												      <li><a href="javascript:void(0)">...</a></li>
												      <c:forEach begin="${currentPage - 2}" end="${currentPage + 2}" var="page">
												      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
												      	  	  <a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${page}">${page}</a>
												      	  </li>
												      </c:forEach>
												      <li><a href="javascript:void(0)">...</a></li>
												      <li><a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${totalPage}">La</a></li>
											      </c:if>
										      	  <c:if test="${currentPage <= 3}">
												      <c:forEach begin="1" end="5" var="page">
												      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
												      	  	  <a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${page}">${page}</a>
												      	  </li>
												      </c:forEach>
												      <li><a href="javascript:void(0)">...</a></li>
												      <li><a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${totalPage}">La</a></li>
											      </c:if>
										      	  <c:if test="${currentPage >= (totalPage - 2)}">
										      	  	  <li><a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/1">Fi</a></li>
												      <li><a href="javascript:void(0)">...</a></li>
												      <c:forEach begin="${totalPage - 4}" end="${totalPage}" var="page">
												      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
												      	  	  <a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${page}">${page}</a>
												      	  </li>
												      </c:forEach>
											      </c:if>
										      </c:when>
										      <c:otherwise>
										      	  <c:forEach begin="1" end="${totalPage}" var="page">
											      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
											      	  	  <a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${page}">${page}</a>
											      	  </li>
											      </c:forEach>
										      </c:otherwise>
									      </c:choose>
									      
									      <c:set value="${currentPage + 1}" var="pageNext"></c:set>
									      <c:if test="${currentPage == totalPage}">
									      	<c:set value="${currentPage}" var="pageNext"></c:set>
									      </c:if>
										  <li <c:if test='${currentPage == totalPage}'>class="disabled"</c:if>>
										  	<a href="${urlLand}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${pageNext}" aria-label="Next">
										  		<span aria-hidden="true">»</span>
										  	</a>
										  </li>
									   </ul>
									</c:if>
								</nav>
								
							</c:when>
							<c:otherwise>
								<div class="alert alert-info" role="alert">
								    Không có tin
								</div>
							</c:otherwise>
						</c:choose>
	  				</div>
  				</div>
  			</div>
  			
<script type="text/javascript">
	document.getElementById("func_land").className = "current";
</script>