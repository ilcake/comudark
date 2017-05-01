$(function(){
	
	//반응형 그리드
	$('#container').wallyti();

	//사용자가 이전에 좋아요 누른 게시물 표시
	$.ajax({
		type: "get",
		url: "idList",
		success: function(resp){
			 $.each(resp,function(index, item) {
				var likeboard = $("span[boardnum="+item.boardnum+"][like_userid="+item.like_userid+"]");
				likeboard.css("color", "rgb(255, 0, 0)");
			 });
		}
	});
	
	//사용자가 이전에 구독 누른 유저 표시
	$.ajax({
		type: "get",
		url: "subscribeList",
		success: function(resp){
			 $.each(resp,function(index, item) {
				var subboard = $("span[userid="+item.userid+"][sub_userid="+item.sub_userid+"]");
				subboard.css("color", "lightgray");
			 });
		}
	});
	
	
	//좋아요 버튼 클릭 이벤트
	$(".glyphicon-thumbs-up").on("click", function(){
		
		var boardnum = $(this).attr("boardnum");
		var userid = $(this).attr("userid");
		var like_userid = $(this).attr("like_userid");
		
		//좋아요
		if($(this).css("color") == "rgb(255, 0, 0)"){
			$(this).css("color", "black");
			$.ajax({
				type: "get",
				url: "deleteLike",
				data: {"boardnum":boardnum, "userid":userid, "like_userid":like_userid},
				success: function(resp){
					/*alert("delete like");*/
					$.alert({
					    title: '좋아요',
					    content: 'delete like',
					});
				}
			});
		//좋아요 취소
		}else{
			$(this).css("color", "red");
			$.ajax({
				type: "get",
				url: "like",
				data: {"boardnum":boardnum, "userid":userid, "like_userid":like_userid},
				success: function(resp){
					/*alert("like");*/
					$.alert({
					    title: '좋아요',
					    content: 'like',
					});
				}
			});
		}
	});
	
	//구독 버튼 클릭 이벤트
	$(".glyphicon-user").on("click", function(){
		
		var userid = $(this).attr("userid");
		var sub_userid = $(this).attr("sub_userid");
		
		//구독
		if($(this).css("color") == "rgb(0, 0, 0)"){	
			$("span[userid="+$(this).attr("userid")+"][sub_userid="+$(this).attr("sub_userid")+"]").css("color", "lightgray");
			$.ajax({
				type: "get",
				url: "writeSubscribe",
				data: {"userid":userid, "sub_userid":sub_userid},
				success: function(resp){
					/*alert("subscribe");*/
					$.alert({
					    title: '구독',
					    content: 'subscribe',
					});
				}
			});
		//구독 취소
		}else{
			$("span[userid="+$(this).attr("userid")+"][sub_userid="+$(this).attr("sub_userid")+"]").css("color", "black");
			$.ajax({
				type: "get",
				url: "deleteSubscribe",
				data: {"userid":userid, "sub_userid":sub_userid},
				success: function(resp){
					/*alert("delete subscribe");*/
					$.alert({
					    title: '구독',
					    content: 'delete subscribe',
					});
				}
			});
		}
	});
    
	//글 삭제
	$(".deleteBoard").on("click", function(){
		if(confirm('delete?')){
			var boardnum = $(this).attr("boardnum");
			$.ajax({
				type: "get",
				url: "deleteBoard",
				data: {"boardnum":boardnum},
				success: function(resp){
					/*alert("delete");*/
					$.alert({
					    title: '글 삭제',
					    content: 'delete',
					});
				}
			});
		}
	});
	
	//파일 영역 클릭 이벤트
	$(".buttonEffect").on("click", function(){
		window.open("player?filenum="+$(this).attr("filenum"), "PLAYER", "top=200, left=400, width=800, height=500, location=no, resizable=no");
	});
	
	
/* 	$(".glyphicon-heart-empty").on("click", function(){
		$(this).removeClass("glyphicon-heart-empty").addClass("glyphicon-thumbs-up");
	});
	
	$(".glyphicon-heart-empty").hover(
		function(){
			$(this).removeClass("glyphicon-heart-empty").addClass("glyphicon-heart");
		},
		function(){
			$(this).removeClass("glyphicon-heart").addClass("glyphicon-heart-empty");
		}
	); */
	
	/*
	$(".glyphicon").hover(
			function(){
				$(this).animate({ scale: "+=0.2%" }, 300 );
			},
			function(){
				$(this).removeClass("glyphicon-star").addClass("glyphicon-star-empty");
			}
		);
	*/
	
	$(".cover").hover(
		function(){
			$(this).css("opacity", "0.5");		
		},
		function(){
			$(this).css("opacity", "1");		
		}
	);

	
	//댓글 수정
	$(".updatereply").on("click", function(){
		$(".replytext[boardnum="+$(this).attr("boardnum")+"]").val($(this).attr("replytext"));
		$(".here[boardnum="+$(this).attr("boardnum")+"]").attr("name", 'replynum').attr("value", $(this).attr('replynum'));
	});
	
	$(".updatereply").hover(
			function(){
				$(this).css("color", "red");		
			},
			function(){
				$(this).css("color", "black");		
			}
		);
	
});