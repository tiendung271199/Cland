<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm danh mục</div>
		</div>
		<div class="content-box-large box-with-header">
			<form action="${urlCat}/add" method="post" >
				<div>
					<div class="row mb-10"></div>
					
					<div class="row">
						<div class="col-sm-6">
							<c:if test="${not empty cError}">
								<div class="alert alert-danger" role="alert">
								    ${cError}
								</div>
							</c:if>
						
							<div class="form-group">
								<label for="name">Tên danh mục</label>
								<form:errors path="category.cname" cssStyle="color:red;font-style:italic" ></form:errors>
								<input type="text" name="cname" class="form-control" placeholder="Nhập tên danh mục">
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