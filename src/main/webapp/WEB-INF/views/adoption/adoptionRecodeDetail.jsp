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

.area {
	width: 100%;
	height: 150px;
}

.container {
	margin-top: -150px;
}
</style>
</head>
<body>
<div class="container">
<c:if test="${loginUser.id.equals('admin')}">
			<c:import url="../admin/header.jsp" />
		</c:if>

		<c:if test="${!loginUser.id.equals('admin') || empty loginUser}">
			<c:import url="../common/header.jsp" />
		</c:if>
		<div class="area"></div>
	
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>입양 일지</b></h1>
	</div>
	
	<section id="container">
		<form name="readForm" role="form" method="post">
			<input type="hidden" id="adopId" name="adopId" value="${adopboard.adopId}" />
			<input type="hidden" id="adopTitle" name="adopTitle" value="${adopboard.adopTitle}"> 
			<input type="hidden" id="adopWriter" name="adopWriter" value="${adopboard.adopWriter}"> 
			<input type="hidden" id="id" name="id" value="${loginId}">
			<input type="hidden" id="adopContent" name="adopContent" value="${adopboard.adopContent}"> 
			<input type="hidden" id="adopView" name="adopView" value="${adopboard.adopView}"> 
			<input type="hidden" id="adopCreateDate" name="adopCreateDate" value="${adopboard.adopCreateDate}"> 
			<input type="hidden" id="page" name="page" value="${page}"> 
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
		첨부파일<a href="${ contextPath }/resources/auploadFiles/${ af.fileChangeName }" download="${ af.fileName }">${ af.fileName }</a>
		</div>
		
		<c:url var="adopUpdateForm" value="adopUpdateForm.ado">
			<c:param name="adopId" value="${ adopboard.adopId }"/>
			<c:param name="page" value="${ page }"/>
		</c:url>
		<c:url var="adopDelete" value="adopDelete.ado">
			<c:param name="adopId" value="${ adopboard.adopId }"/>
			<c:param name="fileNo" value="${ af.fileNo }"/>
		</c:url>
		<c:url var="adopList" value="adopRecode.ado">
			<c:param name="page" value="${ page }"/>
		</c:url>
		
		<c:if test="${ loginUser.nickname == adopboard.adopWriter}">
		<button class="delete_btn btn btn-danger" id="deleteBtn" onclick="location.href='${ adopDelete }'">삭제</button>
		<button class="update_btn btn btn-warning" id="updateBtn" onclick="location.href='${ adopUpdateForm }'">수정</button> 
		</c:if>
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
						<td colspan="1"><label for="content">&nbsp;&nbsp;<b>댓글</b></label></td>
						<c:if test="${ empty sessionScope.loginUser }">
						<td colspan="6">
						<!-- 로그인하지 않은 사용자에게는 로그인 불가멘트 노출 및 클릭시 로그인 페이지로 이동 -->
						<a href='<%=request.getContextPath()%>/loginView.me' class="btn btn-default btn-block" role="button">
							<i class="fa fa-efit" >로그인한 사용자만 댓글 등록이 가능합니다. </i>
						</a>
						</td>
						</c:if>
					</tr>
					<tr>
							<c:if test="${ !empty sessionScope.loginUser }">
						<td colspan="6"><input type="text" id="rContent" name="rContent" class="form-control"/></td>
						<td><button id="rinsertBtn"class="replyWriteBtn btn btn-success">작성</button></td>
						</c:if>
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
	</script>
	
	<script>
	function getReplyList(){
		var adopId = ${adopboard.adopId};
		var id = $('#id').val();
		
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
						var $rWriterNickname = $('<td>').text(data[i].rNickname);
						var $rContent = $('<td colspan=7>').text(data[i].rContent);
						var $rCreateDate = $('<td>').text(data[i].rCreateDate);
						var page = ${page};
						var $writerId = data[i].rWriter;
						var $userId = id;
						if( $userId.trim() == $writerId.trim() ){
							var $rUpdateBtn = $('<td width=50><a href="adoprUpdateForm.ado?rId='+ data[i].rId + '&adopId=' + adopId + '&page=' + page + '">수정</a></td>');						
							var $rdeleteBtn = $('<td width=50><a href="adoprDelete.ado?rId='+ data[i].rId + '&adopId=' + adopId + '&page=' + page + '">삭제</a></td>');						
						} else {
							var $rUpdateBtn = $('<td>').text('수정');
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
					var $rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
			}
		});
	}
</script>

	
<script type="text/javascript">
 		// 목록이동 버튼
		$(document).on('click', '#listBtn', function(){
			location.href = "${pageContext.request.contextPath}/adopRecode.ado";
		});
</script>
</body>
</html>