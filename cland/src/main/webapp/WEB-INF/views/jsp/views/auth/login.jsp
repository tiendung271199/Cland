<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="login-wrapper">
	        <div class="box">
	            <div class="content-wrap">
	            	<img width="100px" height="100px" class="img-circle" src="${contextPath}/images/icon-180x180.png">
	                <h6>Đăng nhập</h6>
					
					<form action="" method="post">
						<div class="form-group">
							<p style="color:red; font-style:italic">${loginError}</p>
						</div>
		                <div class="form-group">
		                	<label class="text-left pull-left" for="username">Tên đăng nhập</label>
		               		<input class="form-control" name="username" value="" type="text" placeholder="Username">
		                </div>
		                
		                <div class="form-group">
		                	<label class="text-left pull-left" for="password">Mật khẩu</label>
		                	<input class="form-control" name="password" type="password" placeholder="Password">
		                </div>
		                
		                <div class="row" style="margin-top: 30px">
							<div class="col-sm-12">
								<input type="submit" value="Login" class="btn btn-primary signup btn-block" />
							</div>
						</div>
	                </form>
	                
	            </div>
	        </div>

	        <div class="already">
	            <p>Don't have an account yet?</p>
	            <a href="${urlAuth}/signup">Sign Up</a>
	        </div>
	    </div>
	</div>
</div>