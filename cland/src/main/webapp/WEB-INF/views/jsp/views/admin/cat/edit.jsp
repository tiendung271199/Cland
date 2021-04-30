<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="row">
	<div class="col-md-12 panel-info">
		<div class="content-box-header panel-heading">
			<div class="panel-title ">Cập nhật danh mục</div>
		</div>
		<div class="content-box-large box-with-header">
			<c:choose>
				<c:when test="${not empty objCat}">
					<form action="" method="post" id="form_cat_edit" >
						<div>
							<div class="row mb-10"></div>
							<div class="row">
								<div class="col-sm-6">
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
		$('#form_cat_edit').validate({
			rules:{
				"cname":{
					required: true,
					minlength: 6,
					maxlength: 40,
				}
			},
			messages:{
				"cname":{
					required: "Bắt buộc",
					minlength: "Tên danh mục tối thiểu 6 ký tự",
					maxlength: "Tên danh mục tối đa 40 ký tự",
				}
			}
		})
	})
</script>

<script type="text/javascript">
	document.getElementById("func_category").className = "current";
</script>