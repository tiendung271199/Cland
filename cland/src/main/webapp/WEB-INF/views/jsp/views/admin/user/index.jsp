<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý người dùng</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${urlUser}/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
					</div>
                	<div class="col-md-4">
                	<form action="${urlUser}" method="get">
	                 	 <div class="input-group form">
	                       <input type="text" class="form-control" name="searchContent" value="${searchContent}" placeholder="Search...">
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
						<c:if test="${not empty userError}">
							<div class="alert alert-danger" role="alert">
							    ${userError}
							</div>
						</c:if>
	  					<c:choose>
	  						<c:when test="${not empty userList}">
			  					<table class="table table-striped table-bordered" id="example">
									<thead>
										<tr>
											<th width="5%">ID</th>
											<th>Username</th>
											<th>Fullname</th>
											<th width="15%">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${userList}" var="objUser" >
											<tr class="odd gradeA">
												<td>${objUser.id}</td>
												<td>${objUser.username}</td>
												<td>${objUser.fullname}</td>
												<td class="center text-center">
													<a href="${urlUser}/edit/${objUser.id}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>
				                                    <a href="${urlUser}/delete/${objUser.id}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá người dùng \'${objUser.username}\' không?')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
			
								<nav class="text-center" aria-label="...">
									<c:if test="${totalPage > 0}">
									   <ul class="pagination">
									   	  <c:if test="${currentPage > 1}">
									      	<li><a href="${urlUser}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${currentPage - 1}" aria-label="Previous" ><span aria-hidden="true">«</span></a></li>
									      </c:if>
									      
									      <c:forEach begin="1" end="${totalPage}" var="page">
									      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
									      	  	  <a href="${urlUser}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${page}">${page}</a>
									      	  </li>
									      </c:forEach>
									      
									      <c:if test="${currentPage < totalPage}">
									      	<li><a href="${urlUser}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
									      </c:if>
									   </ul>
									</c:if>
								</nav>
								
							</c:when>
							<c:otherwise>
								<div class="alert alert-info" role="alert">
								    Không có người dùng
								</div>
							</c:otherwise>
						</c:choose>
	  				</div>
  				</div>
  			</div>