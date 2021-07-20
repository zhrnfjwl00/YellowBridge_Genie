<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header_admin</title>
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/common.js"></script>
</head>
<body>
<!-- 헤더 시작 -->
<header class="gnbFixed main">
<div class="inner">
	<h1><a href=""><img src="<%= request.getContextPath() %>/resources/images/logo.png"></a></h1>
	<div class="innerMenu">
	<span class="util">
			<!--로그인 전-->
		<a href="">로그인</a>
		<a href="">회원가입</a>
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
								<li><a href="">봉사관리</a></li>
								<li><a href="">후원관리</a></li>
							</ul>
						</div></li>
					<li class=""><a href="">고객사항</a>
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