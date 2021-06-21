<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources//css/common.css">
<link rel="stylesheet" href=".<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/canalytics.js"></script>
<title>Main Contents</title>
</head>
<body>
<section id="gotoMainContents" class="mainCont" tabindex="0">
	<article class="mainBox01">
		<div class="rollingBox">
			<ul class="rollingList">
    				
				<li class="on" style="background:#f2ffca; position:right;" >
				<!-- #f2ffca -->
				    <a href="">
				        <img src="<%= request.getContextPath() %>/resources/images/mainImg.png" style="height: 380px;">
				    </a>
				</li>
			</ul>
        </div>
    </article>
    
    
    <!--::입양동물::-->
    <section class="best_services section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>입양동물</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_1.png" alt="">
                         <h3> <a href="#"> 일련번호 : 455-35839</a></h3>
                        <p>구조일 2021-06-10</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_2.png" alt="">
                        <h3> <a href="#"> 일련번호 : 455-35839</a></h3>
                        <p>구조일 2021-06-10</p>                    
                        </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_3.png" alt="">
                        <h3> <a href="#"> 일련번호 : 455-35839</a></h3>
                        <p>구조일 2021-06-10</p>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_4.png" alt="">
                        <h3> <a href="#"> 일련번호 : 455-35839</a></h3>
                        <p>구조일 2021-06-10</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::입양동물 끝::-->
    
    
    
     <!--::봉사::-->
    <section class="best_services section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>봉사</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_1.png" alt="">
                         <h3> <a href="#">대구 반야월 쉼터</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_2.png" alt="">
                        <h3> <a href="#">경남 창녕 쉼터</a></h3>
                        </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_3.png" alt="">
                        <h3> <a href="#">경산 아이들 보호소</a></h3>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_ihotel_list">
                        <img src="<%= request.getContextPath() %>/resources/images/services_4.png" alt="">
                        <h3> <a href="#">양산 사랑이네 집</a></h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--::봉사 끝::-->
    
    
	<article class="mainBox03">	
        <div class="mainEvent">

            <ul class="evtNav">
                <li class="on"><a href="javascript:void(0)"></a></li>
            </ul>
            <div class="evt1">
                <ul style="left: 0px;">                
                    <li>
                        <a href="">
                            <img src="<%= request.getContextPath() %>/resources/images/1609724181537.jpg" alt="" width="485" height="200">
                        </a>
                    </li>                    
                <li>
                        <a href="">
                            <img src="<%= request.getContextPath() %>/resources/images/1609724181537.jpg" alt="" width="485" height="200">
                        </a>
                    </li></ul>
            </div>                
	        <div class="evt2">
	            <ul>
	                <li>
	                    <a href="">
	                        <img src="<%= request.getContextPath() %>/resources/images/1609724683629.jpg" alt="">
	                    </a>
	                </li>
	                <li>
                        <a href="">
                            <img src="<%= request.getContextPath() %>/resources/images/default_evt2_banner2.jpg" alt="기본이벤트2" width="225" height="200">
                        </a>
                    
	                </li>
	            </ul>
	        </div>
        </div>
			

		<div class="boardBox">
			<div><strong>입양일지</strong></div>
			<ul>
				<li><a href="">승승이 근황입니다~~</a><span>2021.06.11</span></li>
				<li><a href="">171109, 210501에 입양한 둥이와 까미 입양후..</a><span>2021.06.10</span></li>
				<li><a href="">담비 근황입니다!</a><span>2021.06.08</span></li>
				<li><a href="">이제 완전 새 식구가 된 곰이에요!!</a><span>2021.05.25</span></li>
				<li><a href="">꼬맹이 순희♡</a><span>2021.05.21</span></li>
			</ul>
			<a href="" class="more" aria-label="">더보기</a>
		</div>

		<div class="boardBox">
			<div><strong>공지사항</strong></div>
			<ul>
                <li><a href="">반려동물 어울림 한마당</a><span>2020.12.01</span></li>
                <li><a href="">금천구 유기동물입양 지원안내</a><span>2020.11.04</span></li>
                <li><a href="">함께할 가족을 모집합니다.</a><span>2020.11.02</span></li>
                <li><a href="">단아안 한의원에서 따뜻한 음악제를 통해 기부금을 전달 해주셨어요</a><span>2020.10.16</span></li>
                <li><a href="">동물등록제 안내</a><span>2020.10.12</span></li>
			</ul>
			<a href="" class="more" aria-label="">더보기</a>
		</div>
	</article>
</section>

</body>
</html>