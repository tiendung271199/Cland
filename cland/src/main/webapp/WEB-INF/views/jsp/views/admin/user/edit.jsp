<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp" %>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Cập nhật người dùng</div>
		</div>
		<div class="content-box-large box-with-header">
			<c:choose>
				<c:when test="${not empty objUser}">
					<form action="" method="post" id="form_user_edit" >
						<div>
							<div class="row mb-10"></div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<label for="username">Username</label>
										<form:errors path="userError.username" cssStyle="color:red;font-style:italic" ></form:errors>
										<input type="text" name="username" value="${objUser.username}" class="form-control" placeholder="Nhập username" />
									</div>
									
									<div class="form-group">
										<label for="password">Password</label>
										<form:errors path="userError.password" cssStyle="color:red;font-style:italic" ></form:errors>
										<input type="password" name="password" value="" class="form-control" placeholder="Nhập password" />
									</div>
									
									<div class="form-group">
										<label for="fullname">Fullname</label>
										<form:errors path="userError.fullname" cssStyle="color:red;font-style:italic" ></form:errors>
										<input type="text" name="fullname" value="${objUser.fullname}" class="form-control" placeholder="Nhập fullname" />
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
				</c:when>
				<c:otherwise>
					<div class="alert alert-warning" role="alert">
					    Không có dữ liệu
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function (){
		$('#form_user_edit').validate({
			rules:{
				"username":{
					required: true,
					minlength: 5,
					maxlength: 20,
				},
				"fullname":{
					required: true,
					minlength: 6,
					maxlength: 30,
				},
				"password":{
					minlength: 6,
					maxlength: 16,
				}
			},
			messages:{
				"username":{
					required: "Bắt buộc",
					minlength: "Tên danh mục tối thiểu 5 ký tự",
					maxlength: "Tên danh mục tối đa 20 ký tự",
				},
				"fullname":{
					required: "Bắt buộc",
					minlength: "Tên danh mục tối thiểu 6 ký tự",
					maxlength: "Tên danh mục tối đa 30 ký tự",
				},
				"password":{
					minlength: "Tên danh mục tối thiểu 6 ký tự",
					maxlength: "Tên danh mục tối đa 16 ký tự",
				}
			}
		})
	})
</script>

<script type="text/javascript">
	document.getElementById("func_user").className = "current";
</script>