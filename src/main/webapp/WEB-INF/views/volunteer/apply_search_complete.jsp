<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	table{
  		margin: auto;
		width: 80%;
  		border-collapse : collapse;
  		cellpadding: 10px;
  		margin-bottom: 50px;
  		align: center;
	}
	
	th{
		width: 30%;
		padding: 10px;
		background: lightgray;
	}
	
	td{
		width: 70%;
		padding: 10px;
	}
	
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
<div class="applycomplete">
	<div style="text-align:center; padding-bottom:30px;">
		<h1 style="color:#BDCC94; letter-spacing: -1px;">봉사 신청 조회</h1>
	</div>
		
	<table border="1" align="center">
		<tr>
			<th>봉사자 성함</th>
			<td>강건강</td>
		</tr>
		<tr>
			<th>봉사자 핸드폰 번호</th>
			<td>010-1111-2222</td>
		</tr>
		<tr>
			<th>봉사자 이메일 주소</th>
			<td>health@kh.or.kr</td>
		</tr>
		<tr>
			<th>보호소</th>
			<td>반야월 쉼터</td>
		</tr>
		<tr>
			<th>신청 내역</th>
			<td>대구 반야월 쉼터 봉사 (8월 7일)</td>
		</tr>
		<tr>
			<th>결제 금액</th>
			<td>10,000원</td>
		</tr>
		<tr>
			<th>상태</th>
			<td color="red">신청확정</td>
		</tr>
		<tr>
			<th>전달사항</th>
			<td>전달사항이 없습니다.</td>
		</tr>
	</table>

						
	<div align="center" class="pay button">
		<input type="button" onclick="location.href='<%= request.getContextPath() %>/gomain'" id="goMain" value="메인으로">
	</div>
</div>	
</body>
</html>