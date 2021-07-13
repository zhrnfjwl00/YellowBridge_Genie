<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>입양공고</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
</head>
<body>
	<c:import url="../common/header.jsp" />

	<div class="wrap_sub">
		<div class="rescue">
			<div class="menu_name">

				<h2>입양공고</h2> <button onclick="location.href='animalNoticeWriterForm.ado'">공고등록</button>
				<hr>
			</div>
				<c:forEach var="animal" items="${ animallist }">
			<div class="list">
				<form name="animalApply" action="animalApplyWriterForm.ado" method="post" enctype="multipart/form-data">
				<%-- <c:foreach items="${list}" var="list" varstatus="status"> --%>
						<!-- <input type="hidden" name="animalNo" value="">  -->
						<input type="hidden" name="animalType" value="${ animal.animalType }"> 
						<input type="hidden" name="animalAge" value=""> 
						<input type="hidden" name="animalColor" value=""> 
						<input type="hidden" name="animalTnr" value=""> 
						<input type="hidden" name="animalCharacter" value=""> 
						<input type="hidden" name="animalWeight" value="">
						<input type="hidden" name="animalCondition" value="">
						<input type="hidden" name="animalFeature" value="">
						<input type="hidden" name="rescueLocation" value="${ animal.rescueLocation }">
						<input type="hidden" name="rescueDate" value="${ animal.rescueDate }">
						<input type="hidden" name="animalWeight" value="">
						<input type="hidden" name="animalBoardNo" value="">
						<input type="hidden" name="animalStatus" value=""> 
					<img src="<%=request.getContextPath()%>/resources/auploadFiles/${ animal.animalFile }"  width="348" height="261" border="0/">
					<ul>
						<li class="full"><strong>No.</strong>${ animal.animalNo }</li>
						<li class="full"><strong>구조일</strong> <i>
								${ animal.rescueDate }
						</i></li>
						<li class="full"><strong>구조장소</strong></li>
						<li class="full">${ animal.rescueLocation }</li>
						<li class="half"><strong>축종</strong> ${ animal.animalType }</li>
						<li class="half"><strong>성별</strong> ${ animal.animalGender }</li>
						<li class="half"><strong>연령</strong> ${ animal.animalAge }살</li>
						<li class="half"><strong>모색</strong> ${ animal.animalColor }</li>
						<li class="half"><strong>중성화수술</strong> ${ animal.animalTnr }</li>
						<li class="half"><strong>성격</strong> ${ animal.animalCharacter }</li>
						<li class="half"><strong>체중</strong> ${ animal.animalWeight }kg</li>
						<li class="half"><strong>건강상태</strong> ${ animal.animalCondition }</li>
						<li class="full"><strong>특징</strong></li>
						<li class="full"><span>
								${ animal.animalFeature }
						</span></li>
					</ul>
					<button type="submit">입양신청</button>
				</form>
			</div>
					</c:forEach>
			<!--E:list-->

			<!-- 페이지 -->
			<div id="pagingNav" class="pagenation">
									<c:if test="${ pi.currentPage <= 1 }">
										<a href="${ before }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_prev.png" alt="이전 목록 보기"></a> 
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="adopNotice.ado">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_prev.png" alt="이전 목록 보기"></a> 
									</c:if>
									
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
										<span class="select">${ p }</span> 
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="adopNotice.ado">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a>
										</c:if>
									</c:forEach>
									
									
									<!-- [다음] -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<a href="${ after }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_nxt.png" alt="다음 목록 보기"></a>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="adopNotice.ado">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_nxt.png" alt="다음 목록 보기"></a>
									</c:if>
									
									
									<%-- 
				<span class="select">1</span> 
				<a href="">2</a>
				<a href="">3</a> 
				<a href="">4</a> 
				<a href="">5</a> 
				<a href="${ after }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_nxt.png" alt="다음 목록 보기"></a> --%>
			</div>
			<!-- 페이지  끝 -->

			<!--입양공고 리스트 끝-->
		</div>
		<!--E:rescue-->
	</div>
	<!--E:sub_wrap-->
	<c:import url="../common/footer.jsp" />
</body>
</html>