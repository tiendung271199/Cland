<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm tin</div>
		</div>
		<div class="content-box-large box-with-header">
			<form action="${urlLand}/add" method="post" enctype="multipart/form-data" id="form_land_add">
				<div>
					<div class="row mb-10"></div>
					<div class="row">
						<div class="col-sm-6">
							<c:if test="${not empty lError}">
								<div class="alert alert-danger" role="alert">
								    ${lError}
								</div>
							</c:if>
						
							<div class="form-group">
								<label for="name">Tên tin</label>
								<form:errors path="landError.lname" cssStyle="color:red;font-style:italic" ></form:errors>
								<input type="text" name="lname" value="${objLand.lname}" class="form-control" placeholder="Nhập tên tin">
							</div>
							
							<div class="form-group">
								<label>Danh mục</label>
								<select name="cat.cid" class="form-control">
								   <c:if test="${not empty catList}">
								   	   <c:forEach items="${catList}" var="objCat" >
									   	  <option value="${objCat.cid}" <c:if test='${objLand.cat.cid == objCat.cid}'>selected</c:if> >${objCat.cname}</option>
									   </c:forEach>
								   </c:if>
								</select>
							</div>
			
							<div class="form-group">
								<label>Hình ảnh</label>
								<form:errors path="landError.picture" cssStyle="color:red;font-style:italic" ></form:errors>
								<input type="file" name="image" class="btn btn-default" id="exampleInputFile1" >
								<p class="help-block"><em>Định dạng: jpg, png</em></p>
							</div>
							
							<div class="form-group">
								<label for="area">Diện tích</label>
								<form:errors path="landError.area" cssStyle="color:red;font-style:italic" ></form:errors>
								<input type="text" name="area" value="${objLand.area}" class="form-control" placeholder="Nhập diện tích">
							</div>
							
							<div class="form-group">
							   <label>Địa chỉ</label>
							   <form:errors path="landError.address" cssStyle="color:red;font-style:italic" ></form:errors>
							   <textarea name="address" class="form-control" rows="3" placeholder="Nhập địa chỉ">${objLand.address}</textarea>
							</div>
						</div>
			
						<div class="col-sm-6"></div>
			
						<div class="col-sm-12">
							<div class="form-group">
							   <label>Mô tả</label>
							   <form:errors path="landError.description" cssStyle="color:red;font-style:italic" ></form:errors>
							   <textarea name="description" class="form-control" rows="7" placeholder="Nhập mô tả">${objLand.description}</textarea>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-12">
							<input type="submit" value="Thêm" class="btn btn-success" />
							<input type="reset" value="Nhập lại" class="btn btn-default" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function (){
		$('#form_land_add').validate({
			rules:{
				"lname":{
					required: true,
					minlength: 20,
					maxlength: 100,
				},
				"description":{
					required: true,
				},
				"address":{
					required: true,
					minlength: 20,
					maxlength: 60,
				},
				"area":{
					required: true,
					digits: true,
					min: 10,
				},
				"image":{
					required: true,
				}
			},
			messages:{
				"lname":{
					required: "Bắt buộc",
					minlength: "Tên tin tối thiểu 20 ký tự",
					maxlength: "Tên tin tối đa 100 ký tự",
				},
				"description":{
					required: "Bắt buộc",
				},
				"address":{
					required: "Bắt buộc",
					minlength: "Địa chỉ tối thiểu 20 ký tự",
					maxlength: "Địa chỉ tối đa 60 ký tự",
				},
				"area":{
					required: "Bắt buộc",
					digits: "Diện tích là số không âm",
					min: "Diện tích tối thiểu là 10",
				},
				"image":{
					required: "Bắt buộc",
				}
			}
		})
	})
</script>

<script type="text/javascript">
	document.getElementById("func_land").className = "current";
</script>