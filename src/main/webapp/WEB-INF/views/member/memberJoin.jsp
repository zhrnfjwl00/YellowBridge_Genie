<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YELLOW BRIDGE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	
	.area{
	 width:100%;
	 height: 150px; 
	}

	.joinArea{
	width:500px; 
	height:900px;  
	margin:0 auto; }
	
	.infoTable{ 
	border-collapse: separate; 
	border-spacing: 0 20px; 
	margin-left:40px;
	}
	.infoTable th{ 
	font-weight: bolder; 
	font-size:15px; 
	}
	.infoTable sup{
	color:red; 
	font-weight: bolder;
	}
	
	#ad{
	width:100px;
	}
	
	#button{
	width:200px;
	height:50px; 
	background:rgb(246, 255, 222); 
	border:none; 
	font-weight: bolder; 
	color:black; 
	font-size:15px;
	}
	
	#resetButton{
	width:200px; 
	height:50px; 
	background:rgb(246, 255, 222); 
	border:none; 
	font-weight: bolder; 
	color:black; 
	font-size:15px;
	margin-right:50px;}
	
	
	#email{
	width:190px;
	}
	
	#birth{
	width:190px;
	}
	
	
	.postcodify_address{
	width:250px;
	}
	.postcodify_extra_info{
	width:250px;
	}
	
	span.guide{
	display:none; 
	font-size:12px; 
	top:12px; 
	right: 10px;
	}
	span.ok{
	color: green;
	}
	span.error{
	color:red;
	}
	
	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="area">
	</div>
	
	<div class="joinArea">
		<h1>회원가입</h1>
			<form action="minsert.me" method="post" id="joinForm">
				<table class="infoTable">
					<tr>
						<th><sup>*</sup>아이디</th>
						<td>
							<input type="text" name="id" id="userId"><br>
							<span class="guide ok">사용 가능합니다.</span>
							<span class="guide error">사용 불가능합니다.</span>
							<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
						</td>
					</tr>
					<tr>
						<th><sup>*</sup>비밀번호</th>
						<td>
							<input type="password" name="pwd">
						</td>
					</tr>
					<tr></tr>
					<tr>
						<th><sup>*</sup>이름</th>
						<td>
							<input type="text" name="name">
						</td>
					</tr>
					<tr>
						<th><sup>*</sup>닉네임</th>
						<td>
							<input type="text" name="nickname" id="nickname"><br>
							<span class="nick_guide ok">사용 가능합니다.</span>
							<span class="nick_guide error">사용 불가능합니다.</span>
							<input type="hidden" name="nick_DuplicateCheck" id="nick_DuplicateCheck" value="0">
						</td>
					</tr>
						<tr>
						<th><sup>*</sup>이메일</th>
						<td>
							<input type="email" name="email" id="email">
						</td>
					</tr>
					<tr>
						<th><sup>*</sup>연락처</th>
						<td>
							<input type="text" name="phone" placeholder="'-'제외하고 숫자만 입력">
						</td>
					</tr>
					<tr>
						<th><sup>*</sup>생년월일</th>
						<td>
							<input type="date" name="birth" id="birth">
						</td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<th><sup>*</sup>우편번호</th>
						<td>
							<input type="text" name="post" class="postcodify_postcode5" value="" size="6" id="ad">
							<button type="button" id="postcodify_search_button">검색</button>
						</td>
					</tr>
					<tr>
						<th>&nbsp;도로명 주소</th>
						<td><input type="text" name="address1" class="postcodify_address" value=""></td>
					</tr>
					<tr>
						<th>&nbsp;상세 주소</th>
						<td><input type="text" name="address2" class="postcodify_extra_info" value=""></td>
					</tr>
					
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
					
					<tr></tr>
					<tr></tr>
					
					
					<tr>
						<td colspan="2" align="center">
							<button onclick="return validate();" id="button">가입하기</button>
							<input type="reset" value="취소하기" id="resetButton">
						</td>
					</tr>
				</table>
				
			</form>
	</div>
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$('#userId').on('keyup', function(){
			var userId = $(this).val().trim();
			
			if(userId.length < 4){
				$('.guide').hide();
				$('#idDuplicateCheck').val(0);
				
				return;
			}
			
			$.ajax({
				url: 'dupId.me',
				data: {id:userId},
				success : function(data){
					console.log(data);
					if(data == 0) {
						$('.guide.error').hide();
						$('.guide.ok').show();
						$('#idDuplicateCheck').val(1);
					}else{
						$('.guide.error').show();
						$('.guide.ok').hide();
						$('#idDuplicateCheck').val(0);
					}
				}
			});
		});
		
			
		$('#nickname').on('keyup', function(){
			var nickname = $(this).val().trim();
			
			if(nickname.length < 4){
				$('.nick_guide').hide();
				$('#nick_DuplicateCheck').val(0);
				
				return;
			}
			$.ajax({
				url:'dupNickname.me',
				data: {nickname : nickname},
				success: function(data){
					console.log(data);
					if(data == 0){
						$('.nick_guide.error').hide();
						$('.nick_guide.ok').show();
						$('#nick_DuplicateCheck').val(1);
					}else{
						$('.nick_guide.error').show();
						$('.nick_guide.ok').hide();
						$('#nick_DuplicateCheck').val(0);
					}
				}
			});
		});
		
		
		function validate(){
			if($('#idDuplicateCheck').val() == 0){
				alert("사용가능한 아이디를 입력해주세요.");
				$('#userId').focus();
				return false;
			}else if($('#nick_DuplicateCheck').val() == 0){
				alert("사용가능한 닉네임을 입력해주세요.");
				$('#nickname').focus();
				return false;	
			}else{
				$('#joinForm').submit();
			}
		}
		
		
	</script>
</body>
</html>