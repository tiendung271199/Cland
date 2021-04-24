<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý liên hệ</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8"></div>
                	<div class="col-md-4">
                	<form action="${urlContact}" method="get">
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
						<c:if test="${not empty contactError}">
							<div class="alert alert-danger" role="alert">
							    ${contactError}
							</div>
						</c:if>
	  					<c:choose>
	  						<c:when test="${not empty contactList}">
			  					<table class="table table-striped table-bordered" id="example">
									<thead>
										<tr>
											<th width="5%">ID</th>
											<th>Tên</th>
											<th>Email</th>
											<th>Tiêu đề</th>
											<th>Nội dung</th>
											<th width="10%">Chức năng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${contactList}" var="objContact" >
											<tr class="odd gradeA">
												<td>${objContact.cid}</td>
												<td>${objContact.fullname}</td>
												<td>${objContact.email}</td>
												<td>${objContact.subject}</td>
												<td>${objContact.content}</td>
												<td class="center text-center">
				                                    <a href="${urlContact}/delete/${objContact.cid}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá liên hệ này không?')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
			
								<nav class="text-center" aria-label="...">
									<c:if test="${totalPage > 0}">
									   <ul class="pagination">
									   	  <c:if test="${currentPage > 1}">
									      	<li><a href="${urlContact}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${currentPage - 1}" aria-label="Previous" ><span aria-hidden="true">«</span></a></li>
									      </c:if>
									      
									      <c:forEach begin="1" end="${totalPage}" var="page">
									      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> >
									      	  	  <a href="${urlContact}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${page}">${page}</a>
									      	  </li>
									      </c:forEach>
									      
									      <c:if test="${currentPage < totalPage}">
									      	<li><a href="${urlContact}<c:if test='${not empty searchContent}'>/${searchContent}</c:if>/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
									      </c:if>
									   </ul>
									</c:if>
								</nav>
								
							</c:when>
							<c:otherwise>
								<div class="alert alert-info" role="alert">
								    Không có liên hệ
								</div>
							</c:otherwise>
						</c:choose>
	  				</div>
  				</div>
  			</div>