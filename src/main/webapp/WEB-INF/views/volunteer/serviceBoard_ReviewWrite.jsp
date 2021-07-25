<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
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

<title>후기 게시글 작성</title>
<style>
.serviceBoardWrite {
		width: 65%;
		margin: 0px auto;
	}
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	.form-group{padding-bottom: 5px;}
	.btnDiv{padding-top:25px; float: right;}
</style>
</head>
<body>
<c:import url="header.jsp"/>
<div class="serviceBoardWrite">
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 후기 작성</b></h1>
	</div>
	
    <div style="padding : 30px;">
		<form action="writeReview.vol" method="post" id="writeReview" enctype="Multipart/form-data">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label>분류</label>
							<input type="hidden" name="volCategory" class="volCategory" value="${ va.shelterName}">${ va.shelterName }
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="volTitle" class="form-control" required>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>첨부파일</label>
							<input type="file" id="uploadFile" multiple="multiple" name="uploadFile">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>내용</label>
							<textarea id="summernote" name="volContent" class="form-control" cols="60" rows="25" style="resize:none" required></textarea>
						</div>
					</td>
				</tr>
			</table>
			<div class="btnDiv">
			<button type="submit" class="btn btn-default">작성</button>
			</div>
		</form>
	</div>
	
</div>
<c:import url="../common/footer.jsp"/>
<script>
	$('#summernote').summernote({
		  // 에디터 높이
		  height: 150,
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
			    // 코드보기, 확대해서보기, 도움말
			    ['view', ['codeview','fullscreen', 'help']]
			  ],
			  // 추가한 글꼴
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			 // 추가한 폰트사이즈
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		});
</script>
</body>
</html>


