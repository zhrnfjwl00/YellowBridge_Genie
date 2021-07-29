<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>
<style>
	
	#area1{width:100%; height:200px;}
	
	.loginArea { width:500px; height:400px; text-align:center; padding:50px;  margin: 0 auto;}
    .loginArea h3 {font-size:50px; }
    
    #userName {padding-left: 70px; padding-bottom: 20px;}
    #userName_text{width:270px; padding:20px; border:0; border-bottom:1px solid black;}
    #confirmPwd{padding-left: 70px;}
    #confirmPwd_text{width:270px; padding:20px; border:0; border-bottom:1px solid black;}
    
    #userName_text::placeholder {font-weight: bolder; color:black; font-size:15px;}
    #confirmPwd_text::placeholder {font-weight: bolder; color:black; font-size:15px;}
    
    #login{padding:20px; }
    #loginButton{width:280px; height:50px; background:rgb(246, 255, 222); border:none; font-weight: bolder; color:black; font-size:15px;}
    
    .button a{font-size:15px; font-weight: bolder; }
    .button td{}
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div id="area1">
</div>
	<div class="loginArea">
		<form action="noMemPayResult.sup" method="post">
			<h3>비회원 인증</h3> <br>
				<table class="loginTable">
					<tr>
						<td id="userName"><input type="text" name="userName" placeholder="주문자명" id="userName_text"> </td>
					</tr>
					<tr>
						<td id="confirmPwd"><input type="password" name="confirmPwd" placeholder="패스워드" id="confirmPwd_text"></td>
					</tr>
					<tr>
						<td id="login" colspan="3"><button type="submit" id="loginButton" style="cursor:pointer" >확인</button></td>
					</tr>
				</table>
		</form>
	</div>
<c:import url="../common/footer.jsp"/>
<script>
	
</script>
</body>
</html>