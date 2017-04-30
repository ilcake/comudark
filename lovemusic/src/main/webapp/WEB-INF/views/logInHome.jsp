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
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 

<script>
var carousels = $('.carousel');
carousels.each(function() {
  var $obj = $(this);
  var $inner = $obj.find('.carousel-inner');
  
  var id = 'uuid' + new Date().getTime();
  $obj.addClass(id);

  if ($obj.data('shift') === 1) {
    var items = $obj.find('.item > [class*="col-"]'),
        visibleCnt = $obj.find('.item:first [class*="col-"]').length,
        wrapper = "";
    
    // build styles
    var rule_base = '.carousel.' + id + ' .carousel-inner > .item',
        styles = $('<style></style>'),
        rules = [];
        rules[0] = rule_base + '.next {left: ' + (100 / visibleCnt) + '%; transform: none;}';
        rules[1] = rule_base + '.active {left: 0;}';
        rules[2] = rule_base + '.active.left {left: -' + (100 / visibleCnt) + '%; transform: none;}';
        rules[3] = rule_base + '.next.left {left: 0;}';
        rules[4] = rule_base + '.active.right {left: ' + (100 / visibleCnt) + '%; transform: none;}';
        rules[5] = rule_base + '.prev.right {left: 0;}';
        rules[6] = rule_base + '.prev {left: -' + (100 / visibleCnt) + '%; transform: none;}';
    for (var i = 0; i < rules.length; i++) {
      styles.append(rules[i]);
    }
    $obj.prepend(styles);

    // rebuild items
    for (var i = 0; i < $(items).length; i++) {
      var $item = $(items[i]);
      var parent = $item.parent();
      if (parent.hasClass('item')) {
        if (!wrapper.length) {
          wrapper = parent.clone().removeClass('active').html('');
        }
        $item.unwrap();
      }
      
      var itemGroup = [$item];
      for (var x = 1; x < visibleCnt; x++) {
        var a = i + x;
        var next = $(items[a]);
        if (!next.length) {
          next = $(items[(a - $(items).length)]);
        }
        itemGroup[x] = next.clone();
      }
      var newSet = wrapper.clone().html(itemGroup);
      if (i == 0) {
        newSet.addClass('active');
      }
      newSet.appendTo($inner);
    }
  }
});
</script>



<script type="text/javascript">
	$(function() {

	});
</script>

<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_1pa.png" />

<style type="text/css">
.score {
	position: relative;
	top: 40px;
}

#title, .mini_title{
	position: relative;
	color: white;
	text-align: center;
}

#ranking {
	position: relative;
	margin: auto;
	display: table;
	/* border: solid 3px white;  */
	margin-top: 30px;
	width: 80%;
	min-Width: 800px;
}

table, td {
	font-size: small;
	border: solid 1px white;
	margin: 10px;
	color: white;
	text-shadow: 1px 1px black;
	text-align: center;
}

tr:hover{
background-color: rgba(255,255,255,0.5);
}

.td_no, .td_total{
	width: 10%;
}

tr {
/* 	background-color: rgba(255, 255, 255, 0.5); */
	background-color: rgba(0, 0, 0, 0.5);
	vertical-align: middle;
}

.tr_top {
	background-color: red;
	text-align: center;
	font-weight: bold;
}

#like, #subscribe {
	width: 47%;
	/* max-Width: 300px; */
	position: relative;
	margin: 10px;
	/* margin-right: 31px; */
	padding: 10px;
	display: inline-table;
}

#latest {
	width: 95%;
	margin: 10px;
}

.image {
	width: 50px;
	height: 50px;
}

.carousel{
	height:100px;
}

.carousel-control !important{
    position: relative;
    top: -85px;
    bottom: 0;
    left: 0;
    width: 15%;
	height: 50px;
	vertical-align: middle;
	background: none;
}

h3{
	text-shadow: 2px 2px 2px black;
}

.mini_title{
	text-shadow: 1px 1px 2px black;
	padding-left: 10px;
}

.img-responsive{
	box-shadow: 0px 1px 2px white;
	border: solid 1px white;
	/* background-color: white; */
/* 	padding: 5px; */
}

img:hover{
	box-shadow: 2px 2px 10px white;
	border: 3px solid white;
}


</style>
<script type="text/javascript">

	//like ranking 클릭
	function like(boardnum){
		location.href = "comuplayer?boardnum="+boardnum;
	}
	
	//subscribe ranking 클릭
	function subscribe(userid){
		location.href = "search?userid="+userid;
	}

	$(function() {

	/* 	$('#myCarousel').carousel({
			interval : 10000
		}); */

		$(".carousel-control.left").html("◀");
		$(".carousel-control.right").html("▶");
		
		$.ajax({
			url : "likeRanking",
			type : "get",
			success : function(resp) {
				var res = "<span class='mini_title'><span class='glyphicon glyphicon-heart' aria-hidden='true'></span> LIKE RANKING</span>";
				res += "<table class='table'><thead><tr class='tr_top'>";
				res += "<td class='td_no'>NO.</td>";
				res += "<td>ID</td>";
				res += "<td>TITLE</td>";
				res += "<td class='td_total'>TOTAL</td>";
				res += "</tr></thead>";
				$.each(resp, function(index, item) {
					res += "<tbody><tr onclick='javascript:like("+item.BOARDNUM+")'>";
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
				$("#like").html(res);
			}
		});

		$.ajax({
			url : "subscribeRanking",
			type : "get",
			success : function(resp) {
				var res = "<span class='mini_title'><span class='glyphicon glyphicon-user' aria-hidden='true'></span> SUBSCRIBE RANKING</span>";
				res += "<table class='table'><thead><tr class='tr_top'>";
				res += "<td class='td_no'>NO.</td>";
				res += "<td>ID</td>";
				res += "<td class='td_total'>TOTAL</td>";
				res += "</tr></thead>";
				$.each(resp, function(index, item) {
					res += "<tbody><tr onclick='javascript:subscribe("+item.USERID+")'>";
					res += "<td>";
					res += index+1;
					res += "</td>";
					res += "<td>";
					res += item.USERID;
					res += "</td>";
					res += "<td>";
					res += item.RANK;
					res += "</td>";
					res += "</tr></tbody>";
				});
				res += "</table>";
				$("#subscribe").html(res);
			}
		});

	});
</script>
</head>
<body>

	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper" style="background-color: black;">
		<div class="video-container" style="position: fixed;">
			<video autoplay loop class="fillWidth"
				style="width: 100%; height: 100%;">
				<source src="myfiles/video/Cheer-Up.mp4" type="video/mp4" />
			</video>
		</div>
		
		<div id="ranking">
			<div id="title">
				<h3>RANKING</h3>
			</div>
			
			<!-- ========================================= like page ========================================= -->
			<div id="like">
<!-- 				<table class="table">
					<tr class="tr_top">
						<td>#</td>
						<td><span class="glyphicon glyphicon-heart"
							aria-hidden="true"></span> LIKE RANKING</td>
						<td>COUNT</td>
					</tr>
					<span class="dddd"></span>
					<tr>
						<td>1</td>
						<td><img class="image" src=""
							onERROR="this.src='images/disc.png'"> 곡 제목입니다</td>
						<td></td>
					</tr>
					<tr>
						<td>2</td>
						<td><img class="image" src=""
							onERROR="this.src='images/disc.png'"> 곡 제목입니다</td>
						<td>255</td>
					</tr>
					<tr>
						<td>3</td>
						<td><img class="image" src=""
							onERROR="this.src='images/disc.png'"> 곡 제목입니다</td>
						<td>255</td>
					</tr>
					<tr>
						<td>4</td>
						<td><img class="image" src=""
							onERROR="this.src='images/disc.png'"> 곡 제목입니다</td>
						<td>255</td>
					</tr>
					<tr>
						<td>5</td>
						<td><img class="image" src=""
							onERROR="this.src='images/disc.png'"> 곡 제목입니다</td>
						<td>255</td>
					</tr>
				</table> -->
			</div>

			<!-- ========================================= suscribe page ========================================= -->
			<div id="subscribe">
<!-- 				<table class="table">
					<tr class="tr_top">
						<td>#</td>
						<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							SUBSCRIBE RANKING</td>
						<td>COUNT</td>
					</tr>
					<tr>
						<td>1</td>
						<td><img class="image" src=""
							onERROR="this.src='images/user.png'"> user 1</td>
						<td>255</td>
					</tr>
					<tr>
						<td>2</td>
						<td><img class="image" src=""
							onERROR="this.src='images/user.png'"> user 1</td>
						<td>255</td>
					</tr>
					<tr>
						<td>3</td>
						<td><img class="image" src=""
							onERROR="this.src='images/user.png'"> user 1</td>
						<td>255</td>
					</tr>
					<tr>
						<td>4</td>
						<td><img class="image" src=""
							onERROR="this.src='images/user.png'"> user 1</td>
						<td>255</td>
					</tr>
					<tr>
						<td>5</td>
						<td><img class="image" src=""
							onERROR="this.src='images/user.png'"> user 1</td>
						<td>255</td>
					</tr>
				</table> -->
			</div>
			<hr>
			<div id="title">
				<h3>LATEST MUSIC</h3>
			</div>
			<!-- ========================================= latest page ========================================= -->
			<div id="latest">
			  <div id="single" class="carousel slide" data-ride="carousel" data-shift="1">
			    <div class="carousel-inner">
			      <ul class="row item active">
			      	<c:forEach var="board" items="${list}" end="5">
			        <li class="col-xs-2 one"> <a href="comuplayer?filenum=${board.filenum}"><img src="resources/covers/${board.cover_re}" onERROR="this.src='images/album.jpg'" class="img-responsive"></a></li>
			        </c:forEach>
			      </ul>
			      <ul class="row item">
			      	<c:forEach var="board" items="${list}" begin="6" end="11">			      
			        <li class="col-xs-2 one"> <a href="comuplayer?filenum=${board.filenum}"><img src="resources/covers/${board.cover_re}" onERROR="this.src='images/album.jpg'" class="img-responsive"></a></li>
			        </c:forEach>
			      </ul>
			    </div>
			    <a class="carousel-control left" href="#single" data-slide="prev">Previous</a> <a class="carousel-control right" href="#single" data-slide="next">Next</a> </div>
				<br><br>
<!-- 				<table class="table">
					<tr class="tr_top">
						<td><span class="glyphicon glyphicon-music"
							aria-hidden="true"></span> LATEST MUSIC</td>
					</tr>
					<tr>
						<td>2222</td>
					</tr>
					<tr>
						<td>3333</td>
					</tr>
				</table> -->
			</div>
		</div>
			<!-- ranking end -->

		<!-- 		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="row score">
					<div class="col-md-5"> style="background-color: red;
						<h3>Favorite Ranking</h3>
						<div class="like"></div>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-5"> style="background-color: red;
						<h3>Subscribe Ranking</h3>
						<div class="subscribe"></div>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div> -->
	</div>	<!-- totalwrapper end -->

</body>
</html>