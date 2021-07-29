<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YELLOW BRIDGE</title>
</head>
<body>
	<c:if test="${loginUser.id.equals('admin')}">
      <c:import url="../admin/header.jsp"/>
   </c:if>
   
   <c:if test="${!loginUser.id.equals('admin') || empty loginUser}">
      <c:import url="../common/header.jsp"/>
   </c:if>
   	
   <div class="full" style="border:1px solib black;">
   			<div id="myADiaryList" style="width:1200px; height:380px; ">
				<h2  style="font-weight:bolder;">사용자 관리</h2> <br>
				
						
						<c:if test=  "${ empty memberlist }">
							<div class="display"  style="width:1200px; height: 300px;  background-color: #fafafa;  position:relative">	
								<img src="<%= request.getContextPath() %>/resources/images/notList.PNG" style="height: 110px; width: 110px; 
								                                       position:absolute; top:50%; left:50%; margin-left:-97px; margin-top:-80px;">
		
								<br><br> <h4 style="position:absolute; top:50%; left:45%; margin-left:-97px; margin-top:30px;">등록된 회원이 없습니다.</h4>	
							</div>
						</c:if>
						
						<c:if test=  "${ !empty memberlist }">
							<table class="display"  style="width:1200px; height: 300px;">
								<tr>
									<th style="width:155px; background-color: #fafafa; border-left:1px solid white;">번호</th>
									<th style="width:400px; background-color: #fafafa">아이디</th>
									<th style="width:200px; background-color: #fafafa">이름</th>
									<th style="width:180px; background-color: #fafafa">닉네임</th>									
									<th style="width:260px; background-color: #fafafa; border-right:1px solid white;">가입일</th>
								</tr>
							
							
							
							<c:forEach var="memberlist" items="${ memberlist }">
							
								<tr>
									<td style="border-left:1px solid white;">	
										<span >${memberlist.no }</span>
									</td>
									<td >		 	
										<a href="adoptionRecodeDetail.ado?adopId= ${alist.adopId}&page=${pi.currentPage}"> ${ memberlist.id}</a>
									</td>
									<td>
										<span> ${memberlist.name }</span>
									</td>
									<td>		 	
										<span> ${memberlist.nickname}</span>
									</td>
									<td style="border-right:1px solid white;">
										<span> ${memberlist.date} </span>
									</td>				
								</tr>
								
							</c:forEach>
							
							
								<!-- 페이징 처리 -->
									<tr align="center" height="20" id="buttonTab">
										<td colspan="6">
										
											<!-- [이전] -->
											<c:if test="${ pi.currentPage <= 1 }">
												[이전] &nbsp;
											</c:if>
											<c:if test="${ pi.currentPage > 1 }">
												<c:url var="before" value="memberListForm.me">
													<c:param name="page" value="${ pi.currentPage - 1 }"/>
												</c:url>
												<a href="${ before }">[이전]</a> &nbsp;
											</c:if>
											
											<!-- 페이지 -->
											<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
												<c:if test="${ p eq pi.currentPage }">
													<font color="red" size="4"><b>[${ p }]</b></font>
												</c:if>
												
												<c:if test="${ p ne pi.currentPage }">
													<c:url var="pagination" value="memberListForm.me">
														<c:param name="page" value="${ p }"/>
													</c:url>
													<a href="${ pagination }">${ p }</a> &nbsp;
												</c:if>
											</c:forEach>
											
											<!-- [다음] -->
											<c:if test="${ pi.currentPage >= pi.maxPage }">
												[다음]
											</c:if>
											<c:if test="${ pi.currentPage < pi.maxPage }">
												<c:url var="after" value="memberListForm.me">
													<c:param name="page" value="${ pi.currentPage + 1 }"/>
												</c:url> 
												<a href="${ after }">[다음]</a>
											</c:if>
										</td>
									</tr>
							</tbody>
						</table>
					</c:if>
   		</div>
   </div>
   
   <c:if test="${!loginUser.id.equals('admin') || empty loginUser}">
      <c:import url="../common/header.jsp"/>
   </c:if>
   
   
   
   
   <c:import url="../common/footer.jsp"/>
</body>
</html>