<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm tin</div>
		</div>
		<div class="content-box-large box-with-header">
			<form action="${urlLand}/add" method="post" enctype="multipart/form-data" >
				<div>
					<div class="row mb-10"></div>
					<div class="row">
						<div class="col-sm-6">
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
									   	  <option value="${objCat.cid}" <c:if test='${objLand.cid == objCat.cid}'>selected</c:if> >${objCat.cname}</option>
									   </c:forEach>
								   </c:if>
								</select>
							</div>
			
							<div class="form-group">
								<label>Hình ảnh</label>
								<span style="color: red; font-style: italic">${lError}</span>
								<input type="file" name="image" class="btn btn-default" id="exampleInputFile1" accept="image/*">
								<p class="help-block"><em>Định dạng: jpg, png, jpeg,...</em></p>
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