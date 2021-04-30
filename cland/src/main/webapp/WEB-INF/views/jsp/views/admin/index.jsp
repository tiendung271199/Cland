<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-md-12 panel-warning">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Dashboard</div>
		</div>
		<div class="content-box-large box-with-header">
		   <div class="row">
	           <div class="col-md-4 col-sm-4 col-xs-4">
	               <div class="panel panel-back noti-box">
	                   <span class="icon-box bg-color-green set-icon">
	                   <span class="glyphicon glyphicon-th-list"></span>
	               </span>
	                   <div class="text-box">
	                       <p class="main-text"><a class="fs-14" href="${urlCat}" title="">Quản lý danh mục</a></p>
	                       <p class="text-muted">Có ${totalRowCat} danh mục</p>
	                   </div>
	               </div>
	           </div>
	           <div class="col-md-4 col-sm-4 col-xs-4">
	               <div class="panel panel-back noti-box">
	                   <span class="icon-box bg-color-blue set-icon">
	                   <span class="glyphicon glyphicon-book"></span>
	               </span>
	                   <div class="text-box">
	                       <p class="main-text"><a class="fs-14" href="${urlLand}" title="">Quản lý land</a></p>
	                       <p class="text-muted">Có ${totalRowLand} tin</p>
	                   </div>
	               </div>
	           </div>
	           <div class="col-md-4 col-sm-4 col-xs-4">
	               <div class="panel panel-back noti-box">
	                   <span class="icon-box bg-color-brown set-icon">
	                   <span class="glyphicon glyphicon-user"></span>
	               </span>
	                   <div class="text-box">
	                       <p class="main-text"><a class="fs-14" href="${urlUser}" title="">Quản lý người dùng</a></p>
	                       <p class="text-muted">Có ${totalRowUser} người dùng</p>
	                   </div>
	               </div>
	           </div>
       	   </div>
	   </div>
	</div>
</div>	

<div class="row">
	<div class="col-md-6">
		<div class="content-box-large">
			<div class="panel-heading">
				<div class="panel-title">Chào mừng đến với trang quản trị</div>
				
				<div class="panel-options">
					<a href="#" data-rel="collapse"><i class="glyphicon glyphicon-refresh"></i></a>
					<a href="#" data-rel="reload"><i class="glyphicon glyphicon-cog"></i></a>
				</div>
			</div>
			<div class="panel-body">
	 			Chào mừng bạn đến với trang quản trị Cland
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="row">
			<div class="col-md-12">
				<div class="content-box-header">
					<div class="panel-title">Hướng dẫn sử dụng</div>
 				</div>
 				<div class="content-box-large box-with-header">
 					Trang quản trị có một số chức năng: Quản lý danh mục, quản lý tin, quản lý liện hệ, quản lý người dùng
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="content-box-header">
					<div class="panel-title">Nội quy</div>
 				</div>
	 			<div class="content-box-large box-with-header">
	 				Nội quy trang quản trị Cland
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	document.getElementById("func_index").className = "current";
</script>