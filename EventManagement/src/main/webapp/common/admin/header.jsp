<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

	<a class="navbar-brand mr-1" href="index.html">Trang quản lý</a>

	<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>

	<!-- Navbar Search -->
 <form
		class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
		<div class="input-group">

		</div>
	</form> 

	<!-- Navbar -->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <span
				class="badge badge-danger">9+</span>
		</a>
			<!-- <div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="alertsDropdown">
				<a class="dropdown-item" href="#">Đăng xuất</a> <a
					class="dropdown-item" href="#">Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Something else here</a>
			</div>--></li>
		<li class="nav-item dropdown no-arrow mx-1"><a
			class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i> <span
				class="badge badge-danger"></span>
		</a>
		<!-- 	<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="messagesDropdown">
				<a class="dropdown-item" href="#">Action</a> <a
					class="dropdown-item" href="#">Another action</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#">Something else here</a>
			</div> -->
			</li>
		<li class="nav-item dropdown no-arrow"><a
			class="nav-link dropdown-toggle" href="#" id="userDropdown"
			role="button" data-toggle="dropdown" aria-haspopup="true"
			aria-expanded="false"> <i class="fas fa-user-circle fa-fw"></i>
		</a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#logoutModal">Đăng xuất</a>
				<a class="dropdown-item" href="#" data-toggle="modal"
					data-target="#changePasswordModal">Đổi mật khẩu</a>
			</div>
		</li>
	</ul>

</nav>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Bạn muốn đăng xuất?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-footer">
					<a class="btn btn-primary" href=<c:url value="/j_spring_security_logout"/>>Đăng xuất</a>
				</div>
			</div>
		</div>
	</div>
	
		<!-- Change password Modal-->
	<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Cập nhật mật khẩu</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td>Mật khẩu mới</td><td><input type="password" id="password" class="form-control"></td>
						</tr>
						<tr>
							<td>Xác nhận lại mật khẩu</td><td><input type="password" id="confpassword" class="form-control"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" id="btnChangePassword">Cập nhật</button>
				</div>
			</div>
		</div>
	</div>
<script>
	function checkPassword(password, confpassword){
		if(confpassword != password) return 1;
		if (password.indexOf(' ') != -1 ) return 2;
		return 0;
	}
	$(document).ready(function(){
		$('#btnChangePassword').on('click', function(){
			var password = $('#password').val();
			var confpassword = $('#confpassword').val();
			if(checkPassword(password, confpassword) == 0){
				var data = {
						userName: 'admin',
						password: password,
				};
				$.ajax({
					url: 'http://localhost:8080/EventManagement/api/admin/changePassword',
					type: 'POST',
					contentType: 'application/json',
					dataType: 'json',
					data: JSON.stringify(data),
					success: function(result){
						alert("Cập nhật thành công!");
						$('#changePasswordModal').modal('hide');
					},
					error: function(e){
						alert("Xảy ra lỗi!");
					}
				});
			}
			else{
				if(checkPassword(password, confpassword) == 1) alert("Xác nhận lại mật khẩu!");
				if(checkPassword(password, confpassword) == 2) alert("Mật khẩu không chứa khoảng trắng!");
			}
		});
	});
</script>