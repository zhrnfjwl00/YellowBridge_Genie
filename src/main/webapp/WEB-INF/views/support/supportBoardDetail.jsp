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
			.replyTable{margin: auto; width: 900px;}
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
			<c:url var="supdateView" value="supdateView.sup">
					<c:param name="bNo" value="${ board.bNo }"/>
					<c:param name="page" value="${ page }"/>
			</c:url>
				
			<c:url var="sdelete" value="sdelete.sup">
					<c:param name="bNo" value="${ board.bNo }"/>
			</c:url>
			
			<section id="container">
				<div class="form-group">
					<table>
						<tr>
							<th> ${board.bTitle} 
							<%-- <c:if test="${loginUser.id eq board.bWriter}"> --%>
							<button class="delete_btn btn btn-danger" id="deleteBtn" onclick="location.href='${sdelete}'">삭제</button>
							<button class="update_btn btn btn-warning" id="updateBtn" onclick="location.href='${supdateView}'">수정</button>
							<%-- </c:if> --%>
							</th>
						</tr>
						<tr>
							<td> ${board.nickname} </td>
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
								
				<c:url var="slist" value="sList.sup">
					<c:param name="page" value="${ page }"/>
				</c:url>
				<p align="center">
					<button class="list_btn btn btn-primary" onclick="location.href='${ slist }'">목록</button>	
				</p>
				
				<br>
				
				<table class="replyTable">
					<tr>
						<td colspan="7"><label for="content">&nbsp;&nbsp;<b>댓글</b></label></td>
					</tr>
					<tr>
						<td colspan="6"><input type="text" id="rContent" name="rContent" class="form-control"/></td>
						<td><button id="rinsertBtn"class="replyWriteBtn btn btn-success">작성</button></td>
					</tr>
				</table>
				
<%-- 				<c:url var="rdelete" value="rdelete.sup"> --%>
<%-- 					<c:param name="rId" value="${rId}"/> --%>
<%-- 				</c:url> --%>
				
				<table class="replyTable" id="rtb">
					<thead>
						<tr><td colspan="2"><b id="rCount"></b></td></tr>
					</thead>
					<tbody></tbody> 
				</table>
				
			</section>
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</body>
	<script type="text/javascript">
	$(function(){
		
		getReplyList();
		
 		setInterval(function(){
 			getReplyList();
 		}, 10000);
		
		$('#rinsertBtn').on('click', function(){
			var rContent = $('#rContent').val();
			var refBid = ${board.bNo};
			
			$.ajax({
				url: 'addReply.sup',
				data: {rContent:rContent, refBid:refBid},
				success: function(data){
					console.log(data);
					
					if(data == 'success'){
						$('#rContent').val('');
						getReplyList(); // 댓글 리스트 불러오기
					}
				}
			});
		});
		
		
	});
	
	function getReplyList(){
		var bNo = ${board.bNo};
		
		$.ajax({
			url: 'rList.sup',
			data: {bNo:bNo},
			dataType: 'json',
			success: function(data){
				console.log(data);
				var $tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				$('#rCount').text('댓글(' + data.length + ')');
				if(data.length > 0){
					for(var i in data){
						var $tr = $('<tr>');
						var $rWriter = $('<td width=100 style="font-weight: bolder;">').text(data[i].rWriter);
						var $rContent = $('<td width=600>').text(data[i].rContent);
						var $rCreateDate = $('<td width=100>').text(data[i].rCreateDate);
// 						var rId = data[i].rId;
// 						console.log(rId);
// 						var realRId = rId.trim();
						var bNo = ${board.bNo};
						var page = ${page};
						var $rdeleteBtn = $('<td width=50 id="deleteReplyBtn"><a href="rdelete.sup?rId='+ data[i].rId + '&bNo=' + bNo + '&page=' + page + '">X</a></td>');
																								
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tr.append($rdeleteBtn);
						$tableBody.append($tr);
						
						
					}
					
					
					
				} else {
					var $tr = $('<tr>');
					var $rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
			}
		});
	}
	
	/* $(function(){
		$('#deleteReplyBtn').on('click', function(){
			var $rId = $(this).parent().children.eq(0).text();
			location.href="rdelete.sup?rId="+ $rId;
		});
		
	}); */
	
	
	
	</script>
	
	<script type="text/javascript">
	
		
		
	
	</script>
	<!-- <script type="text/javascript">
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
		});
		
		/* $(function(){
			
			getReplyList();
			
			setInterval(function(){
				getReplyList();
			}, 10000);
			
			$('#rSubmit').on('click', function(){
				var rContent = $('#rContent').val();
				var bNo = ${board.bNo};
				
				$.ajax({
					url:'addReply.sup',
					data:{rContent:rContent, bNo:bNo},
					success: function(data){
						console.log(data);
						if(data == 'success'){
							$('#rContent').val('');
							getReplyList(); // 댓글 리스트 불러오기
					  }
					}
				});
			});
		}); */
	</script> -->
</html>