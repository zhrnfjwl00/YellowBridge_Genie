<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입양절차</title>
<style>
.basic {
	position:relative;
}

.info {
	position::absolute;
	vertical-align:middle;
}
</style>
</head>
<body>
	<div class="basic">
	<c:import url="../common/header.jsp"/>
		<div class="info">
<%-- 			<img src="<%= request.getContextPath() %>/resources/images/process1.png" alt="" align="center">
 --%>		</div>
	<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>