<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="py-5 bg-dark" id="footer">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; EventManagement 2021</p>
	</div>
	<!-- /.container -->
</footer>

<script>
	var h = $('#header').outerHeight();
	var f = $('#footer').outerHeight();
	var b = $('body').outerHeight();
	var h=b-f-h-h;
	$('#wrap').attr('style','height:'+h+'px;')
</script>