<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Danh sách khách hàng</title>

</head>

<body>

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Danh sách khách hàng
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" width="100%" id="dataTable" cellspacing="0">
								<thead>
									<tr>
										<th style="width:5%;">STT</th>
										<th style="width:20%;">Họ tên</th>
										<th style="width:10%;">Số điện thoại</th>
										<th style="width:45%;">Địa chỉ</th>
										<th style="width:10%;">Số lượng vé</th>
										<th style="width:10%;">Tổng tiền</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
								<tfoot>
									<tr>
										<th>STT</th>
										<th>Họ tên</th>
										<th>Số điện thoại</th>
										<th>Địa chỉ</th>
										<th>Số lượng vé</th>
										<th>Tổng tiền</th>
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
				$(document).ready(function(){
					$.ajax({
						url: 'http://localhost:8080/EventManagement/api/private/event/listcustomers/${id}',
						type : 'GET',
						contentType : 'application/json',
						dataType : 'json',
						success : function(result){
							var stt = 1;
							var table = $('#dataTable').DataTable();
							result.forEach(function(element){
								var item = [
									stt,
									element.fullName,
									element.phoneNumber,
									element.address,
									element.countTickets,
									element.countMoney
								];
								stt++;
								table.row.add(item).draw(false);
							});
						},
						error: function(e){
							alert("loi");
						}
					});
				});
			</script>
	</body>
</html>