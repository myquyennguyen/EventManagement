<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="header">
	<div class="container">
		<a class="navbar-brand" href="#"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href=<c:url value="/trang-chu"/>><i class="fas fa-home"></i>&nbsp;Trang chủ
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active dropdown"><a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><label id="account"><i class="fas fa-user"></i>&nbsp;Tài khoản</label></a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          				<a class="dropdown-item" id="login" href=<c:url value="/login" /> ><label>Đăng nhập</label></a>
          				<a class="dropdown-item"  id="register" href=<c:url value="/dang-ky" />><label>Đăng ký</label></a>
          				<a class="dropdown-item"  id="userInf" href=<c:url value="/thong-tin-nguoi-dung/${username}" />><label>Thông tin người dùng</label></a>
          				<a class="dropdown-item" id="logout" data-toggle="modal" data-target="#logoutModal"><label >Đăng xuất</label></a>
        			</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-tty"></i>&nbsp;Liên hệ</a></li>
			</ul>
		</div>
	</div>
</nav>

  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Bạn muốn đăng xuất?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-footer">
          <a class="btn btn-primary"  href=<c:url value="/j_spring_security_logout" />>Đăng xuất</a>
        </div>
      </div>
    </div>
  </div>
  