<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입양신청서</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption2.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:import url="../common/header.jsp" />

	<div class="wrap_sub">
		<div class="rescue">
			<div class="menu_name">
				<h2>입양신청서</h2>
				<hr>
			</div>
			
			<!--글쓰기-->
			<fmt:formatDate var="formatRegDate" value="${rescueDate}" pattern="yyyy.MM.dd"/>
			<div class="board_request">
			<form method="post" action="animalApplyInsert.ado" enctype="multipart/form-data" accept-charset="utf-8">
			<fmt:formatDate var="formatRegDate" value="${rescueDate}" pattern="yyyy.MM.dd"/>
				<input type="hidden" name="animalType" value="${ animal.animalType }">
				<input type="hidden" name="requestAnimalNo" value="${ animal.animalNo }">
			<table>
				<caption>입양신청서</caption>
				<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
				</colgroup>
			<tbody>
				<tr>
					<th><span>축종</span></th>
					<td>${ animal.animalType }</td>
					<th><span>일련번호</span></th>
					<td>${ animal.animalNo }</td>
				</tr>
				<tr>
					<th><span>입양사유</span></th>
					<td colspan="3"><input type="text" id="requestReason" name="requestReason"></td>
				</tr>
				<tr>
					<th><span>가족 동의</span></th>
					<td colspan="3"> 
						<input type="radio" name="requestAgreement" id="requestAgreement1" value="Y" checked><label for="Y">동의</label>
						<input type="radio" name="requestAgreement" id="requestAgreement2" value="N"><label for="Y">동의하지않음</label>
					</td>
				</tr>
				<tr>
					<th scope="row"><span>반려동물 입양경험</span></th>
					<td colspan="3"> 
						<input type="radio" name="requestExperience" value="Y" checked> 있음
						<input type="radio" name="requestExperience" value="N"> 없음
					</td>
				</tr>
				<tr>
					<th scope="row"><span>현재 반려동물을 키우고 계십니까?</span></th>
					<td colspan="3"> 
						<input type="radio" name="requestPoss" value="Y" checked> 예
						<input type="radio" name="requestPoss" value="N"> 아니오 
					</td>
				</tr>
			</tbody>
		</table>
		<table>
				<tr>
					<th scope="row"><span>과거에 입양했던 반려동물의 종류와 수량은?</span></th>
				</tr>
				<tr>
					<td><input type="text" id="requestQuestion1" name="requestQuestion1"></td>
				<tr>
				<tr>
					<th scope="row"><span>과거에 입양했던 반려동물은 현재 어떻게 되었습니까?</span></th>
				</tr>
				<tr>
					<td><input type="text" id="requestQuestion2" name="requestQuestion2"></td>
				<tr>
				<tr>
					<th scope="row"><span>중성화수술에 동의하십니까? *미동의시 입양불가</span></th>
				</tr>
				<tr>
					<td>
						
				<tr>
		</table>
		
		<div class="btn_area">
<!-- 			<a href="javascript:void(0);" onclick="javascript:check();">신청서 등록</a> -->
			<button type="submit">제출하기</button>
<!--  			<a href="javascript:void(0);" onclick="javascript:check();">신청서 등록</a>
			<a href="javascript:void(0);" onclick="location.href=''">취소</a> -->
		</div>
		<!--E:btn_area-->
	</form>
	<div class="request_info">
		<strong>입양절차 안내</strong><br>
		입양상담은 법적 공고기간 10일 이후부터 진행됩니다.<br>
		입양신청서가 접수되면, 입양업무 담당자가 서류심사를 한 후, 입양이 가능하다고 판단된 분께만 개별연락을 드리며,<br>
		1차 전화상담, 2차 방문상담 후 입양여부를 최종 결정하게 됩니다<br>
		또한, 미성년자나 대학생의 경우는 부모님의 동의여부를 확인해야만 입양이 가능합니다.<br>
	</div><!--E:request_info-->


	</div><!--E:board_request-->
	</div><!--E:wrap_sub-->
	</div>
	<c:import url="../common/footer.jsp" />
	
	
	
</body>
</html>