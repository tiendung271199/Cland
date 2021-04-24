<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
  			<div class="content-box-large">
  				<div class="row">
	  				<div class="panel-heading">
	  					<div class="panel-title ">Quản lý danh mục</div>
		  			</div>
				</div>
				<hr>	
				<div class="row">
					<div class="col-md-8">
						<a href="${urlCat}/add" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
					</div>
                	<div class="col-md-4">
                 	 <div class="input-group form">
                       <input type="text" id="searchContent" class="form-control" placeholder="Search...">
                       <span class="input-group-btn">
                         <button class="btn btn-primary" type="button" onclick="search()">Search</button>
                       </span>
                  	 </div>
                  	</div>
				</div>
				
				<div class="row">
	  				<div class="panel-body">
	  					<c:if test="${not empty success}">
							<div class="alert alert-success" role="alert">
							    ${success}
							</div>
						</c:if>
						<c:if test="${not empty catError}">
							<div class="alert alert-danger" role="alert">
							    ${catError}
							</div>
						</c:if>
	  					<c:choose>
	  						<c:when test="${not empty catList}">
			  					<table class="table table-striped table-bordered" id="example">
									<thead>
										<tr>
											<th width="4%">ID</th>
											<th>Tên danh mục</th>
											<th width="15%">Chức năng</th>
										</tr>
									</thead>
									<tbody id="cat-table">
										<c:forEach items="${catList}" var="objCat" >
											<tr class="odd gradeA">
												<td>${objCat.cid}</td>
												<td>${objCat.cname}</td>
												<td class="center text-center">
													<a href="${urlCat}/edit/${objCat.cid}" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>
				                                    <a href="${urlCat}/delete/${objCat.cid}" title="" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xoá danh mục \'${objCat.cname}\' không?')"><span class="glyphicon glyphicon-trash"></span> Xóa</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
			
								<nav class="text-center" aria-label="...">
									<c:if test="${totalPage > 0}">
									   <ul class="pagination">
									   	  <c:if test="${currentPage > 1}">
									      	<li><a href="${urlCat}/${currentPage - 1}" aria-label="Previous" ><span aria-hidden="true">«</span></a></li>
									      </c:if>
									      
									      <c:forEach begin="1" end="${totalPage}" var="page">
									      	  <li <c:if test='${page == currentPage}'> class="active" </c:if> ><a href="${urlCat}/${page}">${page}</a></li>
									      </c:forEach>
									      
									      <c:if test="${currentPage < totalPage}">
									      	<li><a href="${urlCat}/${currentPage + 1}" aria-label="Next"><span aria-hidden="true">»</span></a></li>
									      </c:if>
									   </ul>
									</c:if>
								</nav>
								
							</c:when>
							<c:otherwise>
								<div class="alert alert-info" role="alert">
								    Không có danh mục
								</div>
							</c:otherwise>
						</c:choose>
	  				</div>
  				</div>
  			</div>
  			
<script type="text/javascript">
	function search() {
		var searchContent = $("#searchContent").val();
		$.ajax({
			url: './search',
			type: 'GET',
			dataType: 'json',
			// cache: false,
			data: {
				searchContent: searchContent
			},
			
			success: function(result){
				var body = '';
				if (result.length > 0) {
					result.forEach(item => {
						console.log(item);
						body += '<tr class="odd gradeA">';
						body += '<td>' + item.cid + '</td>';
						body += '<td>' + item.cname + '</td>';
						body += '<td class="center text-center">';
						body += '<a href="./cat/edit/' + item.cid + '" title="" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Sửa</a>';
						body += '<a href="./cat/delete/' + item.cid + '" title="" class="btn btn-danger" onclick="return confirm(\'Bạn có chắc muốn xoá danh mục ' + item.cname + ' không?\')" ><span class="glyphicon glyphicon-trash"></span> Xóa</a>';
						body += '</td>';
						body += '</tr>';
					});
					console.log("ok");
					$("#cat-table").html(body);
				} else {
					console.log("not ok");
					$("#cat-table").html('Không tìm thấy');
				}
			},
			error: function (){
				alert('Có lỗi xảy ra');
			}
		});
		return false;
	}
</script>
