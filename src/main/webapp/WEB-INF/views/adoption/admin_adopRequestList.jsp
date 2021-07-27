<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<title>관리자 계정 입양일지 리스트 출력</title>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption2.css">
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
	
	.tableCheck{width: 10%;}
	.tableNo{width: 10%;}
	.tableTitle{width: 35%;}
	.tableWriter{width: 20%;}
	.tableDate{width: 25%;}
	.tableCount{width: 5%;}
	#searchArea{padding-bottom:25px;}
	.btnDiv{padding-top:25px; float: right;}
	
.submenu_1 {
  list-style-type: none;
  margin-top: 100px;
  padding: 0;
  overflow: hidden;
  background-color: #DDE88F;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #BDCC94;
}

.btn_area {width:1100px; height:auto; margin:40px auto 50px auto; text-align:center;}
.btn_area button {width:88px; height:33px; line-height:35px; display:inline-block; vertical-align:top; color:#95998A; border:1px solid #95998A;}
</style>
</head>
<body>
<div class="serviceBoard">
	<c:import url="../admin/header.jsp"/>
	<div class="container" style="margin-top:30px; text-align:center;">
		<div class="row">
		
				<div class="col-sm-12">
					<ul class="submenu_1">
						  <li><a class="active" href="admin_adoption.ado">입양공고관리</a></li>
						  <li><a href="admin_request.ado">입양신청관리</a></li>
						  <li><a href="admin_recode.ado">입양일지관리</a></li>
						</ul>
					<table id="example" class="display" style="width: 100%">
						<thead>
							<tr>
								<th class="tableCheck">선택</th>
								<th class="tableNo">NO.</th>
								<th class="tableTitle">동물명</th>
								<th class="tableWriter">구조일</th>
								<th class="tableDate">입양신청자</th>
								<th class="tableCount">입양상태</th>
							</tr>
						</thead>
						<tbody id="listArea">
							<c:forEach var="animal" items="${ animallist }">
								<fmt:formatDate var="formatRegDate"
									value="${ animal.rescueDate }" pattern="yyyy.MM.dd" />
								<tr>
									<td><input type="checkbox" name="checkbox" value="${ animal.animalNo }">
									<td align="center" class="tableNo">${ animal.animalNo }</td>
									<td align="center" class="tableTitle">${ animal.animalType }</td>
									<td align="center" class="tableWriter">${ formatRegDate }</td>
									<td align="center" class="tableDate">${ animal.requestMemberNickname }</td>
									<td align="center" class="adopView">${ animal.animalRequestState }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="btn_area">
						<button onclick="location.href='animalNoticeWriterForm.ado'">공고등록</button>
						<button id="updateBtn">선택공고삭제</button>
					</div>
					<!--E:btn_area-->
					
					
					<!-- 페이지 -->
								<div id="pagingNav" class="pagenation">
									<c:if test="${ pi.currentPage <= 1 }">
										<a href="${ before }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_prev.png" alt="이전 목록 보기"></a> 
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="admin_adoption.ado">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_prev.png" alt="이전 목록 보기"></a> 
									</c:if>
									
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
										<span class="select">${ p }</span> 
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="admin_adoption.ado">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a>
										</c:if>
									</c:forEach>
									
									
									<!-- [다음] -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<a href="${ after }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_nxt.png" alt="다음 목록 보기"></a>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="admin_adoption.ado">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_nxt.png" alt="다음 목록 보기"></a>
									</c:if>
								</div>
									<!-- 페이지  끝 -->
				</div>
			</div>
		
	</div>
</div>
	<script type="text/javascript">
		$('#updateBtn').on('click', function() {
			if ($('input[name=checkbox]:checked').length < 1) {
				alert('선택된 입양공고가 없습니다.');
			} else {
				var checkbox = [];
				$('input[name=checkbox]:checked').each(function() {
					checkbox.push($(this).val());
				});

				$.ajax({
					url : 'admin_deleteNotice.ado',
					type : 'post',
					data : { checkbox : checkbox },
					success : function(data) {
						window.location.reload();
						console.log('성공');
						
					},
					error : function() {
						console.log('공고삭제에 실패했습니다.');
					}
				});
			}
		});
	</script>
	<c:import url="../common/footer.jsp"/>
</body>
</html>