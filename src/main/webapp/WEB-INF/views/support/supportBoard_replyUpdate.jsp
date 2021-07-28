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
					<c:param name="bNo" value="${ b.bNo }"/>
					<c:param name="page" value="${ page }"/>
			</c:url>
				
			<c:url var="sdelete" value="sdelete.sup">
					<c:param name="bNo" value="${ b.bNo }"/>
			</c:url>
			
			<section id="container">
				<div class="form-group">
					<table>
						<tr>
							<th> ${b.bTitle} 
							<c:if test="${loginUser.id eq b.bWriter}">
							<button class="delete_btn btn btn-danger" id="deleteBtn" onclick="location.href='${sdelete}'">삭제</button>
							<button class="update_btn btn btn-warning" id="updateBtn" onclick="location.href='${supdateView}'">수정</button>
							</c:if>
							</th>
						</tr>
						<tr>
							<td> ${b.bWriter} </td>
						</tr>
						<tr>
							<td> ${b.bCreateDate} &nbsp;&nbsp;
							 | &nbsp; 조회수 ${b.bView} </td> 
							
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
						<td colspan="6"><input type="text" id="rContent" name="rContent" class="form-control" value="${r.rContent}"/></td>
								<td><button id="rupdateBtn"class="replyWriteBtn btn btn-success">수정</button></td>
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
	$(function(){
		
		getReplyList();
		
 		setInterval(function(){
 			getReplyList();
 		}, 10000);
		
		$('#rupdateBtn').on('click', function(){
			var rContent = $('#rContent').val();
			var refBid = ${b.bNo};
			var rId = ${r.rId};
			var page = ${page};
			
			$.ajax({
				url: 'updateReply.sup',
				data: {rContent:rContent, refBid:refBid, rId:rId},
				success: function(data){
					console.log(data);
					
					if(data == 'success'){
						$('#rContent').val('');
						<%-- location.href= '<%=request.getContextPath()%>/sdetail.sup?bNo=" + refBid + "&page=" + page; --%>
						getReplyList(); // 댓글 리스트 불러오기
					}
				}
			});
		});
	});
	
	function getReplyList(){
		var bNo = ${b.bNo};
		var $no = ${loginUser.no};
		
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
						var $tr = $('<tr>');
						var $a = $('<a>');
						var $trWriter = $('<th>').text('작성자');
						var $trContent = $('<th colspan=7>').text('내용');
						var $trCreateDate = $('<th>').text('작성일');
						var $trUpdate = $('<th>').text('수정');
						var $trDelete = $('<th>').text('삭제');
						
						$tr.append($trWriter);
						$tr.append($trContent);
						$tr.append($trCreateDate);
						$tr.append($trUpdate);
						$tr.append($trDelete);
						$tableBody.append($tr);
						
						for(var i in data){
							var $tr = $('<tr>');
							var $rWriterNickname = $('<td>').text(data[i].rWriter);
							var $rContent = $('<td colspan=7>').text(data[i].rContent);
							var $rCreateDate = $('<td>').text(data[i].rCreateDate);
							var page = ${page};
  							var $rUpdateBtn = $('<td width=50><a href="rupdate.sup?rId='+ data[i].rId + '&bNo=' + bNo + '&page=' + page + '">수정</a></td>');						 
							var $rdeleteBtn = $('<td width=50><a href="rdelete.sup?rId='+ data[i].rId + '&bNo=' + bNo + '&page=' + page + '">삭제</a></td>');				
							
							$tr.append($rWriterNickname);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							$tr.append($rUpdateBtn);
							$tr.append($rdeleteBtn);
							$tableBody.append($tr);
					
						}
				} else{
					var $tr = $('<tr>');
					var $rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
			}
		});
	}
	
	</script>
</html>