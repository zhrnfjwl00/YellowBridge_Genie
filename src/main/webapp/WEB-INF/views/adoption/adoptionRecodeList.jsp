<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>입양일지 리스트 출력</title>
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
	
	.tableNo{width: 10%;}
	.tableTitle{width: 55%;}
	.tableWriter{width: 10%;}
	.tableDate{width: 15%;}
	.tableCount{width: 10%;}
	#searchArea{padding-bottom:25px;}
	.btnDiv{padding-top:25px; float: right;}
</style>

</head>
<body>
<div class="serviceBoard">
	<c:import url="../common/header.jsp"/>
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>입양 일지</b></h1>
		<h5><b>반려동물과의 행복했던 추억을 남겨주세요.</b></h5>
	</div>
	
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
					<!-- 
					<input id="searchValue" type="search">
					<button onclick="searchBoard();">검색</button> -->
				</div>
				  
				<table id="example" class="display" style="width:100%">
					<thead>
						<tr>
							<th class="tableNo">NO.</th>
							<th class="tableTitle">제목</th>
							<th class="tableWriter">글쓴이</th>
							<th class="tableDate">작성일</th>
							<th class="tableCount">조회수</th>
						</tr>
					</thead>
					<tbody id = "listArea">
					<%-- <c:if test="${ empty vollist }">
						<tr>
							<td colspan="6">작성된 게시물이 없습니다.</td>
						</tr>
					</c:if> --%>
					
					<%-- <c:if test="${ !empty vollist }"> --%>
						<c:forEach var="adop" items="${ adoplist }">
							<tr>
								<td align="center" class="tableNo">${ adop.adopId }</td>
								<%-- <td align="center" class="tablecate">${ adop.adopCategory }</td> --%>
							
								<td align="center" class="tableTitle">
									<c:url var="adoptionRecodeDetail" value="adoptionRecodeDetail.ado">
										<c:param name="adopId" value="${ adop.adopId }"/>
										<c:param name="page" value="${ pi.currentPage }"/>
									</c:url>
									<a href="${ adoptionRecodeDetail }">${ adop.adopTitle }</a>
								</td>
								
								<td align="center" class="tableWriter">${ adop.adopWriter }</td>
								<td align="center" class="tableDate">${ adop.adopCreateDate }</td>
								<td align="center" class="adopView">${ adop.adopView }</td>
							</tr>
						</c:forEach>
					<%-- </c:if> --%>
					
						<!-- 페이징 처리 -->
							<tr align="center" height="20" id="buttonTab">
								<td colspan="6">
								
									<!-- [이전] -->
									<c:if test="${ pi.currentPage <= 1 }">
										[이전] &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="adopRecode.ado">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }">[이전]</a> &nbsp;
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="red" size="4"><b>[${ p }]</b></font>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="adopRecode.ado">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a> &nbsp;
										</c:if>
									</c:forEach>
									
									<!-- [다음] -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										[다음]
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="adopRecode.ado">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }">[다음]</a>
									</c:if>
								</td>
							</tr>
					</tbody>
				</table>
				<div class="btnDiv">
					<button type="button" class="btn btn-primary" id = "writeBtn" onclick="location.href='adoptionRecodeWrite.ado';">글쓰기</button>
				</div>
			</div>
		</div>
		
	</div>
</div>
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
	<c:import url="../common/footer.jsp"/>
</body>
</html>