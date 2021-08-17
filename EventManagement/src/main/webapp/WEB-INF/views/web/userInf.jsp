<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<header>
	</header>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">	
					<i class="fas fa-user-check"></i>&nbsp;Họ và tên:&nbsp;<label id="full_name">${user.fullName}</label><br>
					<i class="fas fa-phone-square"></i>&nbsp;Số điện thoại:&nbsp;<label id="phone_number">${user.phoneNumber}</label><br>
					<i class="fas fa-map-marker-alt"></i>&nbsp;Địa chỉ:&nbsp;<label id="address_">${user.address}</label><br>
					<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#updateInfModal">Cập nhật thông tin</button>
					<hr>
				</div>
				<div class="col-sm-12">
					<h2>Lịch sử mua vé</h2>
					<table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
						<thead>
							<tr>
								<td>STT</td>
								<td>Sự kiện</td>
								<td>Số lượng vé</td>
								<td>Tổng tiền</td>
								<td>Ngày mua</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${events}" var="event">
								<tr>
									<td>1</td>
									<td>${event.eventName}</td>
									<td>${event.countTickets}</td>
									<td>${event.countMoney}</td>
									<td>${event.dateRegister}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td>STT</td>
								<td>Sự kiện</td>
								<td>Số lượng vé</td>
								<td>Tổng tiền</td>
								<td>Ngày mua</td>
							</tr>
						</tfoot>
					</table>
				</div>
<div class="modal fade" id="updateInfModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Cập nhật thông tin người dùng</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        	<table>
        		<tr>
        			<td>Họ và tên</td><td><input type="text" name="fullName" id="fullName" class="form-control" value="${user.fullName}"></td>
        		</tr>
        		<tr>
        			<td>Số điện thoại</td><td><input type="text" name="phoneNumber" id="phoneNumber" class="form-control" value="${user.phoneNumber}"></td>
        		</tr>
        		<tr>
        			<td>Địa chỉ</td><td><input type="text" name="address" id="address" class="form-control" value="${user.address}"></td>
        		</tr>
        		<tr id="password">
        			<td>Mật khẩu mới</td><td><input type="password" name="inputPassword" id="inputPassword" class="form-control"></td>
        		</tr>
        		<tr id="confpassword">
        			<td>Xác nhận lại mật khẩu</td><td><input type="password" name="confirmPassword" id="confirmPassword" class="form-control"></td>
        		</tr>
        		<tr id="confpassword">
        			<td></td><td><input type="checkbox" value="" id="checkboxPassword">&nbsp;Đổi mật khẩu</td>
        		</tr>
        	</table>
        	
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" id="btnUpdate">Cập nhật</button>
        </div>
      </div>
    </div>
  </div>
			</div>
		</div>
<script>
	$(document).ready(function(){
  		function checkInf(password, confpassword, phoneNumber){
  			if(confpassword != password) return 1;
  			if (password.indexOf(' ') != -1 ) return 2;
  			const isNumeric = /^\d+$/;
  			if(isNumeric.test(phoneNumber) == false) return 3;
  			return 0;
  		}
		$('#password').hide('fast');
		$('#confpassword').hide('fast');
		$('#checkboxPassword').change(function(){
			if($('#checkboxPassword').is(':checked')){
				$('#password').show('fast');
				$('#confpassword').show('fast');
			}
			else{
				$('#password').hide('fast');
				$('#confpassword').hide('fast');
			}
		});
		
		$('#btnUpdate').on('click', function(){
	  		var password = $('#inputPassword').val().trim();
	  		var confpassword = $('#confirmPassword').val().trim();
	  		var fullName = $('#fullName').val().trim();
	  		var phoneNumber = $('#phoneNumber').val().trim();
	  		var address = $('#address').val().trim();
			if(checkInf(password, confpassword, phoneNumber) == 0){
			var data = {
				userName : '${username}',
				password : password,
				fullName : fullName,
				address : address,
				phoneNumber : phoneNumber
				};
  			$.ajax({
  				url: "http://localhost:8080/EventManagement/api/public/user/update",
  				type: "POST",
  				contentType: "application/json",
  				data: JSON.stringify(data),
  				dataType: "json",
  				success: function(result){
  					alert("Cập nhật thành công!");
  					$('#updateInfModal').modal('hide');
  					$('#full_name').empty();
  					$('#full_name').append(fullName);
  					$('#phone_number').empty();
  					$('#phone_number').append(phoneNumber);
  					$('#address_').empty();
  					$('#address_').append(address);
  				},
  				error: function(e){
  					alert("Xảy ra lỗi!");
  				}
  			});
			}
			else{
				if(checkInf(password, confpassword, phoneNumber) == 1)
					alert('Xác nhận mật khẩu chưa đúng!');
				if(checkInf(password, confpassword, phoneNumber) == 2)
					alert('Mật khẩu không được chứa khoảng trắng!');
				if(checkInf(password, confpassword, phoneNumber) == 3)
					alert('Số điện thoại chưa hợp lệ!');
			}
		});
		
	});
</script>
	</body>
</html>