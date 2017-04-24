<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--==============   INCLUDE JS AND CSS   =================-->
<script src="resources/jquery-3.1.1.min.js"></script>

<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_comu.png" />

<style type="text/css">
.score {
	position: relative;
	top: 40px;
}
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "login",
			type : "post",
			data : {
				"userid" : $('#userid2').val(),
				"password" : $('#password2').val()
			},
			success : function(resp) {
				if (resp == "errorMsg") {
					alert("로그인 실패");
					$("#userid2").val("");
					$("#password2").val("");
				} else {
					alert("로그인 성공");
					location.href = resp;
				}
			}
		});
	});
</script>
</head>
<body>

	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper">

		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="row score">
					<div class="col-md-5" style="background-color: red;">
						<h3>Favorite Ranking</h3>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-5" style="background-color: red;">
						<h3>Subscribe Ranking</h3>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

</body>
</html>