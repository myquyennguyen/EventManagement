<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<title>Trang chủ</title>
</head>

<body>
<div class="container">
	<div class="row">
		<div class="col-md-7">
			  <div id="map">
			  ${event.map}
			  </div>
		</div>
		<div class="col-md-5">
			<h3>Thời gian và địa điểm </h3>
			<i class="far fa-clock"></i>&nbsp;Thời gian bắt đầu:&nbsp;<label id="start_time"></label><br>
			<i class="fas fa-clock"></i>&nbsp;Thời gian kết thúc:&nbsp;<label id="end_time"></label><br>
			<i class="fas fa-map-marker-alt"></i>&nbsp;Địa điểm:&nbsp;<label id="location">${event.venuename}</label> <br>
			<i class="fas fa-dollar-sign"></i>&nbsp;Giá vé: &nbsp;<label id="fee">${event.fee}</label><br>
			<i class="fas fa-ticket-alt"></i>&nbsp;Vé đã bán: &nbsp;<label id="tickets">${event.sold}/${event.tickets}</label><br>
			<i class="fas fa-star"></i>&nbsp;Trạng thái: &nbsp;<label id="status">${event.status}</label><br>
			<a  class="btn btn-warning btn-sm" id="btnedit">Chỉnh sửa</a>
			<button class="btn btn-primary btn-sm" id="saveEvent">Lưu</button>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
				<br><h1 id="event_name">${event.name}</h1>
			  	<div id="description">${event.description}</div>
			  	<hr>
			  	<h4>Thông tin mở rộng</h4>
			  	<div id="advanceddetails">${event.advancedDetails}</div>
			  	<div id="header" hidden>${event.header}</div>
		</div>
	</div>
	</div>
	<script>
		var startTime = '${event.startDate}'.split("-");
		var start_time = startTime[2]+'/'+startTime[1]+'/'+startTime[0]+'  '+'${event.startTime}';
		var endTime = '${event.endDate}'.split("-");
		var end_time = endTime[2]+'/'+endTime[1]+'/'+endTime[0]+'  '+'${event.endTime}';
		$('#start_time').append(start_time);
		$('#end_time').append(end_time);
		var id = ${event.eventId};
		$(document).ready(function(){
		if(id==0)
			$('#btnedit').attr('href', '<c:url value="/create/edit"/>');
		else
			$('#btnedit').attr('href', '<c:url value="/edit/${event.eventId}/edit"/>');
		$('#saveEvent').on('click', function(){
			var data = {
					eventId: ${event.eventId},
					name: '${event.name}',
					startDate: '${event.startDate}',
					startTime: '${event.startTime}',
					endDate: '${event.endDate}',
					endTime: '${event.endTime}',
					venuename: '${event.venuename}',
					map: '${event.map}',
					fee: '${event.fee}',
					description: $('#description').html(),
					tickets: ${event.tickets},
					sold: ${event.sold},
					status: '${event.status}',
					header: $('#header').html(),
					advancedDetails: $('#advanceddetails').html()
			};
			if(id==0){
			$.ajax({
				url: "http://localhost:8080/EventManagement/api/private/newevent",
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify(data),
				dataType: "json",
				success: function(result){
					alert("Sự kiện được tạo thành công!");
					window.location.href="http://localhost:8080/EventManagement/create";
				},
				error: function(e){
					alert("Xảy ra lỗi!");
				}
			});
			}
			else{
				$.ajax({
					url: "http://localhost:8080/EventManagement/api/private/update",
					type: "PUT",
					contentType: "application/json",
					data: JSON.stringify(data),
					dataType: "json",
					success: function(result){
						alert("Cập nhật sự kiện thành công!");
						window.location.href="http://localhost:8080/EventManagement/event/"+id;
					},
					error: function(e){
						alert("Xảy ra lỗi!");
					}
				});
			}
		});

		});
	</script>
	</body>
	</html>