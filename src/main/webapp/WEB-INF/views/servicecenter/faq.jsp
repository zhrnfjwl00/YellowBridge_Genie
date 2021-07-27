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
            <p class="q"><a href="#a1">질문1. &nbsp;&nbsp;&nbsp;&nbsp;강아지들은 집에만 있는데 걱정이 되요</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변1&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;저도 모르는데 어떻게 알려드립니까.....</p>
        </li>
        <li class="article" id="a2">
            <p class="q"><a href="#a2">질문2.&nbsp;&nbsp;&nbsp;&nbsp;같은 질문인데요 질문같지 않는 질문들 뿐이네요</a></p>
            <p class="a">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변2&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;저도 모르는데 어떻게 알려드립니까.....</p>
        </li>
        <li class="article" id="a3">
            <p class="q"><a href="#a3">질문3&nbsp;&nbsp;&nbsp;&nbsp;여기에 답이있다는게 사실입니까?</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변3&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;저도 모르는데 어떻게 알려드립니까.....</p>
        </li>
        <li class="article" id="a4">
            <p class="q"><a href="#a4">질문4. &nbsp;&nbsp;&nbsp;&nbsp;왜이런곳에 질문이 있는걸까요..??????</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변4&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;저도 모르는데 어떻게 알려드립니까.....</p>
        </li>
        <li class="article" id="a5">
            <p class="q"><a href="#a5">질문5.&nbsp;&nbsp;&nbsp;&nbsp;같은 질문인데요 질문같지 않는 질문들 뿐이네요</a></p>
            <p class="a">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변5&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;저도 모르는데 어떻게 알려드립니까.....</p>
        </li>
        <li class="article" id="a6">
            <p class="q"><a href="#a6">질문6&nbsp;&nbsp;&nbsp;&nbsp;여기에 답이있다는게 사실입니까?</a></p>
            <p class="a">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            답변6&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;저도 모르는데 어떻게 알려드립니까.....</p>
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