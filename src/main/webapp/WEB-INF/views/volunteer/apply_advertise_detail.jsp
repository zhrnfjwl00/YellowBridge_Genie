<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	.replyTable{margin: auto; }
	#rinsertBtn{float: right; margin: 5px;}
	#rtb tbody{text-align:center; }
	#rtb th{border-bottom: 1px dotted grey;}
	#rtb td{padding: 3px;}

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
</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="servicedetail">
	
	<div style="text-align:center;" class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>봉사 신청</b></h1>
	</div>
	
	<form action="<%= request.getContextPath() %>/serviceapplyform.vol?serviceNo=${ volad.serviceNo }" method="post" encType="multipart/form-data">
		<div class="apply-top">
			<div id="applyImg">
				<img src="<%=request.getContextPath()%>/resources/voluploadFiles/${ volad.changeName }">
			</div>
			<div id="apply-info1">
				<table class="info1-table">
					<tr>
						<td>
						<button type="submit" class="update_btn btn btn-warning" id="updateBtn">수정</button>
						<button type="button" class="delete_btn btn btn-danger" id="deleteBtn">삭제</button>
						</td>
					</tr>
					<tr>
						<td style="font-size: 20px;"><b>${ volad.serviceTitle }</b></td>
					</tr>
					<tr>
						<td><b>참가비 : </b>10,000원</td>
					</tr>
						<td><div style="border-top:2px solid black; width:100%; margin: 20px 0;"></div></td>
					<tr>
						<td><b>보호소 : </b>${ volad.shelterName }</td>
					</tr>
					<tr>
						<td><b>보호소 정보 : </b>${ volad.shelterInfo }</td>
					</tr>
					<tr>
						<td><b>보호소 연락처 : </b>${ volad.shelterTel }</td>
					</tr>
					
					<c:if test="${ !empty sessionScope.loginUser }">
					<tr>
						<td>
							<div style="text-align: center;">
							<button id="applybtn" onclick="goApply();">봉사신청</button>
							</div>
						</td>
					</tr>
					</c:if>
					<c:if test="${ empty sessionScope.loginUser }">
					<tr>
						<td>
							<div style="text-align: center; padding-top: 15px; color: red; font-size: 18px;" >
							<b>봉사 신청은 로그인 후 가능합니다.</b>
							</div>
						</td>
					</tr>
					</c:if>
				</table>
			</div>
		</div>
	</form>
		
		<div class="apply-bottom">
			<div id="apply-info2">
				<textarea id="content" name="content" class="form-control" cols="60" rows="25" readonly="readonly" style="resize:none; background-color: transparent">${ volad.serviceContent }</textarea>
				<%-- ${fn:replace(volad.serviceContent, newLineChar, "<br>")} --%>
			</div>
		</div>
		
		
		<br>
		<div class="container">
		<table class="replyTable">
			<tr>
				<td colspan="6"><input type="text" id="rContent" name="rContent" class="form-control"/></td>
				<td><button id="rinsertBtn"class="replyWriteBtn btn btn-success">작성</button></td>
			</tr>
		</table>
		
		<table class="replyTable" id="rtb">
			<thead>
				<tr>
					<td colspan="2"><b id="rCount"></b></td>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
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
    	var serId = ${ volad.serviceNo };
		
		location.href="serviceapplyform.vol?serId="+serId;
	}
  </script>
  
  <script>
	$("#deleteBtn").on("click", function(){
		var serviceNo = ${ volad.serviceNo };
		
		var deleteYN = confirm("삭제하시겠습니까?");
		if(deleteYN == true){
			location.href = "vAdDelete.vol?serviceNo=" + serviceNo;
		}
	})
	
	$("#updateBtn").on("click", function(){
		var serviceNo = ${ volad.serviceNo };
		
		location.href = "adminVolUpdateForm.vol?serviceNo=" + serviceNo;
	})
  </script>
  
  <script>
	$(function(){
		
		getReplyList();
		
		setInterval(function(){
			getReplyList();
		}, 1000);
		
		$('#rinsertBtn').on('click', function(){
			var volrContent = $('#rContent').val();
			var volrefBid = ${ volad.serviceNo };
			
			$.ajax({
				url: 'voladdReply.vol',
				data: {volrContent:volrContent, volrefBid:volrefBid},
				success: function(data){
					console.log(data);
					
					if(data == 'success'){
						$('#rContent').val('');
						getReplyList(); // 댓글 리스트 불러오기
					}
				}
			});
		});
	});
	
	function getReplyList(){
		var volId = ${ volad.serviceNo };
		
		$.ajax({
			url: 'volrList.vol',
			data: {volId:volId},
			dataType: 'json',
			success: function(data){
				console.log(data);
				var $tableBody = $('#rtb tbody');
				$tableBody.html('');
				
				$('#rCount').text('후기(' + data.length + ')');
				if(data.length > 0){
					var $tr = $('<tr>');
					var $trWriter = $('<th>').text('작성자');
					var $trContent = $('<th colspan=3>').text('내용');
					var $trCreateDate = $('<th>').text('작성일');
					
					$tr.append($trWriter);
					$tr.append($trContent);
					$tr.append($trCreateDate);
					$tableBody.append($tr);
					
					for(var i in data){
						var $tr = $('<tr>');
						var $rWriter = $('<td>').text(data[i].volrNickname);
						var $rContent = $('<td colspan=3>').text(data[i].volrContent);
						var $rCreateDate = $('<td>').text(data[i].volrCreateDate);
						
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tableBody.append($tr);
					}
				} else {
					var $tr = $('<tr>');
					var $rContent = $('<td colspan=5>').text('등록된 후기가 없습니다.');
					
					$tr.append($rContent);
					$tableBody.append($tr);
				}
			}
		});
	}
	</script>

</body>
</html>