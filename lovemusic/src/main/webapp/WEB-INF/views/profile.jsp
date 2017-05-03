<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>PROFILE</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="resources/jquery-3.1.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>
<style>
table, td{
	margin: auto;
	text-align: center;
	width: 100%;
	height: 100%;
	padding: 5px;
	border: 1px lightgray solid;
}

.a{
	width: 20%;
	background-color: black;
	color: white;
	border: white solid 1px;
}

img.one{
	width: 100px;
	height: 100px;
	margin: auto;
	border-radius: 10px;
	box-shadow: 1px 1px 1px black;
}

img.one:hover img.two{
	visibility: visible;
	
}

img.two{
	visibility: hidden;
	position: absolute;
	left: 0%;
	border-radius: 10px;
	box-shadow: 1px 1px 1px black;
}

input{
	border: none;
	border-bottom: solid 1px lightgray;
	outline: none;
	text-align: center;
}
</style>

<script>
$(function(){
	$(".one").hover(
		function(){
			$(".two").css("visibility", "visible");
		},
		function(){
			$(".two").css("visibility", "hidden");			
		}
	);
	
	$(".board").on("click", function(){
		window.opener.location.href="searchBoard?searchTitle=userid&searchText="+$(".userid").text();
	});
	
	$(".like").on("click", function(){
		window.opener.location.href="searchBoard?searchTitle=userid&searchText="+$(".userid").text();
	});
	
	$(".update").on("click", function(){
		var email = $(".email").text();
		var pw = $(".pw").text();
		$(".email").html("<input type='text' id='email' name='email' value='"+email+"'>");
		$(".pw").html("<input type='password' id='pw1' name='password' value='"+pw+"'>");
		
		$(".up").html("<button class='btn btn-primary btn-xs update2'>수정 완료</button>");	
		
		$(".update2").on("click", function(){
			$("form").submit();
/* 			$.ajax({
				url: "updateUser",
				type: "post",
				data: {"email" : $("#email").val(), "pw1" : $("#pw1").val()},				
				success: function(){
					alert("upda");			
				}
			}); */		
		});

	});	

});

</script>
<body>

<form method="post" action="updateUser">
<input type="hidden" name="userid" value="${profile.userid}">
<table>
<tr><td colspan="2"><img class="one" src="resources/profiles/${profile.profile}"/><img class="two" src="resources/profiles/${profile.profile}"/><br><br></td></tr>
<tr><td class="a">ID</td><td><span class="userid">${profile.userid}</span></td></tr>
<tr><td class="a">E-MAIL</td><td><span class="email">${profile.email}</span></td></tr>
<c:if test="${loginId == profile.userid}">
<tr><td class='a'>PW</td><td><span class='pw'><input type="password" value="${profile.password}" readonly style="border:none;"/></span></td></tr>
</c:if>
</table>

</form>

<table>
<tr>
	<td>
		<br>
		<span class="up">
		<button class="btn btn-primary btn-xs board">게시물 보기</button> 
		<!-- <button class="btn btn-primary btn-xs like">좋아하는 곡</button>  -->
		<c:if test="${loginId == profile.userid }">
			<button class="btn btn-primary btn-xs update">회원정보 수정</button>
		</c:if>
		</span>
		<br><br>
	</td>
</tr>
</table>

</body>
</html>