<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
</head>

<!--==============   APPENDING JS AND CSS   =================-->
<script src="resources/jquery-3.1.1.min.js"></script>
<script src="resources/myfiles/js/bg-movie.js"></script>
<link href='resources/myfiles/css/bg-movie.css' rel='stylesheet' type='text/css'>

<script type="text/javascript">

	$(document).ready(function(){
	});
	
	$(function() {
		if($("#filenum").attr("value") == "") {
			$("#filenum").removeAttr("name");
		}
		
		//이미지
	    $("#imgInp").on('change', function(){
	        readURL(this);
	    });
	    
	    //체크박스
	    var count = 0;
	    $("input:checkbox").on('click', function(){
	   	  	if(count>0){
		    	$("#shared").html("shared");
		   	  	//$("#shared").css("color", "#CCCCCC");
		    	count=0;
	   	  	}else{
		   	  	$("#shared").html("unshared");
		   	  	//$("#shared").css("color", "#9c27b0");
		   	  	//$("#code").html("");
		    	count++;
	   	  	}
	    });
	});

  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
              $('#imgView').attr('src', e.target.result);
          }

        reader.readAsDataURL(input.files[0]);
      }
  }

</script>

<style>
	.image{
		width: 120px; height:120px;
		border-radius: 5px;
	}
	#center{ 
		margin: auto; text-align: center;
	}
	
	.container{
		margin: 20px;
	}
	
/* share 스위치 START */
	.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
/* share 스위치 END */
	
</style>


<body>
	<jsp:include page="navibar.jsp" flush="false" />
	<div id="totalWrapper">
		<div class="video-container" style="position:absolute;">	<!-- ★ -->
			<video autoplay loop class="fillWidth">
				<source src="myfiles/video/For_Wes.mp4" type="video/mp4" />
			</video>
		</div>

	    	<div class="container"><h3>write</h3>
	    		<div class="row" style="margin: 30px;">
	    		<form id="form1" runat="server" action="writing" method="post" enctype="multipart/form-data">
	    			<input type="hidden" name="userid" value="${loginId}" />
	    			<input type="hidden" name="filenum" id="filenum" value="${boardFile.filenum}" />
		    		<div class="col-md-3" id="center">
		    		<br>
				        
				   		 <label>
			                <img id="imgView" class="image" src="resources/covers/${boardFile.cover_re}" onERROR="this.src='images/album.jpg'"/> <input type="file" style="display: none;" id="imgInp" name="upload" />
			            </label>
						<hr>
						
						<label class="switch">	<!-- share 체크박스 -->
						  <input type="checkbox" value="true" name="shared" checked>
						  <div class="slider round"></div><br>
						  <span id="shared">shared</span>
						</label>
					</div>
					
					<div class="col-md-9" style="border:solid 1px lightgray; padding:25px; border-radius: 5px;">
						<div class="form-group label-floating">
							<label class="control-label">Title <c:if test="${boardFile.file_title != null}">(*Default : File Title)</c:if></label>
							<input type="text" class="form-control" name="title" value="${boardFile.file_title}">
						</div>
						<c:if test="${boardFile.file_title != null}">
							<div class="form-group label-floating" id="code">
							<label class="control-label">Code</label>
							<textarea class="form-control"rows="5" readonly>${boardFile.file_ori}</textarea>
							</div>
						</c:if>
						<div class="form-group label-floating">
						<label class="control-label">Detail</label>
						<textarea class="form-control" rows="5" name="content"></textarea>
						</div>
						<div style="text-align:right;"><button class="btn btn-primary btn-sm">write</button></div>
					</div>
				</form>	    
				</div>
			</div>
		<!-- Modal -->
		<div id="visual" class="modal fade" role="dialog"></div>
	</div>
</body>
</html>