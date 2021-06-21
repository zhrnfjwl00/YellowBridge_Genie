<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사 신청 메인</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	html{
		min-width: 1000px;
	}
	
	.serviceapply {
		width: 65%;
		margin: 0px auto;
	}
	
	.serviceapplytext{
		margin-top: 150px;
	}
	
	#service {
		width: 100%;
	}
	
	#service-list{
		align:center;
	}
	
	.shelter {
		display: inline-block;
		padding: 10px 10px 50px 10px;
		width: 30%;
		align: center;
	}
	
	.shelter img {
		width: 100%;
		height: 100%;
	}
	
	.shelter-img {
		border: 1px solid #9a9a9a;
		width: 100%;
		height: 200px;
	}
	
	#shelter-info {
		padding: 15px;
		text-align: center;
	}
	
	.shelter-price{
		margin-top: 10px;
	}
</style>
</head>
<body>

<div class="serviceapply">
	<c:import url="../common/header.jsp"/>
	
	<div style="text-align:center; padding-bottom:30px;" class="serviceapplytext">
		<h1 style="color:#BDCC94; letter-spacing: -1px;">봉사 신청</h1>
	</div>
	
	<div id="service">
		<div id="service-list" align="center">
			<div class="shelter">
				<input type="hidden" id="pNo" name="pNo" value="0">
				<div>
					<div class="shelter-img">
						<img src="<%=request.getContextPath()%>/resources/images/serviceinfo.jpg" >
					</div>
					<div id="shelter-info">
						<div class="shelter-name">보호소 이름</div>
						<div class="shelter-price">10,000원</div>
					</div>
				</div>
			</div>
			<div class="shelter">
				<input type="hidden" id="pNo" name="pNo" value="0">
				<div>
					<div class="shelter-img">
						<img src="<%=request.getContextPath()%>/resources/images/serviceinfo.jpg">
					</div>
					<div id="shelter-info">
						<div class="shelter-name">보호소 이름</div>
						<div class="shelter-price">10,000원</div>
					</div>
				</div>
			</div>
			<div class="shelter">
				<input type="hidden" id="pNo" name="pNo" value="0">
				<div>
					<div class="shelter-img">
						<img src="<%=request.getContextPath()%>/resources/images/serviceinfo.jpg">
					</div>
					<div id="shelter-info">
						<div class="shelter-name">보호소 이름</div>
						<div class="shelter-price">10,000원</div>
					</div>
				</div>
			</div>
			<div class="shelter">
				<input type="hidden" id="pNo" name="pNo" value="0">
				<div>
					<div class="shelter-img">
						<img src="<%=request.getContextPath()%>/resources/images/serviceinfo.jpg">
					</div>
					<div id="shelter-info">
						<div class="shelter-name">보호소 이름</div>
						<div class="shelter-price">10,000원</div>
					</div>
				</div>
			</div>
			<div class="shelter">
				<input type="hidden" id="pNo" name="pNo" value="0">
				<div>
					<div class="shelter-img">
						<img src="<%=request.getContextPath()%>/resources/images/serviceinfo.jpg">
					</div>
					<div id="shelter-info">
						<div class="shelter-name">보호소 이름</div>
						<div class="shelter-price">10,000원</div>
					</div>
				</div>
			</div>
			<div class="shelter">
				<input type="hidden" id="pNo" name="pNo" value="0">
				<div>
					<div class="shelter-img">
						<img src="<%=request.getContextPath()%>/resources/images/serviceinfo.jpg">
					</div>
					<div id="shelter-info">
						<div class="shelter-name">보호소 이름</div>
						<div class="shelter-price">10,000원</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</div>
</html>