<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YELLOW BRIDGE</title>
<style>

	.area{
	 width:100%;
	 height: 200px; 
	}
	
	.area2{
	width:800px;
	height: 1050px;
	margin: 0 auto;
	
	}
	
	.updateArea{ 
	width:500px; 
	height:800px; 
	margin: 0 auto;
	
	}
	
	.menu { 
	width: 615px; 
	height:230px; 
	margin: 0 auto;
	}
	
	.menu button{
	width:200px; 
	height: 80px; 
	font-size:20px; 
	font-weight: bolder; 
	background-color:white; 
	border: none; 
	border-bottom: 2px solid black; 
	}
	
	.menu button:hover {
	background-color:rgb(246, 255, 222); 
	border-bottom: 2px solid rgb(246, 255, 222); 
	}
	
	#button2{ 
	border-bottom: 1px solid rgb(246, 255, 222); 
	background-color:rgb(246, 255, 222);
	}
	
	
	.updateArea{
	width:500px; 
	height:900px;  
	margin:0 auto;
	}
	
	.updateTable{
	border-collapse: separate; 
	border-spacing: 0 20px;
	}
	
	.updateTable th{ 
	font-weight: bolder; 
	font-size:15px; 
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
	margin-right:50px;
	}
	
	#birth{
	width:180px;
	}
	#email{
	width:180px;
	}
	.postcodify_address {
	width:250px;
	}
	.postcodify_extra_info {
	width: 250px;
	}
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>	
<div class="area">
	</div>
<div class="area2">
		<div class="menu">
			<h1> 마이페이지 </h1>
				<!-- 활동정보 -->
				<span><button type="button" onclick="location.href='mypage.jsp'" id="button1">활동정보</button></span>
				
				<!-- 회원정보 -->
				<span><button type="button" onclick="location.href='mupdateView.me'" id="button2">회원정보</button></span>
				
				<!-- 회원탈퇴 -->
				<c:url var="mdelete" value="mdelete.me">
					<c:param name="id" value="${ loginUser.id }"/>
				</c:url>
				<span><button type="button" onclick="location.href='mdeleteView.me'" id="button3">회원탈퇴</button></span>
			</div>	
	
	<div class="updateArea">
			
		<form action="mupdate.me" method="post">
			<table class="updateTable">
				<tr>
					<th>아이디</th>
					<td>${ loginUser.id }<input type="hidden" name="id" value="${ loginUser.id }"></td>
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="password" name="newPwd1"></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><input type="password" name="newPwd2"></td>				
				<tr>
			
				
				<tr>
					<th>이름</th>
					<td>${ loginUser.name }<input type="hidden" name="name" value="${ loginUser.name }"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>${ loginUser.nickname }<input type="hidden" name="nickname" value="${ loginUser.nickname }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="${ loginUser.email }"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${ loginUser.phone }<input type="hidden" name="phone" value="${ loginUser.phone }"></td>
				</tr>
				
				<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
					<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
						<c:set var="post" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 1 }">
						<c:set var="address1" value="${ addr }"/>
					</c:if>
					<c:if test="${ status.index eq 2 }">
						<c:set var="address2" value="${ addr }"/>	
					</c:if>
				</c:forTokens>
				<tr>
					<th>생년월일</th>
					<td>${ loginUser.birth }<input type="hidden" name="birth" value="${ loginUser.birth }"></td>
				</tr>
				
				<tr></tr>
				<tr></tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="post" class="postcodify_postcode5" value="${ post }" size="6">
						<button type="button" id="postcodify_search_button">검색</button>
					</td>
				</tr>
				
				<tr>
					<th>도로명 주소</th>
					<td>
						<input type="text" name="address1" class="postcodify_address" value="${ address1 }" size="30">
					</td>
				</tr>
				<tr>
					<th>상세 주소</th>
					<td><input type="text" name="address2" class="postcodify_extra_info" value="${ address2 }" size="30"></td>
				</tr>	
				
				
				<!-- jQuery와 Postcodify를 로딩한다. -->
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
						<input type="submit" value="수정하기" id="button">
						<c:url var="mdelete" value="mdelete.me">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
						<%-- <button type="button" onclick="location.href='${ mdelete }'">탈퇴하기</button> --%>
						<input type="reset" id="resetButton" value="취소하기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>