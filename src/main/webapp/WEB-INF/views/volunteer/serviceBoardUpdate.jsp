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
		<form action="serviceBoardUpdate.vol" method="post" id="serviceBoardWrite" enctype="Multipart/form-data">
			<input type="hidden" id="volId" name="volId" value="${volu.volId}" />
			
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label>분류</label>
							<select name="volCateNo">
			           			<option value="1">대구 반야월 쉼터</option>
			           			<option value="2">구미 사랑 보호소</option>
			           			<option value="3">양산 사랑이네 집</option>
			           			<option value="4">창녕 쉼터</option>
			           			<option value="5">대구 앵두네 집</option>
			           			<option value="6">경산 아이들 쉼터</option>
			           		</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>제목</label>
							<input type="text" name="volTitle" class="form-control" value="${ volu.volTitle }">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<label>첨부파일</label>
							<input type="file" id="uploadFile" multiple="multiple" name="uploadFile"><button class="fileBtn" id="fileBtn">삭제</button>
							<a href="<%= request.getContextPath() %>/resources/voluploadFiles/${ vFu.changeName }" download="${ vFu.fileName }">${ vFu.changeName }</a>
							
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<label for="content" class="col-sm-2 control-label"><b>내용</b></label>
						<textarea id="volContent" name="volContent" class="form-control" cols="60" rows="25" style="resize:none">${volu.volContent}</textarea>
						</div>
					</td>
				</tr>
			</table>
			<div class="btnDiv">
			<button type="submit" class="btn btn-default">수정</button>
			<c:url var="serviceBoardDelete" value="serviceBoardDelete.vol">
				<c:param name="volId" value="${volboard.volId}"/>
			</c:url>
			</div>
		</form>
	</div>
	<c:import url="../common/footer.jsp"/>
	
</div>

<script type="text/javascript">
	// 참고** 미리 댓글부분 적어놓긴 했는데 수정하실 분들은 수정하셔도 됩니다! 
	$(document).ready(function(){
		/* var formObj = $("form[name='readForm']");
		
		// 삭제
		$(".fileBtn").on("click", function(){
			
			var deleteYN = confirm("삭제하시겠습니까?");
			if(deleteYN == true){
				
			formObj.attr("action", "/volunteer/delete");
			formObj.attr("method", "post");
			formObj.submit();
				
			}
		})   */
		
		
		$("#fileBtn").on("click", function(){
			var fileNo = ${vFu.fileNo};
			
			location.href = "serviceBoardDelete.vol?volId="+volId;
		})
	}
</script>
</body>
</html>


