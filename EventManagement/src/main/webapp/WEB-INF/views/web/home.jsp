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

	<!-- Page Content -->
	<div class="container">

		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="col-lg-12">
			<!-- 	<img class="img-fluid rounded mb-4 mb-lg-0"
					src=<c:url value="/template/web/picture/Anh-thien-nhien-1.jpg" /> alt=""> -->
					<div id="mycarousel" class="carousel slide" data-ride="carousel">

        <!--Cho hiện thị chỉ số nếu muốn-->
        <ol class="carousel-indicators">
            <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
            <li data-target="#mycarousel" data-slide-to="1" class=""></li>
            <li data-target="#mycarousel" data-slide-to="2" class=""></li>
        </ol>
        <!--Hết tạo chỉ số-->

        <!--Các slide bên trong carousel-inner-->
        <div class="carousel-inner">

            <!--Slide 1 thiết lập hiện thị đầu tiên .active-->
            <div class="carousel-item active">
                <img class="d-block w-100" src=<c:url value="/template/web/picture/banner-tan-hoang-minh.jpg"/>>
                <!--Cho thêm hiện thị thông tin-->
                <div class="carousel-caption d-none d-md-block">
                </div>
            </div>

            <!--Slide 2-->
            <div class="carousel-item">
                <img class="d-block w-100" src=<c:url value="/template/web/picture/workshopenglish.jpg"/>>
            </div>
            <!--Slide 3-->
            <div class="carousel-item">
                <img class="d-block w-100" src=<c:url value="/template/web/picture/tour-da-nang.jpg"/>>
            </div>
        </div>
        


        <!--Cho thêm khiển chuyển slide trước, sau nếu muốn-->
            <a class="carousel-control-prev" href="#mycarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span></a>
            <a class="carousel-control-next" href="#mycarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
        <!--Hết tạo điều khiển chuyển Slide--> 
        
    </div>
			</div>
			<!-- /.col-lg-8 -->
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->

		<!-- Content Row -->
		<div class="row" id="listevent">
			<div id="test">
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	
<script>
$(document).ready(function(){
	$.ajax({
		url: 'http://localhost:8080/EventManagement/api/public/event/upcoming',
		type: 'GET',
		contentType: 'application/json',
		dataType:'json',
		success: function(result){
			result.forEach(function(element){
				var url = '<c:url value="/su-kien/'+element.eventId+'"/>';
				var startdates = element.startDate.split("-");
				var startdate = startdates[2]+"-"+startdates[1]+"-"+startdates[0];
				var enddates = element.endDate.split("-");
				var enddate = enddates[2]+"-"+enddates[1]+"-"+enddates[0];
				$('#listevent').append('<div class="col-md-6 mb-5">'+
											'<div class="card h-100">'+
												'<div class="card-body">'+
													'<h4 class="card-title">'+element.name+'</h4>'+
													'<p class="card-text">'+'<i class="far fa-clock"></i>&nbsp;Từ: '+element.startTime+'&nbsp;'+startdate+' - Đến: '+element.endTime+'&nbsp;'+enddate+'<br><i class="fas fa-map-marker-alt"></i>&nbsp;'+element.venuename+'<br>'+element.header+'</p>'+
												'</div>'+
												'<div class="card-footer">'+
													'<a href='+url+' class="btn btn-primary btn-sm btInf" data-id="'+element.eventId+'" >Xem chi tiết</a>'+
												'</div>'+
											'</div>'+
										'</div>');
			});		
		},
		error: function (error){
			alert("Xảy ra lỗi!");
		}
	});
  });

</script>

</body>

</html>