<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header_admin</title>
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/common.js"></script>
<style>
	#info{border:none; margin-left: 10px; background-color: hsla(120, 100%, 50%, 0);}
	#logout{border: none; background-color: hsla(120, 100%, 50%, 0);}
</style>
</head>
<body>
<!-- 헤더 시작 -->
<header class="gnbFixed main">
<div class="inner">
	<h1><a href=""><img src="<%= request.getContextPath() %>/resources/images/logo.png"></a></h1>
	<div class="innerMenu">
	<<span class="util">
			<c:if test="${ empty sessionScope.loginUser }">
				<a onclick="location.href ='<%=request.getContextPath()%>/loginView.me'" style="cursor:pointer;">로그인</a>
				<a onclick="location.href ='<%=request.getContextPath()%>/memberJoinTermsView.me'" style="cursor:pointer;">회원가입</a>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
					<c:out value="${ loginUser.nickname}님"/> 
					<c:url var="myinfo" value="myinfo.me"/>
					<c:url var="logout" value="logout.me"/>
					<button onclick="location.href='${myinfo}'" id="info">마이페이지</button>
					<button onclick="location.href='${logout}'" id="logout">로그아웃</button>
			</c:if>
		</span>
    </div>
			<nav>
				<ul id="menuBody" class="nav7nd">
					<li class=""><a href="">사용자관리 </a>
						<div class="sub" style="display: none;">
						</div></li>
					<li class=""><a href="t">통계파악</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
							</ul>
						</div></li>
					<li class=""><a href="">관리</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
								<li><a href="admin_adoption.ado">입양관리</a></li>
								<li><a href="adminsearchlist.vol">봉사관리</a></li>
								<li><a href="">후원관리</a></li>
							</ul>
						</div></li>
					<li class=""><a href="notice.sc">고객사항</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
							</ul>
						</div></li>
				</ul>
			</nav>
		</div>
</header>
<!--// 헤더 끝  -->

</body>
</html>