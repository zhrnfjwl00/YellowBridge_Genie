<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>
<style>
	
	.loginArea { width:500px; height:400px; text-align:center; padding:50px;  margin-left:550px; margin-top:150px;}
    .loginArea h3 {font-size:50px; }
    
    #id {padding-left: 70px; padding-bottom: 20px;}
    #id_text{width:270px; padding:20px; border:0; border-bottom:1px solid black;}
    #pwd{padding-left: 70px;}
    #pwd_text{width:270px; padding:20px; border:0; border-bottom:1px solid black;}
    
    #id_text::placeholder {font-weight: bolder; color:black; font-size:15px;}
    #pwd_text::placeholder {font-weight: bolder; color:black; font-size:15px;}
    
    #login{padding:20px; }
    #loginButton{width:280px; height:50px; background:rgb(246, 255, 222); border:none; font-weight: bolder; color:black; font-size:15px;}
    
    .button a{font-size:15px; font-weight: bolder; }
    .button td{}
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
	<div class="loginArea">
		<form action="login.me" method="post">
			<h3>로그인</h3> <br>
				<table class="loginTable">
					<tr>
						<td id="id"><input type="text" name="id" placeholder="아이디" id="id_text"> </td>
						
						
					</tr>
					<tr>
						<td id="pwd"><input type="password" name="pwd" placeholder="패스워드" id="pwd_text"></td>

					</tr>
					<tr>
						<td id="login" colspan="3"><button type="submit" id="loginButton" style="cursor:pointer" >로그인</button></td>
						
					</tr>
					<tr class="button">
						<td><a onclick="location.href ='<%=request.getContextPath()%>/memberJoinTermsView.me'" style="cursor:pointer;">회원가입 </a></td> 
						<td><a onclick="location.href ='<%=request.getContextPath()%>/idFindView.me'" style="cursor:pointer;">아이디 찾기 </a></td>
						<td><a onclick="location.href ='<%=request.getContextPath()%>/pwdFindView.me'" style="cursor:pointer;">비밀번호 찾기</a></td>
					</tr>
				</table>
		</form>
	</div>
<c:import url="../common/footer.jsp"/>
<script>
	
</script>
</body>
</html>