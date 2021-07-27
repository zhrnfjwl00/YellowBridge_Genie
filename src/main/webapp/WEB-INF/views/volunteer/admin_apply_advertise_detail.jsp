<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content= "text/html; charset=UTF-8">
<!-- BootStrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
 <!-- 서머노트를 위해 추가해야할 부분 -->
 <script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
 <script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

<title>봉사 신청 등록</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c928d855be38f3adf0df68edd3fca4ae"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<style>
	.servicedetail{
		width: 65%;
		margin: 0px auto;
		padding-top: 30px;
	}
	
	#map{
		width: 100%;
		margin: 0px auto;
	}
	
	.apply-top{
		width: 80%;
		margin: 0px auto;
		display: table;
		padding-bottom: 30px;
		border-bottom: 1px solid black;
	}
	
	#applyImg{
		width: 40%;
		vertical-align: middle;
		letter-spacing: -1px;
		display: table-cell;
		margin-right: 30px;
	}
	
	#applyImg img{
		width: 350px; 
		height: 200px; 
		border:1px solid black;
	}
	
	#apply-info1{
		padding-left: 100px;
		width: 50%;
		vertical-align: middle;
		display: table-cell;
	}
	
	td{padding: 3px;}
	
	input[type="text"]{padding: 7px;}
	
	.apply-bottom{
		padding-top: 30px;
		padding-bottom: 30px;
		width: 85%;
		margin: 0px auto;
		border-bottom: 1px solid black;
	}
	
	#apply-info2{
		width: 85%;
		margin: 0px auto;
	}
	
	.replyTable{margin: auto; }
	#rinsertBtn{float: right; margin: 5px;}
	#rtb tbody{text-align:center; }
	#rtb th{border-bottom: 1px dotted grey;}
	#rtb td{padding: 3px;}

	#stopBtn{
    	background-color: red;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 5px 30px;
        margin-top: 30px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	#continueBtn{
    	background-color: rgb(189, 204, 148);
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 5px 30px;
        margin-top: 30px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	
	#applybtn{
    	background-color: rgb(189, 204, 148);
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 10px 30px;
        margin-top: 30px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.info1-table tr td{padding-bottom: 4px;}
	
	#goMain{
		background: lightgray;
    	border: 1px solid lightgray;
    	color: white;
    	font-weight: bold;
    	border-radius: 5px;
    	padding: 15px 15px;
	}
	
	.buttonDiv{padding-top:100px;}
	
	.tableTitle{width: 40%;}
	.tableWriter{width: 10%;}
	.tableDate{width: 15%;}
	.tableCount{width: 10%;}
	
	#mapDiv{padding: 30px; width: 65%; margin: 0px auto;}
	
	.map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
</style>
</head>
<body>
<c:import url="header.jsp"/>
<div class="servicedetail">
${ volboard.serviceEnd }
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 신청</b></h1>
	</div>
	<form action="<%= request.getContextPath() %>/serviceapplyform.vol?serviceNo=${ volboard.serviceNo }" method="post" encType="multipart/form-data">
		<div class="apply-top">
			<div id="applyImg">
				<img src="<%=request.getContextPath()%>/resources/voluploadFiles/${ volboard.changeName }">
			</div>
			<div id="apply-info1">
				<table class="info1-table">
					<tr>
						<td>
						<input type="hidden" id="shelter" value="${ volboard.cateNo }">
						<input type="hidden" id="page" name="page" value="${page}"> 
						<button type="button" class="update_btn btn btn-warning" id="updateBtn">수정</button>
						<button type="button" class="delete_btn btn btn-danger" id="deleteBtn">삭제</button>
						<button type="button" id="stopBtn">신청중지</button>
						<button type="button" id="continueBtn">신청재개</button>
						</td>
					</tr>
					<tr>
						<td style="font-size: 20px;"><b>${ volboard.serviceTitle }</b></td>
					</tr>
					<tr>
						<td><b>참가비 : </b>10,000원</td>
					</tr>
						<td><div style="border-top:2px solid black; width:100%; margin: 20px 0;"></div></td>
					<tr>
						<td><b>보호소 : </b>${ volboard.shelterName }</td>
					</tr>
					<tr>
						<td><b>보호소 정보 : </b>${ volboard.shelterInfo }</td>
					</tr>
					<tr>
						<td><b>보호소 연락처 : </b>${ volboard.shelterTel }</td>
					</tr>
					
					<tr>
						<td>
							<c:if test="${ volboard.serviceEnd eq '신청중지' }">
								<div style="text-align: center; padding-top: 15px; color: navy; font-size: 18px;" >
								<b>이미 신청이 마감된 봉사입니다.</b>
								</div>
							</c:if>
							<c:if test="${ volboard.serviceEnd ne '신청중지' }">
								<div style="text-align: center;">
								<b>봉사 신청이 가능합니다.</b>
								</div>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
		
		<div class="apply-bottom">
			<div id="apply-info2">
				<textarea id="summernote" name="content" class="form-control" cols="60" rows="25" readonly="readonly" style="resize:none; background-color: transparent">${ volboard.serviceContent }</textarea>
				<%-- ${fn:replace(volboard.serviceContent, newLineChar, "<br>")} --%>
			</div>
		</div>
		
		<div id="mapDiv"> 
		<label style="font-size: 20px;"><b>위치안내</b></label>
			<div id="map" style="width:600px; height:400px;"></div>
		</div>
		
		
		
		<br>
		
		<table class="replyTable" id="rtb">
			<thead>
				<tr>
					<td colspan="2"><b id="rCount"></b></td>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
			
		<div align="center" class="buttonDiv">
			<input type="button" onclick="location.href='<%= request.getContextPath() %>/adminserviceapply.vol'" id="goMain" value="메인으로">
		</div>
</div>
<c:import url="../common/footer.jsp"/>

	<script>
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = function(e){
	            const previewImage = document.getElementById("preview-image");
	            previewImage.src = e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}

	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", function(e){
	    readImage(e.target)
	});
	
    $(document).ready(function() {
      $('.wrap').on( 'keyup', 'textarea', function (e){
        $(this).css('height', 'auto' );
        $(this).height( this.scrollHeight );
      });
      $('.wrap').find( 'textarea' ).keyup();
    });
    
    function goApply(){
    	var serId = ${ volboard.serviceNo };
		
		location.href="serviceapplyform.vol?serId="+serId;
	}
  </script>
  
  <script>
	$("#deleteBtn").on("click", function(){
		var serviceNo = ${ volboard.serviceNo };
		
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			location.href = "vAdDelete.vol?serviceNo=" + serviceNo;
		}
	})
	
	$("#stopBtn").on("click", function(){
		var serviceNo = ${ volboard.serviceNo };
		var page = ${ page };
		
		var stopYN = confirm("해당 봉사의 신청을 중단하시겠습니까?");
		if(stopYN == true){
			location.href = "vAdStop.vol?serviceNo=" + serviceNo + "&page=" + page;
		}
	})
	
	$("#continueBtn").on("click", function(){
		var serviceNo = ${ volboard.serviceNo };
		var page = ${ page };
		
		var continueYN = confirm("해당 봉사의 신청을 재개하시겠습니까?");
		if(continueYN == true){
			location.href = "vAdContinue.vol?serviceNo=" + serviceNo + "&page=" + page;
		}
	})
	
	$("#updateBtn").on("click", function(){
		var serviceNo = ${ volboard.serviceNo };
		var page = ${ page };
		
		location.href = "adminVolUpdateForm.vol?serviceNo=" + serviceNo + "&page=" + page;
	})
</script>
<script>
	var mapContainer = document.getElementById('map');
	var place = ${ volboard.cateNo };
	
	if(place == 21){
		var mapOption = {
			center: new kakao.maps.LatLng(35.880401, 128.701180),
			level: 3
		};
	} else if (place == 22) {
		var mapOption = {
			center: new kakao.maps.LatLng(36.130951, 128.316779),
			level: 3
		};
	} else if (place == 23) {
		var mapOption = {
			center: new kakao.maps.LatLng(35.430988, 129.159204),
			level: 3
		};
	} else if (place == 24) {
		var mapOption = {
			center: new kakao.maps.LatLng(35.415067, 128.645838),
			level: 3
		};
	} else if (place == 25) {
		var mapOption = {
			center: new kakao.maps.LatLng(35.848403, 128.597092),
			level: 3
		};
	} else if (place == 26) {
		var mapOption = {
			center: new kakao.maps.LatLng(35.769183, 128.878759),
			level: 3
		};
	} else if (place == 27) {
		var mapOption = {
			center: new kakao.maps.LatLng(35.612025, 128.748393),
			level: 3
		};
	}
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	if(place == 21){
		var markerPosition  = new kakao.maps.LatLng(35.880401, 128.701180); 
		
		var content = '<div class="customoverlay">' +
	    '  <a href="http://kko.to/rUfXbj0fB" target="_blank">' +
	    '    <span class="title">대구 반야월 쉼터</span>' +
	    '  </a>' +
	    '</div>';
	} else if (place == 22) {
		var markerPosition  = new kakao.maps.LatLng(36.130951, 128.316779); 
		
		var content = '<div class="customoverlay">' +
	    '  <a href="http://kko.to/PVcf20j4M" target="_blank">' +
	    '    <span class="title">구미 사랑 보호소</span>' +
	    '  </a>' +
	    '</div>';
	} else if (place == 23) {
		var markerPosition  = new kakao.maps.LatLng(35.430988, 129.159204); 
		var content = '<div class="customoverlay">' +
	    '  <a href="http://kko.to/ejgxl004p" target="_blank">' +
	    '    <span class="title">양산 사랑이네 집</span>' +
	    '  </a>' +
	    '</div>';
	} else if (place == 24) {
		var markerPosition  = new kakao.maps.LatLng(35.415067, 128.645838); 
		var content = '<div class="customoverlay">' +
	    '  <a href="http://kko.to/mdNn2004H" target="_blank">' +
	    '    <span class="title">경남 창녕 쉼터</span>' +
	    '  </a>' +
	    '</div>';
	} else if (place == 25) {
		var markerPosition  = new kakao.maps.LatLng(35.848386, 128.597070); 
		var content = '<div class="customoverlay">' +
	    '  <a href="http://kko.to/v3AFljj4B" target="_blank">' +
	    '    <span class="title">대구 앵두네 집</span>' +
	    '  </a>' +
	    '</div>';
	} else if (place == 26) {
		var markerPosition  = new kakao.maps.LatLng(35.769183, 128.878759); 
		
		var content = '<div class="customoverlay">' +
	    '  <a href="http://kko.to/Ux75bjjfp" target="_blank">' +
	    '    <span class="title">경산 아이들 쉼터</span>' +
	    '  </a>' +
	    '</div>';
	} else if (place == 27) {
		var markerPosition  = new kakao.maps.LatLng(35.612025, 128.748393); 
		
		var content = '<div class="customoverlay">' +
	    '  <a href="http://kko.to/Mdi0vjjfp" target="_blank">' +
	    '    <span class="title">청도 허그안 쉼터</span>' +
	    '  </a>' +
	    '</div>';
	}

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 커스텀 오버레이를 생성합니다
	var customOverlay = new kakao.maps.CustomOverlay({
	    map: map,
	    position: markerPosition,
	    content: content,
	    yAnchor: 1 
	});

</script>
<script type="text/javascript">
$('#summernote').summernote({
	  // 에디터 높이
	  minheight: 500,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
	  focus : true,
	});
	
	$('#summernote').summernote('disable');
	
    
</script>
</body>
</html>