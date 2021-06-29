<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
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
	 		.reply{margin: auto; width: 500px;}
			.replyTable{ margin: auto; width: 500px;}
			#rSubmit {float: right;}
	 	</style>
	</head>
	<body>
		<c:import url="../common/header.jsp"/>
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			
			<section id="container">
				<div class="form-group">
					<table>
						<tr>
							<th> ${board.bTitle} </th>
							<button class="delete_btn btn btn-danger" id="deleteBtn">삭제</button>
							<button class="update_btn btn btn-warning" id="updateBtn">수정</button>
							
						</tr>
						<tr>
							<td> ${board.bWriter} </td>
						</tr>
						<tr>
							<td> ${board.bCreateDate} &nbsp;&nbsp;
							 | &nbsp; 조회수 ${board.bView} </td> 
							
						</tr>
						<tr>
							<th>첨부파일
								<a href="${ contextPath }/resources/suploadFiles/${ fi.changeName }" download="${ fi.fileName }">${ fi.fileName }</a>
							</th>
						</tr>	
					</table>
				</div>
				
				<br>
				
				<div class="form-group">
					<% pageContext.setAttribute("newLineChar", "\r\n"); %> <!-- \r\n 말고 그냥 \n도, \r도 가능하다 -->
					${ fn:replace(board.bContent, newLineChar, "<br>") }
				</div>
								
				<p align="center">
					<button class="list_btn btn btn-primary"onclick="location.href='${ slist }'">목록</button>	
				</p>
				
				<c:url var="supdateView" value="supdate.sup">
					<c:param name="bNo" value="${ board.bNo }"/>
					<c:param name="page" value="${ page }"/>
				</c:url>
				
				<c:url var="sdelete" value="sdelete.bo">
					<c:param name="bNo" value="${ board.bNo }"/>
				</c:url>
				
				<c:url var="slist" value="sList.sup">
					<c:param name="page" value="${ page }"/>
				</c:url>
				
				<br>
				
				<table class="replyTable">
					<tr>
						<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
						<td><button id="rinsertBtn">등록하기</button></td>
					</tr>
				</table>
				
				<table class="replyTable" id="rtb">
					<thead>
					<tr>
						<td colspan="2"><b id="rCount"></b></td>
					</tr>
				</thead>
				<tbody></tbody>
				</table>
			</section>
		</div>
	<c:import url="../common/footer.jsp"/>
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
			/* $(".list_btn").on("click", function(){
				
				location.href = "/board/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			}) */
			
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