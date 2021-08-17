<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Đăng ký</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container" id="wrap">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Đăng kí tài khoản</div>
      <div class="card-body">
        <form>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="username" class="form-control" placeholder="Tên đăng nhập" required autofocus="autofocus">
                  <label for="username">Tên đăng nhập</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="fullName" class="form-control" placeholder="Họ và tên" required>
                  <label for="fullName">Họ và tên</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required>
                  <label for="inputPassword">Mật khẩu</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="confirmPassword" class="form-control" placeholder="Nhập lại mật khẩu" required>
                  <label for="confirmPassword">Nhập lại mật khẩu</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="address" class="form-control" placeholder="Địa chỉ" required>
              <label for="address">Địa chỉ</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="phoneNumber" class="form-control" placeholder="Số điện thoại" required>
              <label for="phoneNumber">Số điện thoại</label>
            </div>
          </div>
          <button class="btn btn-primary btn-block" type="submit" id="register">Đăng kí</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login.html">Đăng nhập</a>
          <a class="d-block small" href="forgot-password.html">Quên mật khẩu?</a>
        </div>
      </div>
    </div>
  </div>
  <script>
  	$(document).ready(function(){
  		
  		$('form').submit(function(event) {
			event.preventDefault();
	  		var username = $('#username').val().trim();
	  		var password = $('#inputPassword').val().trim();
	  		var confpassword = $('#confirmPassword').val().trim();
	  		var fullName = $('#fullName').val().trim();
	  		var phoneNumber = $('#phoneNumber').val().trim();
	  		var address = $('#address').val().trim();
	  		function checkInf(){
	  			if(confpassword != password) return 1;
	  			if(username.indexOf(' ') != -1 || password.indexOf(' ') != -1 ) return 2;
	  			const isNumeric = /^\d+$/;
	  			if(isNumeric.test(phoneNumber) == false) return 3;
	  			return 0;
	  		}
			if(checkInf() == 0){
	  			var data = {
	  					userName: username,
	  					password: password,
	  					fullName: fullName,
	  					address: address,
	  					phoneNumber: phoneNumber,
	  			};
	  			$.ajax({
	  				url: "http://localhost:8080/EventManagement/api/user/create",
	  				type: "POST",
	  				contentType: "application/json",
	  				data: JSON.stringify(data),
	  				dataType: "json",
	  				success: function(result){
	  					alert("Đăng kí tài khoản thành công!");
	  					window.location.href="http://localhost:8080/EventManagement/login";
	  				},
	  				error: function(e){
	  					alert("Tên đăng nhập bị trùng hoặc xảy ra lỗi trong quá trình đăng ký!");
	  				}
	  			})
			}
			else{
				if(checkInf() == 1)
					alert('Xác nhận mật khẩu chưa đúng!');
				if(checkInf() == 2)
					alert('Tên đăng nhập và mật khẩu không được chứa khoảng trắng!');
				if(checkInf() == 3)
					alert('Số điện thoại chưa hợp lệ!');
			}
	  		
  		});
  	});
  </script>

</body>

</html>
