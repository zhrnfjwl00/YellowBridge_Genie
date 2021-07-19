<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입양절차</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption2.css">
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
<%-- <c:forEach var="animal" items="${ animallist }"> --%>
<fmt:formatDate var="formatRegDate" value="${rescueDate}" pattern="yyyy.MM.dd"/>
<div class="board_request">
					<form method="post" action="animalApplyInsert.ado" enctype="multipart/form-data" accept-charset="utf-8">
					<fmt:formatDate var="formatRegDate" value="${rescueDate}" pattern="yyyy.MM.dd"/>
		<input type="hidden" name="animalType" value="${ animal.animalType }">
		<input type="hidden" name="requestAnimalNo" value="${ animal.animalNo }">
		<table cellpadding="0" cellspacing="0" summary="입양상담신청 게시판">
			<caption>입양신청서</caption>
			<colgroup>
<%-- 				<col width="25%">
				<col width="75%"> --%>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><span>축종</span></th>
					<td>${ animal.animalType }</td>
					<th scope="row"><span>일련번호</span></th>
					<td>${ animal.animalNo }</td>
				</tr>
				<tr>
					<th scope="row"><span>입양사유</span></th>
					<td colspan="3"><input type="text" id="requestReason" name="requestReason"></td>
				</tr>
				<tr>
					<th scope="row"><span>가족 동의</span></th>
					<td colspan="3"> 
						<input type="radio" name="requestAgreement" value="Y" checked> 동의 
						<input type="radio" name="requestAgreement" value="N"> 동의하지않음
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
						<input type="radio" name="requestTnrAgree" value="Y" checked> 예
						<input type="radio" name="requestTnrAgree" value="N"> 아니오 
				<tr>
		</table>
		
		<div class="btn_area">
<!-- 			<a href="javascript:void(0);" onclick="javascript:check();">신청서 등록</a> -->
			<button type="submit">제출하기</button>
<!--  			<a href="javascript:void(0);" onclick="javascript:check();">신청서 등록</a>
			<a href="javascript:void(0);" onclick="location.href=''">취소</a> -->
		</div><!--E:btn_area-->
	</form>

	<div class="request_info">
		<strong>입양절차 안내</strong><br>
		입양상담은 법적 공고기간 10일 이후부터 진행됩니다.<br>
		입양신청서가 접수되면, 입양업무 담당자가 서류심사를 한 후, 입양이 가능하다고 판단된 분께만 개별연락을 드리며,<br>
		1차 전화상담, 2차 방문상담 후 입양여부를 최종 결정하게 됩니다<br>
		또한, 미성년자나 대학생의 경우는 부모님의 동의여부를 확인해야만 입양이 가능합니다.<br>
		입양이 결정된 경우, 협회를 방문하실 때는 <span>신분증과 입양동물의 운송에 필요한 물품</span>(<u>이동가방, 목걸이, 리드줄 등</u>)을 지참하시고<br>
		<u>오후 4시(일요일 및 공휴일 제외)까지 방문</u>해 주셔야 합니다.
	</div><!--E:request_info-->


	</div><!--E:board_request-->
<%-- 	</c:forEach>
 --%>	</div><!--E:wrap_sub-->
	</div>
	<c:import url="../common/footer.jsp" />
	
	
	<script>
	<!--
	function check() {
		var form = document.form;

		if(form.name.value =='') {
			alert('신청하시는 분의 이름을 입력해주세요'); 
			form.name.focus();
			return false;
		}

		if(form.birthday.value =='') {
			alert('생년월일을 입력해주세요'); 
			form.birthday1.focus();
			return false;
		}

		var check_tel = 1;
		var check_mobile = 1;
		if(form.cell_num2.value == "" || form.cell_num3.value == "") check_mobile = 0;
	    if(form.tel2.value == "" || form.tel3.value == "") check_tel = 0;
	    if(!check_mobile && !check_tel) { alert("자택 또는 이동전화 중 한가지는 입력해주세요."); form.cell_num1.focus(); return; }

		if (form.addr.value == "") { alert("주소를 입력해주세요."); form.addr.focus(); return; }

		if(!form.ani_memo.value) {
			alert('입양하시려는 이유를 간단히 기술하세요'); 
			form.ani_memo.focus();
			return false;
		}

		var len = form.f_agree.length;
		var check2 = "";
			 
		for(var i=0;i<len;i++){
		if(form.f_agree[i].checked){
		 check2 = form.f_agree[i].value; 
		 }  
		}
		if(check2 == "") {
			alert('가종동의 여부를 선택하세요'); 
			return false;
		}


		var len = form.adoption.length;
		var check3 = "";
			 
		for(var i=0;i<len;i++){
		if(form.adoption[i].checked){
		 check3 = form.adoption[i].value; 
		 }  
		}
		if(check3 == "") {
			alert('반려동물 입양경험 여부를 선택하세요'); 
			return false;
		}

		if(check3 == "Y"){
			if(form.ani_fee.value == ""){
			alert('과거에 입양했던 반려동물의 종류와 수량을 입력하세요');
			form.ani_fee.focus();
			return false;
			}
			if(form.ani_state.value == ""){
			alert('과거에 입양했던 반려동물은 현재 어떻게 되었는지 기술하세요');
			form.ani_state.focus();
			return false;
			}
		}


		var len = form.home_type.length;
		var check4 = "";
			 
		for(var i=0;i<len;i++){
		if(form.home_type[i].checked){
		 check4 = form.home_type[i].value; 
		 }  
		}//버튼이 하나이상일경우 확인

		if(check4 == ""){
		 alert("주거형태를 선택하세요.");
		return false;
		}


		if(!form.ani_plan1.value) {
			alert('이사, 또는 해외이주 시 반려동물 어떻게 하실 것인지 기술하세요'); 
			form.ani_plan1.focus();
			return false;
		}
		if(!form.ani_plan2.value) {
			alert('미혼의 경우, 앞으로 결혼, 임신, 출산 등을 하실 경우\n\n입양한 반려동물을 어떻게 하시실 것인지 기술하세요'); 
			form.ani_plan2.focus();
			return false;
		}

		var len = form.neutral_yn.length;
		var check5 = "";
			 
		for(var i=0;i<len;i++){
		if(form.neutral_yn[i].checked){
		 check5 = form.neutral_yn[i].value; 
		 }  
		}

		if(check5 == ""){
		 alert("중성화수술 동의여부를 선택하세요.");
		return false;
		}
		if(check5 != "Y"){
		 alert("죄송합니다. 중성화수술에 동의하지 않으시면 입양이 불가합니다.");
		return false;
		}


		form.action = "?act=save&edit=&page=&keyfield=&keyword=";
		form.submit();
		return true;
	}

	//-->
	</script>
</body>
</html>