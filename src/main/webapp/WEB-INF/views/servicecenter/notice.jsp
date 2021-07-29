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
	
	.scBoard {
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
<div class="scBoard">
	<c:if test="${loginUser.id.equals('admin')}">
      <c:import url="../admin/header.jsp"/>
   </c:if>
   
   <c:if test="${!loginUser.id.equals('admin') || empty loginUser}">
      <c:import url="../common/header.jsp"/>
   </c:if>
	<div style="text-align:center;" class="supportBoardtext">
		<h1 style="color:#BDCC94;"><b>공지사항</b></h1>
		<h5><b>YELLOW BRIDGE 서비스 공지사항</b></h5>
	</div>
	<div class="container" style="margin-top:30px; text-align:center;" >
		<div class="row">
			<div class="col-sm-12">
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
			        	<c:forEach var="sc" items="${ sclist }">
							<tr>
								<td align="center">${ sc.scId }</td> <!-- NO 번호  -->
								<td align="center">
										<c:url var="noticeDetail" value="nodetail.sc"> <!-- 상세보기 -->
											<c:param name="bId" value="${ sc.scId }"/>
											<c:param name="page" value="${ pi.currentPage }"/>
											</c:url>
										<a href="${ noticeDetail }">${ sc.scTitle }</a>
								</td>
								
								<td align="center">${ sc.scWriter }</td>
								<td align="center">${ sc.scCreateDate }</td>
								<td align="center">${ sc.scCount }</td>
							</tr>
							</c:forEach>
			        </tbody>
			    </table>
			    <br><br>
			    <div align="center" id="buttonTab">
			
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="notice.sc">
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
							<c:url var="pagination" value="notice.sc">
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
					<div class="btnDiv">
					<%-- <c:if test="${!empty loginUser}"> --%>
					 <c:if test="${loginUser.grade  == 1}">
					<button type="button" class="btn btn-primary" id="writeBtn" onclick="location.href='<%= request.getContextPath() %>/noinsertform.sc'">작성</button>
							<!-- <button type="button" class="btn btn-primary" id="writeBtn"
								onclick="location.href='QnAWrite.sc';">작성</button> -->
					</c:if>
				</div>
			</div>
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
	</script>
</body>
</html>