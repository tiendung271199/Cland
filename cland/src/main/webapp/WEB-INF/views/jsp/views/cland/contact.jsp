<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jsp/components/taglib.jsp"%>
<div class="clearfix main_content floatleft">
	<div class="clearfix content">
		<div class="contact_us">
			<h1>Liên hệ với chúng tôi</h1>
			
			<p>
				TRUNG TÂM ĐÀO TẠO LẬP TRÌNH VINAENTER EDU<br />
				Trụ sở: 154 Phạm Như Xương, Liên Chiểu, Đà Nẵng<br />
				Web: <a href="http://vinaenter.edu.vn" title="">www.vinaenter.edu.vn</a>
			</p>
			
			<form action="${urlContact}" method="post" id="form_contact" >
				<p style="color: blue; font-style: italic">${sendContactSuccess}</p>
				<p style="color: red; font-style: italic">${sendContactError}</p>
				<form:errors path="ct.fullname" cssStyle="color:red;font-style:italic" ></form:errors><br />
				<p><input type="text" name="fullname" class="wpcf7-text" placeholder="Họ tên *" value="${contact.fullname}" /></p>
				
				<form:errors path="ct.email" cssStyle="color:red;font-style:italic" ></form:errors><br />
				<p><input type="text" name="email" class="wpcf7-email" placeholder="Email *" value="${contact.email}" /></p>
				
				<form:errors path="ct.subject" cssStyle="color:red;font-style:italic" ></form:errors><br />
				<p><input type="text" name="subject" class="wpcf7-text" placeholder="Chủ đề *" value="${contact.subject}" /></p>
				
				<form:errors path="ct.content" cssStyle="color:red;font-style:italic" ></form:errors><br />
				<p><textarea name="content" class="wpcf7-textarea" placeholder="Nội dung *">${contact.content}</textarea></p>
				
				<p><input type="submit" name="submit" class="wpcf7-submit" value="Gửi liên hệ"/></p>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function (){
		$('#form_contact').validate({
			rules:{
				"fullname":{
					required: true,
					minlength: 6,
					maxlength: 30,
				},
				"email":{
					required: true, 
					email: true,
				},
				"subject":{
					required: true,
					maxlength: 50,
				},
				"content":{
					required: true,
				}
			},
			messages:{
				"fullname":{
					required: "Bắt buộc",
					minlength: "Fullname tối thiểu 6 ký tự",
					maxlength: "Fullname tối đa 30 ký tự",
				},
				"email":{
					required: "Bắt buộc",
					email: "Email không đúng định dạng",
				},
				"subject":{
					required: "Bắt buộc",
					maxlength: "Chủ đề tối đa 50 ký tự",
				},
				"content":{
					required: "Bắt buộc",
				}
			}
		})
	})
</script>