<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="<%= request.getContextPath() %>/resources/css/common.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/common.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/resources/js/canalytics.js"></script>
<title>YELLOW BRIDGE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

	
	
	.area{margin: 0 auto;}
	
	#aArea{ width: 270px; height: 400px;}
	#aImage{ width:250px; height:250px; margin: 0 auto;} 
	#aImage :hover{ opacity:0.5;}
	#aContent{ width:200px; height:100px; margin: 0 auto;}
	#aList li{font-weight: border; font-size:20px;}

	
	
	#sArea{width: 250px; height: 450px;}
	#sImage{ width:250px; height:250px; margin: 0 auto;} 
	#sImage :hover{ opacity:0.5;}
	#sContent{ width:200px; height:100px; margin: 0 auto;}
	#sList li{font-weight: border; font-size:25px; text-align: center; }
	
	

	

</style>
</head>
<body>
<section id="gotoMainContents" class="mainCont" tabindex="0" >
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
    
    <br><br>
    
    <!--::입양동물::-->
    <section class="best_services section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <!-- 제목 div -->
                <div class="col-xl-6" >
                    <div class="section_tittle text-center" >
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
        <div class="container" style=" height: 450px;" >
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center" >
                        <h2 onclick="GoVolAdminAdList();" style="cursor:pointer" >봉사</h2>
                    </div>
                </div>
            </div>
            
            <!-- 봉사 정보 -->
            <div class="row" id="serviceArea">
            </div>
            
        </div>
    </section>
    <!--::봉사 끝::-->
    <br><br>
    
	<article class="mainBox03" style=" width: 1200px;" >	
        <div class="mainEvent"> 
        </div>
			

		<div class="boardBox"  style=" width: 550px; ">
			<div><strong style="color:#95998a; font-size: 30px;">입양일지</strong></div>
			<ul id="adopArea">
				
			</ul>
			<a href="adopRecode.ado" class="more" aria-label="" style="font-size:20px;">더보기</a>
		</div>

		<div class="boardBox" style="width: 550px; ">
			<div><strong style="color:#95998a; font-size: 30px;">공지사항</strong></div>
			<ul id="noticeArea">
                
			</ul>
			<a href="" class="more" aria-label="" style="font-size:20px;">더보기</a>
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
		    							'<img src="<%= request.getContextPath() %>/resources/voluploadFiles/'+data[i].changeName+'"  style="width:250px; height:250px;">' +
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
    
	
	
	
/*------------- 입양일지 ---------------------*/
 	function aDiaryList(){
		$.ajax({
			url: 'aDiaryList.ado',
			dataType: 'json',
			success: function(data){
				console.log(data);
				
				var $ul = $('#adopArea')
				
				for(var i in data){
					$ul.append(
						'<li>'+ '<a href="adoptionRecodeDetail.ado?adopId='+ data[i].adopId +'&page=1" style="font-size:25px;">'+ data[i].adopTitle +'</a>' + '<span style="font-size:25px;">' + data[i].adopModifyDate + '</span>' +'</li>'
					);
				}
			}
		});
	}
	
	$(function(){
		aDiaryList();
		
		var timer = setInterval(function(){
			aDiaryList();
		}, 5000);
			
		clearInterval(timer);
	});

	
	function noticeList(){
		$.ajax({
			url:'noticeList.sc',
			dataType: 'json',
			success: function(data){
				console.log(data);
				
				var $ul = $('#noticeArea');
				
				for(var i in data){
					$ul.append(
						'<li>'+ '<a href="nodetail.sc?scId='+ data[i].scId +'&page=1" style="font-size:25px;">'+ data[i].scTitle +'</a>' + '<span style="font-size:25px;">' + data[i].scModifyDate + '</span>' +'</li>'
					);
				}
			}
		});
	}
	
	$(function(){
		noticeList();
		
		var timer = setInterval(function(){
			aDiaryList();
		}, 5000);
			
		clearInterval(timer);
	});


</script>


</body>
</html>