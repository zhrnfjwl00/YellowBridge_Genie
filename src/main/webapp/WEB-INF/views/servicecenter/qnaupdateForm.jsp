<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>게시글 수정</title>
<style type="text/css">
	#all{margin: 100px;}
</style>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
    <div id=all style="padding : 30px;">
        <form method="POST" action="qnaupdate.sc" enctype="Multipart/form-data">
         <input type="hidden" name="page" value="${ page }">
		 <input type="hidden" name=bNo value="${ board.qId }">
		 <input type="hidden" name="renameFileName" value="${ scfi.renameFileName }">
          <div class="form-group">
            <label>제목</label>
            	<input type="text" name="bTitle" class="form-control" value="${board.qTitle}">
          </div>
          <div class="form-group">
	          <input type="file" id="reloadFile" multiple="multiple" name="reloadFile">
	          <c:if test="${ !empty scfi.fileName }">
	          	<a href="${ contextPath }/resources/scuploadFiles/${ scfi.changeName }" download="${ scfi.fileName }"> <br>현재 업로드한 파일 : ${ scfi.fileName }</a>"
	          </c:if>
          </div>
          <div class="form-group">
          	<label>작성자</label>
           	 <input type="text" name="bWriter" readonly value="${ board.qWriter }" style="border-color: white;">
          </div>
          <div class="form-group">
            <label>내용</label>
            	<textarea name="bContent" class="form-control" rows="5"> ${board.qContent} </textarea>
          </div>
          	<button type="submit" class="btn btn-default">수정</button>
        </form>
    </div>
    
   
   <c:import url="../common/footer.jsp"/>
</body>
</html>