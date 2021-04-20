<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Thêm người dùng</div>
		</div>
		<div class="content-box-large box-with-header">
			<form action="${urlUser}/add" method="post">
				<div>
					<div class="row mb-10"></div>
					<div class="row">
						<div class="col-sm-6">
							<c:if test="${not empty uError}">
								<div class="alert alert-danger" role="alert">
								    ${uError}
								</div>
							</c:if>
						
							<div class="form-group">
								<label for="username">Username</label>
								<form:errors path="userError.username" cssStyle="color:red;font-style:italic" ></form:errors>
								<input type="text" name="username" value="${objUser.username}" class="form-control" placeholder="Nhập username">
							</div>
							
							<div class="form-group">
								<label for="password">Password</label>
								<form:errors path="userError.password" cssStyle="color:red;font-style:italic" ></form:errors>
								<input type="text" name="password" value="${objUser.password}" class="form-control" placeholder="Nhập password">
							</div>
							
							<div class="form-group">
								<label for="fullname">Fullname</label>
								<form:errors path="userError.fullname" cssStyle="color:red;font-style:italic" ></form:errors>
								<input type="text" name="fullname" value="${objUser.fullname}" class="form-control" placeholder="Nhập fullname">
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