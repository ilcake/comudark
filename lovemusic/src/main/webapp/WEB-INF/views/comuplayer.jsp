<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>CoMu Player</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>
	table{
		position:absolute; 
		width:100%; 
		height:100%; 
		/* margin-left:-10px; 
		margin-top:-10px;  */
		text-align: center;
	}
	
	.image{
		width: 100px;
		height: 100px;
		border-radius: 100px;

	}
	
	textarea{
		border: solid black 1px;
		width: 100%;
		height: 100%;
	}
	
	.glyphicon{
		vertical-align: middle;
		line-height: 100px;
		font-size: 40px;
	}
	
	.middle{
		padding: 5px;
		vertical-align: middle;
		line-height: 100px;
		width: 30%;
	}
	
	.title{
		font-weight: bold;
		color: red;
	}
</style>
<body>
<table>
<tr style="height:5%;">
	<td colspan="2" style="padding-top:0px; text-align:left;">ID | <span class="title">TITLE</span> | FILE TITLE</td>
	
</tr>
<tr style="height:15%;">
	<td class="middle">
		&nbsp;<img src="images/galaxy-1.jpg" class="image">&nbsp;
		<span class="glyphicon glyphicon-play" aria-hidden="true"></span>
		<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>
	</td>
	<td>
		<textarea>CODE</textarea>
	</td>
</tr>
<tr style="background-color:black;">
	<td colspan="2"></td>
</tr>
</table>

</body>
</html>