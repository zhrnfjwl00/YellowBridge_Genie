<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사자 신청서 작성</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	.applyform{
		width: 65%;
		margin: 0px auto;
		padding-top: 30px;
	}
	
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.contentTable{
    	width: 60%;
		margin: 0px auto;
		height: auto;
		min-height: 30%;
		border-collapse : collapse;
		padding: 50px;
		align: center;
    }
    
    .none{display: none;}
    
    input{padding: 8px;}
    
    .contentTable th{
    	width: 30%;
    	padding: 10px;
    }
    .contentTable td{
    	width: 70%;
    	padding: 10px;
    }
    
    select { 
    width: 300px; 
    padding: .8em .5em;
    font-family: inherit;
    border: 1px solid #999; 
    border-radius: 0px; 
    -webkit-appearance: none; 
    -moz-appearance: none; 
    appearance: none; 
    margin-bottom: 10px;
    }
    
    #applybtn{
    	background-color: rgb(189, 204, 148);
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 10px 30px;
        margin-top: 30px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	
	.contentBox{
    margin-left:auto;
    margin-right:auto;
	}
	

</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="applyform">
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사자 신청서 작성</b></h1>
		<h3 style="color:rgb(192, 57, 43);"><b>신청서를 작성하기 전 유의사항을 꼭 읽어주세요!</b></h3>
		<p>
			<br>
			1. 동반인이 있을 경우 본인과 동반인 각각 따로 신청서를 작성해 주셔야 합니다.(반드시 봉사자 한 명 당 하나의 신청서 제출)<br><br>

			2. 신청서를 제출하는 사람은 반드시 봉사자 본인이어야 합니다.(대리 신청서 제출 불가. 반드시 회원가입 후 자신의 이름으로 제출해주세요)<br><br>

			3. 당일 노쇼일 경우 평생 Yellow Bridge에서 봉사자로서 참여하실 수 없으니 꼭 참석이 가능하신 분만 신청서를 제출해주세요.<br><br>

			4. 픽업과 준비물 등은 해당 보호소에 문의해주세요.<br><br><br>
		</p>
	</div>
	<div class="contentBox">
		<form action="<%= request.getContextPath() %>/sApplyForm.vol" method="post" id="sApplyForm">
			<table class="contentTable" style="​margin: auto; text-align: center;">
				<tr>
	        		<th><b>신청 봉사</b></th>
	        		<td style="color:red;">
	        		<b>${ vol.serviceTitle }</b>
	        		<input type="hidden" name="serviceNo" id="serviceNo" size="10px" value="${ vol.serviceNo }" required>
	        		</td>
	        	</tr>
				<tr>
	        		<th><b>입금하실 금액</b></th>
	        		<td>10,000원</td>
	        	</tr>
				<tr>
	        		<th><b>봉사자 성함</b></th>
	        		<td>${ loginUser.name }</td>
	        	</tr>
	           	<tr>
	           		<th><b>휴대전화번호</b></th>
	           		<td>${ loginUser.phone }</td>
	           	</tr>
	           	<tr>
	           		<th><b>이메일</b></th>
	           		<td>${ loginUser.email }</td>
	           	</tr>
	           	<tr>
	           		<th><b>봉사자 주소</b></th>
	           		<td>${ loginUser.address }</td>
	           	</tr>
	           	<tr>
	           		<th><b>전달사항</b></th>
	           		<td><input type="text" name="volReq" id="volReq" size="50px" placeholder="할 말 있으시면 적어주세요! "></td>
	           	</tr>
	           	<tr>
	           		<th><b>결제방법</b><br><input type="radio" name="payment" value="무통장입금" required checked>무통장입금</th>
	           		<td>
	           			<select>
	           				<option>기업은행 12123434565678 옐로우브릿지</option>
	           			</select>
	           			<br>
	           			입금자명 : <input type="text" name="servicepayName" id="servicepayName" size="10px" required>
	           		</td>
	           	</tr>
	           	<tr>
	           		<td colspan="2" style="text-align:center; padding-top:30px;">봉사 오고 가는 길 차량 사고 및 봉사 도중 사고 발생 시 치료비 등 본인 책임입니다. 동의하십니까? *<input type="radio" name="agree" value="네" required checked>네</td>
	           	</tr>
	       </table>
       
			<div style="text-align: center;">
				<input type="submit" name="applybtn" id="applybtn" value="신청하기">
			</div>
		</form>
		
	</div>
</div>
<c:import url="../common/footer.jsp"/>

<script>
	$("#applybtn").on("click", function(){
		var YN = confirm("입력하신 정보를 다시 한번 확인해주세요. 제출 후 수정이 불가능합니다.");
		
	})
</script>
</body>
</html>