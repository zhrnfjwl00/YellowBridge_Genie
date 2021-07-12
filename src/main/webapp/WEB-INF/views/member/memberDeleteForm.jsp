<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YELLOW BRIDGE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	
	.area{
	 width:100%;
	 height: 200px; 
	}
	
	.area2{
	width:1200px;
	height: 530px;
	margin: 0 auto;	

	}

 	 
 	 
	.menu { 
	width: 615px; 
	height:150px; 
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
	
	#button3{ 
	border-bottom: 1px solid rgb(246, 255, 222); 
	background-color:rgb(246, 255, 222);
	}
	
	.main{
	width:900px; 
	height: 400px; 
	 }
	
	.dupPwArea{

	width:445px; 
	height:200px; 
	margin: 0 auto;
	text-align: center;
	 
	}
	
	.dupPwArea h2{
	font-weight: bolder; 
	align-content: center; 
	
	}
	
	.dupPwArea p{
	font-weight: bolder;
	color: black;
	}
	
	#DeleteBtn{
	width:200px;
	height:50px; 
	background:rgb(246, 255, 222); 
	border:none; 
	font-weight: bolder; 
	color:black; 
	font-size:15px;
	
	}
	
	#CancelBtn{
	width:200px;
	height:50px; 
	background:rgb(246, 255, 222); 
	border:none; 
	font-weight: bolder; 
	color:black; 
	font-size:15px;
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
		
		<div class="dupPwArea">
			<h2 style="color:rgb(192, 57, 43)">정말로 탈퇴하시겠습니까?</h2>
			<br>
			<p>탈퇴 시 회원님의 정보가 파기되오니 신중히 선택하시기 바랍니다.</p>
			<p >하단의 창에 버튼을 누르시면 탈퇴가 완료됩니다.</p>
				
	
			<br>
			<button type="button" onclick="location.href='${ mdelete }'" id="DeleteBtn">회원탈퇴</button>
			<button type="button" onclick="location.href='myinfo.me'"id="CancelBtn" >취소하기</button>
		</div>
	</div>
</div>
<c:import url="../common/footer.jsp"/>
<script>
	
</script>
</body>
</html>