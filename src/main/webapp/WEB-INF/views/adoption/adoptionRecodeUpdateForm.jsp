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
			<input type="hidden" name="renameFileName" value="${ adopboard.renameFileName }">
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
							<c:if test="${ !empty adopboard.originalFileName }">
							<br>현재 업로드한 파일 : 
							<a href="${ contextPath }/resources/auploadFiles/${ adopboard.renameFileName }" download="${ adopboard.originalFileName }">${ adopboard.originalFileName }</a>
							</c:if>
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
			<button type="submit" class="btn btn-default">작성</button> 
			</div>
		</form>
	</div>
	
	
</div>
</body>
</html>

