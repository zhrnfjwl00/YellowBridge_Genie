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
<c:import url="../common/header.jsp"/>
<div class="serviceBoardWrite">
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 게시판</b></h1>
	</div>
	
    <div style="padding : 30px;">
		<form action="serviceBoardUpdate.vol" method="post" id="serviceBoardWrite" enctype="Multipart/form-data">
			<input type="hidden" id="volId" name="volId" value="${volu.volId}" />
			<input type="hidden" id="page" name="page" value="${page}" />
			
			<table>
				<tr>
					<td>
						<div class="form-group">
							<label>분류</label>
							<select name="volCateNo">
			           			<option value="21">대구 반야월 쉼터</option>
			           			<option value="22">구미 사랑 보호소</option>
			           			<option value="23">양산 사랑이네 집</option>
			           			<option value="24">창녕 쉼터</option>
			           			<option value="25">대구 앵두네 집</option>
			           			<option value="26">경산 아이들 쉼터</option>
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
							<input type="file" id="uploadFile" multiple="multiple" name="uploadFile">
							<div>
								<button type="button" class="fileBtn" id="fileBtn" onclick="location.href='${ vdeleteFile }'">삭제</button>
								<a href="<%= request.getContextPath() %>/resources/voluploadFiles/${ vFu.changeName }" download="${ vFu.fileName }">${ vFu.changeName }</a>
							</div>
							<c:url var="vdeleteFile" value="vdeleteFile.vol">
								<c:param name="fileNo" value="${ vFu.fileNo }"/>
								<c:param name="page" value="${ page }"/>
							</c:url>
							
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
				<c:param name="page" value="${ page }"/>
			</c:url>
			</div>
		</form>
	</div>
	
</div>
<c:import url="../common/footer.jsp"/>
<script type="text/javascript">
$("#fileBtn").on("click", function(){
	var volId = ${volu.volId};
	var fileNo = ${ vFu.fileNo };
	var page = ${page};
	
	location.href="vdeleteFile.vol?volId=" + volId + "&fileNo="+fileNo+"&page="+page;
})
</script>

</body>
</html>


