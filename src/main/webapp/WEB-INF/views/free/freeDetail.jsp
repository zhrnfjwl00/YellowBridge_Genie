<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<meta charset="utf-8">
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
부가적인 테마
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
<style type="text/css">
#rinsertBtn, #deleteBtn, #updateBtn {
	float: right;
	margin: 5px;
}

#listBtn {
	float: center;
}

.serviceBoardtext {
	margin-top: 150px;
	letter-spacing: -1px;
}

.form-group #title {
	font-size: 24px;
	font-weight: bold;
	padding-bottom: 15px;
}

.replyTable {
	margin: auto;
}

#rtb tbody {
	text-align: center;
}

#rtb th {
	border-bottom: 1px dotted grey;
}

#rtb td {
	padding: 3px;
}
</style>
</head>
<body>
	<div class="container">
		<c:import url="../common/header.jsp" />
		<div style="text-align: center;" class="serviceBoardtext">
			<h1 style="color: #BDCC94;">
				<b>자유게시판</b>
			</h1>
		</div>
		
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="bId" name="bId" value="${board.bId}" />
			<input type="hidden" id="bTitle" name="bTitle" value="${board.bTitle}"> 
			<input type="hidden" id="bWriter" name="bWriter" value="${board.bWriter}">
			<input type="hidden" id="id" name="id" value="${loginId}">
			<input type="hidden" id="bContent" name="bContent" value="${board.bContent}"> 
			<input type="hidden" id="bCategory" name="bCategory" value="${board.bCategory}"> 
			<input type="hidden" id="bCount" name="bCount" value="${board.bCount}"> 
			<input type="hidden" id="bCreateDate" name="bCreateDate" value="${board.bCreateDate}"> 
			<%-- <input type="hidden" id="id" name="id" value="${ sessionScope.loginUser }">  --%>
			<input type="hidden" id="page" name="page" value="${page}"> 
		</form> 

		<c:url var="freeupdateForm" value="freeupdateForm.fr">
			<c:param name="bNo" value="${ board.bId }" />
			<c:param name="page" value="${ page }" />
		</c:url>

		<c:url var="freedelete" value="freedelete.fr">
			<c:param name="bNo" value="${ board.bId }" />
		</c:url>

		<section id="container">
			<div class="form-group">
				<table>
					<tr>
						<th id="title">${ board.bTitle }</th>
						<th>
							<button class="delete_btn btn btn-danger" id="deleteBtn"
								onclick="location.href='${freedelete}'">삭제</button>
							
							<c:if test="${ sessionScope.Id  == {board.bWriter} }">
							<button class="delete_btn btn btn-danger" id="deleteBtn"
								onclick="location.href='${vreedelete}'">삭제</button>
							</c:if>
							<%-- <button class="update_btn btn btn-warning" id="updateBtn"
								onclick="location.href='${qnaupdateForm}'">수정</button> --%>
						</th>
					</tr>
					<tr>
						<td><b>작성일</b>&nbsp;&nbsp;${ board.bCreateDate } &nbsp;&nbsp;</td>
						<td>| <b>조회수</b> &nbsp;&nbsp;${ board.bCount }
						</td>
					</tr>
				</table>

			</div>

			<div class="downloadFile">
				<b>첨부파일</b> <a
					href="${ contextPath }/resources/scuploadFiles/${ scfi.changeName }"
					download="${ scfi.fileName }">${ scfi.fileName }</a>

			</div>

			<br>


			<div class="form-group">
				<label for="content" class="col-sm-2 control-label"><b>내용</b></label>
				<textarea id="content" name="content" class="form-control" cols="60"
					rows="25" readonly="readonly" style="resize: none">${board.bContent}</textarea>
			</div>
			
			<c:url var="flist" value="fList.fr">
					<c:param name="page" value="${ page }"/>
			</c:url>
			<div align="center">
				<button type="button" class="btn btn-primary" id="writeBtn"
					onclick="location.href='<%=request.getContextPath()%>/freeboard.fr'">목록</button>
			</div>

			<br>




			<table class="replyTable">
				<tr>
					<td colspan="7">
					<label for="content">
						&nbsp;&nbsp;
						<b>댓글</b>
					</label>
					</td>
				</tr>












				<tr>
					<td colspan="6">
						<input type="text" id="rContent"name="rContent" class="form-control" />
					</td>
					<td>
						
						
							<button id="rSubmit"class="replyWriteBtn btn btn-success">등록</button>
					</td>
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
		<c:import url="../common/footer.jsp" />
	</div>

	<script type="text/javascript">
	
	
	$(function(){
		
		 getReplyList();
		 
		 setInterval(function(){
	 			getReplyList();
	 		}, 10000);
		 
		$('#rSubmit').on('click',function(){
			var rContent = $('#rContent').val();
			var refBid = ${board.bId};
			
			$.ajax({
				url: 'addReply.fr',
				data: {rContent:rContent, refBid:refBid},
				success: function(data){
					console.log(data);
					
					if(data == 'success'){
						$('#rContent').val('');
						getReplyList(id); //댓글 리스트 불러오기
					}
				}
			});
		});
	});

	function getReplyList(){
		var bId = ${board.bId};
		var id = $('#id').val();
		
		$.ajax({
			url: 'rList.fr',
			data: {bId:bId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				var $tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				$('#rCount').text('댓글(' + data.length + ')');
				if(data.length > 0){
					 var $tr = $('<tr>');
					var $a = $('<a>');
					var $trWriter = $('<th>').text('작성자');
					var $trContent = $('<th colspan=7>').text('내용');
					var $trCreateDate = $('<th>').text('작성일');
					var $trUpdate = $('<th>').text('');
					var $trDelete = $('<th>').text('삭제'); 
					
					$tr.append($trWriter);
					$tr.append($trContent);
					$tr.append($trCreateDate);
					$tr.append($trUpdate);
					$tr.append($trDelete); 
					$tableBody.append($tr); 
					
					for(var i in data){
						
						var $tr = $('<tr>');
						var $rWriterNickname = $('<td width=100>').text(data[i].rWriter);
						var $rContent = $('<td colspan=7>').text(data[i].rContent);
						var $rCreateDate = $('<td>').text(data[i].rCreateDate);
						
						var page = ${page};
						var $writerId = data[i].rWriter;
						var $userId = id;
						if( $userId.trim() == $writerId.trim()){
							var $rUpdateBtn = $('<td width=50><a href="volrUpdateForm.vol?rId='+ data[i].rId + '&bId=' + bId + '&page=' + page + '">수정</a></td>');						
							var $rdeleteBtn = $('<td width=50><a href="rDelete.fr?rId='+ data[i].rId + '&bId=' + bId + '&page=' + page + '">삭제</a></td>');						
						} else {
							var $rUpdateBtn = $('<td>').text('');
							var $rdeleteBtn = $('<td>').text('삭제');
						} 
						
						$tr.append($rWriterNickname);
						$tr.append($rContent);
						$tr.append($rCreateDate);
					 	$tr.append($rUpdateBtn);
						$tr.append($rdeleteBtn); 
						$tableBody.append($tr);
					}
				} else {
					var $tr = $('<tr>');
					var $rContent = $('<td colspan=10>').text('등록된 댓글이 없습니다.');
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
			}
		})
		};
	


	
	
	</script>

	<script type="text/javascript">
		// 참고** 미리 댓글부분 적어놓긴 했는데 수정하실 분들은 수정하셔도 됩니다! 
		/* 	$(document).ready(function(){
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
		 })  */

		/* 		$(".replyWriteBtn").on("click", function(){
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
		 }) */
	</script>
</body>
</html>