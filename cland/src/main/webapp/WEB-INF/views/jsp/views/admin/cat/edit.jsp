<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Cập nhật danh mục</div>
		</div>
		<div class="content-box-large box-with-header">
			<c:if test="${not empty objCat}">
				<form action="${urlCat}/edit" method="post" >
					<div>
						<div class="row mb-10"></div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="id">ID danh mục</label>
									<input type="text" name="cid" class="form-control" value="${objCat.cid}" readonly="readonly">
								</div>
								<div class="form-group">
									<label for="name">Tên danh mục</label>
									<form:errors path="catError.cname" cssStyle="color:red;font-style:italic" ></form:errors>
									<input type="text" name="cname" class="form-control" value="${objCat.cname}" placeholder="Nhập tên danh mục">
								</div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<input type="submit" value="Cập nhật" class="btn btn-success" />
								<input type="reset" value="Nhập lại" class="btn btn-default" />
							</div>
						</div>
					</div>
				</form>
			</c:if>
		</div>
	</div>
</div>