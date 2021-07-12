<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<style>
	.serviceinfo {
		width: 65%;
		margin: 0px auto;
	}
	.serviceinfotext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	.serviceinfo1 {
		padding-top: 50px;
		margin: 0px auto;
		display: table;
	}
	.serviceinfo1 .infotext {
		font-size: 20px;
		padding-right: 35px;
		color: gray;
		font-weight: bold;
		vertical-align: middle;
		width: 500px;
		letter-spacing: -1px;
		display: table-cell;
	}
	.serviceinfo1 .infoImg {
		display: table-cell;
	}
	.serviceinfo2 {
		margin-top: 50px;
		margin-bottom: 150px;
		width: 100%;
		background: rgb(233, 247, 172);
		height: 190px;
	}
	.serviceinfo2 .infotext2 {
		font-size: 18px;
		color: rgb(51, 51, 51);
		width: 30%;
		display: table-cell;
		letter-spacing: -1px;
		padding-left: 30px;
		padding-right: 30px;
	}
	#servicego{
		font-weight: bold;
		margin-top: 9px;
		margin-left: 23%;
		letter-spacing: -1px;
		background: rgb(189, 204, 148);
        border: 1px solid white;
        color: white;
        cursor: pointer;
        padding: 8px 8px;
        border-radius: 5px;
        font-size: 0.9375em;
	}
</style>
</head>
<body>
<c:import url="../admin/header.jsp"/>
<div class="serviceinfo">
	
	<div style="text-align:center;" class="serviceinfotext">
		<h1 style="color:#BDCC94;"><b>Yellow Bridge와 함께 따뜻한 정을 나누어 보세요!</b></h1>
	</div>
	
	<div class="serviceinfo1">
		<div class="infotext">
			해마다 가족의 품에서 떨어져 방황하는 유기동물들이 늘어나고 있습니다.<br>
			<br>
			그에 따라 아이들이 머물고 있는 보호소를 향한 도움의 손길이 절대적으로 필요한 상황입니다.<br>
			<br>
			Yellow Bridge와 함께 새로운 가족을 기다리고 있는 아이들에게 정을 나누어 주세요.<br>
		</div>
		<div class="infoImg">
			<img src="<%=request.getContextPath()%>/resources/images/serviceinfo.jpg" width="500px" height="500px">
		</div>
	</div>
	
	<div class="serviceinfo2">
		<h2 style="padding: 10px; color:black;"><b>봉사 신청 안내</b></h2>
		
		<div class="infotext2">
			1. Yellow Bridge 홈페이지 접속 후 봉사 > 봉사 신청 메뉴에 들어갑니다.<br>
			<button id="servicego" style="align: center;" onclick="location.href='<%= request.getContextPath() %>/serviceapply.vol'">봉사 신청하러 가기</button>
		</div>
		<div class="infotext2">2. 봉사 신청 메뉴에서 원하는 보호소를 선택 후 봉사료(자재비와 간식비로 쓰입니다)를 결제합니다.</div>
		<div class="infotext2">3. 관리자가 확인 후 확정 메시지나 이메일을 개별로 보내드립니다.</div>
	</div>
	
</div>
<c:import url="../common/footer.jsp"/>
	
	<script></script>
</body>
</html>