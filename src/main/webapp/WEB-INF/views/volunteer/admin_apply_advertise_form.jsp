<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
 <!-- 서머노트를 위해 추가해야할 부분 -->
 <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

<title>봉사 신청 등록</title>
<style>
	.serviceform{
		width: 65%;
		margin: 0px auto;
		padding-top: 30px;
	}
	
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
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
<c:import url="admin_header.jsp"/>
<div class="serviceform">
	<div style="text-align:center; padding-bottom:30px;" class="serviceBoardtext">
		<h1 style="color:#BDCC94; letter-spacing: -1px;"><b>봉사 신청 등록</b></h1>
	</div>
	
	<form action="<%= request.getContextPath() %>/adminAdInsert.vol" method="post" encType="multipart/form-data">
		<div class="apply-top">
			<div id="applyImg">
				<img id="preview-image">
				<input style="text-align:center;" type="file" id="uploadFile" name="uploadFile">
			</div>
			<div id="apply-info1">
				<table>
					<tr>
						<td><input type="text" name="serviceTitle" size="70%" placeholder="제목을 입력해주세요" required></td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
							<label>분류</label>
							<select name="shelterName" id="category">
			           			<option value="카테고리선택">카테고리선택</option>
			           			<option value="대구 반야월 쉼터">대구 반야월 쉼터</option>
			           			<option value="구미 사랑 보호소">구미 사랑 보호소</option>
			           			<option value="양산 사랑이네 집">양산 사랑이네 집</option>
			           			<option value="경남 창녕 쉼터">경남 창녕 쉼터</option>
			           			<option value="대구 앵두네 집">대구 앵두네 집</option>
			           			<option value="경산 아이들 쉼터">경산 아이들 쉼터</option>
			           			<option value="청도 허그안 쉼터">청도 허그안 쉼터</option>
			           		</select>
							</div>
						</td>
					</tr>
					<tr>
						<td>10,000원</td>
					</tr>
						<td><div style="border-top:2px solid black; width:100%; margin: 20px 0;"></div></td>
					<tr>
						<td><textarea cols="72%" rows="7" name="shelterInfo" placeholder="보호소 소개를 입력해주세요" style="resize:none;" required></textarea></td>
					</tr>
					<tr>
						<td><input type="text" name="shelterTel" size="60%" placeholder="문의처를 남겨주세요" required></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="apply-bottom">
			<div id="apply-info2">
				<textarea cols="140" rows="15" id="summernote" name="serviceContent" placeholder="봉사에 관한 자세한 설명을 입력해주세요." style="resize:none;" required></textarea>
			</div>
			<div style="text-align: center;">
				<input type="submit"  onclick="return cate();" name="applybtn" id="applybtn" value="등록하기">
			</div>
		</div>
	</form>
</div>
<c:import url="../common/footer.jsp"/>
<script type="text/javascript">
	function cate(){
		if($('#category').val().trim() == '카테고리선택'){
			alert('카테고리를 선택해주세요.');
			$('#category').focus();
			return false;
		}
	}
</script>	
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
	const inputImage = document.getElementById("uploadFile")
	inputImage.addEventListener("change", function(e){
	    readImage(e.target)
	});
</script>
<script>
$('#summernote').summernote({
	  // 에디터 높이
	  height: 500,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	});
	
</script>
</body>
</html>