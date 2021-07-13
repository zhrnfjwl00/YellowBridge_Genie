<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사 신청 메인</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	html{
		min-width: 1000px;
	}
	
	.serviceapply {
		width: 65%;
		margin: 0px auto;
	}
	
	.serviceapplytext{
		margin-top: 150px;
	}
	
	#service {
		width: 100%;
	}
	
	#service-list{
		align:center;
	}
	
	.shelter {
		display: inline-block;
		padding: 10px 10px 50px 10px;
		width: 30%;
		align: center;
	}
	
	.shelter img {
		width: 100%;
		height: 100%;
	}
	
	.shelter-img {
		border: 1px solid #9a9a9a;
		width: 100%;
		height: 200px;
	}
	
	#shelter-info {
		padding: 15px;
		text-align: center;
	}
</style>
</head>
<body>

<c:import url="../common/header.jsp"/>
<div class="serviceapply">
	<form action="serviceBoardWrite.vol" method="post" id="serviceBoardWrite" enctype="Multipart/form-data">
	<div style="text-align:center; padding-bottom:30px;" class="serviceapplytext">
		<h1 style="color:#BDCC94; letter-spacing: -1px;"><b>봉사 신청</b></h1>
	</div>
	<div class="btnDiv">
		<button type="button" class="btn btn-primary" id="writeBtn" onclick="location.href='<%= request.getContextPath() %>/volAdminAdForm.vol'">글쓰기</button>
	</div>
	<div id="service">
		<div id="service-list" class="service-list" align="center">
		
			<c:forEach var="shel" items="${ volad }">
				<div class="shelter">
					<input type="hidden" id="shelNo" name="shelNo" value="${ shel.serviceNo }">
					<div id="contents">
						<div class="shelter-img">
							<c:url var="serviceAdDetail" value="serviceAdDetail.vol">
								<c:param name="volId" value="${ shel.serviceNo }"/>
								<c:param name="page" value="${ vpi.currentPage }"/>
							</c:url>
							<a href="${ serviceAdDetail }"><img src="<%=request.getContextPath()%>/resources/voluploadFiles/${ shel.fileName }" ></a>
						</div>
						<div id="shelter-info">
						<c:url var="serviceAdDetail" value="serviceAdDetail.vol">
							<c:param name="volId" value="${ shel.serviceNo }"/>
							<c:param name="page" value="${ vpi.currentPage }"/>
						</c:url>
							<a href="${ serviceAdDetail }" class="shelter-name">${ shel.serviceTitle }</a>
						</div>
						<div class="shelter-price">10,000원</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
	
	<table>
	<tr align="center" height="20" id="buttonTab">
		<td colspan="6">
		
			<!-- [이전] -->
			<c:if test="${ vpi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ vpi.currentPage > 1 }">
				<c:url var="before" value="serviceapply.vol">
					<c:param name="page" value="${ vpi.currentPage - 1 }"/>
				</c:url>
				<a href="${ before }">[이전]</a> &nbsp;
			</c:if>
			
			<!-- 페이지 -->
			<c:forEach var="p" begin="${ vpi.startPage }" end="${ vpi.endPage }">
				<c:if test="${ p eq vpi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
				
				<c:if test="${ p ne vpi.currentPage }">
					<c:url var="pagination" value="serviceapply.vol">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<a href="${ pagination }">${ p }</a> &nbsp;
				</c:if>
			</c:forEach>
			
			<!-- [다음] -->
			<c:if test="${ vpi.currentPage >= vpi.maxPage }">
				[다음]
			</c:if>
			<c:if test="${ vpi.currentPage < vpi.maxPage }">
				<c:url var="after" value="serviceapply.vol">
					<c:param name="page" value="${ vpi.currentPage + 1 }"/>
				</c:url> 
				<a href="${ after }">[다음]</a>
			</c:if>
		</td>
	</tr>
	</table>
	
	</form>
</div>
<c:import url="../common/footer.jsp"/>

<script type="text/javascript">
   // 게시글 상세보기
	$(function(){
			$('#service-list #contents').on({'mouseenter':function(){
				$(this).parent().css({'background' : 'lightgray', 'cursor':'pointer'});					
			}, 'mouseout':function(){
				$(this).parent().css({'background' : 'none'});
			}});
		});

	
</script>
</body>
</html>