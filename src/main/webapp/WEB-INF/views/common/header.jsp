<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header_member</title>
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href=".<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
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
					<li class=""><a href="t">YELLOW BRIDGE</a>

						<div class="sub" style="display: none;">
							<ul class="inner">
							</ul>
						</div></li>
					<li class=""><a href="">입양</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
								<li><a href="">입양절차</a></li>
								<li><a href="">입양공고</a></li>
								<li><a href="">입양신청조회</a></li>
								<li><a href="">입양일지</a></li>
							</ul>
						</div></li>
					<li class="volunteer"><a href="serviceInfo.vol">봉사</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
								<li><a href="serviceInfo.vol">봉사시작</a></li>
								<li><a href="serviceapply.vol">봉사신청</a></li>
								<li><a href="serviceApplyBoard.vol">봉사신청조회</a></li>
								<li><a href="serviceBoardList.vol">봉사게시판</a></li>
							</ul>
						</div></li>
					<li class="support"><a href="supportPage.sup">후원</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
								<li><a href="">후원하기</a></li>
								<li><a href="">후훤내역조회</a></li>
								<li><a href="sList.sup">후원금사용내역조회</a></li>
								<li><a href="">후원상품</a></li>
							</ul>
						</div></li>
					<li class=""><a href="">커뮤니티</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
							</ul>
						</div></li>
					<li class=""><a href="">고객사항</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
								<li><a href="">공지사항</a></li>
								<li><a href="">Q&A</a></li>
								<li><a href="">FAQ</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</div>
</header>
<!--// 헤더 끝  -->

</body>
</html>