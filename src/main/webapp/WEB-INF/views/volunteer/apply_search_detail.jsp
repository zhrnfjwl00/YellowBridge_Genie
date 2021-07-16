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
	.applycomplete {
		width: 65%;
		margin: 0px auto;
	}
	.servicetext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.applycomplete{
		width: 65%;
		margin: 0px auto;
		padding-top: 30px;
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
	
	#goMain{
		background: lightgray;
    	border: 1px solid lightgray;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
	}
	
	#goReview{
		background: red;
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
	<div style="text-align:center; padding-bottom:30px;" class="servicetext">
		<h1 style="color:#BDCC94; letter-spacing: -1px;"><b>봉사 신청 조회</b></h1>
	</div>
	
	<div id="tableDiv">
	<table border="1" align="center">
		<tr>
			<th><b>봉사자 성함</b></th>
			<td>${ vApply.mName }</td>
		</tr>
		<tr>
			<th><b>봉사자 핸드폰 번호</b></th>
			<td>${ vApply.mPhone }</td>
		</tr>
		<tr>
			<th><b>봉사자 이메일 주소</b></th>
			<td>${ vApply.mEmail }</td>
		</tr>
		<tr>
			<th><b>보호소</b></th>
			<td>${ vApply.shelterName }</td>
		</tr>
		<tr>
			<th><b>신청 내역</b></th>
			<td>${ vApply.serviceName }</td>
		</tr>
		<tr>
			<th><b>결제 금액</b></th>
			<td>10,000원</td>
		</tr>
		<tr>
			<th><b>상태</b></th>
			<td color="red">${ vApply.volStatus }</td>
		</tr>
		<tr>
			<th><b>전달사항</b></th>
			<td>${ vApply.volReq }</td>
		</tr>
	</table>
	</div>
	
	<c:url var="writeReview" value="writeReviewForm.vol">
		<c:param name="shelterName" value="${ vApply.shelterName }"/>
	</c:url>
						
	<div align="center" class="button">
		<input type="button" onclick="location.href='<%= request.getContextPath() %>/serviceApplyBoard.vol'" id="goMain" value="메인으로">
		<input type="button" onclick="location.href='${ writeReview }'" id="goReview" value="후기쓰기">
	</div>
</div>	
<c:import url="../common/footer.jsp"/>
</body>
</html>