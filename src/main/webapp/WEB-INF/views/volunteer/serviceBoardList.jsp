<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>게시판 리스트 출력</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<style>
	#example{text-align: center;}
	
	#example tr th{padding: 10px; font-size: 18px; font-weight: bold;  border-bottom: 1px solid black;}
	#example tr td{padding: 7px; font-size: 16px;}
	
	.serviceBoard {
		width: 65%;
		margin: 0px auto;
	}
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.tableNo{width: 5%;}
	.tablecate{width: 20%;}
	.tableTitle{width: 40%;}
	.tableWriter{width: 10%;}
	.tableDate{width: 15%;}
	.tableCount{width: 10%;}
	#searchArea{padding-bottom:25px;}
	.btnDiv{padding-top:25px; float: right;}
	
	nav{margin-left: 25px; margin-top: 10px;}
	
	.content{
		margin-left: auto;
		margin-right: auto;
		margin-top: 10px;
		width: 95%;
		min-height: 500px;
	}
	
	.menuwrap{background: #EDFFC0; width: 100%; height: 50px;}
	.volmenu{
		background: #DDE88F; color: navy; text-align: center; font-weight: bold; 
		vertical-align: middle; width: 300px; height: 50px; display: table-cell;
	}
	#navDiv{width: 600px; margin-left: auto; margin-right: auto;}
	.volmenu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
	#serviceBoardList{background: #F6FFDE; color:green; border:1px solid green;}
</style>

</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="serviceBoard">
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 게시판</b></h1>
		<h5><b>봉사 하면서 필요한 물품이나 문제점, 개선방안, 아픈 아이 치료 요청 등 상세하게 작성해주세요.</b></h5>
	</div>
	
	<br clear="all">
	<br>
	
	<div class="menuwrap">
	 <nav id="navDiv">
		<div class="volmenu" id="serviceBoardList"><b>물품요청</b></div>
		<div class="volmenu" id="volreview">봉사후기</div>
	 </nav>
	</div>
	
	<!-- <div class="menuDiv">
	<nav id="navDiv">
		<div class="voldiv"> | </div>
	</nav>
	</div> -->
	<div class="container" style="margin-top:30px; text-align:center;">
		<div class="row">
			<div class="col-sm-12">
				<div id="searchArea" align="center">
					<select id="searchCondition" name="searchCondition">
						<option>-------</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="category">카테고리</option>
					</select>
					
					<input id="searchValue" type="search">
					<button onclick="searchBoard();">검색</button>
				</div>
				  
				<table id="example" class="display" style="width:100%">
					<thead>
						<tr>
							<th class="tableNo">NO.</th>
							<th class="tablecate">카테고리</th>
							<th class="tableTitle">제목</th>
							<th class="tableWriter">글쓴이</th>
							<th class="tableDate">작성일</th>
							<th class="tableCount">조회수</th>
						</tr>
					</thead>
					<tbody id = "listArea">
					<c:if test="${ empty vollist }">
						<tr>
							<td colspan="6">작성된 게시물이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${ !empty vollist }">
						<c:forEach var="vol" items="${ vollist }">
							<tr>
								<td align="center" class="tableNo">${ vol.volId }</td>
								<td align="center" class="tablecate">${ vol.volCategory }</td>
							
								<td align="center" class="tableTitle">
									<c:url var="volBoardDetail" value="volBoardDetail.vol">
										<c:param name="volId" value="${ vol.volId }"/>
										<c:param name="page" value="${ pi.currentPage }"/>
										<c:param name="loginId" value="${ loginUser.id }"/>
									</c:url>
									<a href="${ volBoardDetail }">${ vol.volTitle }</a>
								</td>
								
								<td align="center" class="tableWriter">${ vol.volWriterNickname }</td>
								<td align="center" class="tableDate">${ vol.volCreateDate }</td>
								<td align="center" class="tableCount">${ vol.volCount }</td>
							</tr>
						</c:forEach>
					</c:if>

					<tr align="center" height="20" id="buttonTab">
						<td colspan="6">
						
							<!-- [이전] -->
							<c:if test="${ pi.currentPage <= 1 }">[이전]</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url value="${ loc }" var="blistBack">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
									<c:if test="${ searchValue ne null }">
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
								</c:url>
								<a href="${ blistBack }">[이전]</a>
							</c:if>
							<!-- loc변수: 현재 주소에 있는 값을 가지고 있는 변수 -->
							
							<!-- 숫자 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<!-- 현재 페이지와 번호버튼이 같을 때(선택된 경우) -->
								<c:if test="${ p == pi.currentPage }">
									<font color="red" size="4"><b>[${ p }]</b></font>
								</c:if>
								<!-- 현재 페이지와 번호버튼이 같지 않을 때 -->
								<c:if test="${ p ne pi.currentPage }">
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
							<c:if test="${ pi.currentPage >= pi.maxPage }">[다음]</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url value="${ loc }" var="blistNext">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
									<c:if test="${ searchValue ne null }">
										<c:param name="searchCondition" value="${ searchCondition }"/>
										<c:param name="searchValue" value="${ searchValue }"/>
									</c:if>
								</c:url>
								<a href="${ blistNext }">[다음]</a>
							</c:if>
						</td>
					</tr>
					</tbody>
				</table>
				<c:if test="${ !empty sessionScope.loginUser }">
				<div class="btnDiv">
					<button type="button" class="btn btn-primary" id="writeBtn" onclick="location.href='<%= request.getContextPath() %>/serviceBoardWriteForm.vol'">글쓰기</button>
				</div>
				</c:if>
			</div>
		</div>
		
	</div>
</div>
<c:import url="../common/footer.jsp"/>
	<script type="text/javascript">
	   // 게시글 상세보기
		$(function(){
			$('#listArea td').on({'mouseenter':function(){
				$(this).parent().css({'background' : 'lightgray', 'cursor':'pointer'});					
			}, 'mouseout':function(){
				$(this).parent().css({'background' : 'none'});
			}});
		});
		// 게시글 검색
		function searchBoard(){
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			
			location.href="search.vol?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
		
	</script>
	
	<script>
			$('.volmenu').on('click', function() {
				var id = $(this).attr('id');
				location.href='<%=request.getContextPath()%>/' + id + '.vol';
			});
		</script>
</body>
</html>