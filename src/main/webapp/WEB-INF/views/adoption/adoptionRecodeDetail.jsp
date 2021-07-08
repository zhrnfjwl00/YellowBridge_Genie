<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<meta charset="utf-8">
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
부가적인 테마
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
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
	.replyTable{margin: auto; }
</style>
</head>
<body>
<div class="container">
	<c:import url="../common/header.jsp"/>
	
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>입양 일지</b></h1>
	</div>
	
	<section id="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="adopId" name="adopId" value="${adopboard.adopId}" />
			<input type="hidden" id="adopTitle" name="adopTitle" value="${adopboard.adopTitle}"> 
			<input type="hidden" id="adopWriter" name="adopWriter" value="${adopboard.adopWriter}"> 
			<input type="hidden" id="adopContent" name="adopContent" value="${adopboard.adopContent}"> 
			<input type="hidden" id="adopView" name="adopView" value="${adopboard.adopView}"> 
			<input type="hidden" id="adopCreateDate" name="adopCreateDate" value="${adopboard.adopCreateDate}"> 
		</form> 
	
		<div class="form-group">
			<table>
				<tr>
					<th id="title"> ${ adopboard.adopTitle } </th>
<%--  					<button class="delete_btn btn btn-danger" id="deleteBtn" onclick="location.href='${ adopDelete }'">삭제</button>
					<button class="update_btn btn btn-warning" id="updateBtn" onclick="location.href='${ adopUpdateForm }'">수정</button>  --%>
					
				</tr>
				<tr>
					<td><b>작성자</b>&nbsp;&nbsp;${ adopboard.adopWriter }</td>
				</tr>
				<tr>
					<td><b>작성일</b>&nbsp;&nbsp;${ adopboard.adopCreateDate } &nbsp;&nbsp;</td> 
					<td>| <b>조회수</b> &nbsp;&nbsp;${ adopboard.adopView } </td>
				</tr>
			</table>
			
		</div>
		<div class="downloadFile">
		첨부파일 
				<a href="${ contextPath }/resources/auploadFiles/${ af.fileChangeName }" download="${ af.fileName }">${ af.fileName }</a>
		</div>
		
		<c:url var="adopUpdateForm" value="adopUpdateForm.ado">
			<c:param name="adopId" value="${ adopboard.adopId }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		<c:url var="adopDelete" value="adopDelete.ado">
			<c:param name="adopId" value="${ adopboard.adopId }"/>
		</c:url>
		<c:url var="adopList" value="adopRecode.ado">
			<c:param name="page" value="${ page }"/>
		</c:url>
		
		<button class="delete_btn btn btn-danger" id="deleteBtn" onclick="location.href='${ adopDelete }'">삭제</button>
		<button class="update_btn btn btn-warning" id="updateBtn" onclick="location.href='${ adopUpdateForm }'">수정</button> 
		
		<br>
		
		<div class="form-group">
			<% pageContext.setAttribute("newLineChar", "\r\n"); %>
		<label for="content" class="col-sm-2 control-label"><b>내용</b></label>
		<textarea id="content" name="content" class="form-control" cols="60" rows="25" readonly="readonly" style="resize:none"><c:out value="${fn:replace(adopboard.adopContent, newLineChar, '<br>')}" /></textarea>
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
							작성자 : ${replyList.writer}<br/>
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
				<table>
					<tr>
						<td colspan="7"><label for="content">&nbsp;&nbsp;<b>댓글</b></label></td>
					</tr>
					<tr>
						<td colspan="6"><input type="text" id="rContent" name="rContent" class="form-control"/></td>
						<td><button id="rinsertBtn"class="replyWriteBtn btn btn-success">작성</button></td>
					</tr>
				</table>
						
						
				<table class="replyTable" id="rtb">
					<thead>
						<tr><td colspan="2"><b id="rCount"></b></td></tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			
		</form>
	</section>
	<c:import url="../common/footer.jsp"/>
</div>

<script>
	$(function(){
		
		getReplyList(); // 시작하자마자 댓글이 보이게 하기 위해 설정 
		
		setInterval(function(){  // 다른사람이 봤을때도 계속 갱신 하기 위해 설정, 10초마다갱신
			getReplyList();
		}, 1000);
		
		$('#rinsertBtn').on('click', function(){
			var rContent = $('#rContent').val();
			var refBid = ${adopboard.adopId};
			
			$.ajax({
				url: 'adopaddReply.ado',
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
		var adopId = ${adopboard.adopId};
		
		$.ajax({
			url: 'adoprList.ado',
			data: {adopId:adopId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				var $tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				$('#rCount').text('댓글(' + data.length + ')');
				// 댓글 몇개 들어가있는지 확인 
				if(data.length > 0){
					for(var i in data){
						var $tr = $('<tr>');
						var $rWriter = $('<td width=100>').text(data[i].rWriter);
						var $rContent = $('<td>').text(data[i].rContent);
						var $rCreateDate = $('<td width=100>').text(data[i].rCreateDate);
						
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
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
</script>
	
<script type="text/javascript">
	// 참고** 미리 댓글부분 적어놓긴 했는데 수정하실 분들은 수정하셔도 됩니다! 
/*
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		 // 수정 
		$(".update_btn").on("click", function(){
			formObj.attr("action", "adopUpdateForm.ado");
			formObj.attr("method", "get");
			formObj.submit();				
		});
		
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
	
	*/
	
</script>
</body>
</html>