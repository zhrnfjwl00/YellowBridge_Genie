<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사 신청 등록</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	.servicedetail{
		width: 65%;
		margin: 0px auto;
		padding-top: 30px;
	}
	
	.apply-top{
		width: 80%;
		margin: 0px auto;
		display: table;
		padding-bottom: 30px;
		border-bottom: 1px solid black;
	}
	
	#applyImg{
		width: 40%;
		vertical-align: middle;
		letter-spacing: -1px;
		display: table-cell;
		margin-right: 30px;
	}
	
	#applyImg img{
		width: 350px; 
		height: 200px; 
		border:1px solid black;
	}
	
	#apply-info1{
		padding-left: 100px;
		width: 50%;
		vertical-align: middle;
		display: table-cell;
	}
	
	td{padding: 3px;}
	
	input[type="text"]{padding: 7px;}
	
	.apply-bottom{
		padding-top: 30px;
		padding-bottom: 30px;
		width: 85%;
		margin: 0px auto;
		border-bottom: 1px solid black;
	}
	
	#apply-info2{
		width: 85%;
		margin: 0px auto;
	}
	
	.replyDiv{
		padding-top: 5px;
		padding-bottom: 30px;
		width: 80%;
		margin: 0px auto;
	}
	
	.replyTable{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		padding-top: 15px;
		padding-bottom: 15px;
		width: 100%;
	}
	
	.replyWriteTable{
		padding-top: 30px;
		padding-bottom: 15px;
		
	}
	
	#replybtn{
		background-color: lightgrey;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 30px 30px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	
	#applybtn{
    	background-color: rgb(189, 204, 148);
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 10px 30px;
        margin-top: 30px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
</style>
</head>
<body>
<div class="servicedetail">
	<c:import url="../common/header.jsp"/>
	
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 신청</b></h1>
	</div>
	
	<form action="<%= request.getContextPath() %>/insert.vo" method="post" encType="multipart/form-data">
		<div class="apply-top">
			<div id="applyImg">
				<img src="<%=request.getContextPath()%>${ volad.filePath }${ volad.fileName }">
			</div>
			<div id="apply-info1">
				<table>
					<tr>
						<td><b>${ volad.serviceTitle }</b></td>
					</tr>
					<tr>
						<td>10,000원</td>
					</tr>
						<td><div style="border-top:2px solid black; width:100%; margin: 20px 0;"></div></td>
					<tr>
						<td>${ volad.shelterInfo }</td>
					</tr>
					<tr>
						<td>${ volad.shelterTel }</td>
					</tr>
					<tr>
						<td>
							<div style="text-align: center;">
							<button id="applybtn" onclick="location.href='<%= request.getContextPath() %>/serviceapplyform.vol'">봉사신청</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="apply-bottom">
			<div id="apply-info2">
				<% pageContext.setAttribute("newLineChar", "\r\n"); %>
				<textarea id="content" name="content" class="form-control" cols="60" rows="25" readonly="readonly" style="resize:none; background-color: transparent"><c:out value="${fn:replace(volad.serviceContent, newLineChar, '<br>')}" /></textarea>
				<%-- ${fn:replace(volad.serviceContent, newLineChar, "<br>")} --%>
			</div>
		</div>
		
		
		<div class="replyDiv">
			<h5>후기</h5>
			<table class="replyTable" style="text-align:center;">
				<tr class="replyTr" >
					<td width="100px">강건강</td>
					<td width="400px">오늘 봉사 너무 즐거웠습니다~ 다음에 또 뵐게요</td>
					<td width="150px">2021-02-03</td>
				</tr>
				<tr class="replyTr">
					<td width="100px">남나눔</td>
					<td width="400px">재밌었어요~</td>
					<td width="150px">2021-02-03</td>
				</tr>
			</table>
			<table class="replyWriteTable">
				<tr>
					<td>
						<div class="wrap">
							<textarea cols="100%" rows="5" placeholder="후기를 남겨주세요" style="resize:none;"></textarea>
						</div>
					</td>
					<td>
						<button id="replybtn">등록하기</button>
					</td>
				</tr>
				<tr>
					<td colspan="2"><b>댓글(${ rCount })</b>
				</tr>
			</table>
		</div>
	</form>
	<c:import url="../common/footer.jsp"/>
</div>

	<script>
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = function(e){
	            const previewImage = document.getElementById("preview-image");
	            previewImage.src = e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}

	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", function(e){
	    readImage(e.target)
	});
	</script>
	
	<script>
    $(document).ready(function() {
      $('.wrap').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
  </script>

</body>
</html>