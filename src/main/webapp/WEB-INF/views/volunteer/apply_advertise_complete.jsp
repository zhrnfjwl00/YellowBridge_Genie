<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사 신청 완료</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	html, body {
	    height: 100%; 
	    overflow: auto;
	    margin: 0px auto;
	    letter-spacing: -1px;
	    min-width: 1500px;
  		align: center;
  		margin: auto;
	}	
	
	.applycomplete{
		width: 65%;
		margin: 0px auto;
		padding-top: 30px;
	}
	
	.serviceCompletetext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	table{
  		margin: auto;
		width: 100%;
  		border-collapse : collapse;
  		padding: 10px;
  		margin-bottom: 50px;
  		text-align: center;
	}
	
	#tableDiv{
  		margin: auto;
		width: 60%;
  		margin-bottom: 50px;
  		align: center;
	}
	
	#tableDiv th{
		width: 20%;
		padding: 5px;
		background: lightgray;
	}
	
	#tableDiv td{
		width: 70%;
		padding: 5px;
	}
	
	#bottontxt{padding-bottom:15px;}
	
	#goMain{
		background: lightgray;
    	border: 1px solid lightgray;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
	}
	
	#goOrderDetail{
		background: rgb(189, 204, 148);
    	border: 1px solid white;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
    	margin-right: 30px;
	}
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="applycomplete">
	<div style="text-align:center; padding-bottom:30px;"  class="serviceCompletetext">
		<h1 style="color:#BDCC94; letter-spacing: -1px;"><b>봉사 신청이 완료되었습니다!</b></h1>
	</div>
	
	<div id="tableDiv">
	<table border="1" align="center">
		<tr>
			<th><b>신청 봉사</b></th>
			<td style="color:red; font-size: 18px; font-weight:bold;">${ volApp.serviceName }</td>
		</tr>
		<tr>
			<th><b>신청 보호소</b></th>
			<td>${ volApp.shelterName }</td>
		</tr>
		<tr>
			<th><b>보호소 연락처</b></th>
			<td>${ volApp.shelterTel }</td>
		</tr>
		<tr>
			<th><b>봉사자 성함</b></th>
			<td>${ volApp.mName }</td>
		</tr>
		<tr>
			<th><b>봉사자 핸드폰 번호</b></th>
			<td>${ volApp.mPhone }</td>
		</tr>
		<tr>
			<th><b>봉사자 이메일 주소</b></th>
			<td>${ volApp.mEmail }</td>
		</tr>
		<tr>
			<th><b>봉사자 주소</b></th>
			<td>${ volApp.mAddress }</td>
		</tr>
		<tr>
			<th><b>전달사항</b></th>
			<td>${ volApp.volReq }</td>
		</tr>
		<tr>
			<th><b>결제 수단</b></th>
			<td style="color:blue; font-size: 18px; font-weight:bold;">
				무통장입금(기업은행 12123434565678 옐로우브릿지)<br>
				입금자 성함 : ${ volApp.servicepayName }
			</td>
		</tr>
		<tr>
			<th><b>입금하실 금액</b></th>
			<td style="font-size: 18px; font-weight:bold;">
				10,000원
			</td>
		</tr>
	</table>
	</div>
						
	<div align="center" class="pay button">
		<h3 style="color:rgb(192, 57, 43);" id="bottontxt"><b>무통장입금은 봉사신청 후 12시간 내로 입금해주세요. 12시간 동안 미입금시 자동 취소됩니다.</b></h3>
		<input type="button" id="goOrderDetail" value="신청내역보기">
		<input type="button" onclick="location.href='<%= request.getContextPath() %>/gomain'" id="goMain" value="메인으로">
	</div>
</div>	
<c:import url="../common/footer.jsp"/>
</body>
</html>