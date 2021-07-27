<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YELLOW BRIDGE</title>
</head>
<body>
		<c:if test="${ loginUser.grade == '1'}">
		<c:import url="WEB-INF/views/admin/header.jsp"/>
		</c:if>
		<c:if test="${ loginUser.grade == '0'|| empty loginUser}">
		<c:import url="WEB-INF/views/common/header.jsp"/>
		</c:if>
		<c:import url="WEB-INF/views/common/mainContents/mainContents.jsp"/>
		<c:import url="WEB-INF/views/common/footer.jsp"/>
</body>
</html>