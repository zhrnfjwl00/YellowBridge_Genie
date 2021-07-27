<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<c:import url="../common/header.jsp" />

	<div class="wrap_sub">
		<div class="rescue">
			<div class="menu_name">
				<h2>입양신청완료</h2>
				<hr>
			</div>
			<div class="board_request">
				<table>
					<tr>
						<th scope="row"><span></span></th>
					</tr>
					<tr>
						<td>입양 신청이 완료되었습니다. <br> <br> 담당자가 서류 검토 후 입양이 가능한
							분께는 별도로 공지해 드리고 있으며,<br> 입양신청 후 10일 이내 연락이 없을시에는 유기동물을 키우시기에
							적합하지 않다고 판단된 경우입니다. 이점 양해해 주시기 바랍니다.<br> <br> 세부사항은
							입양신청조회에서 확인해주시기 바랍니다. 감사합니다.
						</td>
				</table>

				<div class="btn_area">
					<!-- 			<a href="javascript:void(0);" onclick="javascript:check();">신청서 등록</a> -->
					<button id="adopInfo">입양신청조회</button>
					<button id="goMain">메인으로</button>
					<!--  			<a href="javascript:void(0);" onclick="javascript:check();">신청서 등록</a>
					<a href="javascript:void(0);" onclick="location.href=''">취소</a> -->
				</div>
				<!--E:btn_area-->
				<div class="request_info">
					<strong>입양절차 안내</strong><br> 입양상담은 법적 공고기간 10일 이후부터 진행됩니다.<br>
					입양신청서가 접수되면, 입양업무 담당자가 서류심사를 한 후, 입양이 가능하다고 판단된 분께만 개별연락을 드리며,<br>
					1차 전화상담, 2차 방문상담 후 입양여부를 최종 결정하게 됩니다<br> 또한, 미성년자나 대학생의 경우는
					부모님의 동의여부를 확인해야만 입양이 가능합니다.<br> 입양이 결정된 경우, 협회를 방문하실 때는 <span>신분증과
						입양동물의 운송에 필요한 물품</span>(<u>이동가방, 목걸이, 리드줄 등</u>)을 지참하시고<br> <u>오후
						4시(일요일 및 공휴일 제외)까지 방문</u>해 주셔야 합니다.
				</div>
				<!--E:request_info-->
			</div>
			<!--E:board_request-->
		</div>
		<!--E:wrap_sub-->
	</div>
	<c:import url="../common/footer.jsp" />
</body>
<script type="text/javascript">
 		// 입양신청조회 버튼
		$(document).on('click', '#adopInfo', function(){
			location.href = "${pageContext.request.contextPath}/adopInfo.ado";
		});
 		
 		// 메인이동 버튼
		$(document).on('click', '#goMain', function(){
			location.href ='<%=request.getContextPath()%>/index.jsp'
		});
</script>
</html>