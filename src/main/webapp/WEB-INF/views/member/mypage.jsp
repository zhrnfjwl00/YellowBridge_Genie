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

	.area2{
		width:1200px;
		height: 2300px;
		margin: 0 auto;
		
	}
	.myInfoArea {
	 height: 100px;
	
	}
	
	.main33{
	width:1200px; 
	height: 150px; 
	background-color: rgb(246, 255, 222);
	padding: 40px;
	}
	
	.main33 button{
	 width:100px;
	 height: 40px; 
	 font-size:20px;  
	 background-color:rgb(246, 255, 222); 

	 }
	 
	
	#button4{
		width: 100px;
		height: 45px;
		background-color: white;
		font-size:20px;
		
	}
	
	
	
	#myInfoTable{
	
	height: 150px;
	font-size: 20px;
	border: 1px solid #fafafa;
	
	}
	
	#myInfoTable tr{
	border: 1px solid #fafafa;
	border-top-color:  black;
	

	
	}
	
	#myInfoTable th{
	border: 1px solid #fafafa;
	border-top-color:  black;
	
	}
	
	
	.display{
		border: 1px solid  #fafafa;
		font-size: 20px;
		width: 700px;
	}
	
	.display th{
	border: 1px solid  #fafafa;
	border-top-color:  black;
	}
	
	.display tr{
	border: 1px solid  #fafafa;
	}
	
	.display td{
	border: 1px solid  #fafafa;
	}

	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="area">
	</div>

	<div class="area2">
		<div class="myInfoArea">
			<h1 style="font-weight: bolder; font-size:50px; "> 마이페이지 </h1>
			
			
			<br><br>
			
			<div class="main33">
				<span id="user" style="font-size:25px;"><strong style="font-size:40px;">${ loginUser.nickname }</strong>님 환영합니다.</span> &nbsp; &nbsp; &nbsp;
				
				<!-- 회원정보 -->
				<span><button type="button" onclick="location.href='mupdateView.me'" id="button2">회원정보</button></span>
				
				<!-- 회원탈퇴 -->
				<c:url var="mdelete" value="mdelete.me">
					<c:param name="id" value="${ loginUser.id }"/>
				</c:url>
				<span><button type="button" onclick="location.href='mdeleteView.me'" id="button3">회원탈퇴</button></span>
			</div>
			
			<br><br>
			
			<div class="myInfo">
				<span style="font-weight:bolder; font-size:30px;" >내 정보
					<span style="width:980px; display:inline-block;"></span>
					<button type="button" onclick="location.href='mupdateView.me'" id="button4">더보기</button>
				</span>  
				<br><br>
				<table id="myInfoTable"> 
					<tr>
						<th style="border-left:1px solid white; background-color: #fafafa">&nbsp;이름</th>
						<td colspan="2">&nbsp;${loginUser.name}</td>
						<th style="background-color: #fafafa">&nbsp;전화번호</th>
						<td colspan="2" style="border-right:1px solid white;">&nbsp;${loginUser.phone }</td>
					</tr>
					
					<tr>
						<th style="border-left:1px solid white; background-color: #fafafa">&nbsp;주소</th>
						<td colspan="5" style="border-right:1px solid white;">&nbsp;${loginUser.address }</td>
					<tr>
				</table>
			</div>
			<br>
			<div style="width:100%; height: 100px; "></div>
			
			
			<!-- 입양일지 -->
			<div id="myADiaryList" style="width:1200px; height:380px; ">
				<h2  style="font-weight:bolder;">입양일지</h2> <br>
				
						
						<c:if test=  "${ empty alist }">
							<div class="display"  style="width:1200px; height: 300px;  background-color: #fafafa;  position:relative">	
								<img src="<%= request.getContextPath() %>/resources/images/notList.PNG" style="height: 110px; width: 110px; 
								                                       position:absolute; top:50%; left:50%; margin-left:-97px; margin-top:-80px;">
		
								<br><br> <h4 style="position:absolute; top:50%; left:45%; margin-left:-97px; margin-top:30px;">작성된 게시물이 없습니다.</h4>	
							</div>
						</c:if>
						
						<c:if test=  "${ !empty alist }">
							<table class="display"  style="width:1200px; height: 300px;">
								<tr>
									<th style="width:155px; background-color: #fafafa; border-left:1px solid white;">번호</th>
									<th style="width:400px; background-color: #fafafa">제목</th>
									<th style="width:200px; background-color: #fafafa"> 작성자</th>
									<th style="width:180px; background-color: #fafafa">조회수</th>
									<th style="width:260px; background-color: #fafafa; border-right:1px solid white;">등록일</th>
								</tr>
							
							
							
							<c:forEach var="alist" items="${ alist }">
							
								<tr>
									<td style="border-left:1px solid white;">	
										<span >${alist.adopId }</span>
									</td>
									<td >		 	
										<a href="adoptionRecodeDetail.ado?adopId= ${alist.adopId}&page=${pi.currentPage}"> ${ alist.adopTitle}</a>
									</td>
									<td>
										<span> ${alist.adopWriter }</span>
									</td>
									<td>		 	
										<span> ${alist. adopView}</span>
									</td>
									<td style="border-right:1px solid white;">
										<span> ${alist.adopModifyDate} </span>
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
												<c:url var="before" value="myinfo.me">
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
													<c:url var="pagination" value="myinfo.me">
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
												<c:url var="after" value="myinfo.me">
													<c:param name="page" value="${ pi.currentPage + 1 }"/>
												</c:url> 
												<a href="${ after }">[다음]</a>
											</c:if>
										</td>
									</tr>
							</tbody>
						</table>
					</c:if>
			<br><br>
			
			<!-- 봉사후기 -->
			<div id="myServiceList"  style="width:1200px; height:380px;">
				<h2  style="font-weight:bolder;">봉사후기</h2> <br>
				
						
						<c:if test=  "${ empty slist }">
							<div class="display"  style="width:1200px; height: 300px;  background-color: #fafafa;  position:relative">	
								<img src="<%= request.getContextPath() %>/resources/images/notList.PNG" style="height: 110px; width: 110px; 
								                                       position:absolute; top:50%; left:50%; margin-left:-97px; margin-top:-80px;">
		
								<br><br> <h4 style="position:absolute; top:50%; left:45%; margin-left:-97px; margin-top:30px;">작성된 게시물이 없습니다.</h4>	
							</div>
						</c:if>
						
							
						<c:if test=  "${ !empty slist }">	
							<table class="display" style="width:1200px; height: 300px;" >
								<tr>
									<th style="width:155px; background-color: #fafafa; border-left:1px solid white;">번호</th>
									<th style="width:400px; background-color: #fafafa">제목</th>
									<th style="width:200px; background-color: #fafafa"> 작성자</th>
									<th style="width:180px; background-color: #fafafa">조회수</th>
									<th style="width:260px; background-color: #fafafa; border-right:1px solid white;">등록일</th>
								</tr>
							
						
							
							<c:forEach var="slist" items="${ slist }">
							
								<tr>
									<td>	
										<span>${slist.volId }</span>
									</td>
									<td>		 	
										<a href="ReviewDetail.vol?volId= ${slist.volId}&page=${spi.currentPage}"> ${ slist.volTitle}</a>
									</td>
									<td>
										<span>${slist.volWriter }</span>
									</td>
									<td>		 	
										<span> ${slist.volCount}</span>
									</td>
									<td>
										<span> ${slist.volModifyDate} </span>
									</td>				
								</tr>
								
							</c:forEach>
							
							
								<!-- 페이징 처리 -->
									<tr align="center" height="20" id="buttonTab">
										<td colspan="6">
										
											<!-- [이전] -->
											<c:if test="${ spi.currentPage <= 1 }">
												[이전] &nbsp;
											</c:if>
											<c:if test="${ spi.currentPage > 1 }">
												<c:url var="before" value="myinfo.me">
													<c:param name="page" value="${ spi.currentPage - 1 }"/>
												</c:url>
												<a href="${ before }">[이전]</a> &nbsp;
											</c:if>
											
											<!-- 페이지 -->
											<c:forEach var="p" begin="${ spi.startPage }" end="${ spi.endPage }">
												<c:if test="${ p eq spi.currentPage }">
													<font color="red" size="4"><b>[${ p }]</b></font>
												</c:if>
												
												<c:if test="${ p ne pi.currentPage }">
													<c:url var="pagination" value="myinfo.me">
														<c:param name="page" value="${ p }"/>
													</c:url>
													<a href="${ pagination }">${ p }</a> &nbsp;
												</c:if>
											</c:forEach>
											
											<!-- [다음] -->
											<c:if test="${ spi.currentPage >= spi.maxPage }">
												[다음]
											</c:if>
											<c:if test="${ spi.currentPage < spi.maxPage }">
												<c:url var="after" value="myinfo.me">
													<c:param name="page" value="${ spi.currentPage + 1 }"/>
												</c:url> 
												<a href="${ after }">[다음]</a>
											</c:if>
										</td>
									</tr>
							</tbody>
						</table>
					</c:if>
				
			</div>
			
			<br><br>
			
			<!-- 1:1 문의사항 -->
			<div id="myBoardList">
				<h2  style="font-weight:bolder;">1:1 문의사항</h2>
					
						<c:if test=  "${ empty nlist }">
							<div class="display"  style="width:1200px; height: 300px;  background-color: #fafafa;  position:relative">	
								<img src="<%= request.getContextPath() %>/resources/images/notList.PNG" style="height: 110px; width: 110px; 
								                                       position:absolute; top:50%; left:50%; margin-left:-97px; margin-top:-80px;">
		
								<br><br> <h4 style="position:absolute; top:50%; left:45%; margin-left:-97px; margin-top:30px;">작성된 게시물이 없습니다.</h4>	
							</div>
						</c:if>
						
							
						<c:if test=  "${ !empty nlist }">	
							<table class="display" style="width:1200px; height: 300px;" >
								<tr>
									<th style="width:155px; background-color: #fafafa; border-left:1px solid white;">번호</th>
									<th style="width:400px; background-color: #fafafa">제목</th>
									<th style="width:200px; background-color: #fafafa"> 작성자</th>
									<th style="width:180px; background-color: #fafafa">조회수</th>
									<th style="width:260px; background-color: #fafafa; border-right:1px solid white;">등록일</th>
								</tr>
							
						
							
							<c:forEach var="nlist" items="${ nlist }">
							
								<tr>
									<td>	
										<span>${nlist.qId }</span>
									</td>
									<td>		 	
										<a href="qnadetail.sc?qId= ${nlist.qId}&page=${npi.currentPage}"> ${ nlist.qTitle}</a>
									</td>
									<td>
										<span>${nlist.qWriter }</span>
									</td>
									<td>		 	
										<span> ${nlist.qCount}</span>
									</td>
									<td>
										<span> ${nlist.qModifyDate} </span>
									</td>				
								</tr>
								
							</c:forEach>
							
							
								<!-- 페이징 처리 -->
									<tr align="center" height="20" id="buttonTab">
										<td colspan="6">
										
											<!-- [이전] -->
											<c:if test="${ npi.currentPage <= 1 }">
												[이전] &nbsp;
											</c:if>
											<c:if test="${ npi.currentPage > 1 }">
												<c:url var="before" value="myinfo.me">
													<c:param name="page" value="${ npi.currentPage - 1 }"/>
												</c:url>
												<a href="${ before }">[이전]</a> &nbsp;
											</c:if>
											
											<!-- 페이지 -->
											<c:forEach var="p" begin="${ npi.startPage }" end="${ npi.endPage }">
												<c:if test="${ p eq npi.currentPage }">
													<font color="red" size="4"><b>[${ p }]</b></font>
												</c:if>
												
												<c:if test="${ p ne npi.currentPage }">
													<c:url var="pagination" value="myinfo.me">
														<c:param name="page" value="${ p }"/>
													</c:url>
													<a href="${ pagination }">${ p }</a> &nbsp;
												</c:if>
											</c:forEach>
											
											<!-- [다음] -->
											<c:if test="${ npi.currentPage >= npi.maxPage }">
												[다음]
											</c:if>
											<c:if test="${ npi.currentPage < npi.maxPage }">
												<c:url var="after" value="myinfo.me">
													<c:param name="page" value="${ npi.currentPage + 1 }"/>
												</c:url> 
												<a href="${ after }">[다음]</a>
											</c:if>
										</td>
									</tr>
							</tbody>
						</table>
					</c:if>
					
				<br><br>
				
				<!-- 자유게시판 -->	
				<div id="freeBoardList">
				<h2  style="font-weight:bolder;">자유게시판</h2>
					
						<c:if test=  "${ empty flist }">
							<div class="display"  style="width:1200px; height: 300px;  background-color: #fafafa;  position:relative">	
								<img src="<%= request.getContextPath() %>/resources/images/notList.PNG" style="height: 110px; width: 110px; 
								                                       position:absolute; top:50%; left:50%; margin-left:-97px; margin-top:-80px;">
		
								<br><br> <h4 style="position:absolute; top:50%; left:45%; margin-left:-97px; margin-top:30px;">작성된 게시물이 없습니다.</h4>	
							</div>
						</c:if>
						
							
						<c:if test=  "${ !empty flist }">	
							<table class="display" style="width:1200px; height: 300px;" >
								<tr>
									<th style="width:155px; background-color: #fafafa; border-left:1px solid white;">번호</th>
									<th style="width:400px; background-color: #fafafa">제목</th>
									<th style="width:200px; background-color: #fafafa"> 작성자</th>
									<th style="width:180px; background-color: #fafafa">조회수</th>
									<th style="width:260px; background-color: #fafafa; border-right:1px solid white;">등록일</th>
								</tr>
							
						
							
							<c:forEach var="flist" items="${ flist }">
							
								<tr>
									<td>	
										<span>${flist.qId }</span>
									</td>
									<td>		 	
										<a href="qnadetail.sc?qId= ${flist.qId}&page=${fpi.currentPage}"> ${ flist.qTitle}</a>
									</td>
									<td>
										<span>${flist.qWriter }</span>
									</td>
									<td>		 	
										<span> ${flist.qCount}</span>
									</td>
									<td>
										<span> ${flist.qModifyDate} </span>
									</td>				
								</tr>
								
							</c:forEach>
							
							
								<!-- 페이징 처리 -->
									<tr align="center" height="20" id="buttonTab">
										<td colspan="6">
										
											<!-- [이전] -->
											<c:if test="${ fpi.currentPage <= 1 }">
												[이전] &nbsp;
											</c:if>
											<c:if test="${ fpi.currentPage > 1 }">
												<c:url var="before" value="myinfo.me">
													<c:param name="page" value="${ fpi.currentPage - 1 }"/>
												</c:url>
												<a href="${ before }">[이전]</a> &nbsp;
											</c:if>
											
											<!-- 페이지 -->
											<c:forEach var="p" begin="${ fpi.startPage }" end="${ fpi.endPage }">
												<c:if test="${ p eq fpi.currentPage }">
													<font color="red" size="4"><b>[${ p }]</b></font>
												</c:if>
												
												<c:if test="${ p ne fpi.currentPage }">
													<c:url var="pagination" value="myinfo.me">
														<c:param name="page" value="${ p }"/>
													</c:url>
													<a href="${ pagination }">${ p }</a> &nbsp;
												</c:if>
											</c:forEach>
											
											<!-- [다음] -->
											<c:if test="${ fpi.currentPage >= fpi.maxPage }">
												[다음]
											</c:if>
											<c:if test="${ fpi.currentPage < fpi.maxPage }">
												<c:url var="after" value="myinfo.me">
													<c:param name="page" value="${ fpi.currentPage + 1 }"/>
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
	</div>
</div>
</div>
	 <c:import url="../common/footer.jsp"/> 

</body>
</html>





