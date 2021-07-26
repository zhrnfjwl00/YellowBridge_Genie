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
<div class="serviceBoardWrite">
	<c:import url="../common/header.jsp"/>
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>입양일지등록</b></h1>
	</div>
	
    <div style="padding : 30px;">
		<form action="adopUpdate.ado" method="post" enctype="multipart/form-data">
			<input type="hidden" name="page" value="${ page }">
			<input type="hidden" name="adopId" value="${ adopboard.adopId }">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="adopTitle" class="form-control" value="${ adopboard.adopTitle }">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>첨부파일</label>
							<input type="file" id="uploadFile" multiple="multiple" name="reloadFile">
							
							<div class="aDeleteFile">
							<c:if test="${ !empty af.fileName && af.fileStatus =='Y'}">
							<br>현재 업로드한 파일 : 
							<a href="${ contextPath }/resources/auploadFiles/${ af.fileChangeName }" download="${ af.fileName }">${ af.fileName }</a>
							</c:if>
							
							<c:if test="${ !empty af.fileName}">
							<button type="button" class="deletefileBtn" id="fileBtn">삭제</button>
							</c:if>
							</div>
							
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>내용</label>
							<textarea name="adopContent" class="form-control" cols="60" rows="25" style="resize:none">${ adopboard.adopContent }</textarea>
						</div>
					</td>
				</tr>
			</table>
			<div class="btnDiv">
			<button type="submit" class="btn btn-default">수정</button> 
			</div>
		</form>
	</div>
</div>
</body>
<script>
	$(".deletefileBtn").on('click', function(event) {
		// deletefileBtn 버튼 클릭시 
		// filestatus 값 N 으로 변경후 controller에서 success로 반환되도록 설정
		
 		var that = $(this); 
		var fileNo = ${ af.fileNo };
		var adopId = ${ adopboard.adopId};
		
		$.ajax({
			url : 'aDeleteAdopFile.ado',
			type : 'post', 
			data : {fileNo:fileNo, adopId:adopId},
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
</html>


