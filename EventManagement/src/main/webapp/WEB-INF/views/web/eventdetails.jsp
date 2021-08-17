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
			<i class="fas fa-dollar-sign"></i>&nbsp;Giá vé: &nbsp;<label id="fee"></label>&nbsp;VND
			<br><button id="btn_booktickets" class="btn btn-primary" style="width:100%;">Đặt vé</button>
		</div>
	</div>
	<div class="row">
	<br>
		<h1 id="event_name"></h1>
		<div id="description">
		</div>
	</div>
	
		
	  <div class="modal fade" id="bookTicketModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Nhập số lượng vé bạn muốn đặt</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
        		<input type="number" max="5" min="1" name="ticket" id="ticket" class="form-control">
        		&nbsp;&nbsp;Tổng tiền &nbsp;<input type="text" disabled id="money" class="form-control">
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" id="btn_book">Đặt vé</button>
        </div>
      </div>
    </div>
  </div>
</div>
	
</div>
<script>
	 var username = '${username}';
	 function nl2br (str, is_xhtml) {     
	        var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br/>' : '<br>';      
	        return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');  
	    }
		$(document).ready(function(){
			$.ajax({
				url: "http://localhost:8080/EventManagement/api/public/event/"+${id},
				type: "GET",
				contentType: "application/json",
				dataType: "json",
				success: function(result){
					$('#event_name').append(result.name);
					$('#start_time').append(result.startDate+"   "+result.startTime);
					$('#end_time').append(result.endDate+"   "+result.endTime);
					$('#location').append(result.venuename);
					$('#map').append(result.map);
					$('#fee').append(result.fee);
					$('#description').append(result.description);
				},
				error: function (er){
					alert("Xảy ra lỗi khi load dữ liệu!");
				}
			});
			$('#btn_booktickets').on('click', function(){
				if(username == '')
					alert("Bạn phải đăng nhập tài khoản để tiếp tục!");
				else{
					$('#bookTicketModal').modal('show');
				}
			});
			$('#ticket').change(function(){
				$.ajax({
					url: "http://localhost:8080/EventManagement/api/public/event/fee/${id}",
					type: "GET",
					contentType: "application/json",
					dataType: "json",
					success: function(result){
						$('#money').val($('#ticket').val()*result);
					},
					error: function(e){
						alert("Xảy ra lỗi!");
					}
				});
				
			});
			$('#btn_book').on('click', function(){
				var data = {
						eventId: ${id},
						username: username,
						countTickets: $('#ticket').val(),
						countMoney: $('#money').val()
				}
				$.ajax({
					url: "http://localhost:8080/EventManagement/api/public/event/register",
					type: "POST",
					contentType: "application/json",
					data: JSON.stringify(data),
					dataType: "json",
					success: function(result){
						if(result == -1)
							alert("Hiện chưa thể đăng kí vé!");
						else
						 if(result == 0)
							alert("Số lượng vé hiện còn không đủ!");
						 else{
							$('#bookTicketModal').modal('hide');
							alert("Đăng kí thành công!");
						}
					},
					error: function(e){
						alert("Xảy ra lỗi!");
					}
				});
			})
		});
	</script>
</body>
</html>