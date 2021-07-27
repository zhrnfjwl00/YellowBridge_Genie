<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>입양절차</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
<style>
.board_request {width:1100px; height:auto; margin:40px auto 50px auto;}
.board_request table {width:100%; border-collapse:collapse; margin-bottom:20px;}
.board_request table thead , .board_request table tbody {border-top:3px solid #95998A;}
.board_request table thead + tbody {border-top:0;}
.board_request table thead th, .board_request table tbody th{background:res; border-bottom:1px solid #ccc;font-family: 'NanumGothicWeb'!important; line-height:40px; font-weight:normal; text-align:center;}
.board_request table span {color:#95998A;}
.board_request table span b {font-family: 'NanumGothicWebBold'!important; font-weight:normal; color:#444;}
.board_request table thead th img {vertical-align:middle; margin-right:5px;}
.board_request table td {text-align:left; font-size:16px; color:#444; line-height:40px; background:#fff; border-bottom:1px solid #ccc; padding:10px; }
.board_request table td button {background:#26579c; color:#fff; text-align:center; width:112px; height:35px; font-size:14px; display:inline-block; vertical-align:middle;margin-bottom:10px;}
.board_request table td input[type="text"].textAreaSize{width: 800px;}
.board_request table td input[type="text"]{width: 250px;}
.board_request table td label {font-size:16px; color:#444;margin-right:15px; margin-left:5px; display:inline-block; vertical-align:middle;}
.board_request table td textarea {padding:5px; font-size:16px; color:#444; background:#fff!important;}

.request_info {background:#fff; font-size:16px; color:#666; line-height:30px; border:2px solid #ccc; padding:20px; margin-bottom:20px;}
.request_info strong {font-family: 'NanumGothicWebBold'!important; font-weight:normal; color:#444;}
.request_info span {color:#95998A;}
.request_info u {text-decoration:none; border-bottom:1px solid #666;}

.btn_area {width:1100px; height:auto; margin:40px auto 50px auto; text-align:center;}

	.btn1{
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
	
	.btn2{
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


</style>
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
					<button id="adopInfo" class="btn1">입양신청조회</button>
					<button id="goMain" class="btn2">메인으로</button>
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