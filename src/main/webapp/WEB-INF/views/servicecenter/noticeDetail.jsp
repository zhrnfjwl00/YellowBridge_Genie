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
	#rtb tbody{text-align:center; }
	#rtb th{border-bottom: 1px dotted grey;}
	#rtb td{padding: 3px;}
</style>
</head>
<body>
<div class="container">
	<c:if test="${loginUser.id.equals('admin')}">
      <c:import url="../admin/header.jsp"/>
   </c:if>
   
   <c:if test="${!loginUser.id.equals('admin') || empty loginUser}">
      <c:import url="../common/header.jsp"/>
   </c:if>
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>공지사항</b></h1>
	</div>
	
	<c:url var="nodelete" value="nodelete.sc">
			<c:param name="bNo" value="${ board.scId }" />
	</c:url>
	
	<section id="container">
		<div class="form-group">
			<table>
				<tr>
					<th id="title"> ${ board.scTitle }  </th>
					<th>
					<c:if test="${loginUser.grade  == 1}">
					<button class="delete_btn btn btn-danger" id="deleteBtn"
								onclick="location.href='${nodelete}'">삭제</button>
					</c:if>
					</th>
				</tr>
				<tr>
					<td><b>작성일</b>&nbsp;&nbsp;${ board.scCreateDate } &nbsp;&nbsp;</td> 
					<td>| <b>조회수</b> &nbsp;&nbsp;${ board.scCount }</td>
				</tr>
			</table>
			
		</div>
		
		<%-- <div class="downloadFile">
				<b>첨부파일</b>
				<a href="<%= request.getContextPath() %>/resources/scuploadFiles/${ vFile.changeName }" download="${ vFile.fileName }">${ vFile.changeName }</a>
				
		</div> --%>
		
		<br>
		
		<div class="form-group">
			<label for="content" class="col-sm-2 control-label"><b>내용</b></label>
			<textarea id="content" name="content" class="form-control" cols="60" rows="25" readonly="readonly" style="resize:none">${board.scContent}</textarea>
		</div>
						
		<div align="center">
			<button type="button" class="btn btn-primary" id="writeBtn" onclick="location.href='<%= request.getContextPath() %>/notice.sc'">목록</button>
		</div>
		
		<br>
		
		<table class="replyTable">
			<tr>
				<td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
						<td><button type="button" class="btn btn-primary" id="writeBtn" onclick="location.href='<%= request.getContextPath() %>/noinsertform.sc'">글쓰기</button></td>
			</tr>
		</table>
		
			
	</section>
	<c:import url="../common/footer.jsp"/>
</div>

<script>
	$(function(){
		
		getReplyList();
		
		setInterval(function(){
			getReplyList();
		}, 1000);
		
		$('#rinsertBtn').on('click', function(){
			var scrContent = $('#rContent').val();
			var screfBid = ${scboard.scId};
			
			$.ajax({
				url: 'scaddReply.sc',
				data: {scrContent:scrContent, screfBid:screfBid},
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
		var scId = ${scboard.scId};
		
		$.ajax({
			url: 'scrList.sc',
			data: {scId:scId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				var $tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				$('#rCount').text('댓글(' + data.length + ')');
				if(data.length > 0){
					var $tr = $('<tr>');
					var $trWriter = $('<th>').text('작성자');
					var $trContent = $('<th colspan=3>').text('내용');
					var $trCreateDate = $('<th>').text('작성일');
					
					$tr.append($trWriter);
					$tr.append($trContent);
					$tr.append($trCreateDate);
					$tableBody.append($tr);
					
					for(var i in data){
						var $tr = $('<tr>');
						var $rWriter = $('<td>').text(data[i].scrNickname);
						var $rContent = $('<td colspan=3>').text(data[i].scrContent);
						var $rCreateDate = $('<td>').text(data[i].scrCreateDate);
						
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tableBody.append($tr);
					}
				} else {
					var $tr = $('<tr>');
					var $rContent = $('<td colspan=5>').text('등록된 댓글이 없습니다.');
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
			}
		});
	}
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
		
		// 목록
		$("#list_btn").on("click", function(){
			
			location.href = "/YellowBridge/notice.sc";
		})
		$("#updateBtn").on("click", function(){
			var scId = ${scboard.scId};
			var page = ${page};
			
			location.href="serviceBoardUpdateForm.sc?scId="+scId+"&page="+page;
		})
		
		$("#deleteBtn").on("click", function(){
			var scId = ${scboard.scId};
			
			location.href = "serviceBoardDelete.sc?scId="+scId;
		})
		
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