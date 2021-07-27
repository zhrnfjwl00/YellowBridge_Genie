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
<title>Q&A작성</title>
<style type="text/css">
	#all{margin: 100px;}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
    <div id=all style="padding : 30px;">
    
		<div style="text-align:center;" class="serviceBoardtext">
			<h1 style="color:#BDCC94;"><b>Q&A작성</b></h1>
		</div>
		
        <form method="POST" action="qnainsert.sc" enctype="Multipart/form-data">
          <div class="form-group">
            <label>제목</label>
            	<input type="text" name="qTitle" class="form-control" value=" ">
          </div>
          <div class="form-group">
	          <input type="file" id="uploadFile" multiple="multiple" name="uploadFile">
          </div>
          <div class="form-group">
          	<label>작성자</label>
           	 <input type="text" name="qWriter" readonly value="${ loginUser.nickname }" style="border-color: white;">
          </div>
          <div class="form-group">
            <label>내용</label>
            	<textarea name="qContent" class="form-control" rows="5"></textarea>
          </div>
          	<button type="submit" class="btn btn-default">작성</button>
        </form>
    </div>
    	<c:import url="../common/footer.jsp"/>
</body>
</html>


