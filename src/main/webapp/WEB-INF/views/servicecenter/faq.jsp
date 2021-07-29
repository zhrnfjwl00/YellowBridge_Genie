<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>FAQ</title>
<style>
/* FAQ */
.faq{display: flex;
        flex-direction: column;
        width: 82%;
        height: 80%;
        align-items: center;
        justify-content: center;
        overflow-y: auto;
	    overflow-x: auto;
	    margin: 0px auto;
	    letter-spacing: -1px;}
.faq .faqHeader{position:relative;zoom:1;}
.faq .faqHeader .showAll{position:absolute;bottom:0;right:0;border:0;padding:0;overflow:visible;background:none;cursor:pointer;}
.faq .faqBody{margin:0;padding:0; }
.faq .faqBody .article{list-style:none}
.faq .q{margin:}
.faq .q a{display:block;text-align:left; 
    
    padding:0 0 0 35px;
    font-size:18px;
    color:#5e5e5e;
    font-weight:bold;
    line-height: 27px;
    cursor:pointer;
    margin: 10px 0; !important}
.faq .q a:hover, .faq .q a:active, .faq .q a:focus{}
/* .faq .a{background:#f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;padding: 10px 75px 10px 75px;
    font-size: 16px;
    color: #444444;
    line-height: 22px;
    border-top: 1px solid #bdbdbd;
    margin:5px 0 0 0;} */
</style>


</head>

<body>
<div class="faq">
	<c:import url="../common/header.jsp"/>
	<h2>FAQ</h2>
    <div class="faqHeader">
        <!--button type="button" class="showAll">답변 모두 여닫기</button-->
    </div>
    <ul class="faqBody">
        <li class="article" id="a1">
            <p class="q"><a href="#a2">질문1.&nbsp;&nbsp;&nbsp;&nbsp;등록대상동물의 범위는?</a></p>
            <p class="a">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변1&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;[동물보호법 시행령 제3조(등록대상동물의 범위)] 2개월 이상의 개로서 주택 반려목적으로 기르는 경우가 등록대상입니다.</p>
        </li>
        <li class="article" id="a2">
            <p class="q"><a href="#a2">질문2.&nbsp;&nbsp;&nbsp;&nbsp;해외에서 내장형 무선식별장치가 시술된 반려견에 대하여 등록신청 하는 경우에는 어떻게 해야 하나요?</a></p>
            <p class="a">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변2&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;1. 동물보호법 시행규칙 별표2에 맞는 규격일 경우 그 번호는 등록 가능합니다. </p>
        </li>
        <li class="article" id="a3">
            <p class="q"><a href="#a3">질문3&nbsp;&nbsp;&nbsp;&nbsp;동물등록신청은 어디서 하나요?</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변3&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;동물등록 대행업체(주로 동물병원)에 반려견을 데리고 방문하셔서 신청하시면 되며,가까운 등록대행업체 검색이 가능합니다.</p>
        </li>
        <li class="article" id="a4">
            <p class="q"><a href="#a4">질문4. &nbsp;&nbsp;&nbsp;&nbsp;동물의 품종과 성별이 잘못 입력되었습니다.어떻게 해야 하나요?</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변4&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;시, 군, 구 관할 지자체의 동물보호 담당자에게 문의하여 정정요청을 하시기 바랍니다.</p>
        </li>
        <li class="article" id="a5">
            <p class="q"><a href="#a5">질문5.&nbsp;&nbsp;&nbsp;&nbsp;동물등록증 출력은 어떻게 하나요?</a></p>
            <p class="a">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변5&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;동물보호관리시스템에서 소유자가 회원가입을 합니다.
        </li>
        <li class="article" id="a6">
            <p class="q"><a href="#a6">질문6&nbsp;&nbsp;&nbsp;&nbsp;소유자가 변경된 경우는 어떻게 하나요?</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변6&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;소유권을 이전받은 사람(변경된 소유자)이 소유권을 이전받은 날부터 30일 이내에 시군구에 변경신고를 해야 합니다.</p>
        </li>
        <li class="article" id="a7">
            <p class="q"><a href="#a6">질문7&nbsp;&nbsp;&nbsp;&nbsp;등록신청 후 처리기간은 얼마나 걸리나요?</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변7&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;동물등록 신청된 건은 등록대행업체에서 소유자가 신청서를 작성하여 제출하면 신청 서류가 송부된다</p>
        </li>
        <li class="article" id="a8">
            <p class="q"><a href="#a6">질문8&nbsp;&nbsp;&nbsp;&nbsp;동물등록제란 무엇인가요?</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변8&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;동물등록제는 반려동물의 등록관리를 통하여 소유주의 책임을 강화하고,  동물의 발생을 억제하여 동물보호 </p>
        </li>
    </ul>
    
    
</div>
    <c:import url="../common/footer.jsp"/>

<script>
jQuery(function($){
    // Frequently Asked Question
    var article = $('.faq>.faqBody>.article');
    article.addClass('hide');
    article.find('.a').hide();
    article.eq(0).removeClass('hide');
    article.eq(0).find('.a').show();
    $('.faq>.faqBody>.article>.q>a').click(function(){
        var myArticle = $(this).parents('.article:first');
        if(myArticle.hasClass('hide')){
            article.addClass('hide').removeClass('show');
            article.find('.a').slideUp(100);
            myArticle.removeClass('hide').addClass('show');
            myArticle.find('.a').slideDown(100);
        } else {
            myArticle.removeClass('show').addClass('hide');
            myArticle.find('.a').slideUp(100);
        }
        return false;
    });
    $('.faq>.faqHeader>.showAll').click(function(){
        var hidden = $('.faq>.faqBody>.article.hide').length;
        if(hidden > 0){
            article.removeClass('hide').addClass('show');
            article.find('.a').slideDown(100);
        } else {
            article.removeClass('show').addClass('hide');
            article.find('.a').slideUp(100);
        }
    });
});
</script>

</body>
</html>