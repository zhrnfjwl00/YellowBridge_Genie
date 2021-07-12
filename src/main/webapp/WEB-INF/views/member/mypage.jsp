<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		width:1200px;
		height: 800px;
		margin: 0 auto;
		
	}
	.myInfoArea {
	 height: 200px;
	
	}
	
	.menu { 
	margin: 0 auto;
	width: 615px; 
	height:90px; 
	
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
	#button1{ 
	border-bottom: 1px solid rgb(246, 255, 222); 
	background-color:rgb(246, 255, 222);
	}
	
	.main{
	width:1200px; 
	height: 400px; 
	border: 1px solid black; 
	padding: 40px; 
	}
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="area">
</div>
<div class="area2">
	<div class="myInfoArea">
		<h1> 마이페이지 </h1>
		<div class="menu">
			
			<!-- 활동정보 -->
			<span><button type="button" onclick="" id="button1">활동정보</button></span>
			
			<!-- 회원정보 -->
			<span><button type="button" onclick="location.href='mupdateView.me'" id="button2">회원정보</button></span>
			
			<!-- 회원탈퇴 -->
			<c:url var="mdelete" value="mdelete.me">
				<c:param name="id" value="${ loginUser.id }"/>
			</c:url>
			<span><button type="button" onclick="location.href='mdeleteView.me'" id="button3">회원탈퇴</button></span>
		</div>
		
		<br><br>
		
		<div class="main">
			<h3>'${ loginUser.nickname }'님 환영합니다.</h3>
		</div>
	</div>
</div>
<c:import url="../common/footer.jsp"/>
</body>
</html>