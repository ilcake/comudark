<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
     //치환 변수 선언
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!--==============   APPENDING JS AND CSS   =================-->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="resources/myfiles/js/mypage.js"></script>
<link href='resources/myfiles/css/mypage.css' rel='stylesheet'
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
  
  #div2, #div3, #div4{
  	height: 70px;
 	border: none; 
 	border-right: white solid 3px; 
 	color: white;
 	text-align: center;
  }
  
   #div2, #div3, #div4{
 	background-image: url("images/galaxy-2.jpg");
 	background-size: 100%;
   background-repeat: no-repeat;
   background-position: center;
 	color: black;
  	opacity: 0.5;
 }
  
/*   #div4{
   background-image: url("images/album.jpg");
   background-size: 10%;
   background-repeat: no-repeat;
   background-position: center;
  } */
  
  .font{
   font-size: 14px;
   color: white;
   text-align: center;
  }
  
  .border{
   border: solid 3px gray;
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
/* 	min-width: 70px;
	width: 100%;
	margin: 20px;
	padding: 10px;
	border-radius: 20px;
/* 	float:left;
	display:inline; */
	color:black;
	background-color:white;
	margin: auto;
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
	margin-bottom: 20px;
	bottom: 50px;
}

.loader, .center, #loadlist{
	table-layout: fixed;
	position: relative;
		margin: auto;
	
}


/* ======== TAB STYLE ======= */

.nav-tabs{
font-size: medium;
font-family: sans-serif;
font-weight: bold;
}

.nav-tabs > li > *{
border: white 3px solid;
}

.nav-tabs > li.active > a,
.nav-tabs > li.active > a:focus,
.nav-tabs > li.active > a:hover{
position: relative;
background: #ff5a5f !important;
/* -webkit-border-radius: 0px; */
/* -moz-border-radius: 0px;
border-radius: 0px; */
/* border-color:#ff5a5f; */
color:#fff;
}
.nav-tabs > li.active > a:after{
content: '';
position: absolute;
border-style: solid;
border-width: 15px 15px 0;
border-color: #ff5a5f transparent;	/* ▼ */
display: block;
width: 0;
z-index: 1;
bottom: -15px;
left: 50%;
margin-left:-15px;
}
.nav-tabs > li > a {
background:#ff272e !important;
/* -webkit-border-radius: 0px; */
/* -moz-border-radius: 0px; */
/* border-radius: 0px; */
/* border-color:#ff272e; */
padding:0 2em;
height: 45px;
line-height:45px;
color:#fff;
-webkit-transition: all 0.4s ease;
-moz-transition: all 0.4s ease;
transition: all 0.4s ease;
}
.nav-tabs > li > a:hover{
/* border-color:#ff5a5f; */
background: #ff5a5f !important;
}
.tab-content > .tab-pane {
border:3px solid #ddd;
border-top: none;
padding: 25px 10px 10px;
border: solid 3px white;
}

.container{
border: white solid 3px;
margin-bottom: 40px;
}

table {
	table-layout: fixed;
	position: relative;
}

</style>

<script type="text/javascript">

$(function(){
   var page = 1;
   
   $(window).scroll(function(){
         var scrollHeight = $(window).scrollTop() + $(window).height();
         var documentHeight = $(document).height();
         
         if(scrollHeight == documentHeight) {
        	 alert("page");
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
	           + '" style="width:60px; height:60px; max-height:60px; border-radius:100px;" draggable="true" ondragstart="drag(event)" id='
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
				<source src="myfiles/video/Blurry-Lights.mp4" type="video/mp4" />
			</video>
		</div>

   <!-- ====================== SECTION BOOKING AND CONTACTS ================================================ -->
	<div class="container" style="border:none;">
		<div class="row" style="border:none;">
					<ul class="nav nav-tabs" style="border:none;">
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
					
				 <div class="tab-content" style="margin-top: 1px;">
					<!-- ====================== tab1 : MY FILES===================== -->
					<div id="myfiles" class="tab-pane in active"> 
						<div id="loader" style="padding:20px; padding-left: 40px; border:none;"></div>
						<!-- loaded file -->
						<table style="border: white solid 3px; text-align: center; color:white; padding:10px;">
							<tr>
								<td id="div2"><a href="write" style="color:white;" id="hov2">&lt; go write</a></td>
								<td id="div3" ondrop="drop(event)" ondragover="allowDrop(event)">
									<span style="color:white;" id="hov3">Drop & write</span></td>
								<td id="div4" ondrop="drop2(event)"
									ondragover="allowDrop(event)"></td>
							</tr>
						</table>
					</div>
					<!-- ====================== tab2 : MY BOARDS===================== -->
					<div id="myboards" class="tab-pane fade"> 
						<!-- =============================== CONTENT ============================= -->
							<div id="container" style="margin: 30px; padding:30px; border:none; position:relative;" >
								<!-- 게시물 시작 (Collapse) -->
								<c:forEach var="board" items="${boardList}">
									<div class="s" style="border-radius:10px; background-color:white; padding: 20px; margin: 20px; width:100%;">
										<table class='board' style="width:100%;">
											<tr>
												<td class="td_img"><img src="images/galaxy-1.jpg"
													alt="image" class="cover"></td>
												<td class="td_center" style="line-height: 1.3em;"><span>${board.userid}</span>
													&nbsp;l&nbsp;<span style="font-weight: bold; color: red;">${board.title}</span>
													<br>
												<span
													style="font-size: small; text-align: right; margin-top: -20px; margin-bottom: -20px;">${board.inputdate}</span>
												</td>
												<!-- 좋아요/구독 버튼 -->
												<td class="td_button">
												</td>
											</tr>
											<tr>
												<td colspan='3'><hr style="margin-top:-5px;"></td>
											</tr>
											<tr>
												<td colspan="3" style="word-break:break-all;" class="content">
												 ${fn:replace(board.content, crcn, br)}	<!-- 글 내용 줄바꿈 처리 -->
												 <br>
													<c:if test="${board.userid == loginId}">	<!-- 작성ID와 로그인ID가 다를 때만 표시 -->
														<span class="writerButton" style="float:right; padding-right:8px;"> 
															<a href=""><span class="glyphicon glyphicon-pencil" aria-hidden="true" boardnum="${board.boardnum}" style="font-size:small;"></span></a> <!-- 글 수정 버튼 --> 
															<a href=""><span class="deleteBoard" boardnum="${board.boardnum}">X</span></a> <!-- 글 삭제 버튼 -->
														</span>
													</c:if> 
												</td>
											</tr>
											<tr>
												<td colspan="3"><hr></td>
											</tr>
										</table>
										<table class="board" id="col${board.boardnum}"> <!-- class="collapse" -->
											<!-- 댓글 -->
											<c:forEach var="reply" items="${replyAll}">
												<c:if test="${reply.boardnum == board.boardnum}">
													<tr class="reply">
														<td class="td_img">${reply.userid}</td>
														<td style="width: 70%;">${reply.replytext}<span style="color: gray;"> ${reply.inputdate}</span></td>
														<td>
														<c:if test="${reply.userid == loginId}">	<!-- 리플ID와 loginID가 같을 때만 표시 -->
														<a href="updateReply?replynum=${reply.replynum}"><span
																class="glyphicon glyphicon-pencil" aria-hidden="true"
																style="font-size: small;"></span></a> <a
															href="deleteReply?replynum=${reply.replynum}">X</a>
														</c:if>
														</td>
													</tr>
												</c:if>
											</c:forEach>
											<tr>
												<form action="replyWrite" method="get">
													<input type="hidden" name="boardnum" value="${board.boardnum}" />
													<td class="td_img">댓글</td>
													<td class="td_center" style="width: 70%;"><input
														type="text" name="replytext" id="replytext" style="width:100%;"></td>
													<td><button style="border: none; background: none;">
															<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
														</button></td>
												</form>
											</tr>
										</table>
									</div>
								</c:forEach>
								<!-- 게시물 END -->
							</div>
						<!-- =============================== CONTENT ============================= -->
					</div>
					<!-- ====================== tab1 : LIKE/SUBSCRIBE===================== -->
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