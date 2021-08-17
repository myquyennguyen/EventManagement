<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Home Page</title>

</head>

<body>	
	<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-table"></i> Tạo sự kiện mới
					</div>
					<div class="card-body">	
						<form method="POST" action=<c:url value="/review" /> id="createevent">
							<table align="center" style="width: 70%;">
								<tr>
									<td colspan="2">Tên sự kiện<input type="text" name="name" id="name" class="text form-control" required></td>
								</tr>
								<tr>
									<td>Số lượng vé<input type="text" name="tickets" id="tickets" class="text form-control" ></td><td>Giá vé<input type="text" name="fee" id="fee" class="text form-control"></td>
								</tr>
								<tr>
									<td colspan="2">Địa điểm<input type="text" name="location" id="location" class="text form-control" required></td>
								</tr>
								<tr>
									<td colspan="2"><a href="https://www.google.com/maps/" target="_blank" data-c-tooltip="Tìm trên Google Maps và thực hiện sao chép HTML">Bản đồ</a><input type="text" name="map" id="map" class="text form-control" required></td>
								</tr>
								<tr>
									<td>Thời gian bắt đầu<input type="date" name="startdate" id="startdate" class="date form-control" required></td><td>Giờ<input type="time" name="starthour" id="starthour" class="time form-control" required></td>
								</tr>
								<tr>
									<td>Thời gian kết thúc<input type="date" name="enddate" id="enddate" class="date form-control"></td><td>Giờ<input type="time" name="endhour" id="endhour" class="time form-control" placeholder="00:00"></td>
								</tr>
								<tr>
									<td colspan="2">Mô tả ngắn<textarea name="header" id="header" class="text form-control" rows="4"></textarea></td>
								</tr>
								<tr>
									<td colspan="2">Mô tả chi tiết<textarea name="descripttion" id="description" class="text form-control" rows="10"></textarea></td>
								</tr>
								<tr>
									<td colspan="2">Thông tin mở rộng<textarea name="advance" id="advance" class="text form-control" rows="4"></textarea></td>
								</tr>
								<tr>
									<td style="text-align:right;"><a id="resetform" class="btn btn-danger" style="color: white;">Hủy</a></td><td><button id="review" class="btn btn-success">Xem trước</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>

			</div>
			<!-- /.container-fluid -->

			<!-- Sticky Footer -->


		</div>
		<!-- /.content-wrapper -->
		<div id="headerhidden" hidden>${event.header}</div>
		<div id="descriptionhidden" hidden>${event.description}</div>
		<div id="advancehidden" hidden>${event.advancedDetails}</div>
	
	<!-- /#wrapper -->
	<script>
    	CKEDITOR.config.language = 'vi';
    	CKEDITOR.config.EncodeOutput = false;
    	CKEDITOR.config.ProcessHTMLEntities = false ;
    	CKEDITOR.config.entities = false;
	 	CKEDITOR.replace( 'description', {
	 		filebrowserUploadUrl : '/EventManagement/upload_ckeditor'
	 	} );
	 	CKEDITOR.replace('header');
	 	CKEDITOR.replace('advance');
		$(document).ready(function(){
			var id = ${id};
			if(id < 0){
				$('#name').val('${event.name}');
				$('#fee').val('${event.fee}');
				$('#tickets').val('${event.tickets}');
				$('#location').val('${event.venuename}');
				$('#map').val('${event.map}');
				$('#startdate').val('${event.startDate}');
				$('#starthour').val('${event.startTime}');
				$('#enddate').val('${event.endDate}');
				$('#endhour').val('${event.endTime}');
				$('#header').val($('#headerhidden').html());
				$('#description').val($('#descriptionhidden').html());
				$('#advance').val($('#advancehidden').html());
			}
			$('form').submit(function(event) {
				event.preventDefault();
				var data = {
						name: $('#name').val(),
						startDate: $('#startdate').val(),
						startTime: $('#starthour').val(),
						endDate: $('#enddate').val(),
						endTime: $('#endhour').val(),
						venuename: $('#location').val(),
						map: $('#map').val(),
						fee: $('#fee').val(),
						description: CKEDITOR.instances.description.getData(),
						tickets: $('#tickets').val(),
						sold: 0,
						status: 'Draft',
						header: CKEDITOR.instances.header.getData(),
						advancedDetails: CKEDITOR.instances.advance.getData()
				};
				$.ajax({
					url: "http://localhost:8080/EventManagement/review",
			        type: "POST",
			        contentType: "application/json",
			        dataType: "json",
			        data: JSON.stringify(data),
			        complete: function(){
			        	window.location.href="http://localhost:8080/EventManagement/view/review";
			        }
				});
		});
			$('#resetform').on('click', function(){
				$('#name').val('');
				$('#fee').val('');
				$('#tickets').val('');
				$('#location').val('');
				$('#map').val('');
				$('#startdate').val('');
				$('#starthour').val('');
				$('#enddate').val('');
				$('#endhour').val('');
				CKEDITOR.instances.description.setData('');
				CKEDITOR.instances.header.setData('');
				CKEDITOR.instances.advance.setData('');
				$.ajax({
					url: "http://localhost:8080/EventManagement/removesession",
			        type: "GET",
			        contentType: "application/json",
			        dataType: "json",
			        complete: function(){
			        }
				});
			});
	});
	</script>
</body>
</html>