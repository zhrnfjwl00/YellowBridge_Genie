<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	.outer{
	
		width:100%; display: center; border-top:2px solid #bdbdbd;
		border-bottom:2px solid #bdbdbd;font-family:"NanumGothic",sans-serif;
		padding-top: 100px;
	}
	.outer tr{border-top:1px solid #cdcdcd; font-weight:bold;}
	.outer tr:first-child{border-top:0;}
	.outer th{background:#f6f6f6; width:30%;text-align:left; padding-left:3%}
	.outer td{text-align:left;background:#fff;padding-top:1%!important;padding-bottom:1%!important;color:#5c5c5c;font-size:15px;line-height:26px;padding-left:3%}
	.outer input[type="text"]
	{margin-right:1%;color:#5c5c5c; line-height:12px; font-size:14px;font-family:"NanumGothic",sans-serif;background:#f6f6f6;vertical-align:middle;border:1px solid #cdcdcd;padding:1%;}
	.insertArea {width:500px; height:450px; margin-left:auto; margin-right:auto;}
	.btnArea {margin-left:auto; margin-right:auto; width:180px; margin-top: 100px;}
	/*#insertBtn,#cancelBtn {margin-left:auto; margin-right:auto; width:180px;} */
	
	#payBtn, #cancelBtn{
		padding: 5px;
		font-size:16px;color:#008000; border:2px solid #81c147;
		border-radius:2em; background: rgb(233, 247, 172); 
		letter-spacing:-0.8px; font-weight:bold;
	}
	#payBtn:hover, #cancelBtn:hover{background:#fff;color:#81c147;}
	
	#infoBtn{margin: auto; width: 50%;}
	#memPayinfoBtn{padding: 5px; width: 100%; font-size: 18px;}
	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	<div class="outer">
		<br>
		<h2 align="center">후원결제 정보 작성</h2>
		<h5 align="center" style="color:gray;">*비회원 결제 시 모든 항목 필수 입력</h5>
		
		<c:if test="${!empty loginUser}">
			<div id="infoBtn" align="center">
				<button id="memInfo" onclick="changeInfo();">회원정보로 작성</button>
			</div>
		</c:if>
		
		<script type="text/javascript">
	        function changeInfo(){
		       	var memName = '${loginUser.name}';
	        	document.getElementById('supName').value = memName;
	        	var memEmail = '${loginUser.email}';
	        	document.getElementById('supEmail').value = memEmail;
	        	var memPhone = '${loginUser.phone}';
	        	document.getElementById('supPhone').value = memPhone;
	        	var memAddress = '${loginUser.address}';
	        	document.getElementById('supAddress').value = memAddress;
	        };
		</script>
		
		<form method="post">
			<div class="insertArea">
				<table id="payInfoTable">
				<br>
					<tr>
						<th width="100px">입금자명</th>
						<td colspan="3"><input type="text" size="45" id="supName" name="supName"  required></td>
					</tr>
					<tr>
						<th width="100px">후원금액</th>
						<td colspan="3"><input type="number" size="45" id="supAmount" name="supAmount" min="1000" step="1000" placeholder="최소금액  1000원" required></td>
					</tr>
					<tr>
						<th width="100px">이메일</th>
						<td colspan="3"><input type="text" size="45" id="supEmail" name="supEmail" placeholder="'@'포함한 이메일 작성" required></td>
					</tr>
					<tr>
						<th width="100px">연락처</th>
						<td colspan="3"><input type="text" size="45" id="supPhone" name="supPhone" placeholder="'-'제외한 번호만 입력"required></td>
					</tr>
					<tr>
						<th width="100px">주소</th>
						<td colspan="3"><input type="text" size="45" id="supAddress" name="supAddress" required></td>
					</tr>
					<c:if test="${empty loginUser}">
						<tr>
							<th width="100px">비회원인증 비밀번호</th>
							<td colspan="3"><input type="password" size="40" id="confirmPwd" name="confirmPwd" required></td>
						</tr>
					</c:if>
					
					
				</table>
				
				<div class="btnArea">
					<button type="button" id="payBtn" onclick="requestPay();">결제하기</button>
					<button type="button" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/supportPage.sup'">취소하기</button>
				</div>
				<br>
				<br>
			</div>
			
	</form>
		<c:import url="../common/footer.jsp"/>
		
		<script type="text/javascript">
			
			function requestPay(){
				
				if('${loginUser}'){
					// 회원결제
					var memNo = '${loginUser.no}';
					var confirmPwd = 'confirmPwd1111'
				} else {
					// 비회원결제
					var memNo = '0000'; // 비회원결제 : 0000
					var confirmPwd = $('#confirmPwd').val();					
				}
				
				
				var userName = $('#supName').val();
				var price = $('#supAmount').val();
				var email = $('#supEmail').val();
				var tel = $('#supPhone').val();
				var addr = $('#supAddress').val();
				
				var IMP = window.IMP;
				IMP.init('imp78411675');
					
				IMP.request_pay({
				    pg : 'html5_inicis', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : 'YellowBridge후원',
				    amount : price,
				    buyer_email : email,
				    buyer_name : userName,
				    buyer_tel : tel,
				    buyer_addr : addr,
				    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
				    
				}, function(rsp) {
				    if ( rsp.success ) {
				        $.ajax({
				        	url: "insertPaymentInfo.sup",
				        	data: {imp_uid:rsp.imp_uid, userName:userName, price:price, 
				        		email:email, tel:tel ,addr:addr, memNo:memNo, confirmPwd:confirmPwd},
				        	success: function(data){
				        		console.log(data);
				        		
				        	},
				        	error: function(e){
				        		console.log(e);
				        	}
				        });
				        
				        var msg = '결제가 완료되었습니다.'+ '\n';
				        msg += '자세한 내역은 내 후원내역조회에서 볼 수 있습니다. '
				        
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				    }
				    alert(msg);
				    location.href="supportPayComplete.sup?imp_uid=" + rsp.imp_uid;
				});
			};
		
		
		
		</script>
		
		
		
</body>
</html>