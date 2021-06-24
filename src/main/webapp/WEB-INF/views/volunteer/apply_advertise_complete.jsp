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
		<h1 style="color:#BDCC94; letter-spacing: -1px;">봉사 신청이 완료되었습니다!</h1>
	</div>
		
	<table border="1" align="center">
		<tr>
			<th>신청 봉사</th>
			<td>대구 반야월 쉼터 봉사 (8월 7일)</td>
		</tr>
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
			<th>봉사자 주소</th>
			<td>서울시 강남구 역삼동</td>
		</tr>
		<tr>
			<th>전달사항</th>
			<td>전달사항이 없습니다.</td>
		</tr>
		<tr>
			<th>결제 수단</th>
			<td>무통장입금(기업은행 12123434565678 옐로우브릿지)</td>
		</tr>
	</table>

						
	<div align="center" class="pay button">
		<h3 style="color:rgb(192, 57, 43);">무통장입금은 봉사신청 후 12시간 내로 입금해주세요. 12시간 동안 미입금시 자동 취소됩니다.</h3>
		<input type="button" id="goOrderDetail" value="신청내역보기">
		<input type="button" onclick="location.href='<%= request.getContextPath() %>/gomain'" id="goMain" value="메인으로">
	</div>
</div>	
</body>
</html>