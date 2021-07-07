<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.joinArea{width:500px; height:750px;  margin-left:570px; margin-top:150px; }
	.infoTable { border-collapse: separate; border-spacing: 0 20px; margin-left:40px;}
	.infoTable th{ font-weight: bolder; font-size:15px; }
	.infoTable sup{color:red; font-weight: bolder;}
	
	/* .infoTable input{ width:200px; height:30px;} */
	#ad{width:100px;}
	
	
	#button{width:200px; height:50px; background:rgb(246, 255, 222); border:none; font-weight: bolder; color:black; font-size:15px;}
	#resetButton{width:200px; height:50px; background:rgb(246, 255, 222); border:none; font-weight: bolder; color:black; font-size:15px;
	             margin-right:50px;}
	
	
	.postcodify_address{width:250px;}
	.postcodify_extra_info{width:250px;}
	
	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	
	<div class="joinArea">
		<h1>회원가입</h1>
			<form action="minsert.me" method="post" id="joinForm">
				<table class="infoTable">
					<tr>
						<th><sup>*</sup>아이디</th>
						<td>
							<input type="text" name="id" id="userId">
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
							<input type="text" name="nickname">
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
</body>
</html>