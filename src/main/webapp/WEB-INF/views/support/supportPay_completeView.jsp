<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사 신청 완료</title>
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
	
	#memPayDetail, #noMemPayDetail{
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
		<h1 style="color:#BDCC94; letter-spacing: -1px;"><b>결제가 완료되었습니다!</b></h1>
	</div>
	
	<div id="tableDiv">
		<table border="1" align="center">
			<tr>
				<th><b>후원 완료</b></th>
				<td style="color:red; font-size: 18px; font-weight:bold;">${ pi.orderStatus } 결제</td>
			</tr>
			<tr>
				<th><b>결제자명</b></th>
				<td>${ pi.userName }</td>
			</tr>
			<%-- <tr>
				<th><b>결제자</b></th>
				<td>${ pi.userName }</td>
			</tr>
			<tr>
				<th><b>연락처</b></th>
				<td>${ pi.tel }</td>
			</tr>
			<tr>
				<th><b>이메일</b></th>
				<td>${ pi.email }</td>
			</tr> --%>
			<tr>
				<th><b>결제 금액</b></th>
				<td>${ pi.price }</td>
			</tr>
			<tr>
				<th><b>결제 수단</b></th>
				<td style="color:blue; font-size: 18px; font-weight:bold;">
					카드결제
				</td>
			</tr>
			
		</table>
	</div>
						
	<div align="center" class="pay button">
		<h3 style="color:rgb(192, 57, 43);" id="bottontxt"><b>소중한 후원금 감사합니다!</b></h3>
		<h6>*비회원 결제내역 확인시 결제자명과 결제인증번호가 필요합니다.</h6>
		<c:if test="${!empty loginUser}">
			<input type="button" id="memPayDetail" onclick="memPayDetail();" value="후원결제내역보기">
		</c:if>
		<c:if test="${empty loginUser}">
			<input type="button" id="noMemPayDetail" onclick="noMemPayDetail();" value="후원결제내역보기">
		</c:if>
		<input type="button" onclick="location.href='<%= request.getContextPath() %>/gomain'" id="goMain" value="메인으로">
	</div>
</div>	
<c:import url="../common/footer.jsp"/>
</body>
<script type="text/javascript">

	function memPayDetail(){
		var memNo = ${loginUser.no};
		location.href="paymentList.sup?memNo=" + memNo;
	};
	
	function noMemPayDetail(){
		location.href="noMemPayDetail.sup";
	};

</script>

</html>