<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href=".<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap');
	.aboutArea{ width:1000px; hegith:1000px; padding:20px; padding-top:200px; margin: 0 auto;}
	.goal{ width: 900px; height:300px; margin:20px; background:rgb(237, 255, 192);}
	.mission{ width: 900px; height:300px; margin:20px; background:rgb(233, 247, 172)}
	.slogan{width: 900px; height:300px; margin:20px; background:rgb(221, 232, 143);}
	
				
	.aboutArea p:first-letter{font-size: 40px;} 
	.goal_text{font-size: 25px;  padding-left:200px; padding-top:40px; line-height: 40px; 
	           color: black; font-weight: bolder; font-family: 'Noto Sans KR', sans-serif;}
	.mission_text{font-size: 30px;  padding-left:200px; padding-top:70px; line-height: 50px;
				  color: black; font-weight: bolder; font-family: 'Noto Sans KR', sans-serif;}
	.slogan_text{font-size: 30px;  padding-left:200px; padding-top:90px; line-height: 50px;
	              color: black; font-weight: bolder; font-family: 'Noto Sans KR', sans-serif;}
	
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
	<div class="aboutArea">
		<div class="goal">
			<p class="goal_text">
				세상에 나쁜 동물은 없죠.<br>
				하지만 우리들의 이기심으로<br>
				사랑스러운 강아지들이 버려지기도 합니다.<br>
				
				유기동물의 책임은 결국 인간에게 있기에<br>
				우리는 그 책임을 나누려 합니다.<br>
			</p>
		</div>
		
		<div class="mission">
			<p class="mission_text">
				MISSION<br>
				우리는 유기동물이 <br>
				건강하고 행복하게 살도록 돕는다.<br>
			</p>
		</div>
		
		
		<div class="slogan">
			<p class="slogan_text">
				SLOGAN<br>
				봉사는 즐겁게 유기동물은 가족에게 <br>
			</p>
		</div>
		
	</div>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>