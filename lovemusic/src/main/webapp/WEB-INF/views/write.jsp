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
	
	
.switch {
  position: relative;
  display: inline-block;
  vertical-align: top;
  width: 56px;
  height: 20px;
  padding: 3px;
  background-color: white;
  border-radius: 18px;
  box-shadow: inset 0 -1px white,
              inset 0 1px 1px rgba(black, .05);
  cursor: pointer;
  @include linear-gradient(top, #eee, white 25px);
}

.switch-input {
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}

.switch-label {
  position: relative;
  display: block;
  height: inherit;
  font-size: 10px;
  text-transform: uppercase;
  background: #eceeef;
  border-radius: inherit;
  box-shadow: inset 0 1px 2px rgba(black, .12),
              inset 0 0 2px rgba(black, .15);
  @include transition($switchTransition);
  @include transition-property(opacity background);

  .switch:before, .switch:after {
    position: absolute;
    top: 50%;
    margin-top: -.5em;
    line-height: 1;
    @include transition(inherit);
  }

  .switch:before {
    content: attr(data-off);
    right: 11px;
    color: #aaa;
    text-shadow: 0 1px rgba(white, .5);
  }

  .switch:after {
    content: attr(data-on);
    left: 11px;
    color: white;
    text-shadow: 0 1px rgba(black, .2);
    opacity: 0;
  }
}

.switch-handle {
  position: absolute;
  top: 4px;
  left: 4px;
  width: 18px;
  height: 18px;
  background: white;
  border-radius: 10px;
  box-shadow: 1px 1px 5px rgba(black, .2);
  @include linear-gradient(top, white 40%, #f0f0f0);

  .switch:before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    margin: -6px 0 0 -6px;
    width: 12px;
    height: 12px;
    background: #f9f9f9;
    border-radius: 6px;
    box-shadow: inset 0 1px rgba(black, .02);
    @include linear-gradient(top, #eee, white);
  }

}

.switch-green > .switch-input:checked ~ .switch-label { background: #4fb845; }
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
    <label class="switch">
      <input type="checkbox" id="checkbox" value="share" name="shared" class="switch-input" checked>
      <span id="shared" class="switch-label" data-on="On" data-off="Off"> shared </span>
      <span class="switch-handle"></span>
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