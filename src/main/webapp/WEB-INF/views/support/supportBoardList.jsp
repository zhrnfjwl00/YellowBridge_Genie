<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 리스트 출력</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
 <style>
  #example{text-align: center;}
	
	#example tr th{padding: 10px; font-size: 18px; font-weight: bold;  border-bottom: 1px solid black;}
	#example tr td{padding: 7px; font-size: 16px;}
	
	.supportBoard {
		width: 65%;
		margin: 0px auto;
	}
	.supportBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.tableNo{width: 5%;}
	.tableTitle{width: 40%;}
	.tableWriter{width: 15%;}
	.tableDate{width: 15%;}
	.tableCount{width: 10%;}
	#searchArea{padding-bottom:25px;}
	.btnDiv{padding-top:25px; float: right;}
 </style>

</head>
<body>
<div class="supportBoard">
	<c:import url="../common/header.jsp"/>
	<div style="text-align:center;" class="supportBoardtext">
		<h1 style="color:#BDCC94;"><b>후원금 사용내역 조회 게시판</b></h1>
		<h5><b>소중한 후원금 이렇게 쓰였습니다.</b></h5>
	</div>
	<div class="container" style="margin-top:30px; text-align:center;" >
		<div class="row">
			<div class="col-sm-12">
			      <div id="searchArea" align="center" >
					<select id="searchCondition" name="searchCondition">
						<option>-------</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					
					<input id="searchValue" type="search">
					<button onclick="searchBoard();">검색</button>
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
			        	<c:forEach var="b" items="${ list }">
							<tr>
								<td align="center">${ b.bNo }</td>
								
								<td align="center">
<%-- 									<c:if test="${ !empty loginUser }">
 --%>										<c:url var="sdetail" value="sdetail.sup">
											<c:param name="bNo" value="${ b.bNo }"/>
											<c:param name="page" value="${ pi.currentPage }"/>
											</c:url>
										<a href="${ sdetail }">${ b.bTitle }</a>
<%-- 									</c:if>
 --%><%-- 								<c:if test="${ empty loginUser }">
<%-- 									</c:if>
 --%>								</td>
								
								<td align="center">${ b.nickname }</td>
								<td align="center">${ b.bCreateDate }</td>
								<td align="center">${ b.bView }</td>
								</td>
							</tr>
							</c:forEach>
			        </tbody>
			    </table>
			    <br><br>
			    <div align="center" height="20" id="buttonTab">
			
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="sList.sup">
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
							<c:url var="pagination" value="sList.sup">
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
						<c:url var="after" value="sList.sup">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
						</c:if>
						</td>
					</tr>
<%-- 					<c:if test="${ !empty loginUser }">
 --%>					<div class="btnDiv">
						<button type="button" class="btn btn-primary" id="writeBtn" onclick="location.href='sinsertView.sup';">글쓰기</button>
<%-- 					</c:if>
 --%>					</div>
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
			
			location.href="search.sup?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
		
	</script>
</body>
</html>