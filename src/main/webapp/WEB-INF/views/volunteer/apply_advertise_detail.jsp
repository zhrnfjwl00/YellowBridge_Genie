<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>봉사 신청 등록</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<style>
	.servicedetail{
		width: 65%;
		margin: 0px auto;
		padding-top: 30px;
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
	
	.replyDiv{
		padding-top: 5px;
		padding-bottom: 30px;
		width: 80%;
		margin: 0px auto;
	}
	
	.replyTable{
		border-bottom: 1px solid black;
		border-top: 1px solid black;
		padding-top: 15px;
		padding-bottom: 15px;
		width: 100%;
	}
	
	.replyWriteTable{
		padding-top: 30px;
		padding-bottom: 15px;
		
	}
	
	#replybtn{
		background-color: lightgrey;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        padding: 30px 30px;
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
</style>
</head>
<body>
<div class="servicedetail">
	<form action="<%= request.getContextPath() %>/insert.vo" method="post" encType="multipart/form-data">
		<div class="apply-top">
			<div id="applyImg">
				<img src="<%=request.getContextPath()%>/resources/serviceinfo.jpg">
			</div>
			<div id="apply-info1">
				<table>
					<tr>
						<td><b>대구 반야월 쉼터 봉사 (8월 7일)</b></td>
					</tr>
					<tr>
						<td>10,000원</td>
					</tr>
						<td><div style="border-top:2px solid black; width:100%; margin: 20px 0;"></div></td>
					<tr>
						<td>약 90마리의 강아지들과 10마리의 고양이들이 살고 있는 사설보호소예요 따뜻한 관심 가져주세요 :)</textarea></td>
					</tr>
					<tr>
						<td>문의 : 010-0101-1212</td>
					</tr>
					<tr>
						<td><div style="text-align: center;"><button id="applybtn" >봉사신청</button></div></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="apply-bottom">
			<div id="apply-info2">
				봉사 장소 : 동구 율암동 142-1 번지<br><br>
				주소 검색 후 들어오기 전 공용 주차장에 주차하세요.<br><br>
				(주소는 블로그나 인스타 등에 공개하지 말아주세요.)<br><br>
				
				봉사 시간 : 10:00~13:00<br><br>
				
				준비물:<br>
				더러워져도 되는 신발, 옷  등<br>
				보호소에 공용 방진복, 장갑이 있습니다.(개인방진복 따로 구매해주세요!)<br><br>
				
				구역별 할 일<br>
				1. 똥, 쓰레기 치우기<br>
				2. 밥, 물 그릇 씻기<br>
				3. 밥, 물 주기<br>
				4. 그 외 환경 개선<br>
			</div>
		</div>
		<div class="replyDiv">
			<h2>후기</h2>
			<table class="replyTable" style="text-align:center;">
				<tr class="replyTr" >
					<td width="100px">강건강</td>
					<td width="400px">오늘 봉사 너무 즐거웠습니다~ 다음에 또 뵐게요</td>
					<td width="150px">2021-02-03</td>
				</tr>
				<tr class="replyTr">
					<td width="100px">남나눔</td>
					<td width="400px">재밌었어요~</td>
					<td width="150px">2021-02-03</td>
				</tr>
			</table>
			<table class="replyWriteTable">
				<tr>
					<td>
						<textarea cols="100%" rows="5" placeholder="후기를 남겨주세요" style="resize:none;"></textarea>
					</td>
					<td>
						<button id="replybtn">등록하기</button>
					</td>
				</tr>
				<tr>
					<td colspan="2"><b>댓글(${ rCount })</b>
				</tr>
			</table>
		</div>
	</form>
	
	
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
	</script>
</div>
</body>
</html>