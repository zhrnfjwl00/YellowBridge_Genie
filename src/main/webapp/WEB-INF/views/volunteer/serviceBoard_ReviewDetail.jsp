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
	
	#rdeleteBtn{background-color: yellow;}
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="container">
	
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 게시판</b></h1>
	</div>
	
	<section id="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="volId" name="volId" value="${review.volId}" />
			<input type="hidden" id="volTitle" name="volTitle" value="${review.volTitle}"> 
			<input type="hidden" id="volWriter" name="volWriter" value="${review.volWriter}"> 
			<input type="hidden" id="volContent" name="volContent" value="${review.volContent}"> 
			<input type="hidden" id="volCategory" name="volCategory" value="${review.volCategory}"> 
			<input type="hidden" id="volCount" name="volCount" value="${review.volCount}"> 
			<input type="hidden" id="volCreateDate" name="volCreateDate" value="${review.volCreateDate}"> 
			<input type="hidden" id="id" name="id" value="${ sessionScope.loginUser }"> 
			<input type="hidden" id="page" name="page" value="${page}"> 
		</form> 
	
		<div class="form-group">
			<table>
				<tr>
					<th id="title"> ${ review.volTitle } <b id="rCount"></b></th>
					<c:if test="${ loginUser.id eq review.volWriter}">
						<th>
						<button class="delete_btn btn btn-danger" id="deleteBtn" onclick="location.href='${ serviceBoardDelete }'">삭제</button>
						<button class="update_btn btn btn-warning" id="updateBtn">수정</button>
						</th>
					</c:if>
				</tr>
				<tr>
					<td><b>작성자</b>&nbsp;&nbsp;${ review.volWriterNickname } &nbsp;&nbsp;</td>
					<td>| <b>보호소</b> &nbsp;&nbsp;${ review.volCategory } </td>
				</tr>
				<tr>
					<td><b>작성일</b>&nbsp;&nbsp;${ review.volCreateDate } &nbsp;&nbsp;</td> 
					<td>| <b>조회수</b> &nbsp;&nbsp;${ review.volCount } </td>
				</tr>
			</table>
			
		</div>
		
		<div class="downloadFile">
				<b>첨부파일</b>
				<a href="<%= request.getContextPath() %>/resources/voluploadFiles/${ vFile.changeName }" download="${ vFile.fileName }">${ vFile.changeName }</a>
				
		</div>
		
		<br>
		
		<div class="form-group">
			<label for="content" class="col-sm-2 control-label"><b>내용</b></label>
			<textarea id="content" name="content" class="form-control" cols="60" rows="25" readonly="readonly" style="resize:none">${review.volContent}</textarea>
		</div>
						
		<div align="center">
			<button id="listBtn" class="list_btn btn btn-primary">목록</button>	
		</div>
		
		<br>
		<c:if test="${ !empty sessionScope.loginUser }">
			<table class="replyTable">
				<tr>
					<td colspan="6"><input type="text" id="rContent" name="rContent" class="form-control"/></td>
							<td><button id="rinsertBtn"class="replyWriteBtn btn btn-success">작성</button></td>
				</tr>
			</table>
		</c:if>
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

<c:if test="${ !empty sessionScope.loginUser }">
<script>
	$(function(){
		var id = $('#id').val().trim();
		
		getReplyList();
		
		setInterval(function(){
			getReplyList();
		}, 1000);
		
		
		$('#rinsertBtn').on('click', function(){
			var volrContent = $('#rContent').val();
			var volrefBid = ${review.volId};
			
			$.ajax({
				url: 'reviewaddReply.vol',
				data: {volrContent:volrContent, volrefBid:volrefBid},
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
	</script>
</c:if>	

<c:if test="${ empty sessionScope.loginUser }">
<script>
	$(function(){
		var id = $('#id').val().trim();
		
		getReplyList2();
		
		setInterval(function(){
			getReplyList2();
		}, 1000);
		
		
		$('#rinsertBtn').on('click', function(){
			var volrContent = $('#rContent').val();
			var volrefBid = ${review.volId};
			
			$.ajax({
				url: 'reviewaddReply.vol',
				data: {volrContent:volrContent, volrefBid:volrefBid},
				success: function(data){
					console.log(data);
					
					if(data == 'success'){
						$('#rContent').val('');
						getReplyList2(); // 댓글 리스트 불러오기
					}
				}
			});
		});
	});
	</script>
</c:if>	
	
	<script>
	function getReplyList(){
		var volId = ${review.volId};
		
		$.ajax({
			url: 'reviewrList.vol',
			data: {volId:volId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				var $tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				$('#rCount').text('(' + data.length + ')');
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
						var $rWriter = $('<td>').text(data[i].volrNickname);
						var $rContent = $('<td colspan=7>').text(data[i].volrContent);
						var $rCreateDate = $('<td>').text(data[i].volrCreateDate);
						var page = ${page};
						var $rUpdateBtn = $('<td width=50><a href="reviewrUpdateForm.vol?rId='+ data[i].volrId + '&volId=' + volId + '&page=' + page + '">수정</a></td>');						
						var $rdeleteBtn = $('<td width=50><a href="reviewrDelete.vol?rId='+ data[i].volrId + '&volId=' + volId + '&page=' + page + '">삭제</a></td>');						
						
						$tr.append($rWriter);
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
		});
	}
	
	function getReplyList2(){
		var volId = ${review.volId};
		
		$.ajax({
			url: 'reviewrList.vol',
			data: {volId:volId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				var $tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				$('#rCount').text('(' + data.length + ')');
				if(data.length > 0){
					var $tr = $('<tr>');
					var $a = $('<a>');
					var $trWriter = $('<th>').text('작성자');
					var $trContent = $('<th colspan=7>').text('내용');
					var $trCreateDate = $('<th>').text('작성일');
					
					$tr.append($trWriter);
					$tr.append($trContent);
					$tr.append($trCreateDate);
					$tableBody.append($tr);
					
					for(var i in data){
						var $tr = $('<tr>');
						var $rWriter = $('<td>').text(data[i].volrNickname);
						var $rContent = $('<td colspan=7>').text(data[i].volrContent);
						var $rCreateDate = $('<td>').text(data[i].volrCreateDate);
						var page = ${page};
						
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tableBody.append($tr);
					}
				} else {
					var $tr = $('<tr>');
					var $rContent = $('<td colspan=10>').text('등록된 댓글이 없습니다.');
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
			}
		});
	}
</script>
	
 <script type="text/javascript">
	// 참고** 미리 댓글부분 적어놓긴 했는데 수정하실 분들은 수정하셔도 됩니다! 
		
		// 목록
		$(".list_btn").on("click", function(){
			
			location.href = "/YellowBridge/volreview.vol";
		})
		$("#updateBtn").on("click", function(){
			var volId = ${review.volId};
			var page = ${page};
			
			location.href="reviewUpdateForm.vol?volId="+volId+"&page="+page;
		})
		
		$("#deleteBtn").on("click", function(){
			var volId = ${review.volId};
			
			location.href = "ReviewDelete.vol?volId="+volId;
		})
</script> 
</body>
</html>