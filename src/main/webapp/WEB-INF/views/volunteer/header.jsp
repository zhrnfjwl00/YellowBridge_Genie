<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header_member</title>
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources/css/common.css?ver=1">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css?ver=1">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/common.js?ver=1"></script>

<style>
   #info{border:none; margin-left: 10px; background-color: hsla(120, 100%, 50%, 0);}
   #managerPage{border:none; margin-left: 10px; background-color: hsla(120, 100%, 50%, 0);}


   #logout{border: none; background-color: hsla(120, 100%, 50%, 0);}
   
   #header_total_area{background-color: white;   opacity:0.9; height:120px;}
   
   #image a{ text-align:center;}
   
   #header_total_area{height: 100px; }
   
   
   
   
</style>

</head>
<body>
<!-- 헤더 시작 -->
<header class="gnbFixed main" id="header_total_area" >
<div class="inner" id="inner" >
   <h1 id="image" ><a onclick="location.href ='<%=request.getContextPath()%>/index.jsp'" style="cursor:pointer;"><img src="<%= request.getContextPath() %>/resources/images/logo.png" ></a></h1>
   <div class="innerMenu" id="innerMenu">
   
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
            <ul id="menuBody" class="nav7nd" >
               <li class=""><a onclick="location.href ='<%=request.getContextPath()%>/about.ab'" style="cursor:pointer;">YELLOW BRIDGE</a>

                  <div class="sub" style="display: none;">
                     <ul class="inner">
                     </ul>
                  </div></li>
               <li class="adoption"><a href="adopProcess.ado">입양</a>
                  <div class="sub" style="display: none;">
                     <ul class="inner">
                        <li><a href="adopProcess.ado">입양절차</a></li>
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
                     
                        <c:if test="${!loginUser.id.equals('admin')}">
                           <li><a href="supportPage.sup">후원하기</a></li>
                        </c:if>
                        
                        <c:if test="${!loginUser.id.equals('admin') && !empty loginUser}">
                           <c:url var="piResult" value="paymentList.sup">
                              <c:param name="memNo" value="${loginUser.no}"/>
                           </c:url>
                           <li><a href="${piResult}">후원내역조회</a></li>
                        </c:if>
                  
                        <c:if test="${empty loginUser}">
                           <li><a href="noMemPayDetail.sup">후원내역조회</a></li>
                        </c:if>
                        
                        <li><a href="sList.sup">후원금사용내역조회</a></li>
                     </ul>
                  </div></li>
               <li class=""><a href="freeboard.fr">커뮤니티</a>
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