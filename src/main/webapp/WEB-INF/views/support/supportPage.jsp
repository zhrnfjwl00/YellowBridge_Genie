<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	.carousel-inner img {
     	width:500px;
        height:500px;
	}
	.serviceinfo {
		width: 65%;
		margin: 0px auto;
	}
	.serviceinfotext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	.serviceinfo1 {
		padding-top: 50px;
		margin: 0px auto;
		display: table;
	}
	.serviceinfo1 .infotext {
		font-size: 20px;
		padding-right: 35px;
		color: gray;
		vertical-align: middle;
		width: 500px;
		letter-spacing: -1px;
		display: table-cell;
	}
	
	.serviceinfo2 {
		margin-top: 30px;
		margin-bottom: 150px;
		width: 100%;
		background: rgb(233, 247, 172);
		height: 80px;
	}
	
	.serviceinfo2 h2{
		text-align: right;
	}
	
	#supportgo{
		font-weight: bold;
		margin-top: 9px;
		margin-left: 23%;
		letter-spacing: -1px;
		background: rgb(189, 204, 148);
        border: 1px solid white;
        color: white;
        cursor: pointer;
        padding: 8px 8px;
        border-radius: 5px;
        font-size: 0.9375em;
	}
</style>
</head>
<body>
	
<div class="serviceinfo">
	<c:import url="../common/header.jsp"/>
	
	<div style="text-align:center;" class="serviceinfotext">
		<h1 style="color:#BDCC94;"><b>Yellow Bridge와 함께 해주세요 !</b></h1>
	</div>
	
	<div class="serviceinfo1">
		<div class="infotext">
			<b>애니멀 호더, 개농장, 번식장 등</b><br><br>
			
			음지에서 고통받고 있는 <br>
			
			아이들이 너무나 많습니다<br><br><br>
			
			유기동물의 책임은 결국 인간에게 있기에<br>

			우리는 그 책임을 나누려 합니다<br>

			소중한 후원금은 고통받고 외면 받는 유기동물을 위해 사용됩니다.<br>
		</div>
		<div class="container mt-3">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ul>
            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<%=request.getContextPath()%>/resources/images/supportPage.jpg">
                </div>
                <div class="carousel-item">
                	<img src="<%=request.getContextPath()%>/resources/images/supportPage2.jpg">
                </div>
                <div class="carousel-item">
                    <img src="<%=request.getContextPath()%>/resources/images/supportPage3.jpg">
                </div>
            </div>
            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#myCarousel" data-slide="next"> 
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    	</div>
	</div>
	
	<div class="serviceinfo2">
		<h2 style="padding: 18px; color:black;"><a href='supportPayView.sup'> 후원하기→ &nbsp;&nbsp;&nbsp;</a></h2>
	</div>
	
	<c:import url="../common/footer.jsp"/>
</div>
	
</body>
</html>