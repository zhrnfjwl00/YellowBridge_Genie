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
		<h1 style="color:#BDCC94;"><b>봉사 게시판</b></h1>
	</div>
	
    <div style="padding : 30px;">
		<form method="POST" action="/board/post">
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label>분류</label>
							<select name="category">
			           			<option value="">대구 반야월 쉼터</option>
			           			<option value="">구미 사랑 보호소</option>
			           			<option value="">양산 사랑이네 집</option>
			           			<option value="">창녕 쉼터</option>
			           			<option value="">대구 앵두네 집</option>
			           			<option value="">안성 행복한 보금자리</option>
			           		</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="subject" class="form-control">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>첨부파일</label>
							<input type="file" id="file" multiple="multiple" name="file">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>내용</label>
							<textarea name="content" class="form-control" cols="60" rows="25" style="resize:none"></textarea>
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


