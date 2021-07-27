<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<title>게시글 작성</title>
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
	#fileBtn{
		background: #BDCC94;
    	border: 1px solid lightgray;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 5px 5px;
	}
</style>
</head>
<body>
<c:import url="header.jsp"/>
<div class="serviceBoardWrite">
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 게시판</b></h1>
	</div>
	
    <div style="padding : 30px;">
		<form action="reviewUpdate.vol" method="post" id="serviceBoardWrite" enctype="Multipart/form-data">
			<input type="hidden" id="volId" name="volId" value="${volu.volId}" />
			<input type="hidden" id="page" name="page" value="${page}" />
			
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label>보호소</label>
			           		<input type="hidden" name="volCategory" class="volCategory" value="${ volu.volCategory }">${ volu.volCategory }
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="volTitle" class="form-control" value="${ volu.volTitle }" required>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>첨부파일</label>
							<input type="file" id="uploadFile" multiple="multiple" name="uploadFile">
							<div class="vDeleteFile">
								<c:if test="${ !empty vFu.fileName && vFu.fileStatus =='Y'}">
								<br>현재 업로드한 파일 : 
									<a href="${ contextPath }/resources/voluploadFiles/${ vFu.changeName }" download="${ vFu.fileName }">${ vFu.changeName }</a>
								</c:if>
								
								<c:if test="${ !empty vFu.fileName }">
								<button type="button" class="deletefileBtn" id="fileBtn">삭제</button>
								</c:if>
							</div>
							
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label for="content" class="col-sm-2 control-label"><b>내용</b></label>
						<textarea id="summernote" name="volContent" class="form-control" cols="60" rows="25" style="resize:none" required>${volu.volContent}</textarea>
						</div>
					</td>
				</tr>
			</table>
			<div class="btnDiv">
			<button type="submit" class="btn btn-default">수정</button>
			<c:url var="ReviewDelete" value="ReviewDelete.vol">
				<c:param name="volId" value="${volu.volId}"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			</div>
		</form>
	</div>
	
</div>
<c:import url="../common/footer.jsp"/>
<script>
	$(".deletefileBtn").on('click', function(event) {
 		var that = $(this); 
		var fileNo = ${vFu.fileNo};
		var volId = ${volu.volId};
		var page = ${page};
		
		$.ajax({
			url : 'vdeleteFile.vol',
			type : 'post', 
			data : {fileNo:fileNo, volId:volId, page:page},
			dataType : 'text',
			success: function(data) {
				// controller 수행 후 
				// 클릭한 button이 속한 div를 remove하여 없앰.
				that.parent("div").remove();
				alert("파일이 삭제되었습니다. ")
				}
		});
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


