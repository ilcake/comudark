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
			url : "likeRanking",
			type : "get",
			success : function(resp) {
				console.log(resp);
				var res = "<table class='table table-hover'><thead><tr>";
				res += "<td>NO.</td>";
				res += "<td>ID</td>";
				res += "<td>TITLE</td>";
				res += "<td>TOTAL</td>";
				res += "</tr></thead>";
				$.each(resp, function(index, item) {
					res += "<tbody><tr>";
					res += "<td>";
					res += index + 1;
					res += "</td>";
					res += "<td>";
					res += item.USERID;
					res += "</td>";
					res += "<td>";
					res += item.TITLE;
					res += "</td>";
					res += "<td>";
					res += item.RANK;
					res += "</td>";
					res += "</tr></tbody>";
				});
				res += "</table>";
				$(".like").html(res);
			}
		});

		$.ajax({
			url : "subscribeRanking",
			type : "get",
			success : function(resp) {
				console.log(resp);
				var res = "<table class='table table-hover'><thead><tr>";
				res += "<td>TOTAL</td>";
				res += "<td>ID</td>";
				res += "</tr></thead>";
				$.each(resp, function(index, item) {
					res += "<tbody><tr>";
					res += "<td>";
					res += item.RANK;
					res += "</td>";
					res += "<td>";
					res += item.USERID;
					res += "</td>";
					res += "</tr></tbody>";
				});
				res += "</table>";
				$(".subscribe").html(res);
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
						<div class="like"></div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-5" style="background-color: red;">
						<h3>Subscribe Ranking</h3>
						<div class="subscribe"></div>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>

</body>
</html>