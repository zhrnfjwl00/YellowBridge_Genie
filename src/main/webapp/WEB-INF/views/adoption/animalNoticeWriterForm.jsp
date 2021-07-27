<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입양절차</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption2.css">
</head>
<body>
	<c:import url="../admin/header.jsp" />
	<div class="wrap_sub">
		<div class="rescue">
			<div class="menu_name">
				<h2>입양공고등록</h2>
				<hr>
			</div>
			<!--글쓰기-->
			<div class="board_request">
				<form method="post" name="form" action="animalInsert.ado" enctype="multipart/form-data" accept-charset="utf-8">
					<table cellpadding="0" cellspacing="0" summary="입양상담신청 게시판">
						<caption>입양공고등록</caption>
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
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="필수항목표시"><span>축종</span></th>
								<td><input type="text" id="animalType" name="animalType" value=""></td>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="필수항목표시"><span>성별</span></th>
								<td colspan="3">
									<input type="radio" class="animalGender" name="animalGender" id="animalGender1" value="G" checked><label for="animalGender1"> 암컷</label>
									<input type="radio" class="animalGender" name="animalGender" id="animalGender2" value="M"><label for="animalGender2"> 수컷</label></td>
							</tr>
							<tr>
								<th scope="row"><span>연령</span></th>
								<td><input type="number" id="animalAge" name="animalAge"></td>
								<th scope="row"><span>모색</span></th>
								<td><input type="text" id="animalColor" name="animalColor"></td>
							</tr>
							<tr>
								<th scope="row"><span>중성화수술여부</span></th>
								<td><input type="radio" id="animalTnr1" name="animalTnr" value="Y" checked> 했음 
								<input type="radio" id="animalTnr2" name="animalTnr" value="N"> 안했음</td>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="필수항목표시"><span>성격</span></th>
								<td><input type="text" id="animalCharacter" name="animalCharacter"></td>
							</tr>
							<tr>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="필수항목표시"><span>체중</span></th>
								<td><input type="text" id="animalWeight" name="animalWeight"></td>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="필수항목표시"><span>건강상태</span></th>
								<td><input type="text" id="animalCondition" name="animalCondition"></td>
							</tr>
							<tr>
								<th scope="row"><img
									src="<%=request.getContextPath()%>/resources/images/check.png"
									alt="필수항목표시"><span>특징</span></th>
								<td colspan="3"><input type="text" id="animalFeature"
									name="animalFeature"></td>
							</tr>
						</tbody>
					</table>


					<table cellpadding="0" cellspacing="0" summary="입양상담신청 게시판">
						<caption>입양상담신청 게시판</caption>
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span>구조일</span></th>
								<td><input type="date" id="rescueDate" name="rescueDate"></td>
							</tr>

							<tr>
								<th scope="row"><img
									src="<%=request.getContextPath()%>/resources/images/check.png"
									alt="필수항목표시"><span>구조장소</span></th>
								<td><input type="text" id="rescueLocation"
									name="rescueLocation"></td>
							</tr>

							<tr>
								<th scope="row"><img
									src="<%=request.getContextPath()%>/resources/images/check.png"
									alt="필수항목표시"><span>이미지첨부</span></th>
								<td><input type="file" id="uploadFile" multiple="multiple"
									name="uploadFile"></td>
							</tr>
						</tbody>
					</table>

					<div class="btn_area">
						<button onclick="javascript:check();">공고등록</button>
						<!--  			<a href="javascript:void(0);" onclick="javascript:check();">신청서 등록</a>
			<a href="javascript:void(0);" onclick="location.href=''">취소</a> -->
					</div>
					<!--E:btn_area-->
				</form>
			</div>
			<!--E:board_request-->
		</div>
		<!--E:wrap_sub-->
	</div>
	<c:import url="../common/footer.jsp" />


	<script>
	/* $('#btn55').click(function(){
	    if($('#animalType').val == ''){
	    	alert('축종을 입력해주세요');
	          return false;
	      }
	    return true;
	}); */
	
	
	
	
	/* 
		function check() {
			var form = document.form;
			
			if (form.animalType.value == '') {
				alert('축종을 입력해주세요');
				form.animalType.focus();
				return false;
			}
			
			
			
			
			form.action = "animalInsert.ado";
			form.submit();
			return true;
		}; */
	<!-- 

			

			if (form.birthday.value == '') {
				alert('생년월일을 입력해주세요');
				form.birthday1.focus();
				return false;
			}

			var check_tel = 1;
			var check_mobile = 1;
			if (form.cell_num2.value == "" || form.cell_num3.value == "")
				check_mobile = 0;
			if (form.tel2.value == "" || form.tel3.value == "")
				check_tel = 0;
			if (!check_mobile && !check_tel) {
				alert("자택 또는 이동전화 중 한가지는 입력해주세요.");
				form.cell_num1.focus();
				return;
			}

			if (form.addr.value == "") {
				alert("주소를 입력해주세요.");
				form.addr.focus();
				return;
			}

			if (!form.ani_memo.value) {
				alert('입양하시려는 이유를 간단히 기술하세요');
				form.ani_memo.focus();
				return false;
			}

			var len = form.f_agree.length;
			var check2 = "";

			for (var i = 0; i < len; i++) {
				if (form.f_agree[i].checked) {
					check2 = form.f_agree[i].value;
				}
			}
			if (check2 == "") {
				alert('가종동의 여부를 선택하세요');
				return false;
			}

			var len = form.adoption.length;
			var check3 = "";

			for (var i = 0; i < len; i++) {
				if (form.adoption[i].checked) {
					check3 = form.adoption[i].value;
				}
			}
			if (check3 == "") {
				alert('반려동물 입양경험 여부를 선택하세요');
				return false;
			}

			if (check3 == "Y") {
				if (form.ani_fee.value == "") {
					alert('과거에 입양했던 반려동물의 종류와 수량을 입력하세요');
					form.ani_fee.focus();
					return false;
				}
				if (form.ani_state.value == "") {
					alert('과거에 입양했던 반려동물은 현재 어떻게 되었는지 기술하세요');
					form.ani_state.focus();
					return false;
				}
			}

			var len = form.home_type.length;
			var check4 = "";

			for (var i = 0; i < len; i++) {
				if (form.home_type[i].checked) {
					check4 = form.home_type[i].value;
				}
			}//버튼이 하나이상일경우 확인

			if (check4 == "") {
				alert("주거형태를 선택하세요.");
				return false;
			}

			if (!form.ani_plan1.value) {
				alert('이사, 또는 해외이주 시 반려동물 어떻게 하실 것인지 기술하세요');
				form.ani_plan1.focus();
				return false;
			}
			if (!form.ani_plan2.value) {
				alert('미혼의 경우, 앞으로 결혼, 임신, 출산 등을 하실 경우\n\n입양한 반려동물을 어떻게 하시실 것인지 기술하세요');
				form.ani_plan2.focus();
				return false;
			}

			var len = form.neutral_yn.length;
			var check5 = "";

			for (var i = 0; i < len; i++) {
				if (form.neutral_yn[i].checked) {
					check5 = form.neutral_yn[i].value;
				}
			}

			if (check5 == "") {
				alert("중성화수술 동의여부를 선택하세요.");
				return false;
			}
			if (check5 != "Y") {
				alert("죄송합니다. 중성화수술에 동의하지 않으시면 입양이 불가합니다.");
				return false;
			}

			
		}
	//-->
	</script>
</body>
</html>