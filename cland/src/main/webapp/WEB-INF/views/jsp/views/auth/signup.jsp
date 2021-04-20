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
					
					<form action="" method="post">
		                <div class="form-group">
		                	<label class="text-left pull-left" for="username">Tên đăng nhập</label>
		                	<form:errors path="userError.username" cssStyle="color:red;font-style:italic" ></form:errors>
		               		<input class="form-control" name="username" value="" type="text" placeholder="Username">
		                </div>
		                
		                <div class="form-group">
		                	<label class="text-left pull-left" for="password">Mật khẩu</label>
		                	<form:errors path="userError.password" cssStyle="color:red;font-style:italic" ></form:errors>
		                	<input class="form-control" name="password" type="password" placeholder="Password">
		                </div>
		                
		                <div class="form-group">
		                	<label class="text-left pull-left" for="fullname">Họ tên</label>
		                	<form:errors path="userError.fullname" cssStyle="color:red;font-style:italic" ></form:errors>
		                	<input class="form-control" name="fullname" value="" type="text" placeholder="Fullname">
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