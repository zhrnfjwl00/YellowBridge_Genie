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
	.btnDiv{padding-top:15px; float: right;}
	#writeBtn{
    	background-color: #BDCC94;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
        padding: 7px 10px;
	}

.area {
	width: 100%;
	height: 150px;
}	

.serviceBoardWrite {
	margin-top: -150px;
}
	
</style>
</head>
<body>
<div class="serviceBoardWrite">
<c:if test="${loginUser.id.equals('admin')}">
      <c:import url="../admin/header.jsp"/>
   </c:if>
   <c:if test="${!loginUser.id.equals('admin')|| empty loginUser}">
      <c:import url="../common/header.jsp"/>
   </c:if>
   		<div class="area"></div>
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>입양일지등록</b></h1>
	</div>
	
    <div style="padding : 30px;">
		<form action="adopinsert.ado" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="adopTitle" class="form-control">
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
							<textarea name="adopContent" class="form-control" cols="60" rows="25" style="resize:none"></textarea>
						</div>
					</td>
				</tr>
			</table>
			<div class="btnDiv">
			<button type="submit" id="writeBtn">작성</button> 
			</div>
		</form>
	</div>
	
	
</div>
</body>
</html>


