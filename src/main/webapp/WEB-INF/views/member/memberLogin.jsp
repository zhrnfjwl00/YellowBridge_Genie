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
    font-weight: bolder;
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
    font-size:13px; 
    font-weight: bolder; 
    margin-left: 35px;
    }
    
     #my_modal {
                display: none;
                width: 500px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

            #my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px;
            }
    
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="area">
</div>
	<div class="loginArea">
		<form action="login.me" method="post" id="formLogin"  >
			<h3>?????????</h3> <br>

				<table class="loginTable">
					<tr>
						<td id="id">
							<input type="text" name="id" placeholder="?????????" id="id_text"> 
							<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
						</td>
						
					</tr>
					<tr>
						<td id="pwd">
							<input type="password" name="pwd" placeholder="????????????" id="pwd_text">
							<input type="hidden" name="pwdDuplicateCheck" id="pwdDuplicateCheck" value="0">
						</td>

					</tr>
					<tr>
						<td id="login" colspan="3"><button onclick="return IdPwdCheck();" id="loginButton" style="cursor:pointer">?????????</button></td>
						
					</tr>
					<%-- <tr class="button">
						<td><a onclick="location.href ='<%=request.getContextPath()%>/memberJoinTermsView.me'" style="cursor:pointer;">???????????? </a></td> 
						<td colspan="2"><a id="popup_open_btn" onclick="location.href='memberIdPwFindView.me'" style="cursor:pointer;">?????????  ?? ???????????? ??????</a></td>
						
					</tr> --%>
				</table>	
			</form>
		</div>
		
		
	
<c:import url="../common/footer.jsp"/>

<script>

	function IdPwdCheck(){
		var userId = $('#id_text').val().trim();
		var userPwd = $('#pwd_text').val().trim();
		
		
		if(userId == ""){
			alert("???????????? ???????????????.");
			$('#id_text').focus();
			return false;
		}else{
			if(userPwd == ""){
				alert("??????????????? ???????????????.");
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
					alert("????????? ????????? ?????? ???????????? ?????????.");
					location.href='loginView.me';
				
					
				}else if(data == 1){
					$('#formLogin').submit();
				}
			}
		});
	}
	
	 function modal(id) {
         var zIndex = 9999;
         var modal = document.getElementById(id);
		
         // ?????? div ?????? ??????????????? ?????????
         var bg = document.createElement('div');
         bg.setStyle({
             position: 'fixed',
             zIndex: zIndex,
             left: '0px',
             top: '0px',
             width: '100%',
             height: '100%',
             overflow: 'auto',
             // ????????? ????????? ????????? ????????? ???
             backgroundColor: 'rgba(0,0,0,0.4)'
         });
         document.body.append(bg);

         // ?????? ?????? ??????, ????????? ???????????? ?????? div ?????????
         modal.querySelector('.modal_close_btn').addEventListener('click', function() {
             bg.remove();
            modal.style.display = 'none';
         });

         modal.setStyle({
             position: 'fixed',
             display: 'block',
             boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

             // ????????? ????????? ?????? ?????? ?????? ?????????
             zIndex: zIndex + 1,

             // div center ??????
             top: '50%',
             left: '50%',
             transform: 'translate(-50%, -50%)',
             msTransform: 'translate(-50%, -50%)',
             webkitTransform: 'translate(-50%, -50%)'
         });
     }

     // Element ??? style ????????? ??????????????? ???????????? ?????? ??????
     Element.prototype.setStyle = function(styles) {
         for (var k in styles) this.style[k] = styles[k];
         return this;
     };

     document.getElementById('popup_open_btn').addEventListener('click', function() {
         // ????????? ?????????
         modal('my_modal');
     });
	
     
     function search_check(num) {
 		if (num == '1') {
 			document.getElementById("searchP").style.display = "none";
 			document.getElementById("searchI").style.display = "";	
 		} else {
 			document.getElementById("searchI").style.display = "none";
 			document.getElementById("searchP").style.display = "";
 		}
 	}
    
 	
  
     
     
      function idSearch_click(){
    	 
    	 var userId = '${userId.id}';
    	 console.log(userId);
    	 
    	
    	 
    	 if(userId == null){
    		 $('#area').hide();
    		 alert("??????????????? ??????????????????.");
    		 return f
    	 }else{
    		 $('#area').hide();
    		 alert("??????????????? ????????????" + userId + " "  + "?????????.");
    	 }
     }  
	
     
    
</script>
	


</body>
</html>