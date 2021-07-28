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
	
	#searchArea{padding-bottom:30px;}
	
	#searchValue{
    	border: 1px solid lightgray;
    	border-radius: 5px;
    	padding: 8px 20px;
	}
	
	#searchBtn{
		background: #BDCC94;
    	border: 1px solid lightgray;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 8px 10px;
	}
	
	.btnDiv{ width:100%;  padding-bottom:30px; }
	#writeBtn{float: right;}
	
	.menuwrap{background: #EDFFC0; width: 100%; height: 50px; margin-bottom: 50px;}
	.adminmenu{
		background: #DDE88F; color: navy; text-align: center; font-weight: bold; 
		vertical-align: middle; width: 300px; height: 50px; display: table-cell;
	}
	#navDiv{width: 600px; margin-left: auto; margin-right: auto;}
	#searchArea{margin-bottom: 30px;}
	.adminmenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	#adminserviceapply{background: #F6FFDE; color:green; border:1px solid green;}
	
</style>
</head>
<body>

<c:import url="../admin/header.jsp"/>
<div class="serviceapply">
	<div style="text-align:center; padding-bottom:30px;" class="serviceapplytext">
		<h1 style="color:#BDCC94; letter-spacing: -1px;"><b>봉사 신청</b></h1>
	</div>
	
	<div class="menuwrap">
	 <nav id="navDiv">
		<div class="adminmenu" id="adminsearchlist"><b>봉사 신청서 관리</b></div>
		<div class="adminmenu" id="adminserviceapply">공고 관리</div>
	 </nav>
	</div>
	
	<div class="btnDiv">
		<button type="button" class="btn btn-primary" id="writeBtn" onclick="location.href='<%= request.getContextPath() %>/volAdminAdForm.vol'">글쓰기</button>
	</div>
	<div id="service">
		<div id="service-list" class="service-list" align="center">
			<div id="searchArea" align="center">
				<select id="searchCondition" name="searchCondition">
					<option>-------</option>
					<option value="title">제목</option>
					<option value="category">보호소</option>
				</select>
				
				<input id="searchValue" type="search">
				<button type="button" onclick="searchBoard();" id="searchBtn">검색</button>
			</div>
			
			
			<c:forEach var="shel" items="${ volad }">
				<div class="shelter">
					<input type="hidden" id="shelNo" name="shelNo" value="${ shel.serviceNo }">
					<div id="contents">
						<div class="shelter-img">
							<c:url var="volAdminAdDetail" value="volAdminAdDetail.vol">
								<c:param name="volId" value="${ shel.serviceNo }"/>
								<c:param name="page" value="${ vpi.currentPage }"/>
							</c:url>
							<a href="${ volAdminAdDetail }"><img src="<%=request.getContextPath()%>/resources/voluploadFiles/${ shel.changeName }" ></a>
						</div>
						<div id="shelter-info">
						<c:url var="volAdminAdDetail" value="volAdminAdDetail.vol">
							<c:param name="volId" value="${ shel.serviceNo }"/>
							<c:param name="page" value="${ vpi.currentPage }"/>
						</c:url>
							<a href="${ volAdminAdDetail }" class="shelter-name">${ shel.serviceTitle }</a>
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
			<c:if test="${ vpi.currentPage <= 1 }">[이전]</c:if>
			<c:if test="${ vpi.currentPage > 1 }">
				<c:url value="${ loc }" var="blistBack">
					<c:param name="page" value="${ vpi.currentPage - 1 }"/>
					<c:if test="${ searchValue ne null }">
						<c:param name="searchCondition" value="${ searchCondition }"/>
						<c:param name="searchValue" value="${ searchValue }"/>
					</c:if>
				</c:url>
				<a href="${ blistBack }">[이전]</a>
			</c:if>
			<!-- loc변수: 현재 주소에 있는 값을 가지고 있는 변수 -->
			
			<!-- 숫자 -->
			<c:forEach var="p" begin="${ vpi.startPage }" end="${ vpi.endPage }">
				<!-- 현재 페이지와 번호버튼이 같을 때(선택된 경우) -->
				<c:if test="${ p == vpi.currentPage }">
					<font color="red" size="4"><b>[${ p }]</b></font>
				</c:if>
				<!-- 현재 페이지와 번호버튼이 같지 않을 때 -->
				<c:if test="${ p ne vpi.currentPage }">
					<c:url var="blistCheck" value="${ loc }">
						<c:param name="page" value="${ p }"/>
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
						</c:if>
					</c:url>
					<a href="${ blistCheck }">${ p }</a>
				</c:if>
				<!-- loc: search.bo -->
			</c:forEach>
			
			<!-- [다음] -->
			<c:if test="${ vpi.currentPage >= vpi.maxPage }">[다음]</c:if>
			<c:if test="${ vpi.currentPage < vpi.maxPage }">
				<c:url value="${ loc }" var="blistNext">
					<c:param name="page" value="${ vpi.currentPage + 1 }"/>
					<c:if test="${ searchValue ne null }">
						<c:param name="searchCondition" value="${ searchCondition }"/>
						<c:param name="searchValue" value="${ searchValue }"/>
					</c:if>
				</c:url>
				<a href="${ blistNext }">[다음]</a>
			</c:if>
		</td>
	</tr>
	</table>
	
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
   
	// 게시글 검색
	function searchBoard(){
		var searchCondition = $("#searchCondition").val();
		var searchValue = $("#searchValue").val();
		
		location.href="adminsearchAdvertise.vol?searchCondition="+searchCondition+"&searchValue="+searchValue;
	}
	
</script>
<script>
		$('.adminmenu').on('click', function() {
			var id = $(this).attr('id');
			location.href='<%=request.getContextPath()%>/' + id + '.vol';
		});
</script>
</body>
</html>