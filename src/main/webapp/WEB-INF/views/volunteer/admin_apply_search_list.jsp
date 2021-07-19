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
	
	.selected{width:5%;}
	.tableNo{width: 5%;}
	.tableShelter{width: 20%;}
	.tableCo{width:30%;}
	.tableName{width:7%;}
	.tableId{width:8%;}
	.tableTime{width:10%;}
	.tableStatus{width:10%;}
	
	#listArea{padding: 5px;}
	
	#bottom {
	padding-top: 10px;
	text-align: center;
	}
	
	#update {
		padding-left: 10px;
		text-align: left;
		padding-bottom: 25px;
	}
	
	#update button {
		height: 30px;
		width: 50px;
		margin-top: 1px;
		font-size: 12px;
		color: white;
		background: orange;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        width: auto;
        border-radius: 5px;
        font-size: 0.9375em;
	}
	
	#updateBtn:hover {
		background: #ffa500d9;
		cursor: pointer;
	}
	
	#update p {
		font-size: 15px;
		font-weight: 600;
		display: inline-block;
		padding-right: 10px;
	}
	
	#update select {
		width: 150px !important;
	}
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="serviceApplyBoard">

	
	<div style="text-align:center;" class="serviceApplyBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 신청 조회</b></h1>
	</div>
	
	<div id="searchArea" align="center">
		<select id="searchCondition" name="searchCondition">
			<option>-------</option>
			<option value="writer">작성자아이디</option>
			<option value="title">제목</option>
			<option value="category">보호소</option>
		</select>
		
		<input id="searchValue" type="search">
		<button onclick="searchBoard();">검색</button>
	</div>
	
	<table id="serviceApplyBoardTable" class="display" style="width:100%">
		<thead>
			<tr>
				<th align="center" class="selected"><input type="checkbox" name="selected" id="allSelected"></th>
				<th align="center" class="tableNo">NO.</th>
                <th align="center" class="tableShelter">보호소</th>
                <th align="center" class="tableCo">신청내역</th>
                <th align="center" class="tableName">이름</th>
                <th align="center" class="tableId">아이디</th>
                <th align="center" class="tableTime">신청시각</th>
                <th align="center" class="tableStatus">상태</th>
			</tr>
		</thead>
		<tbody id = "listArea">
		<c:if test="${ empty adminaplist }">
			<tr>
				<td colspan="5">작성된 봉사 신청서가 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach var="vol" items="${ adminaplist }">
			<tr>
				<td class="selected"><input type="checkbox" name="checkbox" id="oneSelected" value="${ vol.serviceappNo }"></td>
				<td align="center" class="tableNo">${ vol.serviceappNo }</td>
				<td align="center" class="tableShelter">${ vol.shelterName }</td>
			
				<td align="center" class="tableCo">
					<c:url var="adminsearchDetail" value="adminsearchDetail.vol">
						<c:param name="appId" value="${ vol.serviceappNo }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ adminsearchDetail }">${ vol.serviceName }</a>
				</td>
				
				<td align="center" class="tableName">${ vol.mName }</td>
				<td align="center" class="tableId">${ vol.mId }</td>
				<td align="center" class="tableTime">${ vol.volDate }</td>
				<td align="center" class="tableStatus">${ vol.volStatus }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div id="bottom">
		<div id="update">
			<p>선택한 신청건을</p>
			<select id="selectUpdate">
				<option>신청상태선택</option>
				<option value="신청확정">신청확정</option>
				<option value="확정대기">확정대기</option>
				<option value="신청취소">신청취소</option>
				<option value="신청대기">신청대기</option>
				<option value="입금미확인">입금미확인</option>
				<option value="입금확인">입금확인</option>
			</select>
			<p>으로</p>
			<button id="updateBtn">변경</button>
		</div>
	</div>
	
	
	<table id="serviceApplyBoardTable" class="display" style="width:100%">
		<tr align="center" height="20" id="buttonTab">
			<td colspan="7">
			
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
	</table>
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
		
		location.href="adminApplysearch.vol?searchCondition="+searchCondition+"&searchValue="+searchValue;
	}
	
	$('#updateBtn').on('click', function() {
		if ($('input[name=checkbox]:checked').length < 1) {
			alert('선택된 주문이 없습니다.')
		} else if ($('#selectUpdate').val() == '신청상태선택') {
			alert('주문 상태를 선택해주세요.');
		} else {
			var checkArr = [];
			$('input[name="checkbox"]:checked').each(function() {
				checkArr.push($(this).val());
			});

			$.ajax({
				url : 'updateApply.vol',
				data : {
					check : checkArr,
					select : $('#selectUpdate').val()
				},
				success : function(data) {
					alert(data);
					window.location.reload();
				},
				error : function() {
					console.log('신청 상태 수정에 실패했습니다.');
				}
			});
		}
	});
   
</script>
</body>
</html>