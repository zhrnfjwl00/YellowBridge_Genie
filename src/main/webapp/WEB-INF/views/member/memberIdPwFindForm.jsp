<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.area{
	 width:100%;
	 height: 150px; 
	}
</style>
</head>

<body>
<c:import url="../common/header.jsp"/>
<div class="area">
</div>

	 <div class="full" id="full">
				<div class="container">
					<div class="area_inputs wow fadeIn" id="area">
						<div class="sub_title font-weight-bold text-black">
							
							<h4>아이디/비밀번호 찾기 </h4>
						
					
						</div>
						<div style="margin-bottom: 10px;"
							class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
							<label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
							<label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
						</div>
						
						<form action="memberIdFine.me" method="post">
							<div id="searchI">
								<div class="form-group">
									<label class="font-weight-bold text-black" for="name">이름</label>
									<div>
										<input type="text" class="form-control" id="name" name="name" placeholder="ex) 홍길동">
									</div>
								</div>
								<div class="form-group">
									<label class="font-weight-bold text-black" for="phone">휴대폰번호</label>
									<div>
										<input type="text" class="form-control" id="phone_1" name="phone" placeholder="ex) '-'제외하고 숫자만 입력">
									</div>
								</div>
								<div class="form-group">
									<button id="popup_open_btn" type="submit" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
									<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
								</div>
							</div>
						</form>	
						
						<div id="searchP" style="display: none;">
							<div class="form-group">
								<label class="font-weight-bold text-black" for="email">이메일</label>
								<div>
									<input type="email" class="form-control" id="email"	name="email" placeholder="ex) E-mail@gmail.com">
								</div>
							</div>
							<div class="form-group">
							<button id="popup_open_btn" type="button" class="btn btn-primary btn-block">확인</button>
							<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
						</div>
						</div>
					</div>
				</div>
			</div>
		  
		   <div id="my_modal">
		 	 <div id="background_modal" class="background_modal">
				<div class="modal_contents">
					<h4>
						<b>손님 아이디는?</b><span class="close">&times;</span>
					</h4><br>
						<h2 id="id_value"></h2>
					<br>
					<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
					<i class="fa fa-envelope"></i>비밀번호 찾기</button>
				</div>
			</div>
		  <a class="modal_close_btn">닫기</a>
        </div>
		
	
 <c:import url="../common/footer.jsp"/>       
</body>

<script>

function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);
	
    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
       modal.style.display = 'none';
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

document.getElementById('popup_open_btn').addEventListener('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});


$(document).ready(function() {
	/////////모///달///기///능///////////
	// 1. 모달창 히든 불러오기
	$('#popup_open_btn').click(function() {
		$('#background_modal').show();
	});
	// 2. 모달창 닫기 버튼
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	});
});

function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
</script>
</html>