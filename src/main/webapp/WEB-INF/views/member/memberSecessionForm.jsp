<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YELLOW BRIDGE</title>
<style>
	.secessionArea{border: 1px solid black;}
	
	.secessionArea h1{color:rgb(192, 57, 43);}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
		<div class="secessionArea">
			<h1>탈퇴가 완료되었습니다.</h1>
			<p>그동안 Yellow Bridge를 이용해주셔서 감사합니다.</p>
			<a href="../../../index.jsp">시작페이지로 돌아가기</a>
		</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>