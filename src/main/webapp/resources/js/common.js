(function($, win, doc) {
    "use strict";

    var $win = $(win),
        $doc = $(doc);

    //gnb 함수 추가  
    $.GNB = {};
    $.GNB.init = function() {
        //gnb 스크립트 초기화
        var gnb = new GNB();
    };

    //인푹박스 체크 함수 
    // @parameter type: input 타입 , idx : 태그 순서, bChked: 체크 여부 
    win.commonJs = {};
    var commonJs = win.commonJs;

    commonJs.checkBoxCall = function(type, idx, bChked) {
        var checkInput = $('input[type="' + type + '"]').eq(idx);
        var getName = checkInput.attr('name'),
            $siblings = $('[name="' + getName + '"]');

        if (checkInput.attr('type').toUpperCase() === 'RADIO') {
            $siblings.closest('.formWrap').removeClass('on');
            $siblings.attr('checked', false);
        }

        if (bChked) {
            checkInput.closest('.formWrap').addClass('on');
            checkInput.attr('checked', true);
        } else {
            checkInput.closest('.formWrap').removeClass('on');
            checkInput.attr('checked', false);
        }
    }
    commonJs.centerMove = function() {
        var docHeight = $(window).height();
        var innerPopHeight = docHeight - 101;
        var isScroll = false;
        $(".LayerPopWrap").each(function() {
            var popHeight = $(this).outerHeight();
            if (innerPopHeight <= popHeight) {
                isScroll = true;
                $(this).css("width", "620px");
                $(this).find(".popCont").css({
                    "overflow-y": "auto",
                    "overflow-x": "hidden",
                    height: innerPopHeight
                });
            }
            $.util.center(this);
        });
    }
   
    commonJs.errorFocus = function(obj) {
    	obj.focus();
    	obj.addClass("errorFocus"); 
    };
    


    commonJs.findFocusElements = function(target) {
        //div[tabindex="0"], a, button, input, textarea
        return target.find('div[tabindex="0"], a, button, input, textarea, select');
    };
    
    commonJs.firstTargetFocus = function(target) {
        var $target = $(target),
            i = 0,
            getFirstChild = (function getFirstChild(elem) {
                var $elem = $(elem),
                    getChildren = null;
                                    
                if($elem.children().length > 0) {
                    getChildren = $elem.children().eq(0);
                    
                    if(getChildren.hasClass('hidden') || getChildren.is(':hidden')) {
                        getChildren = getChildren.next();
                    }
                    return getFirstChild(getChildren);
                } else {
                    return $elem;
                }
            }($target));
        
        // outline 없앰
        // getFirstChild.css('outline', 'none');
        // android 포커스를 위한 속성
        getFirstChild.attr('tabindex', '0');
        // 포커스 이동
        getFirstChild.focus();
        // getFirstChild.off('focusout.goFocus');
        // getFirstChild.on('focusout.goFocus', function() {
            // $(this).removeAttr('tabindex');
        // });
        return $target;
    };
    commonJs.saveTarget = [];
    commonJs.saveTop = 0;
    //메인 팝업 열기 
    commonJs.openMainPop = function(popId, positionX, postionY, zIndex) {
    	//팝업 닫기 
    	$("#"+popId).find(".close").off("click").on("click", function() {
        	var mainPopId = $("#close").closest(".mainPopWrap").attr("id");
            if ($("#"+popId).find("input").is(":checked") == true) {
                setCookie(popId, "Y", 1);
            }
            $("#"+popId).hide();            
        });
    	
    	//쿠키 설정 여부에 따라 팝업 보여주기 
        if (getCookie(popId) != "Y") {
            $('#' + popId).show();
            //접근성 포커스 추가 
            $('#' + popId).attr("tabindex", 0).focus();
        } else {
            $('#' + popId).hide();
        }

        zIndex = 10000 + (zIndex || 0);

        //팝업 위치 설정
        $('#' + popId).css({
            'top': Number(positionX),
            'left': Number(postionY),
            'z-index': zIndex
        })
    }; 
    
    //쿠기설정
    function setCookie(name, value, expiredays) { // 쿠키의 이름과 값 그리고 쿠키가 종료되는 날짜를 설정 합니다.
    	var today = new Date();
    	    today.setDate(today.getDate() + expiredays);
    	// 날짜를 설정하기 위해 setDate메소드를 사용하여 getDate의 "일"에 종료일 하루 "1" 을 더합니다.
    	 document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + ';'
    	//쿠키를 저장시 이름과 값을 쌍을 이루고 그리고 쿠키를 사용한 문서의 위치를 정하고 종료일은 GMT 시간으로 합니다.
	}
	
	function getCookie(key) { //쿠키 값 얻어오기
        var results = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
        if (results) {
            return (unescape(results[2]));
        } else {
            return undefined;
        }
    }
    //GNB 객체
    //접근성 focus 
    function GNB() {
        var header = $('header'),
            $gnb = $('nav>ul'),
            $gnbLi = $gnb.find('>li>a'), // gnb  메뉴
            $menuWrap = $gnbLi.next(".sub"), // gnb sub 메뉴 
            idx = -1,
            totalElmLength = 0,
            timer = null,
            totalMenuSub = $("nav .totalMenu .btnOpen"), //전체메뉴 버튼 
            isActiveHeader = false;

        //회사 소개 페이지는 항상 gnb 메뉴 불투명 하게 유지 
        if ($(location).attr('pathname').indexOf("company") != -1) {
            isActiveHeader = true;
        }
        
        function removeMainClass() {
            if ($(document).scrollTop() == 0) {
                $("header").removeClass("main");
            }
        }

        function addMainClass() {
            if ($(document).scrollTop() == 0) {
                $("header").addClass("main");
            }
        }
        
        // header 이벤트 
        if (!isActiveHeader) {
            header.on({
                mouseenter: function() {
                    //gnb 메뉴 불투명 css 추가 
                	removeMainClass(); 
                },
                mouseleave: function() {
                    //gnb메뉴 불투명 css 제거 
                	addMainClass();
                },
                focusin: function() {
                    //gnb 메뉴 불투명 css 추가 
                	removeMainClass();
                },
                focusout: function() {
                    //gnb메뉴 불투명 css 제거 
                	addMainClass();
                }
            })

            $gnbLi.on({
                mouseenter: function() {
                	removeMainClass();
                }
            });
            //gnb sub 메뉴 이벤트
            $menuWrap.on({
                mouseenter: function() {
                    //gnb 메뉴 불투명 css 추가 
                	removeMainClass();
                },
                mouseleave: function() {
                    //gnb 메뉴 불투명 css 제거 
                	addMainClass();
                }
            })
        }


        //gnb 메뉴 이벤트
        $gnbLi.on({
            focusin: function(e) {
                idx = $(this).closest("li").index();                
                openList(idx);
            },
            keydown: function(ev) {
                // back space event
                if (ev.shiftKey == true && ev.keyCode == 9) {
                    var prevElm = $(this).closest("li").prev("li");
                    var prevSub = prevElm.find(".sub");
                    var prevElmIex = prevElm.index();

                    if (prevElm.length > 0 && prevSub.length > 0) {
                        //이전 탭 열기 
                        openList(prevElmIex);
                        prevSub.last().find("a").attr("tabindex", 0).focus();
                        ev.preventDefault();
                    } else {
                        hideList();
                    }
                }

            },
            mouseenter: function() {
                //서브 메뉴 열기 
                idx = $(this).closest("li").index();
                openList(idx);
            },
            mouseleave: function() {
                //서브 메뉴 닫기 
                hideList();

            }
        });

        //gnb sub 메뉴 이벤트
        $menuWrap.on({
            mouseenter: function() {
                //gnb 메뉴 열기 
                idx = $(this).closest("li").index();
                openList(idx);
            },
            mouseleave: function() {
                //gnb 메뉴 닫기 
                hideList();

            },
        });
        
        //전체 메뉴 버튼 이벤트
        totalMenuSub.on({
        	focusin: function(ev){
        		hideList();
        	},
        	keydown: function(ev) {
        		// back space event
        		var prevElm = $("nav>ul>li").last(),
        		prevSub = prevElm.find(".sub");
        		if (ev.shiftKey == true && ev.keyCode == 9) {
        			//이전 탭 열기
        			openList($("nav>ul>li").length-1);    
        			prevSub.last().find("a").attr("tabindex", 0).focus();
        			ev.preventDefault();
        		}
        	}
        })
        
    }

    //gnb sub 메뉴 열기
    function openList(idx) {
        var $gnb = $('nav>ul'),
            $gnbLi = $gnb.find('>li>a'), // gnb  메뉴
            $menuWrap = $gnbLi.next(".sub"); // gnb sub 메뉴 

        hideList();
        $gnbLi.eq(idx).closest("li").addClass("on");

        //하위 메뉴가 있을 경우에만 활성화 
        if ($menuWrap.eq(idx).length > 0) {
            $menuWrap.eq(idx).show();
        }
    }


    //gnb sub 메뉴 열기
    function hideList() {
        var $gnb = $('nav>ul'),
            $gnbLi = $gnb.find('>li>a'), // gnb  메뉴
            $menuWrap = $gnbLi.next(".sub"); // gnb sub 메뉴 
        $gnbLi.closest("li").siblings().removeClass('on');
        $menuWrap.hide();
    }

    // 레이어 팝업 설정 
    $.extend($, {
        util: {
            jquery: function(el) {
                return el.jquery ? el : $(el);
            },
            center: function($el) {
                $el = $.util.jquery($el);


                var n = $el.height() / 2;
                $el.css({
                    position: 'fixed',
                    top: '50%',
                    'margin-top': -n + 'px'
                });

                return this;
            },
            forEachArray: function(list, fn) {
                for (var i = 0, item; item = list[i]; i++) {
                    if (fn(item, i, list) === false) {
                        break;
                    }
                }

                return this;
            }
        },
        popup: function(action, options) {
            switch (action) {
                case 'open':
                    openPopup(options);
                    break;
                case 'close':
                    closePopup();
                    break;
            }
        }
    });

    // 팝업 기본값  
    $.popup.defaults = {
        onOpen: function() {},
        onClose: function(remove) {
            remove();
        }
    };

    $.popup.popups = [];

    /**
     * 팝업 생성
     * @param {Number} options.templateId layerPopup Id
     * @param {String} options.wrapper layerPopup parent selector
     * @param {jQuery | HTMLElement} options.appendTop
     * @param {jQuery | HTMLElement} options.appendCont
     */
    function createLayerPopup(options) {
        var $layerWrap = $('<div id="' + options.templateId + '" class="LayerPopWrap" />'),
            $popTop = $('<div class="popTop"><h1 /></div>'),
            $popCont = $('<div class="popCont" />');

        if ($('#' + options.templateId).length > 0) {
            return;
        }

        $layerWrap.append($popTop);
        $layerWrap.append($popCont);
        
        $popTop.find("h1").append(options.appendTop);
        $popCont.append(options.appendCont);
        $popCont.after('<a href="#" class="popClose">닫기</a>');

        $(options.wrapper).append($layerWrap);
       
    }

    function focusOutClosePop(lastFocus) {
        $(".popTop").off('keydown').on('keydown', function(ev) {
            // back space event
            if (ev.shiftKey == true && ev.keyCode == 9) {
                lastFocus.focus();
                $.popup('close');
                var oPopup = getTopPopup();
                if ($.popup.popups.length > 0) {
                    oPopup.$target.show();
                    lastFocus.focus();
                }
                ev.preventDefault();
            }
        });
        $(".popClose").off('keydown').on('keydown', function(ev) {
            // back space event
            if (ev.keyCode == 9) {
                lastFocus.focus();
                $.popup('close');
                var oPopup = getTopPopup();
                if ($.popup.popups.length > 0) {
                    oPopup.$target.show();
                    lastFocus.focus();
                }
                ev.preventDefault();
            }
        });
    }


    // 팝업 열기 
    function openPopup(options) {
        options = $.extend({}, $.popup.defaults, options);
        if ($('#' + options.id).css('display') == "block") {
            return false;
        }

        // 모바일 화면 해상도
        $("body").css({ "overflow": "hidden" });
        var oPopCont;
        var popLength = $.popup.popups.length;

        // 다중 팝업 일 경우 지우고 기존 팝업 감추고 시작
        if (popLength > 0 && options.parentPop) {
            options.parentPop.hide();
        }

        var oItemPop = {
            "item_select_1_popup": {
                'appendTop': '의류 우려상품 선택 동의',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../images/img_item_1_1.jpg" alt=""></span>내품이 보임' +
                    '<br>(종이 쇼핑백)</li>' +
                    '<li><span class="thum"><img src="../images/img_item_1_2.jpg" alt=""></span>합포장</li>' +
                    '<li><span class="thum"><img src="../images/img_item_1_3.jpg" alt=""></span>박스 포장' +
                    '<br>안 된 캐리어</li>' +
                    '<li><span class="thum"><img src="../images/img_item_1_4.jpg" alt=""></span>내품이 보임</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">우편법 제2조 3항에 규정되어 있는 서신 / 서류(예:편지, 서류) 등이 포함되어있는 경우, 창을 닫고 서신 / 서류 품목을 다시 선택하여 주십시오.</em></li>' +
                    '<li>사진과 같이 포장이 부실한 경우 <em class="fc2">"수거하지 않습니다."</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">상기 제품 이외에 <em class="fc1">파손 우려가 있는 유리 등의 제품</em>이 들어있습니까?</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">우려상품 포함</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">우려상품 없음</a>' +
                    '</div>'
            },
            "item_select_2_popup": {
                'appendTop': '서신/서류 우려상품 선택 동의',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_1.jpg" alt=""></span>현금</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_2.jpg" alt=""></span>편지봉투</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_3.jpg" alt=""></span>유가증권' +
                    '<br>(상품권, 공연티켓)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_2_4.jpg" alt=""></span>신분증, 여권</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>서신/서류 상품은 <em class="fc2">[우편법]</em> 규정에 의거하여 운임이 산정됩니다.</li>' +
                    '<li>사진과 같은 상품은 <em class="fc2">절대 접수 금지</em>이며 사고시 <em class="fc2">사고 배상금액 산정에서 제외</em>됩니다.</li>' +
                    '</ul>' +
                    '<table class="tableType2 mt20">' +
                    '<caption>적립일자, 적립이벤트, 적립포인트, 소멸일로 구성된 포인트 적립 현황 목록</caption>' +
                    '<colgroup>' +
                    '<col style="width:33%">' +
                    '<col style="width:34%">' +
                    '<col style="width:33%">' +
                    '</colgroup>' +
                    '<thead>' +
                    '<tr>' +
                    '<th scope="col">중량</th>' +
                    '<th scope="col">기본운임</th>' +
                    '<th scope="col">비고</th>' +
                    '</tr>' +
                    '</thead>' +
                    '<tbody>' +
                    '<tr>' +
                    '<td>350g 이하</td>' +
                    '<td>3,100원</td>' +
                    '<td><a href="#" class="icoSearch">우편법</a></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td>350g 이상</td>' +
                    '<td>2,800원</td>' +
                    '<td>Postbox 기본운임</td>' +
                    '</tr>' +
                    '</tbody>' +
                    '</table>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '서신/서류 상품은 각종 운임할인 이벤트에서 제외됩니다.' +
                    '<br> (<em class="fc1">서류봉투</em>로 포장해주시기 바라며, <em class="fc1">편지봉투는 접수 불가</em>합니다.)' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">우려상품 포함</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">우려상품 없음</a>' +
                    '</div>'
            },
            "item_select_3_popup": {
                'appendTop': '가전제품류 파손면책 선택 동의',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_1.jpg" alt=""></span>스티로폼 박스에' +
                    '<br>흔들리지 않도록 포장</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_2.jpg" alt=""></span>스티로폼 박스에' +
                    '<br>견고하게 포장</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_3.jpg" alt=""></span>컴퓨터 본체 포장 불량 내품 완충 불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_3_4.jpg" alt=""></span>휴대폰 포장 불량' +
                    '<br>내품 완충 불량</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">우편법 제2조 3항에 규정되어 있는 서신 / 서류(예:편지, 서류) 등이 포함되어있는 경우, 창을 닫고 서신 / 서류 품목을 다시 선택하여 주십시오.</em></li>' +
                    '<li>가전제품류는 <em class="fc2">제품출고 시 포장된 박스(스티로폼 포장)</em>로 흔들리지 않도록 포장되어야 함.' +
                    '<br> 상기와 같이 포장되지 않은 경우 택배기사 수거 시 집하 거부될 수 있음</li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '완충제로 포장되어 있어야 하며, <em class="fc1">파손면책(택배사 책임 없음 인정)시<br>' +
                    '접수 가능</em>합니다. 파손면책에 동의하시겠습니까?' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">동의하지 않음</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">동의함</a>' +
                    '</div>' +
                    '<dl class="addCont">' +
                    '<dt>파손면책이란?</dt>' +
                    '<dd>배송 중 포장부실로 인한 상품의 고장/파손에 대하여 택배사의 배상책임을 묻지 않겠다는 고객의 확인입니다.</dd>' +
                    '</dl>'
            },
            "item_select_4_popup": {
                'appendTop': '과일류 접수불가 품목선택 동의',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_1.jpg" alt=""></span>홍시</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_2.jpg" alt=""></span>포도</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_3.jpg" alt=""></span>딸기</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_4_4.jpg" alt=""></span>복숭아</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">우편법 제2조 3항에 규정되어 있는 서신 / 서류(예:편지, 서류) 등이 포함되어있는 경우, 창을 닫고 서신 / 서류 품목을 다시 선택하여 주십시오.</em></li>' +
                    '<li><em class="fc2">무른 과일은 접수금지 상품입니다.</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '<em class="fc1">&lt;접수불가 과일&gt;</em> 무른과일 : 포도/딸기/수박/복숭아/홍시/참외 등 <em class="fc1">쉽게 물러지는 과일</em>' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">접수불가품목 해당</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">접수 불가품목 해당 안됨</a>' +
                    '</div>'
            },

            "item_select_5_popup": {
                'appendTop': '곡물류 확인',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_1.jpg" alt=""></span>곡물류' +
                    '<br>박스포장</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_2.jpg" alt=""></span>곡물류' +
                    '<br>박스포장</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_3.jpg" alt=""></span>박스포장' +
                    '<br>안된 쌀</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_5_4.jpg" alt=""></span>마대포장' +
                    '<br>접수 불가</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">우편법 제2조 3항에 규정되어 있는 서신 / 서류(예:편지, 서류) 등이 포함되어있는 경우, 창을 닫고 서신 / 서류 품목을 다시 선택하여 주십시오.</em></li>' +
                    '<li>사진과 같은 상품(상단사진)은 <em class="fc2">절대접수 금지</em>이며 사고 시 <em class="fc2">사고 배상금액 산정에서 제외</em>됩니다.</li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '<em class="fc1">쌀 / 콩 / 조 등 곡물류는 최대 20kg</em> 까지만 접수 됩니다.' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">확인</a>' +
                    '</div>'
            },
            "item_select_6_popup": {
                'appendTop': '한약류 접수불가 품목선택 동의',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_1.jpg" alt=""></span>전용박스에' +
                    '<br>정상포장</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_2.jpg" alt=""></span>전용박스에' +
                    '<br>정상포장</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_3.jpg" alt=""></span>합포장 불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_6_4.jpg" alt=""></span>전용박스 이외' +
                    '<br>포장불량</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">우편법 제2조 3항에 규정되어 있는 서신 / 서류(예:편지, 서류) 등이 포함되어있는 경우, 창을 닫고 서신 / 서류 품목을 다시 선택하여 주십시오.</em></li>' +
                    '<li>한약류(과일즙)는 전용박스로 접수가능하며, 위와 같이 <em class="fc2">2박스 또는 다른 박스에 포장된 경우 집화 거부됨</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '한약류(과일즙:포도,배 등)는 <em class="fc1">전용박스</em>로 접수가 가능합니다.' +
                    '<br>' +
                    '<em class="fc1">단, 1박스씩 개별 포장되어 있어야 합니다.</em>' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">접수불가품목 해당</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">접수 불가품목 해당 안됨</a>' +
                    '</div>'
            },
            "item_select_7_popup": {
                'appendTop': '식품류 접수불가 품목선택 동의',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_1.jpg" alt=""></span>생선</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_2.jpg" alt=""></span>육류</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_3.jpg" alt=""></span>김치</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_7_4.jpg" alt=""></span>유리 꿀병</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">우편법 제2조 3항에 규정되어 있는 서신 / 서류(예:편지, 서류) 등이 포함되어있는 경우, 창을 닫고 서신 / 서류 품목을 다시 선택하여 주십시오.</em></li>' +
                    '<li><em class="fc2">하절기(6~10월)동안 김치</em>는 절대 접수 금지 품목입니다. 변질이 우려되는 <em class="fc2">떡/반찬류</em> 등 또한 하절기(6~10월) 절대 접수 금지 입니다.</li>' +
                    '<li><em class="fc2">생선, 육류, 유리 꿀병, 담근 술 (접수금지)</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '<em class="fc1">&lt;접수불가 식품&gt;</em> 변질우려가 높은 냉동/냉장식품' +
                    '<br> (단, 기온이 낮은 <em class="fc1">10월~3월 접수가능</em>)' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" role="button" id="btn-cancel">접수불가품목 해당</a>' +
                    '<a href="#" class="btnType1" role="button" id="btn-confirm">접수 불가품목 해당 안됨</a>' +
                    '</div>'
            },
            "item_select_8_popup": {
                'appendTop': '잡화/서적 파손면책 선택 동의',
                'appendCont':

                    '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_1.jpg" alt=""></span>귀금속</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_2.jpg" alt=""></span>액체류' +
                    '<br>(샴푸, 화장품류)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_3.jpg" alt=""></span>예술품</li>' +
                    '<li><span class="thum"><img src="../img/common/img_item_8_4.jpg" alt=""></span>낚시대, 골프채 등</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>이용불가상품</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li>유리류 / 사기류 / 아크릴제품 / 물품가액 100만원 이상 / 현금 / 신분증 / 여권 / 예술품 / 살아있는 동물 / 포장하지 않은 상품 / 한 변의 길이 1m초과 / 전체둘레 1.6m초과 / 액체류 / 중량 30kg 초과 등</li>' +
                    '</ul>' +
                    '</dd>' +
                    '<dt>주의사항</dt>' +
                    '<dd>' +
                    '<ul class="listType1">' +
                    '<li><em class="fc2">우편법 제2조 3항에 규정되어 있는 서신 / 서류(예:편지, 서류) 등이 포함되어있는 경우, 창을 닫고 서신 / 서류 품목을 다시 선택하여 주십시오.</em></li>' +
                    '</ul>' +
                    '</dd>' +
                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '완충제로 포장되어 있어야 하며, <em class="fc1">파손면책(택배사 책임 없음 인정)시<br>' +
                    '접수 가능</em>합니다. 파손면책에 동의하시겠습니까?' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" id="btn-cancel" role="button">동의하지 않음</a>' +
                    '<a href="#" class="btnType1" id="btn-confirm" role="button">동의함</a>' +
                    '</div>' +
                    '<dl class="addCont">' +
                    '<dt>파손면책이란?</dt>' +
                    '<dd>배송 중 포장부실로 인한 상품의 고장/파손에 대하여 택배사의 배상책임을 묻지 않겠다는 고객의 확인입니다.</dd>' +
                    '</dl>'
            },
            "item_select_9_popup": {
                'appendTop': '편의점 행사 상품 선택 동의',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="/img/common/img_item_1_2.jpg" alt=""></span>합포장</li>' +
                    '<li><span class="thum"><img src="/img/common/img_item_8_2.jpg" alt=""></span>액체류<br>(샴푸, 화장품류)</li>' +
                    '<li><span class="thum"><img src="/img/common/img_item_4_2.jpg" alt=""></span>포도</li>' +
                    '<li><span class="thum"><img src="/img/common/img_item_2_3.jpg" alt=""></span>유가증권<br>(상품권, 공연티켓)</li>' +
                    '</ul>' +
                    '<div class="noPd mt40">' +
                    '<div class="gBox">' +
                    '<dl class="noti">' +
                    '<dt>CU편의점에서 판매하는 명절 선물세트 구입 후 택배 접수 시에 한하여 적용됩니다.</dt>' +

                    '</dl>' +
                    '</div>' +
                    '</div>' +
                    '<p class="altTxt">' +
                    '상기 제품 이외에 <em class="fc1">파손 우려가 있는 유리 등의 </em>제품이 들어있습니까?' +
                    '</p>' +
                    '</div>' +
                    '<div class="btn_c col2">' +
                    '<a href="#" class="btnType2" id="btn-cancel" role="button">접수불가품목 해당</a>' +
                    '<a href="#" class="btnType1" id="btn-confirm" role="button">접수 불가품목 해당 안됨</a>' +
                    '</div>' +
                    '</div>'
            },
            "item_postal_act_popup": {
                'appendTop': '우편법 발췌',
                'appendCont': '<dl class="noti">' +
                    '<dt>우편법 제1조(목적)</dt>' +
                    '<dd>' +
                    '이 법은 우편 이용에 관한 기본적인 사항을 정하여 공평하고 적정한 우편 역무를 제공함으로써 공공의 복지증진에 이바지함을 목적으로 한다.<br>' +
                    '[전문개정 2011.12.2]' +
                    '</dd>' +
                    '<dt>우편법 제1조의2(정의)</dt>' +
                    '<dd>' +
                    '이 법에서 사용하는 용어의 뜻은 다음과 같다.' +
                    '<ol class="basic mt10">' +
                    '<li>"우편물"이란 통상우편물과 소포우편물을 말한다.</li>' +
                    '<li>"통상우편물"이란 서신(書信) 등 의사전달물, 통화(송금통지서를 포함한다) 및 소형포장우편물을 말한다.</li>' +
                    '<li>"소포우편물"이란 통상우편물 외의 물건을 포장한 우편물을 말한다.</li>' +
                    '<li>"우편요금"이란 우편물의 발송인이나 수취인이 그 송달의 대가로 우편관서에 내야 하는 금액을 말한다.</li>' +
                    '<li>"우표"란 우편요금의 선납과 우표수집 취미의 문화를 확산시키기 위하여 발행하는 증표를 말한다.</li>' +
                    '<li>"우편요금을 표시하는 증표"란 우편엽서, 항공서신, 우편요금 표시 인영(印影)이 인쇄된 봉투(연하장이나 인사장이 딸린 것을 포함한다)를 말한다.</li>' +
                    '<li>"서신"이란 의사전달을 위하여 특정인이나 특정 주소로 송부하는 것으로서 문자·기호·부호 또는 그림 등으로 표시한 유형의 문서 또는 전단을 말한다.<br>' +
                    '다만, 신문, 정기간행물, 서적, 상품안내서 등 대통령령으로 정하는 것은 제외한다.' +
                    '</li>' +
                    '</ol>' +
                    '[전문개정 2011.12.2]' +
                    '</dd>' +
                    '<dt>우편법 제2조(경영주체와 사업의 독점 등)</dt>' +
                    '<dd>' +
                    '<ol class="circle">' +
                    '<li>우편사업은 국가가 경영하며, 지식경제부장관이 관장한다. 다만, 지식경제부장관은 우편사업의 일부를 개인, 법인 또는 단체 등으로 하여금 경영하게 할 수 있으며, 그에 관한 사항은 따로 법률로 정한다.</li>' +
                    '<li>누구든지 제1항과 제5항의 경우 외에는 타인을 위한 서신의 송달 행위를 업(業)으로 하지 못하며, 자기의 조직이나 계통을 이용하여 타인의 서신을 전달하는 행위를 하여서는 아니 된다.</li>' +
                    '<li>제2항에도 불구하고 서신 (국가기관이나 지방자치단체에서 발송하는 등기취급 서신은 제외한다)의 중량이 350그램을 넘거나 우편요금이 대통령령으로 정하는 통상우편요금의 10배를 넘는 경우에는 타인을 위하여 서신을 송달하는 행위를 업으로 할 수 있다.</li>' +
                    '<li>누구든지 제2항을 위반하는 자에게 서신의 송달을 위탁하여서는 아니 된다.</li>' +
                    '<li>우편사업이나 우편창구업무의 위탁에 관한 사항은 따로 법률로 정한다.<br>다만, 지식경제부장관은 우편창구업무 외의 우편업무의 일부를 대통령령으로 정하는 바에 따라 다른 자에게 위탁할 수 있다.</li>' +
                    '</ol>' +
                    '[전문개정 2011.12.2]' +
                    '</dd>' +
                    '<dt>우편법 제2조의2(서신송달업자의 신고 등)</dt>' +
                    '<dd>' +
                    '<ol class="circle">' +
                    '<li>제2조제3항에 따라 서신을 송달하는 업(이하 "서신송달업"이라 한다)을 하려는 자는 지식경제부령으로 정하는 바에 따라 지식경제부장관에게 신고하여야 한다.</li>' +
                    '<li>제1항에 따른 신고를 하려는 자는 해당 신고서에 지식경제부령으로 정하는 사업계획서를 첨부하여 지식경제부장관에게 제출하여야 한다.</li>' +
                    '<li>지식경제부장관은 제1항에 따라 서신송달업의 신고를 한 자(이하 "서신송달업자"라 한다)에게 다음 각 호의 사항에 관련된 자료 제출을 요구할 수 있다.' +
                    '<ol class="basic">' +
                    '<li>서신의 취급물량, 매출액, 중량 및 요금 등 사업운영에 관한 사항</li>' +
                    '<li>영업소, 대리점 및 작업장 등 시설에 관한 사항</li>' +
                    '<li>그 밖에 서신송달업자의 지도·지원을 위하여 필요한 사항</li>' +
                    '</ol>' +
                    '</li>' +
                    '</ol>' +
                    '</dd>' +
                    '</dl>'
            }
        };

        var oPackPop = {
            "packaging_1_popup": {
                'appendTop': '김치류 접수안내',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 김치/식품류 포장 예시</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_1_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '김장용 비닐로 2중 포장 후 아이스박스에 흔들리지 않도록 포장.<br>' +
                    '상기와 같이 포장이 되지 않을 경우 <em class="fc1">택배기사 수거 시 집화 거부</em>될 수 있음.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. 접수금지 상품</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_1.png" alt=""></span>생선</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_2.png" alt=""></span>육류</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_3.png" alt=""></span>유리병꿀</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_1_2_4.png" alt=""></span>담근 술</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">생선, 육류, 유리병꿀, 담근 술은 접수 금지입니다.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'
            },
            "packaging_2_popup": {
                'appendTop': '한약류 접수안내',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 한약류 포장 예시</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_2_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '한약류(과일즙 : 포도, 배 등)는 <em class="fc1">전용박스</em>로 접수가능합니다.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. 접수금지 상품</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_1.png" alt=""></span>합포장 불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_2.png" alt=""></span>합포장 불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_3.png" alt=""></span>전용박스 이외 포장불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_2_2_4.png" alt=""></span>전용박스 이외 포장불량</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">2박스 합하여 포장 또는 전용박스 이외의 포장된 경우 집화거부됨.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'

            },
            "packaging_3_popup": {
                'appendTop': '가전제품류 접수안내',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 가전제품류 포장 예시</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_3_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">스티로폼 박스</em>에 흔들리지 않도록 견고하게 포장되어야 함.<br>' +
                    '상기와 같이 포장이 되지 않을 경우 <em class="fc1">택배기사 수거 시 집화 거부</em>될 수 있음.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. 포장불량 상품</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_1.png" alt=""></span>내품 고정되지 않음</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_2.png" alt=""></span>내품 고정되지 않음</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_3.png" alt=""></span>내품 완충 불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_4.png" alt=""></span>내품 완충 불량</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">내품 완충이 불량한 경우 집화 거부됩니다.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'

            },
            "packaging_4_popup": {
                'appendTop': '가전제품류 접수안내',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 중고 컴퓨터 포장 예시</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_4_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">스티로폼 박스</em>에 흔들리지 않도록 견고하게 포장되어야 함.<br>' +
                    '상기와 같이 포장이 되지 않을 경우 <em class="fc1">택배기사 수거 시 집화 거부</em>될 수 있음.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. 포장불량 상품</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_1.png" alt=""></span>내품 고정되지 않음</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_2.png" alt=""></span>내품 고정되지 않음</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_3.png" alt=""></span>내품 완충 불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_3_2_4.png" alt=""></span>내품 완충 불량</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">내품 완충이 불량한 경우 집화 거부됩니다.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'

            },
            "packaging_5_popup": {
                'appendTop': '01. 과일류 포장 예시',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 과일류 포장 예시</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_5_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">딱딱한 과일</em>만 접수 가능하며 견고하게 포장되어야 함.<br>' +
                    '상기와 같이 포장이 되지 않을 경우 <em class="fc1">택배기사 수거 시 집화 거부</em>될 수 있음.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. 포장불량 상품</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_1.png" alt=""></span>홍시</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_2.png" alt=""></span>포도</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_3.png" alt=""></span>제주감귤</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_5_2_4.png" alt=""></span>참외</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">무른 과일은 접수금지 상품입니다.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'
            },
            "packaging_7_popup": {
                'appendTop': '기타/잡화류 접수안내',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 기타/잡화류 포장 예시</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_6_1.jpg" alt=""></span>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. 접수금지 상품</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_1.png" alt=""></span>유리상품 류<br>(양주, 꿀 등)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_2.png" alt=""></span>액체류</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_3.png" alt=""></span>내품 완충 불량</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_4.png" alt=""></span>귀금속 류</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_5.png" alt=""></span>예술품</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_6.png" alt=""></span>낚시대 류</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_6_2_7.png" alt=""></span>운송장 크기보다<br> 작은 상품</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">위와 같은 상품은 집화하지 않습니다.</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'
            },
            "packaging_8_popup": {
                'appendTop': '서신,서류 접수안내',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<ol>' +
                    '<li>' +
                    '<strong class="tit">01. 서신서류 포장 예시</strong>' +
                    '<span class="thum"><img src="../img/common/img_packaging_pop_7_1.jpg" alt=""></span>' +
                    '<p class="mt20">' +
                    '<em class="fc1">에어캡이 붙어있는 대봉투</em>에 포장, 혹은 일반 대봉투에 포장해 주시기 바랍니다.' +
                    '</p>' +
                    '</li>' +
                    '<li>' +
                    '<strong class="tit">02. 접수금지 상품</strong>' +
                    '<ul class="ulType1">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_1.png" alt=""></span>현금</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_2.png" alt=""></span>편지봉투</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_3.png" alt=""></span>상품권</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_7_2_4.png" alt=""></span>여권</li>' +
                    '</ul>' +
                    '</li>' +
                    '</ol>' +
                    '<p class="altTxt fc1">현금, 편지봉투, 유가증권(상품권, 공연티켓), 신분증, 여권 접수불가</p>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'
            },
            "packaging_10_popup": {
                'appendTop': '의류 접수안내',
                'appendCont': '<div class="packagingpopBlock">' +
                    '<p class="tit">다음과 같이 <em class="fc1">포장이 부실한 경우</em>는 수거하지 않습니다.</p>' +
                    '<ul  class="ulType2">' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_1.jpg" alt=""></span>박스 포장 안된 캐리어</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_2.jpg" alt=""></span>합포장 불가<br>(박스두개를 테잎으로 합친 형태)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_3.jpg" alt=""></span>내품이 보임 (박스포장 불량)</li>' +
                    '<li><span class="thum"><img src="../img/common/img_packaging_pop_8_4.jpg" alt=""></span>내품이 보임(투명비닐 포장)</li>' +
                    '</ul>' +
                    '</div>' +
                    '<div class="btn_c">' +
                    '<a href="#" class="btnType1" role="button">확인</a>' +
                    '</div>'
            },

        }

        if (options.id.match('item')) {
            oPopCont = oItemPop[options.id];
        } else if (options.id.match('packaging')) {
            oPopCont = oPackPop[options.id];
        }
        // dimmed 값 초기화 
        $('.dimmed').remove();
        //팝업 호출 
        if (oPopCont != undefined) {
            createLayerPopup({
                wrapper: '#ux-popup',
                templateId: options.id,
                appendTop: oPopCont.appendTop,
                appendCont: oPopCont.appendCont

            });
        }

        var $popup = $('#' + options.id).show();
        //포커스 빠져 나갈 경우 
        // 팝업 포커싱 접근성
        var elmLastFocus = $(document).find(':focus');
        var triggerLastFocus;
        if (options.lastFocus != undefined && options.lastFocus.length > 0) {
            focusOutClosePop(options.lastFocus);
            triggerLastFocus = options.lastFocus;
        }else if( elmLastFocus != undefined && elmLastFocus.length>0){
            focusOutClosePop(elmLastFocus);
            triggerLastFocus  = elmLastFocus;
        }

        //접근성 포커스 순서 지정 
        $('#' + options.id).find(".popTop").attr("tabindex", 0).focus();
//        var focusElm = commonJs.findFocusElements($('#' + options.id));
//
//        $(focusElm).not('.popClose').each(function(idx) {
//            $(this).attr('tabindex', idx + 1);
//        });
//        $(focusElm).filter('.popClose').attr('tabindex', focusElm.length);

        // .btn_c이 마지막 노드 일 경우 padding bottom 지정 
        var oPopCont = $('#' + options.id).find(".popCont");
        var oBtn = oPopCont.find(".btn_c");
        if (oBtn.next().length <= 0 && oBtn.length > 0) {
            oBtn.addClass("changed");
            oPopCont.addClass("changed");
        } else {
            oBtn.removeClass("changed");
            oPopCont.removeClass("changed");
        }

        //팝업 공통 닫기 
        $popup.find('.btnType2').off('click');
        $popup.find('.btnType2').on('click', function(ev) {
        	ev.preventDefault();
            if (popLength > 0 && options.parentPop != undefined) {
                options.parentPop.show();
            }            
            closePopup();
        });
        //취소 버튼 
        $popup.find('.popClose').off('click');
        $popup.find('.popClose').on('click', function(ev) {
            ev.preventDefault();
            if (popLength > 0 && options.parentPop != undefined ) {
                options.parentPop.show();
            }
            closePopup();
        });
        //dimmed 생성
        $popup.after("<div class='dimmed'></div>");
        
        // 팝업 옵션값 설정 
        $.popup.popups.push({
            $target: $popup,
            onOpen: options.onOpen,
            onClose: options.onClose,
            $lastFocus: triggerLastFocus,
            parentPop:options.parentPop,
        });

        // 팝업 옵션 이벤트 호출        
        options.onOpen.call($popup.get(0));

        var $img = $('#' + options.id).find('img'),
            imgLen = $img.length,
            count = 0;

        //팝업 가운데 정렬 
        if (imgLen > 0) {
            $img.one('load', function() {
                count += 1;
                if (count === imgLen) {
                    // reposition
                    repositionPopup();
                }
            }).each(function() {
                if (this.complete) {
                    $(this).trigger('load');
                }
            });
        } else {
            repositionPopup();
        }

    }


    // 팝업 닫기 
    function getTopPopup() {
        return $.popup.popups[$.popup.popups.length - 1];
    }

    function closePopup() {
        var oPopup = getTopPopup();
        //팝업 열려 있을 경우 
        if (oPopup) {
            //팝업 삭제 호출
            oPopup.onClose.call(oPopup.$target.get(0), removePopup);
        }

    }


    function removePopup() {
        // 모바일 화면 해상도
        $("body").removeAttr('style');
        var count = $.popup.popups.length;
        var popup;

        //팝업이 열려 있을 경우
        if (count > 0) {
            //팝업 옵션값 삭제 
            popup = $.popup.popups.pop();

            //팝업 삭제 
            popup.$target.hide();

            // 마지막 레이아웃에서 dimmed 삭제 
            if (count == 1) {
                $('.dimmed').remove();
            }

            //마지막 포커스로 이동 
            if (popup.$lastFocus!= undefined && popup.$lastFocus.length > 0) {
                popup.$lastFocus.trigger('focus');
            }
            
            // 2017.04.26 팝업 포커스
            if(commonJs.saveTarget.length > 0) {
                commonJs.firstTargetFocus(commonJs.saveTarget.pop());
                
            }

        }

    }
    // 팝업 가운데 정렬 (스크롤 생성시, LayerPopWrap w숫자 로 설정된 팝업 정렬 )
    function repositionPopup() {
        $(".LayerPopWrap .popCont").removeAttr('style');
        //기존 width 


        var docHeight = $(window).height();
        var innerPopHeight = docHeight - 101;
        $(".LayerPopWrap").each(function() {
            var popHeight = $(this).height();
            if (docHeight < popHeight) {
                $(this).css({ "width": "620px", "marginLeft": "-310px" });
                $(this).find(".popCont").css({
                    "overflow-y": "auto",
                    "overflow-x": "hidden",
                    height: innerPopHeight
                });
            } else {
                $(this).css({ "width": "600px", "marginLeft": "-300px" });
            }

            //특이케이스 LayerPopWrap w
            if ($(this).attr("class").indexOf("LayerPopWrap w") >= 0) {
                $(".LayerPopWrap").css({ "width": "", "marginLeft": "" });
            }

            $.util.center(this);
        });
    }


    function setCalendar() {
        var doc = $(document);
        var calendar = doc.find('span.calendar');

        if (!calendar.length) {
            return;
        }

        function addZero(n) {
            return (String(n).length < 2) ? '0' + n : n;
        }

        var curD = new Date();
        var stD = new Date(Date.parse(curD) - 30 * 1000 * 60 * 60 * 24);
        var endD = new Date(Date.parse(curD) + 30 * 1000 * 60 * 60 * 24);

        var option = {
            //start     : { year : stD.getFullYear(), month : stD.getMonth()+1, day : stD.getDate() },      //달력 시작일
            //current : { year : curD.getFullYear(), month : curD.getMonth()+1, day : curD.getDate() }, //달력 현재일
            //end   : { year : endD.getFullYear(), month : endD.getMonth()+1, day : endD.getDate() }    //달력 마지막
        };

        $.fn.getCalrendar = function() {
            return this.data('calrendar');
        };

        //ex.) $('div.calendar:eq(0)').selectDate({year:2015,month:5,day:10});
        $.fn.selectDate = function(opt) {
            //this.data('calrendar').setDate(opt);
            //$(this).children('input').attr('value',opt.year+'.'+addZero( opt.month )+'.'+addZero( opt.day ));
            //return true;
        };

        //ex.) $('div.calendar:eq(0)').getDate();
        /*
        $.fn.getDate = function()
        {
            return $(this).children('input').attr('placeholder');
        };
        */
        /*
        ex.) 
        $('div.calendar:eq(0)').setup({
            start   : { year:2016, month:1,  day:1  },
            end     : { year:2016, month:12, day:31 },
            today   : { year:2016, month:5,  day:1  },
            date    : { year:2016, month:5,  day:8  }
        });
        */

        $.fn.setup = function(opt) {

            var d = this.data('calrendar');
            if (opt.start) {
                d.setStartDay(opt.start);
            }
            if (opt.end) {
                d.setEndDay(opt.end);
            }
            if (opt.today) {
                d.setToday(opt.today);
            }
            if (opt.date) {
                d.setDate(opt.date);
                $(this).children('input').attr('value', opt.date.year + '.' + addZero(opt.date.month) + '.' + addZero(opt.date.day));
            }
        };

        calendar.each(function(idx) {
            var cal = $(this);
            var mIndex = cal.css('z-index');
            var box = cal.children('div.calBox');

            var calObj = box.calendarInit({
                //target : box.children('.calTop'),
                year: box.find('.year'), // 달표시
                month: box.find('.month'), // 월표시
                start: option.start, //달력 시작일
                current: option.current, //달력 현재일
                end: option.end //달력 마지막
            });

            cal.data('calrendar', calObj);
            calObj.setVisible(false);

            var input = cal.children('input');
            //input.attr('value',option.current.year+'.'+addZero( option.current.month )+'.'+addZero( option.current.day ));
            calObj.calrendarClose = function() {
                cal.css('z-index', 1);
                this.setVisible(false);
            };
            calObj.calrendarOpen = function() {
                cal.css('z-index', 1000);
                this.setVisible(true);
            };

            calObj.bind(calObj.EVENTS.SELECT, function(evt, date) {
                input.attr('value', date.year + '.' + addZero(date.month) + '.' + addZero(date.day));
            });
            calObj.bind(calObj.EVENTS.FOCUSOUT, function(evt) {
                $(evt.target).parent().removeClass('on');
            });

            //$('.dateSearch>spna:eq(0)').on
            //$('.dateSearch>span:eq(0)').on('click', function(evt) 
            cal.children('a').on('click', function(evt) {
                calendar.css('z-index', 1);
                cal.siblings(".calendar").removeClass("on");
                calendar.find(".calBox").hide();
                cal.css('z-index', 1000);
                cal.toggleClass('on');
                /*
                $.each( calendar , function( idx , value) 
                {
                    if( $(value).data('calrendar') )
                    {
                        $(value).data('calrendar').setVisible( false );
                    }
                });
                */
                calendarFocus(cal.parent());
                //calObj.setVisible(true);

                /*
                if(getVersion()){
                    //fixed, 가운데정렬
                    box.css({
                        'position':'fixed',
                        'top':(commonJs.HEIGHT-box.outerHeight(true))/2+'px',
                        'width':'94%',
                        'left':'3%'
                    });
                }else{
                    //하위버전 카렌더 인풋 박스 마스크 뒤로 이동
                    cal.css('z-index',999);
                }
                */
                cal.css('z-index', 999);
                //setMask(box);
                evt.preventDefault();
            });


            function calendarFocus(target) {
//                target.children('.calBox').css({
//                    'display': 'block'
//                });
            	
            	$(".dateSearch .calendar.on .calBox").show();
                var position = target.children('.calendar').offset();
                //target.children('.calendar').addClass('on');
                // $('html,body').animate({scrollTop:position.top}, 300);
            }

            var top = box.children('div.calTop');

            top.children('.first').on('click', function(evt) {
                evt.preventDefault();
                calObj.first();
            });
            top.children('.prev').on('click', function(evt) {
                evt.preventDefault();
                calObj.prev();
            });
            top.children('.next').on('click', function(evt) {
                evt.preventDefault();
                calObj.next();
            });
            top.children('.end').on('click', function(evt) {
                evt.preventDefault();
                calObj.end();
            });

            // 하단 버튼 영역
            var btn = box.children('div.btn');
            btn.children('button.close').on('click', function(evt) {
                cal.removeClass('on');
                calObj.setVisible(false);
                //clearMask();
            });
            btn.children('button.today').on('click', function(evt) {
                calObj.today();
            });
        });

        // 전체변경
        // $('div.calendar:eq(0)').getCalrendar().setup({
        //      start   : { year : 2015 , month : 1, day : 1 }, 
        //      current : { year : 2016 , month : 4, day : 6 },
        //      end     : { year : 2017 , month : 8, day : 1 }  
        // });
        // 단일값 변경
        //$('div.calendar:eq(0)').getCalrendar().setToday(
        //  {
        //      year : 2016 , month : 4, day : 3 
        //  }
        //);
        // 단일 달력 접근
        //$('div.calendar:eq(0)').getCalrendar().calrendarOpen();       // 열기
        //$('div.calendar:eq(0)').getCalrendar().calrendarClose();      // 닫기
    }

    $(document).ready(function() {
    	// 한형 주임님 요청 사항 - 웹로그 분석 시작 
        var referrer =  document.referrer;
    	var naver = "search.naver.com";
    	var daum = "search.daum.net";
    	
    	if(referrer.indexOf(naver) > 0 || referrer.indexOf(daum) > 0){
    		setCookie("event0424","1",1);
    	}
    	// 한형 주임님 요청 사항 - 웹로그 분석 끝 
    	
        //달력 설정
        setCalendar();

        //GNB 메뉴 호출
        $.GNB.init();

        //팝업 리사이징 
        $(window).on('resize', function() {
            repositionPopup();
        });
        $doc.on('keydown', function(ev) {
            // ESC === 27
            if ((ev || win.event).keyCode === 27) {
                closePopup();
            }
        });
        //메뉴 하단 
        $(".footMenu>.selType1>a").on("click", function(ev) {
            ev.preventDefault();
            $(this).next("ul").toggle();
            bottomTitle();
        });
        $(".footMenu>.selType1>ul>li").on("click", function() {
            $(this).closest("ul").toggle();
            bottomTitle();
        });




        function ruleFocus(obj, closeElm) {        	
            var elm = commonJs.findFocusElements(obj),
                firstElm, lastElm;

            if (elm.length > 0) {
                firstElm = $(elm).first();
                lastElm = $(elm).last();
                firstElm = $(elm).first();
                lastElm = $(elm).last();
                firstElm.off("keydown").on("keydown", function(ev) {
                    // back space event
                    if (ev.shiftKey == true && ev.keyCode == 9) {
                        closeElm.hide();
                    }
                });

                lastElm.off("keydown").on("keydown", function(ev) {
                    // tab event
                    if (ev.keyCode == 9) {
                        closeElm.hide();
                    }
                });
            } else {
                obj.off("keydown").on("keydown", function(ev) {
                    // back space event
                    if (ev.shiftKey == true && ev.keyCode == 9) {
                        closeElm.hide();
                    }
                });
            }

        }
        // 웹 접근성 포커스 아웃 될경우 닫힘 
        $(".selType1>a").eq(0).off("keydown").on("keydown", function(ev) {
            ruleFocus($(".selType1>a").eq(0), $(this).next("ul"));
            ruleFocus($(".selType1").eq(0).find("ul>li"), $(this).next("ul"));
        });

        
        $(".tableType1 .selType1 ul>li>a").on("click", function(ev) {
            ev.preventDefault();

            var prodStr = $(this).parent().text();
            var prodIndex = $(this).parent().index();
            var lastFocus = $(this).closest("ul").prev("a");

            var popupId = "item_select_" + prodIndex + "_popup";
            if (prodStr !== "품목선택") {
                $.popup('open', {
                    id: popupId,
                    onOpen: function() {
                        var popId = $("#" + popupId);
                        var focusIdx = 0;

                        popId.find('.btnType2').off().on('click', function(ev) {
                            ev.preventDefault();
                            alert('접수 불가품목이 포함되거나 파손면책 미동의 시 물품을 발송할 수 없습니다.');
                            lastFocus.focus();
                            $.popup('close');
                        });

                        popId.find('.btnType1').off().on('click', function(ev) {
                            ev.preventDefault();
                            $(".tableType1 .selType1").find('a').eq(0).text(prodStr);
                            $.popup('close');
                            $("#label_price").focus();
                        });

                        popId.find('.icoSearch').off().on('click', function(ev) {
                            ev.preventDefault();
                            $.popup('open', {
                                id: 'item_postal_act_popup',
                                parentPop: popId,
                                lastFocus: $(this)
                            });
                        });
                    },
                    lastFocus: lastFocus

                });
            }
        });

        //포장안내 팝업 호출
        $(".packagingBlock2>ul>li").find(".btnType3").off("click").on("click", function(ev) {
            ev.preventDefault();
            var prodIndex = $(this).closest('li').index() + 1;

            var popupId = "packaging_" + prodIndex + "_popup";
            $.popup('open', {
                id: popupId,
                onOpen: function() {
                    $("#" + popupId).find('.btnType1').off('click');
                    $("#" + popupId).find('.btnType1').on('click', function(ev) {
                        ev.preventDefault();
                        $.popup('close');
                    });
                }

            });
        });

        //아코디언 메뉴 클릭
        $(".arcodian .accorTit").off("click").on("click", function(ev) {
            ev.preventDefault();
            var currentVal = $(this).closest("li");

            if (currentVal.hasClass("open")) {
                currentVal.removeClass("open");
                $(this).next().hide();
            } else {
                $(".arcodian").find("li").removeClass("open");
                $(".arcodian").find("li > div").hide();
                currentVal.addClass("open");
                $(this).next().show();
            }
        });

        //인풋박스 체크될 경우 디자인 변경
        $('input[type="radio"], input[type="checkbox"]').each(function() {
            if ($(this).attr('checked')) {
                $(this).closest('.formWrap').addClass('on');
                $(this).attr('checked', true);
            }
        });

        $doc.on('change', 'input[type="radio"], input[type="checkbox"]', function() {
            var type = $(this).attr("type");
            var idx = $('input[type="' + type + '"]').index(this);
            var bChked = $(this).is(":checked");
            commonJs.checkBoxCall(type, idx, bChked);
        });

        // 물품 검색 팝업 
        $('div.selMap').each(function() {
            var arr = [];
            /* ㄱ */
            arr[0] = '';
            /* ㄴ */
            arr[1] = '.state23';
            /* ㄷ */
            arr[2] = '.state25';
            /* ㄹ */
            arr[3] = '.state22';
            /* ㅁ */
            arr[4] = '.state02 , .state03 , .state10';
            /* ㅂ */
            arr[5] = '.state04 , .state11 , .state12 , state17';
            /* ㅅ */
            arr[6] = '.state20 , .state21';
            /* ㅇ */
            arr[7] = '.state27,.state18,.state15,.state13,.state06';
            /* ㅈ */
            arr[8] = '.state14';
            /* ㅊ */
            arr[9] = '.state05';
            /* ㅋ */
            arr[10] = '.state01 , .state19';
            /* ㅌ */
            arr[11] = '.state08';
            /* ㅍ */
            arr[12] = '.state07 , .state16 , .state24 , .state26';
            /* ㅎ */
            arr[13] = '.state09';
            /* 그외 */
            arr[14] = '';

            var sel = $(this).children('a');
            var map = $('.mapBox>a');
            sel.on('click', function() {
                map.show();
                tool.hide();
                //메뉴 클래스 활성화 
                $(this).addClass("on").siblings().removeClass("on");
                $(this).attr("title", "선택됨").siblings().attr("title", "선택안됨");
                $(this).attr("tabindex", 0).focus();
                $('div.fr>p').show();

                var n = $(this).index();
                if (n > 0) {
                    map.not(arr[n - 1]).hide();
                }
                if (n == (sel.length - 1)) {
                    $('div.fr>p').hide();
                    tool.hide();
                    tool.eq(tool.length - 1).show();
                }
            });
            var tool = $('div.fr>dl');
            map.on('click', function() {
                $('div.fr>p').hide();
                map.removeClass('on');
                $(this).addClass('on');
                tool.hide();
                tool.eq($(this).index()).show();
            });
        });


        /**
         * 편의점 택배 슬라이드
         */
        var animateSp = 400;

        function openBox(handle, callback) {
            var $button = null,
                $visualWrap = null,
                visualWidth = 0,
                buttonOpt = null;

            if (handle === 'fr') {
                $button = $('.mainBox02 .sect01 .fr');
                $visualWrap = $('.mainBox02 > .sect03');
                buttonOpt = {
                    position: 'absolute',
                    top: 0,
                    right: 0
                };
            } else if (handle === 'fl') {
                $button = $('.mainBox02 .sect01 .fl');
                $visualWrap = $('.mainBox02 > .sect02');
                buttonOpt = {
                    position: 'absolute',
                    top: 0,
                    left: 0
                };
            }

            visualWidth = $visualWrap.children().width() + parseInt($visualWrap.children().css('margin-left'), 10);

            // 버튼
            $button.css(buttonOpt).stop(true, false).animate({
                width: visualWidth + 'px'
            }, {
                duration: animateSp,
                complete: function() {
                    $visualWrap.removeAttr('style').css({
                        position: 'absolute',
                        top: 0,
                        left: 0,
                        width: '100%'
                    }).hide().stop(true, false).fadeIn({
                        complete: function() {
                            $button.removeAttr('style');
                            //focus
                            $visualWrap.find(".irCont").focus();
                            $('.mainBox02 .sect01').hide();
                        }
                    });

                    if (typeof callback === 'function') {
                        callback();
                    }
                }


            });
        }

        function closeBox(handle, callback) {
            var $button = null,
                $visualWrap = null,
                boxLeft = 0;

            if (handle === 'fr') {
                $button = $('.mainBox02 .sect01 .fr');
                $visualWrap = $('.mainBox02 > .sect03');
                boxLeft = 580;
            } else if (handle === 'fl') {
                $button = $('.mainBox02 .sect01 .fl');
                $visualWrap = $('.mainBox02 > .sect02');
                boxLeft = -580
            }

            // 비주얼 이미지
            $visualWrap.css({
                display: 'block',
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%'
            }).stop(true, false).animate({
                left: boxLeft + 'px'
            }, {
                complete: function() {
                    $(this).stop(true, false).fadeOut({
                        queue: true,
                        complete: function() {
                            $(this).removeAttr('style').hide();
                            //focus
                            if(handle === "fr"){
                            	$(".sect01").find(".fr a").focus();
                            }else if(handle === "fl"){
                            	$(".sect01").find(".fl a").focus();
                            } 
                        }
                    });

                    if (typeof callback === 'function') {
                        callback();
                    }
                }
            });

            $button.fadeIn();
        }

        function changeBox(handle) {
            var $newBox = null,
                $oldBox = null,
                $guide = null,
                guideWidth = 0,
                boxWidth = 0,
                boxBg = null,
                dummyOpts = {
                    position: 'absolute',
                    top: 0,
                    height: '100%',
                    zIndex: 2
                };

            if (handle === 'fr') {
                $newBox = $('.mainBox02 .sect03');
                $oldBox = $('.mainBox02 .sect02');
                $guide = $newBox.find('.guide02');
                boxBg = '#7b4cd3';
                dummyOpts.right = 0;
            } else if (handle === 'fl') {
                $newBox = $('.mainBox02 .sect02');
                $oldBox = $('.mainBox02 .sect03');
                $guide = $newBox.find('.guide01');
                boxBg = '#f8f9fe';
                dummyOpts.left = 0;
            }

            $newBox.show().css('visibility', 'hidden');
            boxWidth = handle === 'fr' ? -parseInt($guide.width(), 10) : parseInt($guide.width(), 10);
            guideWidth = $guide.width() + parseInt($guide.css('margin-left'), 10)

            dummyOpts.width = guideWidth + 'px';
            dummyOpts.background = boxBg;

            // 더미 bg 적용
            $('.mainBox02').append($('<div class="dummyBg"/>').css(dummyOpts));

            $newBox.css({
                visibility: 'visible',
                display: 'none',
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%',
                zIndex: 3
            });

            $oldBox.css({
                display: 'block',
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%',
                zIndex: 3
            }).stop(true, false).animate({
                left: boxWidth + 'px'
            }, {
                duration: animateSp,
                complete: function() {
                    // 스타일 제거 필요
                    $oldBox.fadeOut({
                        queue: false,
                        duration: animateSp
                    });
                    $newBox.fadeIn(animateSp);
                    $newBox.promise().done(function() {
                        $('.dummyBg').remove();
                        //focus
                        $newBox.find(".irCont").focus();
                    });
                }
            });
        }

        $(".mainBox02 .sect01 span a").on("click", function(ev) {
            ev.preventDefault();
            if ($('.mainBox02 > div').is(':animated')) {
                return;
            }
            if ($(this).parent().hasClass("fl")) {
                $('.sect02').show().css({
                    visibility: 'hidden'
                });
                openBox('fl');
            } else {
                $('.sect03').show().css({
                    visibility: 'hidden'
                });
                openBox('fr');
            }
        });

        $(".mainBox02 .sect02 span a").on("click", function(ev) {
            ev.preventDefault();
            if ($('.mainBox02 > div').is(':animated')) {
                return;
            }
            if ($(this).hasClass("fl")) {
                $(".sect01").show();
                closeBox('fl');
            } else {
                changeBox('fr')

            }
        });

        $(".mainBox02 .sect03 span a").on("click", function(ev) {
            ev.preventDefault();
            if ($('.mainBox02 > div').is(':animated')) {
                return;
            }
            if ($(this).hasClass("fl")) {
                changeBox('fl')
            } else {
                $('.sect01').show();
                closeBox('fr');
            }
        });
        // 메인 편의점 택배

        //본문보기 클릭시 포커스 이동 
        // $(".accessbility a").on("keydown", function(ev) {
        //     if (ev.keyCode == 13) {
        //         $("header").find("a").eq(0).focus();
        //     }
        // })


        //메인 배너 
        var img_slider_lock,
            img_nav,
            img_banner,
            timerSlider,
            nextIdx,
            img_slider_index = 1,
            img_slider_num = $('.rollingList>li').length;


        //처음 배너 설정 
        $('.rollingList>li:first-child').addClass('on');

        // 배너 자동 이동 
        // 배너 이미지가 1개 이상일때만 동작
        if(img_slider_num > 1){
        	timerSlider = setInterval(rolling, 10000);
        }

        

        function rolling(idx) {
            img_nav = $('.controlBox .playBox >ul>li.on');
            img_banner = $(".rollingList>li.on");
            if (img_slider_lock == true || idx == img_nav.index()) return;
            img_slider_lock = true;
            if (idx != undefined) {
                img_slider_index = idx;
            }
            nextIdx = img_slider_index + 1;

            $(".rollingList>li:nth-of-type(" + nextIdx + ")").addClass("next");

            $(img_nav).removeClass("on");
            $(".controlBox .playBox >ul>li:nth-of-type(" + nextIdx + ")").addClass("on");
            $(img_banner).clearQueue().stop().animate({
                width: 0
            }, 1000, function() {
                $(this).removeClass('on').css('width', '');

                $(this).parent().find('.next').addClass('on');
                $(this).parent().find('.next').removeClass('next');

                img_slider_index++;
                if (img_slider_index == img_slider_num) {
                    img_slider_index = 0;
                }

                img_slider_lock = false;
            });
        }
        

        //배너 네비게이션 시작/중지
        $('.playBox>a').off('click');
        $('.playBox>a').on('click', function(ev) {
            ev.preventDefault();
            if ($(this).hasClass('play')) {
                $(this).css('display', 'none');
                $(this).siblings(".stop").css('display', '');
                clearInterval(timerSlider);
                timerSlider = null;
            } else {
                $(this).addClass('on');
                $(this).css('display', 'none');
                $(this).siblings(".play").css('display', '');
                
                //배너 이미지가 1개 이상일때만 동작
                if(img_slider_num > 1){
                	timerSlider = setInterval(rolling, 10000);
                }
            }
        });

        // 배너 클릭
        $('.playBox>ul>li>a').off("click");
        $('.playBox>ul>li>a').on("click", function(ev) {
            ev.preventDefault();
            var sliderIdx = $(this).closest("li").index();
            rolling(sliderIdx);
        })

        // 햄버거 버튼 클릭
        function showTMenu() {
            $(".totalMenu .tMenuBox").show();
            $(".totalMenu .tMenuBox").next(".dimmed").show();
        }

        function hideTMenu() {
            $(".totalMenu .tMenuBox").hide();
            $(".totalMenu .tMenuBox").next(".dimmed").hide();
        }
        $("nav .totalMenu .btnOpen").off("click").on("click", function() {
            showTMenu();
            $(".tMenuBox").find("a").eq(0).focus();
            commonJs.saveTop = $(window).scrollTop();
            $('body').css({
                position: 'fixed',
                top: -commonJs.saveTop + 'px'
            });
        });
        $("nav .totalMenu .close").off().on("click", function(ev) {
            ev.preventDefault();
            hideTMenu();
            $('body').css({
                position: '',
                top: ''
            });
            $(window).scrollTop(commonJs.saveTop);
        });


        //focus 접근성 
        $(".tMenuBox dd").find("a").eq(0).off().on('keydown', function(ev) {
            // back space event
            if (ev.shiftKey == true && ev.keyCode == 9) {
                hideTMenu();
                $("nav .totalMenu .btnOpen").focus();
                ev.preventDefault();
            }
        });

        $(".totalMenu .close").on('keydown', function(ev) {
            if (ev.keyCode == 9) {
                hideTMenu();
            }
        });

        // 리스트 탭 클릭
        // 리스트 탭 활성화 될 경우 뒤에 배경 링크 방지 
        function blockLink() {
            $(".rollingList li a").off().on("click", function(ev) {
                ev.preventDefault();
            })
        }
        $(".controlList li>a").off("click");
        $(".controlList li>a").on("click", function(ev) {
            $(this).closest("li").toggleClass("on").siblings("li").removeClass("on");

            if ($(this).closest("li").hasClass("on")) {
                blockLink();
            } else {
                $(".rollingList li a").off("click");
            }
        });

        //focus 접근성 
        $(".controlList li .inBox").each(function(idx) {
            var elmFirst = $(this).find("a").eq(0);
            elmFirst.off().on('keydown', function(ev) {
                // back space event
                if (ev.shiftKey == true && ev.keyCode == 9) {
                    $(this).closest("li").removeClass("on");
                }
            });

            //편의점 택배 보내기 
            if (idx == 0) {
                var elmNext = $(this).find("a.btnType4.type2");
                var toggleMenu = $(".controlList li .inBox").eq(0).find(".addBox");
                elmNext.off().on('keydown', function(ev) {
                    // next event
                    if (ev.keyCode == 9) {
                        toggleMenu.eq(0).hide();
                        toggleMenu.eq(1).show();
                    }
                });
                var elmEnd = $(this).find("a.btnType4.type3");
            } else {
                //배송조회, 간편 서비스 
                elmEnd = $(this).find("a").last();
            }

            //마지막 포커스 일경우 탭 닫기 
            elmEnd.off().on('keydown', function(ev) {
                // next event
                if (ev.keyCode == 9) {
                    $(".controlList li").eq(idx).removeClass("on");
                }
            });
        });
        //controll box - 배송 조회 마지막 태그 tab out close
        $(".controlList li .inBox").eq(0).find('.btn_c >a').off().on('keydown', function(ev){
        	// next event
            if (ev.shiftKey == false && ev.keyCode == 9) {
            	$(".controlList li").eq(1).removeClass("on");
            }        	
        });
        
       //controll box - 서비스 안내  마지막 태그 tab out close
       $(".controlList li .inBox").eq(1).find('a').last().off().on('keydown', function(ev){
        	// next event
            if (ev.shiftKey == false && ev.keyCode == 9) {
            	$(".controlList li").eq(2).removeClass("on");
            }        	
        });
        
        $(".controlList>li>a").on("keydown", function(ev) {
            if (ev.shiftKey == true && ev.keyCode == 9) {
                $(this).closest("li").removeClass("on");
            }
        })

        //리스트 탭 - 내부 아이콘 클릭
        $(".inBox .selBtn a").off("click");
        $(".inBox .selBtn a").on("click", function(ev) {
            //배송 조회 탭일 경우 
            var tabIndex = $(".inBox .selBtn").index($(this).closest(".selBtn"));
            if (tabIndex != 2) {
                ev.preventDefault();
            }
            $(this).siblings().removeClass("on");
            $(this).addClass("on");
            if (tabIndex == 1) {
                var subCont = $(this).closest(".fl").next(".fr");
                var subContIdx = $(this).index();
                subCont.children("div").hide();
                subCont.children("div").eq(subContIdx).show();
            }
        });
        //편의점 택배보내기 - 보내는 사람 다음 버튼 클릭시 이동
        $(".inBox").first().find(".btnType4.type2").on("click", function(ev) {
            ev.preventDefault();
            var frContent = $(".inBox").first().find(".addBox");
            frContent.eq(0).hide();
            frContent.eq(1).show();
        })

        function posYcheck(e) {
            if ((e.originalEvent.wheelDelta && e.originalEvent.wheelDelta > 0) || (e.originalEvent.detail && e.originalEvent.detail < 0)) {
                _isShowScrollTrace = false;
                e.preventDefault();
                gotoPrevCat();
            } else {
                var isEndScroll = (parseInt($(window).scrollTop(), 10) == $(document).height() - $(window).height());
                if (page_num <= 3 && !isEndScroll) {
                    _isShowScrollTrace = false;
                    e.preventDefault();
                    gotoNextCat();
                }
            }
        }

        var page_num = 1;
        var _isShowScrollTrace = true;
        var curIndex;


        $(".mainLink>a").off("click");
        $(".mainLink>a").on("click", function(ev) {
            ev.preventDefault();
            page_num = $(this).index() + 1;
            gotoCat(page_num);
        })



        function gotoPrevCat() {
            page_num = (page_num * 1) - 1;
            if (page_num == 0) page_num = 1;
            gotoCat(page_num);
        }

        function gotoNextCat() {
            page_num = (page_num * 1) + 1;

            if (page_num <= 3) {
                gotoCat(page_num);
            }

        }
        
        function gotoCat(page_num) {
            var offsetY = $('.mainBox0' + page_num).offset().top;
            _isShowScrollTrace = false;

            if (_isShowScrollTrace == true) return;
            $('html,body').stop().animate({
                scrollTop: offsetY
            }, 500).promise().done(function() {
                _isShowScrollTrace = true;
            });

            $(".mainLink>a").removeClass('on');
            $(".mainLink>a:nth-of-type(" + page_num + ")").addClass("on");
        }

        //메인 스크립트 끝 

        // mouse scroll 메인 페이지에서만 호출 
        if ($(location).attr('pathname').indexOf("main") != -1) {
        	
        	//처음 로딩 하여 gnb 메뉴 설정
        	if ($(document).scrollTop() > 0) {
                $("header").removeClass("main");
            } else {
                $("header").addClass("main");
            }

            /*
            $(window).bind('mousewheel DOMMouseScroll', function(e) {
                if ($('html,body').is(':animated')) {
                    return false;
                }

                if (!e.originalEvent) {
                    return false;
                }

                // clearTimeout(tout)
                // var tout = setTimeout(function() {
                //     posYcheck(e);
                // }, 10);
                if ($("body").css("overflow") != "hidden") {
                    posYcheck(e);
                }
            });
            */

            var scrollWindowHandler = function(e) {
                if ($(document).scrollTop() > 0) {
                    $("header").removeClass("main");
                } else {
                    $("header").addClass("main");
                }

                if (_isShowScrollTrace == true) {
                    if (!$('html,body').is(':animated')) {
                        var offset = $('article').offset();
                        var y = $(window).scrollTop() + offset.top + (($(window).height() - offset.top) / 2);
                        $('article').each(function() {
                            if ($(window).scrollTop() == 0) {
                                curIndex = 1;
                            } else if (y >= $(this).offset().top) {
                                curIndex = $(this).index();
                            } else {
                                return false;
                            }
                        });
                        if (curIndex != null) {
                            $('.mainLink a').removeClass('on');
                            $(".mainLink>a:nth-of-type(" + curIndex + ")").addClass("on");
                        }
                    }
                } else {
                    _isShowScrollTrace = true;
                    e.preventDefault();
                    return false;
                }
            };
           
            
            $(window).scroll(scrollWindowHandler);
            
        }


        //퀵메뉴
        $("aside .btnQuick").on("click", function(ev) {
            ev.preventDefault();
            $(this).closest(".quick").toggleClass("on");
            quickTitle();
        });
        $("aside .btnTop").on("click", function(ev) {
            ev.preventDefault();
            $('html,body').animate({
                'scrollTop': 0
            }, 500)
        })

        // iframe 높이 설정 (.iframeBox 내부에 있는 iframe에만 적용
        var $iframe = $('.iframeBox > iframe');


        // iframe setHeight event
        $iframe.on('iframe.setHeight', function() {
            var $this = $(this),
                iframeDocument = this.contentDocument || this.contentWindow.document,
                $documentBody = $(iframeDocument).find('body'),
                getHeight = 0;

            $documentBody.css('height', 'auto');
            if ($documentBody.length > 0 && $documentBody.children()[0] != undefined) {
            	getHeight = $documentBody.children()[0].offsetHeight;
                $this.css('height', getHeight);
            }
        });



        // 회사 소개 HISTORY OF CU POST
        $('.company03').on('click', '.historyTab a', function(e) {
            e.preventDefault();
            var $parent = $(this).closest('li'),
                $siblings = $parent.siblings(),
                $fl = $(this).closest('.fl'),
                $fr = $fl.siblings('.fr'),
                idx = $parent.index();

            $siblings.removeClass('on');
            $parent.addClass('on');

            $fr.hide();
            $fr.eq(idx).show();
        });

        // 회사소개 STORE
        $('.company04 > .inner').css({
            overflow: 'hidden',
            height: '100%'
        });
        $('.company04').on('click', '.store a', function(e) {
            e.preventDefault();
            var $old = $(this).closest('.store'),
                $new = $(this).hasClass('next') ? $old.next('.store') : $old.prev('.store'),
                oldLeft = $(this).hasClass('next') ? '-100%' : '100%',
                newLeft = $(this).hasClass('next') ? '100%' : '-100%';

            if ($old.is(':animated')) {
                return;
            }


            $old.find('a').hide();
            $old.stop(true, false).animate({
                left: oldLeft
            });

            $new.find('a').show();
            $new.show().css({
                left: newLeft
            }).stop(true, false).animate({
                left: '0'
            }, {
                complete: function() {
                    $old.hide();
                }
            });
        });

        // 회사 소개 PARTNER
        $('.company06').on('click', '.compTab > ul a', function(e) {
            e.preventDefault();
            var $parent = $(this).parent(),
                $siblings = $parent.siblings(),
                $tabCont = $(this).closest('.compTab').find('.tabCont'),
                idx = $parent.index();

            $siblings.removeClass('on');
            $parent.addClass('on');

            $tabCont.hide();
            $tabCont.eq(idx).show();
        });


        //큌메뉴 타이틀 속성 추가
        function quickTitle() {
            if ($("aside .btnQuick").closest("aside").hasClass("on")) {
                var quickTitle = "닫기";
            } else {
                var quickTitle = "열기";
            }
            $("aside .btnQuick").attr("title", quickTitle);
        }

        //하단 타이틀 속성 추가 
        function bottomTitle() {
            if ($(".footMenu .selType1 ul").css("display") == "block") {
                var quickTitle = "닫기";
            } else {
                var quickTitle = "열기";
            }
            $(".footMenu .selType1>a").attr("title", quickTitle);
        }
        


        quickTitle();
        bottomTitle();
        
        
        //국제 특송 내역 - 내용 품명 - 영문 표기 팝업 검색
        $(".selSearch a").off("click").on("click", function(){
        	$(this).addClass("on").siblings().removeClass("on");
        });
        
        (function() {
            var $prBox = $('.prBox'),
                $ul = $prBox.find('ul'),
                $view = $ul.closest('.js-prBox-list'),
                $wrap = $ul.closest('.js-prBox-wrap'),
                $button = $prBox.find('.prev, .next'),
                len = $ul.length,
                currentIndex = $ul.filter('.on').length > 0 ? $ul.filter('.on').index() : 0;

            var init = function() {
                setup();
            };

            var setup = function() {
                if (!$view.length) {
                    $ul.wrapAll('<div class="js-prBox-list" />');
                    $view = $ul.parent('.js-prBox-list');
                }
                if (!$wrap.length) {
                    $view.wrap('<div class="js-prBox-wrap" />');
                    $wrap = $view.parent('.js-prBox-wrap');
                }

                render();
                bindEvents();
                checkArrow();
            };

            var render = function() {
                $wrap.css('overflow', 'hidden');
                $view.css({
                    width: 100 * len + '%'
                });
                $ul.css({
                    float: 'left',
                    width: 100 / len + '%'
                });

                $ul.removeClass('on');
                $ul.eq(currentIndex).addClass('on');
            };

            var checkArrow = function() {
                if (len === 1) {
                    $button.hide();
                } else {
                    if (currentIndex === 0) {
                        $button.filter('.prev').hide();
                    } else {
                        $button.filter('.prev').show();
                    }

                    if (currentIndex === len - 1) {
                        $button.filter('.next').hide();
                    } else {
                        $button.filter('.next').show();
                    }
                }
            };

            var bindEvents = function() {
                $button.off('click.prBoxSlide');
                $button.on('click.prBoxSlide', function(e) {
                    e.preventDefault();
                    if ($view.is(':animated')) {
                        return;
                    }

                    if ($(this).hasClass('next')) {
                        slideTo(currentIndex + 1);
                    } else {
                        slideTo(currentIndex - 1);
                    }
                });
            };

            var slideTo = function(index) {
                if ($view.is(':animated')) {
                    return;
                }
                $view.animate({
                    marginLeft: -index * 100 + '%'
                });

                currentIndex = index;
                checkArrow();
            };

            init();

            commonJs.prVideoSlide = {
                init: init,
                slideTo: slideTo
            };
        }());
    });


    $(window).load(function() {
        var resizeTimer = null;
        //console.log('loda')
        function imgResize() {
            var w = $(window).width();
            $('div.rollingBox>ul.rollingList>li>a>img').each(function() {
                var img = $(this)
                var n = w / 2 - 700;
                img.css({
                    left: n + 'px',
                    position: 'absolute'
                });
            });
        }

        $(window).on('resize', function() {
            clearTimeout(resizeTimer);
            resizeTimer = setTimeout(function() {
                imgResize();
                $('.iframeBox > iframe').trigger('iframe.setHeight');
            }, 0);
        }).trigger('resize');


        /* bkc 추가. 서비스 메뉴 추가 확장 */
        
        var tab01Num = $(".serBox .tab01 li").size();
        
        switch (tab01Num) {
            case 1:
                $(".tab01").addClass("liOne");
                break;
            case 2:
                $(".tab01").addClass("liTwo");
                break;
            case 3:
                $(".tab01").addClass("liThree");
                break;
            case 4:
                $(".tab01").addClass("liFour");
                break;
            case 5:
                $(".tab01").addClass("liFive");
                break;
            default:
                $(".tab01").addClass("liSix");
                break;
        }
        
        if(tab01Num > 6){
            $(".iconPlus1").css("display", "block");
        }
        
        var tab02Num = $(".serBox .tab02 li").size();
        
        switch (tab02Num) {
            case 1:
                $(".tab02").addClass("liOne");
                break;
            case 2:
                $(".tab02").addClass("liTwo");
                break;
            case 3:
                $(".tab02").addClass("liThree");
                break;
            case 4:
                $(".tab02").addClass("liFour");
                break;
            case 5:
                $(".tab02").addClass("liFive");
                break;
            default:
                $(".tab02").addClass("liSix");
                break;
        }

        if(tab02Num > 6){
            $(".iconPlus2").css("display", "block");
        }
        
        var icon1Flag = "off";
        var icon2Flag = "off";

        $(".tit01").on("click", function(){
            tab01Right();
            tab02Up();
            serBoxUp();
            tab01Up();
            icon1Flag = "off";
            $(".tit01").addClass("on");
            $(".tit02").removeClass("on");
        });

        $(".tit02").on("click", function(){
            tab01Left();
            tab01Up();
            serBoxUp();
            tab02Up();
            icon2Flag = "off";
            $(".tit01").removeClass("on");
            $(".tit02").addClass("on");
        });

        $(".iconPlus1").on("click", function(){
            if(icon1Flag == "off"){
                tab01Down();
                serBoxDown();
                icon1Down();
                icon1Flag = "on";
            }else if(icon1Flag == "on"){
                icon1Up();
                icon1Flag = "off";
            }
        });

        $(".iconPlus2").on("click", function(){
            if(icon2Flag == "off"){
                tab02Down();
                serBoxDown();
                icon2Down();
                icon2Flag = "on";
            }else if(icon2Flag == "on"){
                icon2Up();
                icon2Flag = "off";
            }
        });

        function tab01Right() {
            $(".tab01").animate({
                width:"880px"
            }, 500);
        }
        function tab01Left(){
            $(".tab01").animate({
                width:"0px"
            }, 500);
        }
        function tab01Up(){
            $(".tab01").css("height", "210px");
            $(".iconPlus1").css("top", "180px").find("a").text("+");
        }
        function tab01Down() {
            $(".tab01").animate({
                height:"422px"
            }, 200);
        }
        function tab02Up(){
            $(".tab02").css("height", "210px");
            $(".iconPlus2").css("top", "180px").find("a").text("+");
        }
        function tab02Down() {
            $(".tab02").animate({
                height:"422px"
            }, 200);
        }
        function serBoxUp(){
            $(".serBox").css("height","210px")
        }
        function serBoxDown(){
            $(".serBox").animate({
                height:"422px"
            }, 200);
        }
        function icon1Down(){
            $(".iconPlus1").animate({
                top:"370px"
            }, 200);
            $(".iconPlus1 a").text("-");
            icon1Flag = "on";
        }
        function icon1Up(){
            $(".tab01").animate({
                height:"210px"
            }, 200);
            $(".serBox").animate({
                height:"210px"
            }, 200);
            $(".iconPlus1").animate({
                top:"180px"
            }, 200);
            $(".iconPlus1 a").text("+");
            icon1Flag = "off";

        }
        function icon2Down(){
            $(".iconPlus2").animate({
                top:"370px"
            }, 200);
            $(".iconPlus2 a").text("-");
            icon2Flag = "on";
        }
        function icon2Up(){
            $(".tab02").animate({
                height:"210px"
            }, 200);
            $(".serBox").animate({
                height:"210px"
            }, 200);
            $(".iconPlus2").animate({
                top:"180px"
            }, 200);
            $(".iconPlus2 a").text("+");
            icon2Flag = "off";
        }


        /* 검색 버튼 */
        $(".searchBtn").on("click", function(){
            $("header .search").toggle();
            $(this).toggleClass("on");
        });

        /* event 롤링 **************************/
        
        var activeNum  = 0;
        var maxNum;
        var timer;
        var ban_w = 485;

        


        // 첫번째 배너 마지막에 붙이기
        $(".evt1 ul li").first().clone().appendTo(".evt1 ul");

        // 추가한 배너 제외한 갯수
        maxNum = $(".evt1 ul li").size() - 1;


        // 네비게이션 갯수대로 만들기
        for(var i=0; i< maxNum - 1; i++){
            $(".evtNav li").first().clone().appendTo(".evtNav");
        }
        

        initPopup();    
        
        
        function initPopup(){
            
            //타이머 제작
            timer = setInterval(function() {
                    onTimer();
            }, 10000);

            changeItem(0);
            
            
            //마우스 오버시 실행
            $(".evt1 ul li").mouseover(function() {
                clearInterval(timer);
            });

            //마우스 아웃시 실행
            $(".evt1 ul li").mouseout(function() {
                timer = setInterval(function() {
                    onTimer()
                }, 10000);
            });
            
            // 네비 마우스 오버
            $(".evtNav li").mouseover(function(){
                clearInterval(timer);
                activeNum = $(this).index();
                changeItem(activeNum);
            });

            // 네비 마우스 아웃시 실행
            $(".evtNav li").mouseout(function(){
                timer = setInterval(function() {
                    onTimer()
                }, 2000);
            });
           
        }
        
        //타이머에 따른 카운터 설정
        function onTimer() {
            
            if (activeNum < maxNum) {
                activeNum++;
            } else {
                activeNum = 0;
            }
            
            changeItem(activeNum);
            
        }
        
        function changeItem(num){

            $(".evt1 ul").stop().animate({
                left : "-" + ban_w*num
            }, 300, function(){
                if(num == maxNum){
                    $(".evt1 ul").css({ "left": "0px" });
                    activeNum = 0;
                }
            });
            
            for(var i=0; i<= maxNum; i++){
                if ( i == activeNum){
                    if( i == maxNum ){
                        $(".evtNav li").eq(0).addClass("on");
                    }
                    $(".evtNav li").eq(i).addClass("on");
                }else{
                    $(".evtNav li").eq(i).removeClass("on");
                }
            }
            
        }

        

    });



})(jQuery, window, document);

