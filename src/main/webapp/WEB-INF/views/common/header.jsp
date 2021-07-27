<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header_member</title>
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.2.4.min.js"></script>
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
	<h1><a onclick="location.href ='<%=request.getContextPath()%>/index.jsp'" style="cursor:pointer;"><img src="<%= request.getContextPath() %>/resources/images/logo.png"></a></h1>
	<div class="innerMenu">
	
		<span class="util">
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
					<li class=""><a onclick="location.href ='<%=request.getContextPath()%>/about.ab'" style="cursor:pointer;">YELLOW BRIDGE</a>

						<div class="sub" style="display: none;">
							<ul class="inner">
							</ul>
						</div></li>
					<li class=""><a href="">입양</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
								<!-- <li><a href="adopProcess.ado">입양절차</a></li> -->
								<li><a href="admin_adoption.ado">입양절차</a></li> <!-- 관리자 화면 확인위해 잠시 설정 -->
								<li><a href="adopNotice.ado">입양공고</a></li>
								<li><a href="adopInfo.ado">입양신청조회</a></li>
								<li><a href="adopRecode.ado">입양일지</a></li>
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
					<li class="servicecenter"><a href="notice.sc">고객사항</a>
						<div class="sub" style="display: none;">
							<ul class="inner">
								<li><a href="notice.sc">공지사항</a></li>
								<li><a href="qna.sc">Q&A</a></li>
								<li><a href="faq.sc">FAQ</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
		</div>
</header>
<!--// 헤더 끝  -->

</body>
</html>