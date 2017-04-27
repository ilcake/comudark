<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
     //치환 변수 선언
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shared</title>
</head>

<!--==============   APPENDING JS AND CSS   =================-->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="js/jquery.wallyti.js"></script>
<link href='resources/myfiles/css/shared.css' rel='stylesheet' type='text/css'>
<script src="resources/myfiles/js/shared.js"></script>

<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper" style="background:none;">
	
 		<div class="video-container" style="position:absolute;">
			<video autoplay loop class="fillWidth">
				<source src="myfiles/video/Blurry-Lights.mp4" type="video/mp4" />
			</video>
		</div>

		<!-- =============================== CONTENT ============================= -->
		<div class="wrapper">
		<div class="search" style="height: 38px; color:white; top:100px; right: 20px; margin:auto; position: absolute; border-radius:10px; border: solid 2px red; padding: 2px; padding-bottom:10px; padding-right:10px;">
			<input type="text" style="background:none; border:none; color:white; padding-top:-20px; margin-top:-10px;">&nbsp;
			<a href="search"><span class="glyphicon glyphicon-search" aria-hidden="true" style="color:white; padding-top:-10px;"></span></a> </div>
		<div></div><div></div><hr><hr><hr>
			<div id="container" style="margin: 30px; padding:30px; padding-top:50px; right:20px;" >
			
				<!-- 게시물 시작 (Collapse) -->
				<c:forEach var="board" items="${boardList}">
				<!-- 공유 설정된 게시물만 표시 -->
				<c:if test="${board.shared == 'share'}">
					<div class="box">
						<table class='board'>
							<tr>
								<td class="td_img">
									<div class="card-container">
										<div class="card">
										<div class="side"><img src="resources/profiles/${board.profile}" onERROR="this.src='images/user.png'" alt="image" class="image"></div>
										<div class="side back"><img src="images/galaxy-2.jpg" style="position:absolute; left:0;"></div>
										</div>
									</div>
								</td>
								<td class="td_center" style="line-height: 1.3em;"><span>${board.userid}</span>
									&nbsp;l&nbsp;<span style="font-weight: bold; color: red;">${board.title}</span>
									<br>
								<span
									style="font-size: small; text-align: right; margin-top: -20px; margin-bottom: -20px;">${board.inputdate}</span>
								</td>
								<!-- 좋아요/구독 버튼 --> <!-- 작성 ID가 로그인 ID와 같으면 표시하지 않음 -->
								<td class="td_button">
								<c:if test="${loginId != board.userid}">
								<a href="#" data-toggle="tooltip" title="좋아요"><span
										class="glyphicon glyphicon-thumbs-up" aria-hidden="true"
										style="color: black;" boardnum="${board.boardnum}"
										userid="${board.userid}" like_userid="${loginId}"></span></a> 
								<a href="#" data-toggle="tooltip" title="구독하기"><span
										class="glyphicon glyphicon-user" aria-hidden="true"
										userid="${board.userid}" sub_userid="${loginId}"></span></a>
								</c:if>
								</td>
							</tr>
							<tr>
								<td colspan='3'><hr class="tr_header"></td>
							</tr>
							<tr>
								<!-- 글 내용 (줄바꿈 처리) -->
								<td colspan="3" style="word-break:break-all;" class="content"> 
								
									<!-- FILE -->
									<c:if test="${board.file_title != null }">
										<button class="buttonEffect" boardnum="${board.filenum }"><!-- <div class="fileField" style=""> -->
											<img class="image" src="resources/covers/${board.cover_re}"> &nbsp;&nbsp; ${board.file_title} ♪
										<!-- </div> --></button><br><br>
									</c:if>
									 ${fn:replace(board.content, crcn, br)}	<br>
									 
								 <!-- 글 수정,삭제 버튼 : 작성ID와 로그인ID가 다를 때만 표시 -->	
									<c:if test="${board.userid == loginId}">					
										<span class="writerButton" style="float:right; padding-right:8px;"> 
											<a href="selectBoard?boardnum=${board.boardnum}"><span class="glyphicon glyphicon-pencil" aria-hidden="true" boardnum="${board.boardnum}" style="font-size:small;"></span></a>
											<a href=""><span class="deleteBoard" boardnum="${board.boardnum}">X</span></a> 
										</span>
									</c:if> 
						<%-- 			<span class="replybutton" id="replybutton"> <a role="button"
										data-toggle="collapse" href="#col${board.boardnum}"
										aria-expanded="false" aria-controls="col${board.boardnum}">
											reply ▼ </a>
									</span> --%>
								</td>
							</tr>
							<tr>
								<td colspan="3"><hr></td>
							</tr>
						</table>
						<table id="col${board.boardnum}"> <!-- class="collapse" -->
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
								<form action="replyWrite" method="post">
								<input type="hidden" name="boardnum" value="${board.boardnum}" />
									<td class="td_img">댓글</td>
									<td class="td_center" style="width: 70%;"><input
										type="text" name="replytext" id="replytext" style="width:100%;"></td>
									<td><button style="border: none; background: none;" class="reply" boardnum="${board.boardnum }">
											<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
										</button></td>
								</form>
							</tr>
						</table>
					</div>
				</c:if>
				</c:forEach>
				<!-- 게시물 END -->
			</div>
		</div>
		<!-- =============================== CONTENT ============================= -->
	</div>
</body>
</html>