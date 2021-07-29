<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>YELLOW BRIDGE</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<style>
#writeBtn {
	width: 10%;
	height: 40px;
	background-color: #BDCC94;
	border: 1px solid white;
	color: white;
	font-weight: bold;
	cursor: pointer;
	letter-spacing: -1px;
	word-break: keep-all;
	border-radius: 5px;
	text-decoration: none;
	font-size: 0.9375em;
}

.board_request {
	width: 1100px;
	height: auto;
	margin: 40px auto 50px auto;
}

.board_request table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.board_request table thead, .board_request table tbody {
	border-top: 3px solid #95998A;
}

.board_request table thead+tbody {
	border-top: 0;
}

.board_request table thead th, .board_request table tbody th {
	background: res;
	border-bottom: 1px solid #ccc;
	font-family: 'NanumGothicWeb' !important;
	line-height: 40px;
	font-weight: normal;
	text-align: center;
}

.board_request table span {
	color: #95998A;
}

.board_request table span b {
	font-family: 'NanumGothicWebBold' !important;
	font-weight: normal;
	color: #444;
}

.board_request table thead th img {
	vertical-align: middle;
	margin-right: 5px;
}

.board_request table td {
	text-align: left;
	font-size: 16px;
	color: #444;
	line-height: 40px;
	background: #fff;
	border-bottom: 1px solid #ccc;
	padding: 10px;
}

.board_request table td button {
	background: #26579c;
	color: #fff;
	text-align: center;
	width: 112px;
	height: 35px;
	font-size: 14px;
	display: inline-block;
	vertical-align: middle;
	margin-bottom: 10px;
}

.board_request table td input[type="text"].textAreaSize {
	width: 800px;
}

.board_request table td input[type="text"] {
	width: 1080px;
}

.board_request table td label {
	font-size: 16px;
	color: #444;
	margin-right: 15px;
	margin-left: 5px;
	display: inline-block;
	vertical-align: middle;
}

.board_request table td textarea {
	padding: 5px;
	font-size: 16px;
	color: #444;
	background: #fff !important;
}

.request_info {
	background: #fff;
	font-size: 16px;
	color: #666;
	line-height: 30px;
	border: 2px solid #ccc;
	padding: 20px;
	margin-bottom: 20px;
}

.request_info strong {
	font-family: 'NanumGothicWebBold' !important;
	font-weight: normal;
	color: #444;
}

.request_info span {
	color: #95998A;
}

.request_info u {
	text-decoration: none;
	border-bottom: 1px solid #666;
}

.btn_area {
	width: 1100px;
	height: auto;
	margin: 40px auto 50px auto;
	text-align: center;
}

.area {
	width: 100%;
	height: 150px;
}

.wrap_sub {
	margin-top: -150px;
}
</style>
</head>
<body>
		<c:if test="${loginUser.id.equals('admin')}">
			<c:import url="../admin/header.jsp" />
		</c:if>
		<c:if test="${!loginUser.id.equals('admin') || empty loginUser}">
			<c:import url="../common/header.jsp" />
		</c:if>
		<div class="area"></div>
	<div class="wrap_sub">
		<div class="rescue">
			<div class="menu_name">
				<h2>입양신청서</h2>
				<hr>
			</div>

			<!--글쓰기-->
			<fmt:formatDate var="formatRegDate" value="${rescueDate}"
				pattern="yyyy.MM.dd" />
			<div class="board_request">
				<form method="post" action="animalApplyInsert.ado"
					enctype="multipart/form-data" accept-charset="utf-8">
					<fmt:formatDate var="formatRegDate" value="${rescueDate}"
						pattern="yyyy.MM.dd" />
					<input type="hidden" name="animalType"
						value="${ animal.animalType }"> <input type="hidden"
						name="requestAnimalNo" value="${ animal.animalNo }">
					<table cellpadding="0" cellspacing="0" summary="입양상담신청 게시판">
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
								<th><span>동물번호</span></th>
								<td>${ animal.animalNo }</td>
							</tr>
							<tr>
								<th><span>입양사유</span></th>
								<td colspan="3"><input type="text" class="textAreaSize"
									id="requestReason" name="requestReason"></td>
							</tr>
							<tr>
								<th><span>가족 동의 여부</span></th>
								<td colspan="3"><input type="radio" name="requestAgreement"
									id="requestAgreement1" value="Y" checked> 동의
									&nbsp;&nbsp; <input type="radio" name="requestAgreement"
									id="requestAgreement2" value="N"> 동의하지않음</td>
							</tr>
							<tr>
								<th scope="row"><span>반려동물 입양경험</span></th>
								<td colspan="3"><input type="radio"
									name="requestExperience" value="Y" checked> 있음
									&nbsp;&nbsp; <input type="radio" name="requestExperience"
									value="N"> 없음</td>
							</tr>
							<tr>
								<th scope="row"><span>현재 반려동물을 키우고 계십니까?</span></th>
								<td colspan="3"><input type="radio" name="requestPoss"
									value="Y" checked> 예 &nbsp;&nbsp; <input type="radio"
									name="requestPoss" value="N"> 아니오</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tr>
							<th scope="row"><span>과거에 입양했던 반려동물의 종류와 수량은?</span></th>
						</tr>
						<tr>
							<td><input type="text" id="requestQuestion1"
								name="requestQuestion1"></td>
						<tr>
						<tr>
							<th scope="row"><span>과거에 입양했던 반려동물은 현재 어떻게 되었습니까?</span></th>
						</tr>
						<tr>
							<td><input type="text" id="requestQuestion2"
								name="requestQuestion2"></td>
						<tr>
						<tr>
							<th scope="row"><span>중성화수술에 동의하십니까? *미동의시 입양불가</span></th>
						</tr>
						<tr>
							<td style="text-align: center;"><input type="radio"
								name="requestTnrAgree" value="Y" checked> 예 &nbsp;&nbsp;
								<input type="radio" name="requestTnrAgree" value="N">
								아니오</td>
						<tr>
					</table>

					<div class="btn_area">
						<button type="submit" id="writeBtn">제출하기</button>
					</div>
					<!--E:btn_area-->
				</form>
				<div class="request_info">
					<strong>입양절차 안내</strong><br> 입양상담은 법적 공고기간 10일 이후부터 진행됩니다.<br>
					입양신청서가 접수되면, 입양업무 담당자가 서류심사를 한 후, 입양이 가능하다고 판단된 분께만 개별연락을 드리며,<br>
					1차 전화상담, 2차 방문상담 후 입양여부를 최종 결정하게 됩니다<br> 또한, 미성년자나 대학생의 경우는
					부모님의 동의여부를 확인해야만 입양이 가능합니다.<br> 입양이 결정된 경우, 협회를 방문하실 때는 신분증과
					입양동물의 운송에 필요한 물품(이동가방, 목걸이, 리드줄 등)을 지참하시고 오후 4시(일요일 및 공휴일 제외)까지 방문해
					주셔야 합니다.
				</div>
				<!--E:request_info-->
			</div>
			<!--E:board_request-->
		</div>
		<!--E:wrap_sub-->
	</div>
	<c:import url="../common/footer.jsp" />



</body>
</html>