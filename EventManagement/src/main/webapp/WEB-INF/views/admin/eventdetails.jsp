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
			  </div>
		</div>
		<div class="col-md-5">
			<h3>Thời gian và địa điểm </h3>
			<i class="far fa-clock"></i>&nbsp;Thời gian bắt đầu:&nbsp;<label id="start_time"></label><br>
			<i class="fas fa-clock"></i>&nbsp;Thời gian kết thúc:&nbsp;<label id="end_time"></label><br>
			<i class="fas fa-map-marker-alt"></i>&nbsp;Địa điểm:&nbsp;<label id="location"></label> <br>
			<i class="fas fa-dollar-sign"></i>&nbsp;Giá vé: &nbsp;<label id="fee"></label><br>
			<i class="fas fa-ticket-alt"></i>&nbsp;Vé đã bán: &nbsp;<label id="tickets"></label>&nbsp;&nbsp;&nbsp;<a href=<c:url value="/listcustomers/${id}"/> class="btn btn-outline-info btn-sm">Danh sách</a><br>
			<i class="fas fa-star"></i>&nbsp;Trạng thái: &nbsp;<label id="status"></label><br>
			<a href=<c:url value="/edit/${id}"/>  class="btn btn-primary btn-sm">Cập nhật thông tin</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
				<br><h1 id="event_name"></h1>
			  	<label id="description"></label>
			  	<hr>
			  	<h4>Thông tin mở rộng</h4>
			  	<div id="advanceddetails"></div>
		</div>
	</div>

	<script>
	 function nl2br (str, is_xhtml) {     
	        var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br/>' : '<br>';      
	        return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');  
	    } 
		$(document).ready(function(){

			var id = ${id};
			if(id != 0){

			$.ajax({
				url: "http://localhost:8080/EventManagement/api/secure/event/"+${id},
				type: "GET",
				contentType: "application/json",
				dataType: "json",
				success: function(result){
					$('#event_name').append(result.name);
					$('#start_time').append(result.startDate+"   "+result.startTime);
					$('#end_time').append(result.endDate+"   "+result.endTime);
					$('#location').append(result.venuename);
					$('#map').append(result.map);
					$('#fee').append(result.fee+' VND');
					$('#tickets').append(result.sold+'/'+result.tickets);
					$('#status').append(result.status);
					$('#description').append(result.description);
					$('#advanceddetails').append(result.advancedDetails);
				},
				error: function (er){
					alert("Xảy ra lỗi khi load dữ liệu!");
				}
			});
			}
			else{
			/*	$.ajax({
					contentType: "application/json",
					dataType: "json",
					success: function(result){ */
						$('#event_name').append(event.name);
						$('#start_time').append(result.startDate+"   "+result.startTime);
						$('#end_time').append(result.endDate+"   "+result.endTime);
						$('#location').append(result.venuename);
						$('#map').append(result.map);
						$('#fee').append(result.fee+' VND');
						$('#tickets').append(result.sold+'/'+result.tickets);
						$('#status').append(result.status);
						$('#description').append(result.description);
						$('#advanceddetails').append(result.advancedDetails);
				//	},
			//});
			}
		});
	</script>
</body>
</html>