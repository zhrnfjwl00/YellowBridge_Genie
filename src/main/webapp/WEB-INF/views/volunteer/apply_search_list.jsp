<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>게시판 리스트 출력</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleavpis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
  	#serviceApplyBoardTable{text-align: center;}
  	#serviceApplyBoardTable tr th{padding: 10px; font-size: 18px; font-weight: bold; border-bottom: 1px solid black;}
  	#serviceApplyBoardTable tr td{padding: 7px; font-size: 16px; }
  	
	.serviceApplyBoard {
		width: 65%;
		margin: 0px auto;
	}
	.serviceApplyBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.tableNo{width: 10%;}
	.tableShelter{width: 20%;}
	.tableCo{width:40%;}
	.tableTime{width:15%;}
	.tableStatus{width:15%;}
	
	#listArea{padding: 5px;}
	
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
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="serviceApplyBoard">

	
	<div style="text-align:center;" class="serviceApplyBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 신청 조회</b></h1>
	</div>
	
	<div class="container" style="margin-top:30px">
		<div class="row">
			<!-- <div id="searchArea" align="center">
				<select id="searchCondition" name="searchCondition">
					<option>-------</option>
					<option value="title">제목</option>
					<option value="category">보호소</option>
				</select>
				
				<input id="searchValue" type="search">
				<button type="button" onclick="searchBoard();" id="searchBtn">검색</button>
			</div> -->
			<div class="col-sm-12">
				<table id="serviceApplyBoardTable" class="display" style="width:100%">
			        <thead>
			            <tr>
			                <th class="tableNo">NO.</th>
			                <th class="tableShelter">보호소</th>
			                <th class="tableCo">신청내역</th>
			                <th class="tableTime">신청시각</th>
			                <th class="tableStatus">상태</th>
			            </tr>
			        </thead>
			        <tbody id = "listArea">
			        <c:if test="${ empty loginUser }">
			        	<tr>
							<td colspan="5">로그인을 먼저 해주세요</td>
						</tr>
			        </c:if>
			        
			        <c:if test="${ !empty loginUser }">
					<c:if test="${ empty aplist }">
						<tr>
							<td colspan="5">조회된 봉사 신청 내역이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:if test="${ !empty aplist }">
						<c:forEach var="vol" items="${ aplist }">
							<tr>
								<td align="center" class="tableNo">${ vol.serviceappNo }</td>
								<td align="center" class="tableShelter">${ vol.shelterName }</td>
							
								<td align="center" class="tableCo">
									<c:url var="vApplyDetail" value="vApplyDetail.vol">
										<c:param name="vId" value="${ vol.serviceappNo }"/>
										<c:param name="page" value="${ pi.currentPage }"/>
										<c:if test="${ searchValue ne null }">
											<c:param name="searchCondition" value="${ searchCondition }"/>
											<c:param name="searchValue" value="${ searchValue }"/>
										</c:if>
									</c:url>
									<a href="${ vApplyDetail }">${ vol.serviceName }</a>
								</td>
								
								<td align="center" class="tableTime">${ vol.volDate }</td>
								<td align="center" class="tableStatus">${ vol.volStatus }</td>
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
					</c:if>
					</tbody>
				</table>
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
			
			location.href="searchApply.vol?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
		
	</script>
</body>
</html>