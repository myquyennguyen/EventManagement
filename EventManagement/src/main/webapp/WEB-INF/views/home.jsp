<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<script>
$(document).ready(function(){

	$.ajax({
		url: 'http://localhost:8080/EventManagement/api/public/event/upcoming',
		type: 'GET',
		contentType: 'application/json',
		dataType:'json',
		success: function(result){
			alert(JSON.stringify(result));
			alert(JSON.stringify(result[0]));
			alert(Array.isArray(result[0]));
			alert(result[0].name);
		},
		error: function (error){
			alert("Xảy ra lỗi!");
		}
	});
  });
</script>
</body>
</html>