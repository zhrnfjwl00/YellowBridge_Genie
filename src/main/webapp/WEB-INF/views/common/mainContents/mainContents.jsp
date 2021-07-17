<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources//css/common.css">
<link rel="stylesheet" href=".<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/canalytics.js"></script>
<title>YELLOW BRIDGE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

	
	
	.area{margin: 0 auto;}
	
	#aArea{ width: 270px; height: 450px;}
	#aImage{ width:250px; height:250px; margin: 0 auto;} 
	#aContent{ width:200px; height:100px; margin: 0 auto;}
	#aList li{font-weight: border; font-size:20px;}
	
	
	#sArea{width: 250px; height: 450px;  }
	#sImage{ width:250px; height:250px; margin: 0 auto;} 
	#sContent{ width:200px; height:100px; margin: 0 auto;}
	#sList li{font-weight: border; font-size:25px; text-align: center; }

</style>
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
                <!-- 제목 div -->
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2 onclick="GoAnimalNoticeWriterForm();" style="cursor:pointer">입양동물</h2>
                    </div>
                </div>
            </div>
            
            <!-- 입양동물 정보 -->
            <div class="row" id="animalArea">      
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
                        <h2 onclick="GoVolAdminAdList();" style="cursor:pointer">봉사</h2>
                    </div>
                </div>
            </div>
            
            <!-- 봉사 정보 -->
            <div class="row" id="serviceArea">
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
<script>
/* --------- 입양공고 ---------------------*/
   
   
    		$.ajax({
    			url: 'animalList.ado',
    			dataType: 'json',
    			success: function(data){
    				console.log(data);
    			
    				var $row = $('#animalArea')
    				
    			 
    			 	 for(var i in data){
    					$row.append(
    							'<div id="aArea" class="area">' +
	    							'<div class="single_ihotel_list" id="aImage" onclick="GoAnimalNoticeWriterForm();" style="cursor:pointer">' +
	    							'<img src="<%= request.getContextPath() %>/resources/auploadFiles/'+data[i].animalFile+'" style="width:250px; height:250px;">' +
	    							'</div>' + 
	    							'<br>' +
	    							' <div id="aContent" onclick="GoAnimalNoticeWriterForm();" style="cursor:pointer">'+
	    								'<ul id="aList">' +
	    								   '<li>'+ "종분류 : "+ data[i].animalType +'</li>' +
	    								   '<li>'+ "구조일 : " +data[i].rescueDate +'</li>' +
	    								 '</ul>' +  
	    							'</div>'+
	    						'</div>'
    							); 
    				}
    			}
    		});
    	
    	function GoAnimalNoticeWriterForm(){
    		$(this).on('click', function(){
    			console.log("클릭됨");
    			location.href='adopNotice.ado';
    		});
    	}
    	
    

	
/*------------- 봉사 ---------------------*/

		$.ajax({
			url: 'serviceList.vol',
			dataType: 'json',
			success: function(data){
				console.log(data);
				
				var $row = $('#serviceArea')
				
			
				for(var i in data){
							$row.append(
	    							'<div id="sArea" class="area">' +
		    							'<div class="single_ihotel_list" id="sImage" onclick="GoVolAdminAdList();" style="cursor:pointer">' +
		    							'<img src="<%= request.getContextPath() %>/resources/images/'+data[i].changeName+'"  style="width:250px; height:250px;">' +
		    							'</div>' +
		    							'<br>' +
		    							' <div id="sContent"  onclick="GoVolAdminAdList();" style="cursor:pointer">'+
		    								'<ul id="sList">' +
		    							    '<li>'+ data[i].shelterName +'</li>' +
		    								'</ul>' +  
		    							'</div>'+
		    						'</div>'
	    							);
				}
			}
		});
	
	function GoVolAdminAdList(){
		$(this).on('click', function(){
			console.log("클릭됨");
			location.href='serviceapply.vol';
		});
	}
    
</script>


</body>
</html>