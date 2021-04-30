<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="login-wrapper">
	        <div class="box">
	            <div class="content-wrap">
	            	<img width="100px" height="100px" class="img-circle" src="${contextPath}/images/icon-180x180.png">
	                <h6>Đăng ký</h6>
					
					<form action="" method="post" id="form_signup" >
						<c:if test="${not empty signupError}">
							<div class="alert alert-danger" role="alert">
							    ${signupError}
							</div>
						</c:if>
						
		                <div class="form-group">
		                	<label class="text-left pull-left" for="username">Tên đăng nhập</label>
		                	<form:errors path="userError.username" cssStyle="color:red;font-style:italic" ></form:errors>
		               		<input class="form-control" name="username" value="${objUser.username}" type="text" placeholder="Username">
		                </div>
		                
		                <div class="form-group">
		                	<label class="text-left pull-left" for="password">Mật khẩu</label>
		                	<form:errors path="userError.password" cssStyle="color:red;font-style:italic" ></form:errors>
		                	<input class="form-control" name="password" type="password" placeholder="Password">
		                </div>
		                
		                <div class="form-group">
		                	<label class="text-left pull-left" for="fullname">Họ tên</label>
		                	<form:errors path="userError.fullname" cssStyle="color:red;font-style:italic" ></form:errors>
		                	<input class="form-control" name="fullname" value="${objUser.fullname}" type="text" placeholder="Fullname">
		                </div>
		                
		                <div class="row" style="margin-top: 30px">
							<div class="col-sm-12">
								<input type="submit" value="Signup" class="btn btn-primary signup btn-block" />
							</div>
						</div>
	                </form>
	                
	            </div>
	        </div>

	        <div class="already">
	            <p>Do you already have an account?</p>
	            <a href="${urlAuth}/login">Login</a>
	        </div>
	    </div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function (){
		$('#form_signup').validate({
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
					required: true,
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
					required: "Bắt buộc",
					minlength: "Tên danh mục tối thiểu 6 ký tự",
					maxlength: "Tên danh mục tối đa 16 ký tự",
				}
			}
		})
	})
</script>