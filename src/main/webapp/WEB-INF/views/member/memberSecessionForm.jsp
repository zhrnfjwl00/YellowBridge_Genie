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
	
	.secessionArea{
	width:400px;
	height: 200px;
	border: 1px solid black;
	margin: 0 auto;
	text-align: center;
	
	}
	
	.secessionArea p{
	font-weight: bolder;
	color:black;
	}
	.secessionArea h1{
	color:rgb(192, 57, 43);
	font-weight: bolder;
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
<div class="area">
</div>
	<c:import url="../common/header.jsp"/>
		<div class="secessionArea">
			<h1>탈퇴가 완료되었습니다.</h1>
			<p>그동안 Yellow Bridge를 이용해주셔서 감사합니다.</p><br>
			<button id="CancelBtn" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">메인으로</button>
		</div><%-- "<%=request.getContextPath()%>/index.jsp" --%>
	<c:import url="../common/footer.jsp"/>
</body>
</html>