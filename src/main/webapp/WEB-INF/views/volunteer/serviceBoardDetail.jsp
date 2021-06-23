<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<meta charset="utf-8">
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
<style type="text/css">
	#rinsertBtn, #deleteBtn, #updateBtn{float: right; margin: 5px;}
	#listBtn{float: center;}
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	.form-group #title{font-size:24px; font-weight:bold;padding-bottom:15px;}
</style>
</head>
<body>
<div class="container">
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 게시판</b></h1>
	</div>
	 
	<div>
		<c:import url="../common/header.jsp"/>
	</div>
	
	<section id="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="volId" name="volId" value="${volboard.volTitle}" />
			<input type="hidden" id="volTitle" name="volTitle" value="${volboard.volTitle}"> 
			<input type="hidden" id="volWriter" name="volWriter" value="${volboard.volWriter}"> 
			<input type="hidden" id="volContent" name="volContent" value="${volboard.volContent}"> 
			<input type="hidden" id="volCategory" name="volCategory" value="${volboard.volCategory}"> 
			<input type="hidden" id="volCount" name="volCount" value="${volboard.volCount}"> 
			<input type="hidden" id="volCreateDate" name="volCreateDate" value="${volboard.volCreateDate}"> 
		</form> 
		
		<div class="form-group">
		<table>
			<tr>
				<th id="title"> ${ volboard.volTitle } </th>
				<button class="delete_btn btn btn-danger" id="deleteBtn">삭제</button>
				<button class="update_btn btn btn-warning" id="updateBtn">수정</button>
				
			</tr>
			<tr>
				<td> ${ volboard.volWriter }  </td>
			</tr>
			<tr>
				<td> ${ volboard.volCreateDate } &nbsp;&nbsp;</td> 
				<td> | 조회수 &nbsp; ${ volboard.volCount } </td>
				
			</tr>
		
		</table>
			
		</div>
		<div class="downloadFile">
				<a href='' download=''> 첨부 파일 다운로드 </a>
		</div>
		
		<br>
		
		<div class="form-group">
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
			<label for="content" class="col-sm-2 control-label">내용</label>
			<textarea id="content" name="content" class="form-control" readonly="readonly">
				<c:out value="${fn:replace(volboard.volContent, newLineChar, '<br>')}" />
			</textarea>
		</div>
						
		<div align="center">
			<button id="listBtn" class="list_btn btn btn-primary">목록</button>	
		</div>
		
		<br>
		
		<!-- 댓글 -->
		<div id="reply">
			<ol class="replyList">
				<c:forEach items="${replyList}" var="replyList">
					<li>
						<p>
						작성자 : ${replyList.writer}<br />
						작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
						</p>
						  
						<p>${replyList.content}</p>
						<div>
							<button type="button" class="replyUpdateBtn btn btn-warning" data-rno="${replyList.rno}">수정</button>
							<button type="button" class="replyDeleteBtn btn btn-danger" data-rno="${replyList.rno}">삭제</button>
						</div>
					</li>
				</c:forEach>   
			</ol>
		</div>
		
		<form name="replyForm" method="post" class="form-horizontal">
			<input type="hidden" id="bno" name="bno" value="${read.bno}" />
			<input type="hidden" id="page" name="page" value="${scri.page}"> 
			<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
			<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
			<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
		
			<hr>
			
			<div class="form-group">
				<label for="content">&nbsp;&nbsp; 댓글 </label>
				<input type="text" id="content" name="content" class="form-control"/><button id="rinsertBtn"class="replyWriteBtn btn btn-success">작성</button>
			</div>
			
			<hr>
				<div>등록된 댓글이 없습니다.</div>
			<hr>
			
		</form>
	</section>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
	<script type="text/javascript">
		// 참고** 미리 댓글부분 적어놓긴 했는데 수정하실 분들은 수정하셔도 됩니다! 
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/board/replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
		})
	</script>
</html>