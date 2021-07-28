<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>jQuery UI</title>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>

		<style>	
		
			/* Default */
			input[type=text],input[type=password]{font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
			*{margin:0;padding:0;font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
			body{font-size:12px;color:#555;background:transparent;-webkit-user-select:none;-moz-user-select:none;-webkit-text-size-adjust:none;-moz-text-size-adjust:none;-ms-text-size-adjust:none}
			ol,ul{list-style:none} 
			table{table-layout:fixed;width:100%;border-collapse:collapse;border-spacing:0}
			caption{overflow:hidden;width:0;height:0;font-size:0;line-height:0;text-indent:-999em}
			img,fieldset{border:0}
			legend{height:0;visibility:hidden}
			em,address{font-style:normal}
			img{border:0 none;vertical-align:middle}
			a{color:#555;text-decoration:none}
			input,select{margin:0;padding:0;vertical-align:middle}
			button{margin:0;padding:0;font-family:inherit;border:0 none;background:transparent;cursor:pointer}
			button::-moz-focus-inner{border:0;padding:0}
			header,footer,aside,nav,section,article{display:block}

			.clearfix{*zoom:1}
			.clearfix:after{content:"";display:block;clear:both;overflow:hidden}

			/* Search */
			.searchBox{border:none}
			.searchBox tbody th{padding:20px 10px 20px 35px;font-size:14px;font-weight:bold;text-align:left;vertical-align:top;border:none;background:#e6e6e6 }
			.searchBox tbody td{padding:12px 10px 12px 25px;border:none;background-color:#efefef}
		
			.searchDate{overflow:hidden;margin-bottom:10px;*zoom:1}
			.searchDate:after{display:block;clear:both;content:''}
			.searchDate li{position:relative;float:left;margin:0 7px 5px 28px}
			.searchDate li .chkbox2{display:block;text-align:center}
			.searchDate li .chkbox2 input{position:absolute;z-index:-1}
			.searchDate li .chkbox2 label{display:block;width:72px;height:26px;font-size:14px;font-weight:bold;color:#fff;text-align:center;line-height:25px;text-decoration:none;cursor:pointer;background:#a5b0b6}
			.searchDate li .chkbox2.on label{background:#ec6a6a}
		
			.demi{display:inline-block;margin:0 1px;vertical-align:middle}
			.inpType{padding-left:6px;height:24px;line-height:24px;border:1px solid #dbdbdb}
			.btncalendar{display:inline-block;width:22px;height:22px;background:url(images/btn_calendar.gif) center center no-repeat;text-indent:-999em}
			
			

		</style>

		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<!-- datepicker 한국어로 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	
		<script>				

		$(document).ready(function() {

			//datepicker 한국어로 사용하기 위한 언어설정
			$.datepicker.setDefaults($.datepicker.regional['ko']); 	
		
			// Datepicker			
			$(".datepicker").datepicker({
				showButtonPanel: true,
				dateFormat: "yy-mm-dd",
				onClose : function ( selectedDate ) {
				
					var eleId = $(this).attr("id");
					var optionName = "";

					if(eleId.indexOf("StartDate") > 0) {
						eleId = eleId.replace("StartDate", "EndDate");
						optionName = "minDate";
					} else {
						eleId = eleId.replace("EndDate", "StartDate");
						optionName = "maxDate";
					}

					$("#"+eleId).datepicker( "option", optionName, selectedDate );		
					$(".searchDate").find(".chkbox2").removeClass("on"); 
				}
			}); 

			//시작일.
			/*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {	
				// 시작일 datepicker가 닫힐때
				// 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				$("#searchEndDate").datepicker( "option", "minDate", selectedDate );
				$(".searchDate").find(".chkbox2").removeClass("on");
			});
			*/

			//종료일.
			/*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {	
				// 종료일 datepicker가 닫힐때
				// 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				$("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
				$(".searchDate").find(".chkbox2").removeClass("on");
			});
			*/

			$(".dateclick").dateclick();	// DateClick
			$(".searchDate").schDate();		// searchDate
			
		});

		// Search Date
		jQuery.fn.schDate = function(){
			var $obj = $(this);
			var $chk = $obj.find("input[type=radio]");
			$chk.click(function(){				
				$('input:not(:checked)').parent(".chkbox2").removeClass("on");
				$('input:checked').parent(".chkbox2").addClass("on");					
			});
		};

		// DateClick
		jQuery.fn.dateclick = function(){
			var $obj = $(this);
			$obj.click(function(){
				$(this).parent().find("input").focus();
			});
		}	

		
		function setSearchDate(start){

			var num = start.substring(0,1);
			var str = start.substring(1,2);

			var today = new Date();

			//var year = today.getFullYear();
			//var month = today.getMonth() + 1;
			//var day = today.getDate();
			
			var endDate = $.datepicker.formatDate('yy-mm-dd', today);
			$('#searchEndDate').val(endDate);
			
			if(str == 'd'){
				today.setDate(today.getDate() - num);
			}else if (str == 'w'){
				today.setDate(today.getDate() - (num*7));
			}else if (str == 'm'){
				today.setMonth(today.getMonth() - num);
				today.setDate(today.getDate() + 1);
			}

			var startDate = $.datepicker.formatDate('yy-mm-dd', today);
			$('#searchStartDate').val(startDate);
					
			// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
			$("#searchEndDate").datepicker( "option", "minDate", startDate );
			
			// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
			$("#searchStartDate").datepicker( "option", "maxDate", endDate );

		}

			
		</script>

</html>