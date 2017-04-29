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
<script type="text/javascript">
	$(function() {

			$('.qt-gridstackCarousel')
					.each(
							function(i, c) {
								var that = $(c), w = that.width(), h = w / 16 * 7, QTtime_constant = that
										.attr("data-time_constant"), QTdist = that
										.attr("data-dist"), QTshift = that
										.attr("data-shift"), QTvpadding = that
										.attr("data-vpadding"), QTfull_width = (that
										.attr("data-full_width") === "1" || that
										.attr("data-full_width") === "true"), QTpadding = that
										.attr("data-padding");
								if (QTtime_constant == undefined
										|| QTtime_constant === "") {
									QTtime_constant = 200;
								}
								if (QTdist == undefined || QTdist === "") {
									QTdist = -30;
								}
								if (QTshift == undefined || QTshift === "") {
									QTshift = 0;
								}
								if (QTpadding == undefined || QTpadding === "") {
									QTpadding = 0;
								}
								if (QTvpadding == undefined
										|| QTvpadding === "") {
									QTvpadding = 0;
								}
								if (QTvpadding !== 0) {
									that.css({
										"margin-top" : QTvpadding,
										"margin-bottom" : QTvpadding
									});
								}
								var atts = {
									time_constant : parseInt(QTtime_constant,
											10),
									dist : parseInt(QTdist, 10),
									padding : parseInt(QTpadding, 10),
									shift : parseInt(QTshift, 10),
									full_width : QTfull_width
								};
								that.carousel(atts);

								that.parent().find(".prev").on("click",
										function(e) {
											e.preventDefault();
											that.carousel("prev");
										});
								that.parent().find(".next").on("click",
										function(e) {
											e.preventDefault();
											that.carousel("next");
										});

								that
										.find(".carousel-item")
										.on(
												"mouseenter touchstart",
												function(e) {
													var itemElem = $(this);
													itemElem.addClass("active");
													if ($("body").hasClass(
															"mobile")) {
														setTimeout(
																function() {
																	itemElem
																			.removeClass("active");
																}, 3000);
														that
																.find("a")
																.on(
																		"touchstart",
																		function(
																				e) {
																			window.location.href = $(
																					this)
																					.attr(
																							"href");
																		});
													}
												}).on("mouseleave", function() {
											$(this).removeClass("active");
										});
							});
		

	});
</script>

<link rel="shortcut icon" type="image/png"
	href="myfiles/images/main/logo_1pa.png" />

<style type="text/css">
.score {
	position: relative;
	top: 40px;
}

#title {
	position: relative;
	color: white;
	text-align: center;
}

#ranking {
	position: relative;
	margin: 100px;
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
}

tr {
	background-color: rgba(255, 255, 255, 0.5);
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

</style>
<script type="text/javascript">
	$(function() {

		$('#myCarousel').carousel({
			interval : 10000
		});

		$.ajax({
			url : "likeRanking",
			type : "get",
			success : function(resp) {
				console.log(resp);
				var res = "<table class='table table-reverse'><thead><tr>";
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
			<div id="like">
				<table class="table">
					<tr class="tr_top">
						<td>#</td>
						<td><span class="glyphicon glyphicon-heart"
							aria-hidden="true"></span> LIKE RANKING</td>
						<td>COUNT</td>
					</tr>
					<tr>
						<td>1</td>
						<td><img class="image" src=""
							onERROR="this.src='images/disc.png'"> 곡 제목입니다</td>
						<td>255</td>
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
				</table>
			</div>

			<div id="subscribe">
				<table class="table">
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
				</table>
			</div>

			<hr>

			<div id="title">
				<h3>LATEST MUSIC</h3>
			</div>


			<div id="latest">
				<table class="table">
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
				</table>
			</div>
		</div>

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
	</div>

</body>
</html>