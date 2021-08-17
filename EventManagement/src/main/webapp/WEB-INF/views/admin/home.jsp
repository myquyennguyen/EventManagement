<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Trang quản lý</title>

</head>

<body>

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh sách sự kiện
						<a href=<c:url value="/create"/> class="btn btn-danger" style="float: right;">Thêm sự kiện</a>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
								<thead>
									<tr>
										<th style="width:5%;">ID</th>
										<th style="width:60%;">Sự kiện</th>
										<th style="width:10%;">Vé đã bán</th>
										<th style="width:15%;">Trạng thái</th>
										<th style="width:10%;">Tác vụ</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								<tfoot>
									<tr>
										<th>ID</th>
										<th>Sự kiện</th>
										<th>Vé đã bán</th>
										<th>Trạng thái</th>
										<th>Tác vụ</th>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<div class="card-footer small text-muted">Updated yesterday
						at 11:59 PM</div>
				</div>
				
			</div>
					
<script>
	$(document).ready(function() {
		$.ajax({
					url : 'http://localhost:8080/EventManagement/api/secure/event/',
					type : 'GET',
					contentType : 'application/json',
					dataType : 'json',
					success : function(result) {
						var table = $('#dataTable').DataTable();
						var data = new Array();
						result.forEach(function(element) {
							var dates = element.startDate.split('-');
							var date = dates[2]+'-'+dates[1]+'-'+dates[0];
							var item = [
								''+element.eventId,
								'<b>'+element.name+'</b><br>'+date+'&nbsp;'+element.startTime+'<br>'+element.venuename,
								element.sold+'/'+element.tickets,
								'</td><td>'+element.status,
							//	'<i class="fas fa-ellipsis-v"></i><a href=<c:url value="/event/'+element.eventId+'" /> class="btn btn-primary btn-sm">Xem</a>&nbsp;<a href="" class="btn btn-warning btn-sm">Dừng đăng kí</a>&nbsp;<a href="" class="btn btn-danger btn-sm" >Xóa</a>'
								'<ul class="navbar-nav ml-auto"><li class="nav-item dropdown no-arrow mx-1">'
			+'<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown"'
			+'role="button" data-toggle="dropdown" aria-haspopup="true"'
			+'aria-expanded="false"> <i class="fas fa-ellipsis-v"></i></a>'
			+'<div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">'
				+'<a class="dropdown-item" href=<c:url value="/event/'+element.eventId+'"/>>Xem</a>'
				+'<button class="dropdown-item btn_cancel" data-id="'+element.eventId+'">Dừng đăng ký</button>'
				+'<button class="dropdown-item btn_publish" data-id="'+element.eventId+'">Hiển thị công khai</button>'
				+'<button class="dropdown-item btn_draft" data-id="'+element.eventId+'">Hiển thị riêng</button>'
				+'<button class="dropdown-item btn_delete" data-id="'+element.eventId+'">Xóa</button>'
			+'</div></li></ul>'
								];
							table.row.add(item).draw(false);
							/*
							$("#tablebody").append('<tr><td>'+element.eventId
													+'</td><td><b>'+element.name+'</b><br>'+date+'&nbsp;'+element.startTime+'<br>'+element.venuename
													+'</td><td>'+element.sold+'/'+element.tickets
													+'</td><td>'+element.status
													+'</td><td><a href=<c:url value="/event/'+element.eventId+'" /> class="btn btn-primary btn-sm">Xem</a>&nbsp;<a href="" class="btn btn-warning btn-sm">Dừng đăng kí</a>&nbsp;<a href="" class="btn btn-danger btn-sm" >Xóa</a></td></tr>'
													); */
							
						});
					},
					error : function(error) {
						alert("Xảy ra lỗi khi load dữ liệu!");
					},
		});
		
		$(document).on('click', '.btn_cancel' ,function(){
			data = 'Cancelled';
			$.ajax({
				url: 'http://localhost:8080/EventManagement/api/private/event/cancel/'+ $(this).attr('data-id'),
				type: 'POST',
				contentType: 'application/json',
				dataType: 'json',
				data: data,
				success: function(result){
					location.reload();
				},
				error: function(e){
					alert('Xảy ra lỗi!');
				}
			});
		});
		$(document).on('click', '.btn_publish' ,function(){
			data = 'Published';
			$.ajax({
				url: 'http://localhost:8080/EventManagement/api/private/event/cancel/'+ $(this).attr('data-id'),
				type: 'POST',
				contentType: 'application/json',
				dataType: 'json',
				data: data,
				success: function(result){
					location.reload();
				},
				error: function(e){
					alert('Xảy ra lỗi!');
				}
			});
		});
		$(document).on('click', '.btn_draft' ,function(){
			data = 'Draft';
			$.ajax({
				url: 'http://localhost:8080/EventManagement/api/private/event/cancel/'+ $(this).attr('data-id'),
				type: 'POST',
				contentType: 'application/json',
				dataType: 'json',
				data: data,
				success: function(result){
					location.reload();
				},
				error: function(e){
					alert('Xảy ra lỗi!');
				}
			});
		});
		$(document).on('click', '.btn_delete' ,function(){
			result = confirm("Bạn có thật sự muốn xóa sự kiện này?");
			if(result)
				$.ajax({
					url: 'http://localhost:8080/EventManagement/api/private/event/delete/'+ $(this).attr('data-id'),
					type: 'DELETE',
					//contentType: 'application/json',
					//dataType: 'json',
					success: function(result){
						location.reload();
						alert("Xóa thành công!");
					},
					error: function(e){
						alert('Không thể xóa sự kiện này!');
					}
				});
		});
});
	</script>
</body>

</html>