<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사 신청 등록</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	.serviceform{
		width: 65%;
		margin: 0px auto;
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
		width: 80%;
		margin: 0px auto;
		display: table;
		padding-top: 30px;
		padding-bottom: 30px;
	}
	
	#apply-info2{
		width: 100%;	
		margin: 0px auto;
		align:center;
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
	
</style>
</head>
<body>
<div class="serviceform">
	<div style="text-align:center; padding-bottom:30px;">
		<h1 style="color:#BDCC94; letter-spacing: -1px;">봉사 신청 등록</h1>
	</div>
	
	<form action="<%= request.getContextPath() %>/insert.vo" method="post" encType="multipart/form-data">
		<div class="apply-top">
			<div id="applyImg">
				<img id="preview-image">
				<input style="text-align:center;" type="file" id="input-image" name="upfile">
			</div>
			<div id="apply-info1">
				<table>
					<tr>
						<td><input type="text" name="title" size="70%" placeholder="제목을 입력해주세요" required></td>
					</tr>
					<tr>
						<td>10,000원</td>
					</tr>
						<td><div style="border-top:2px solid black; width:100%; margin: 20px 0;"></div></td>
					<tr>
						<td><textarea cols="72%" rows="7" name="content" placeholder="보호소 소개를 입력해주세요" style="resize:none;" required></textarea></td>
					</tr>
					<tr>
						<td><input type="text" name="tel" size="60%" placeholder="문의처를 남겨주세요" required></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="apply-bottom">
			<div id="apply-info2">
				<textarea cols="140" rows="15" name="servicecontent" placeholder="봉사에 관한 자세한 설명을 입력해주세요." style="resize:none;" required></textarea>
			</div>
			<div style="text-align: center;">
				<input type="submit" name="applybtn" id="applybtn" value="등록하기">
			</div>
		</div>
	</form>
	
	
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
</div>
</body>
</html>