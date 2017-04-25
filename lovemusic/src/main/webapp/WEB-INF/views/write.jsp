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

<script type="text/javascript">

	$(document).ready(function(){
	});
	
	$(function() {
		
		//이미지
	    $("#imgInp").on('change', function(){
	        readURL(this);
	    });
	    
	    //체크박스
	    var count = 0;
	    $("input:checkbox").on('click', function(){
	   	  	if(count>0){
		    	$("#shared").html("unshared");
		   	  	//$("#shared").css("color", "#CCCCCC");
		    	count=0;
	   	  	}else{
		   	  	$("#shared").html("shared");
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
	img{
		width: 120px; height:120px;
		border-radius: 5px;
	}
	#center{ 
		margin: auto; text-align: center;
	}
	
	.container{
		margin: 20px;
	}
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
	    			<input type="hidden" name="filenum" value="${boardFile.filenum}" />
	    			<input type="hidden" name="userid" value="${loginId}" />
		    		<div class="col-md-3" id="center">
		    		<br>
		    			<!-- 이미지 주소 : 임시 주소!! -->
				        
				   		 <label>
			                <img id="imgView" src="resources/covers/${boardFile.cover_re}" onERROR="this.src='images/album.jpg'"/> <input type="file" style="display: none;" id="imgInp" name="upload" />
			            </label>
						<hr>

							<label>
						    	<input type="checkbox" id="checkbox" value="share" name="shared">
								<span id="shared">unshared</span>
							</label>
					</div>
					
					<div class="col-md-9" style="border:solid 1px lightgray; padding:25px; border-radius: 5px;">
						<div class="form-group label-floating">
							<label class="control-label">Title (*Default : File Title)</label>
							<input type="text" class="form-control" name="title" value="${boardFile.file_title}">
						</div>
						<div class="form-group label-floating" id="code">
						<label class="control-label">Code</label>
						<textarea class="form-control"rows="5" readonly>${boardFile.file_ori}</textarea>
						</div>
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