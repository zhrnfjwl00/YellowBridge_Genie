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
<style type="text/css">
	#all{margin: 100px;}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
    <div id=all style="padding : 30px;">
		<div style="text-align:center;" class="serviceBoardtext">
			<h1 style="color:#BDCC94;"><b>공지사항</b></h1>
		</div>
        <form method="POST" action="noinsert.sc" enctype="Multipart/form-data">
          <div class="form-group">
            <label>제목</label>
            	<input type="text" name="scTitle" class="form-control" value="[공지] ">
          </div>
           <div class="form-group">
	          <input type="file" id="uploadFile" multiple="multiple" name="uploadFile">
          </div>
          <div class="form-group">
          	<label>작성자</label>
           	 <input type="text" name="scWriter" readonly value="${ loginUser.nickname }" style="border-color: white;">
          </div>
          <div class="form-group">
            <label>내용</label>
            	<textarea name="scContent" class="form-control" rows="5"></textarea>
          </div>
          <c:if test="${!empty loginUser}">
          	<button type="submit" class="btn btn-default">작성</button>
          </c:if>
        </form>
    </div>
    	<c:import url="../common/footer.jsp"/>
</body>
</html>


