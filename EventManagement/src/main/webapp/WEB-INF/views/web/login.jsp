<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
</head>

<body class="bg-dark">

  <div class="container" id="wrap">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Đăng nhập</div>
      <div class="card-body">
        <form action="<c:url value='j_spring_security_login'/>" method='POST'>
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" name="username"class="form-control" placeholder="Tên đăng nhập" required>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" name="password" class="form-control" placeholder="Mật khẩu" required>
            </div>
          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Ghi nhớ mật khẩu
              </label>
            </div>
          </div>
          <button class="btn btn-primary btn-block" >Đăng nhập</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="register.html">Đăng kí</a>
          <a class="d-block small" href="forgot-password.html">Quên mật khẩu?</a>
        </div>
      </div>
    </div>
	</div>
</body>

</html>
