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
	 height: 150px; 
	}
	
	.loginArea { 
	 width:500px; 
	 height:400xp; 
	 margin:0 auto; 
	 text-align:center; 
	 padding:50px;  
	 }
	 
    .loginArea h3{
    font-size:50px; 
    }
    
    #id {
    padding-left: 70px; 
    padding-bottom: 20px;
    }
    #id_text{
    width:270px; 
    padding:20px; 
    border:0; 
    border-bottom:1px solid black;
    }
   
    #pwd{
    padding-left: 70px;
    }
    #pwd_text{
    width:270px;
    padding:20px; 
    border:0; 
    border-bottom:1px solid black;
    }
    
    
    #id_text::placeholder {
    font-weight: bolder; 
    color:black; 
    font-size:15px;
    }
    #pwd_text::placeholder {
    font-weight: bolder; 
    color:black; 
    font-size:15px;
    }
    
    #login{
    padding:20px; 
    }
    #loginButton{
    width:280px; 
    height:50px; 
    background:rgb(246, 255, 222); 
    border:none; 
    font-weight: bolder; 
    color:black; 
    font-size:15px;
    }
    
    .button a{
    font-size:15px; 
    font-weight: bolder; 
    }
    
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="area">
</div>
	<div class="loginArea">
		<form action="login.me" method="post" id="formLogin">
			<h3>로그인</h3> <br>
				<table class="loginTable">
					<tr>
						<td id="id">
							<input type="text" name="id" placeholder="아이디" id="id_text"> 
							<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
						</td>
						
					</tr>
					<tr>
						<td id="pwd">
							<input type="password" name="pwd" placeholder="패스워드" id="pwd_text">
							<input type="hidden" name="pwdDuplicateCheck" id="pwdDuplicateCheck" value="0">
						</td>

					</tr>
					<tr>
						<td id="login" colspan="3"><button onclick="return IdPwdCheck();" id="loginButton" style="cursor:pointer">로그인</button></td>
						
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
	function IdPwdCheck(){
		var userId = $('#id_text').val().trim();
		var userPwd = $('#pwd_text').val().trim();
		
		
		if(userId == ""){
			alert("아이디를 입력하세요.");
			$('#id_text').focus();
			return false;
		}else{
			if(userPwd == ""){
				alert("비밀번호를 입력하세요.");
				$('#pwd_text').focus();
				return false;
			}
		}
	
		$.ajax({
			url: 'memberCheck.me',
			data: {id:userId},
			success: function(data){
				console.log(data);
				if(data != 1){
					alert("잘못된 아이디 또는 비밀번호 입니다.");
					return false;
				}else if(data == 1){
					$('#formLogin').submit();
				}
			}
		});
	}
	
	

</script>
</body>
</html>