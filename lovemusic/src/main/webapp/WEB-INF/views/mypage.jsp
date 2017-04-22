<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!--==============   APPENDING JS AND CSS   =================-->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="resources/myfiles/js/comu.js"></script>
<link href='resources/myfiles/css/comu.css' rel='stylesheet'
	type='text/css'>
	
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* mypage css */
  .center, td, tr{
   text-align : center; 
  }
  
  td{
   width: 80px;
   max-width: 80px;
  }
  
  #div3{
   border: solid 1px black;
  }
  
  #div4{
   background-image: url("images/album.jpg");
   background-size: 10%;
   background-repeat: no-repeat;
   background-position: center;
  }
  
  .font{
   font-size: 14px;
  }
  
  .border{
   border: solid 1px gray;
  }
  
  #imgtable{
   width: 20px;
  }
  
  /* board css */
a, a:link, a:hover, a:visited, a:active {
	text-decoration: none;
	color: black;
}

.tr_header{
	margin-top: -5%;
	margin-bottom: -5%;
}

.td_img{
	width:20%;
}

.td_center{
	width: 60%;
}

img {
	border-radius: 100px;
	width: 65px;
	height: 65px;
}

.td_button{
	width:20%;
	text-align: right;
}

.glyphicon{
	font-size: 20px;
}

.panel-group, .panel panel-default {
	margin: auto;
	background: rgba(0, 0, 0, 0.4);
	color: black;
	text-align: left;
}

.panel-heading{
	background-color: blue;
}

/*게시판 블록*/
.box{
	min-width: 70px;
	width: 30%;
	margin: 20px;
	padding: 10px;
	border-radius: 20px;
	float:left;
	display:inline;
	color:black;
	background-color:white;
}

table{
	font-size: medium;
}

.reply > td{
	/*border: solid white 2px;*/
	background-color:#f0f5f5;
	font-size: small;
	padding: 5px;
}

.writerButton{
	position: relative;
	float: left;
	font-size:small;
	margin-bottom: -20%;
}

.replybutton{
	position: relative;
	float: right;
	font-size:small;
	margin-bottom: -20%;
}

.container{
	position: absolute;
	top: 150px;
	margin: auto;
	left: 15%;
	width: 800px;
}

.loader, .center, #loadlist{
	table-layout: fixed;
	position: relative;
		margin: auto;
	
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	   //fileList START======
	   $.ajax({
	     type : "get",
	     url : "fileList",
	     success : function(resp) {
	      var msg = "<table class='center' id='loadlist'><tr>";
	      $.each(resp,function(index, item) {
	         //img 주소 : 테스트용 임시 주소!!
	         msg += '<td class="font"><img src="resources/covers/'
	           + item.cover_re
	           + '" style="width:60px; height:60px; border-radius:100px;" draggable="true" ondragstart="drag(event)" id='
	           + item.filenum
	           + '><br>';
	         var title = item.file_title;
	         //if(title.length>8){title = title.substring(0,8)+'<br>'+title.substring(8,title.length);}
	         msg += title
	           + '</td>';
	         if ((index + 7) % 6 == 0) {
	          msg += "</tr><tr>";
	         }
	        });
	      msg += "</tr><table>";
	      $("#loader").html(msg);
	     }
	   });
	   //fileList END=====

	   var page = 1;
	    
	   $(window).scroll(function(){
	         var scrollHeight = $(window).scrollTop() + $(window).height();
	         var documentHeight = $(document).height();
	         
	         if(scrollHeight == documentHeight) {
	               page=page+2;
	               
	             //board 3번 이후로 불러오기
	             if(page==3){
	              $('<c:forEach var="board" items="${boardList}" begin="3" end="4"><table class="border" style="table-layout:fixed; width:600px; margin:auto;"><tr><td id="imgtable" class="border"><img src="" alt="image(클릭 시 곡 재생)"></td><td>${board.title}'+page+'</td></tr></table></c:forEach>').appendTo('#more');
	             }else if(page==5){
	              $('<c:forEach var="board" items="${boardList}" begin="5" end="6"><table class="border" style="table-layout:fixed; width:600px; margin:auto;"><tr><td id="imgtable" class="border"><img src="" alt="image(클릭 시 곡 재생)"></td><td>${board.title}'+page+'</td></tr></table></c:forEach>').appendTo('#more');

	             }
	         }
	    });
	  });
	  
	  function allowDrop(ev) {
	   ev.preventDefault();
	  }
	  
	  function drag(ev) {
	   ev.dataTransfer.setData("text", ev.target.id);
	  }
	  
	  function drop(ev) {
	   ev.preventDefault();
	   var data = ev.dataTransfer.getData("text");
	   ev.target.appendChild(document.getElementById(data));
	   location.href = 'dragwrite?filenum=' + data;
	  }
	  
	  function drop2(ev) {
	   ev.preventDefault();
	   var data = ev.dataTransfer.getData("text");
	   ev.target.appendChild(document.getElementById(data));
	   if(confirm('delete?')){
	    location.href = 'dragdelete?filenum=' + data;
	   }
	  }
</script>

<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper">
 		<div class="video-container" style="position:absolute;">
			<video autoplay loop class="fillWidth">
				<source src="myfiles/video/For_Wes.mp4" type="video/mp4" />
			</video>
		</div>

   <!-- ====================== SECTION BOOKING AND CONTACTS ================================================ -->
	<div class="container">
		<div class="row">
					<ul class="nav nav-tabs">
						<li class="active">
								<a href="#myfiles" data-toggle="tab">MY FILES</a>
							</li>
						<li>
								<a data-toggle="tab" href="#myboards">MY BOARDS</a>
							</li>
						<li>
								<a data-toggle="tab" href="#likes">LIKE/SUBSCRIBE</a>
							</li>
					</ul>
					
				 <div class="tab-content" >
					<div id="myfiles" class="tab-pane in active">
						<!-- tab1 -->
						<div id="loader"></div>
						<!-- loaded file -->
						<hr>
						<table>
							<tr>
								<td id="div2"><a href="write">&lt; go write</a></td>
								<td id="div3" ondrop="drop(event)" ondragover="allowDrop(event)">
									Drop & write</td>
								<td id="div4" ondrop="drop2(event)"
									ondragover="allowDrop(event)"></td>
							</tr>
						</table>
					</div>
					<div id="myboards" class="tab-pane fade">
						<!-- tab2 -->
						<c:forEach var="board" items="${boardList}">
							<table class='border'
								style="table-layout: fixed; width: 600px; margin: auto;">
								<tr>
									<td id="imgtable" class='border'><img src=""
										alt="image(클릭 시 곡 재생)"></td>
									<td>${board.title}</td>
								</tr>
								<tr>
									<td colspan='2'>${board.content}</td>
								</tr>
								<tr class='border'>
									<td colspan='2'>구독/추천</td>
								</tr>
								<tr class='border'>
									<td colspan='2'>reply</td>
								</tr>
							</table>
							<br>
						</c:forEach>
						<div id="more"></div>
					</div>
					<div id="likes" class="tab-pane fade">
					이건 중간에 오냐?<br>
					내용이 길면<br>
					어떻게 되니?<br>
					어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>어떻게 되니?<br>뜨나?
					</div>
					</div>
		</div>
	</div>
	<!-- ====================== SECTION BOOKING AND CONTACTS END ================================================ -->
		<!-- Modal -->
		<div id="visual" class="modal fade" role="dialog"></div>
	</div>
</body>
</html>