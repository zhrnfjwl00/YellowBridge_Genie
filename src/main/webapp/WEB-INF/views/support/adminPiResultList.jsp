<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판 리스트 출력</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script> 
 <style>
  #example{text-align: center;}
	
	#example tr th{padding: 10px; font-size: 18px; font-weight: bold;  border-bottom: 1px solid black;}
	#example tr td{padding: 7px; font-size: 16px;}
	
	.supportBoard {
		width: 65%;
		margin: 0px auto;
	}
	.supportBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.tableNo{width: 5%;}
	.tableTitle{width: 40%;}
	.tableWriter{width: 15%;}
	.tableDate{width: 15%;}
	.tableCount{width: 10%;}
	#searchArea{padding-bottom:25px;}
	.btnDiv{padding-top:25px; float: right;}
	
	 #toc-content {
    	display: none;
 	 }
	
 </style>

</head>
<body>
<div class="supportBoard">
	<c:if test="${loginUser.id.equals('admin')}">
      <c:import url="../admin/header.jsp"/>
   </c:if>
   
   <c:if test="${!loginUser.id.equals('admin') || empty loginUser}">
      <c:import url="../common/header.jsp"/>
   </c:if>
	<div style="text-align:center;" class="supportBoardtext">
		<h1 style="color:#BDCC94;"><b>결제 내역 조회</b></h1>
		<b style="color:#BDCC94;">총 결제 금액 : </b><h4 id="total"></h4>
	</div>
	<div class="container" style="margin-top:30px; text-align:center;" >
		<div class="row">
			<div class="col-sm-12">
			      <c:import url="../support/NewFile.jsp"/>
			      <table class="searchBox">
			<caption>조회</caption>
			<colgroup>
				<col width="123px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>조회기간</th>
					<td>
						<ul class="searchDate">
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
									<label for="dateType1">당일</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('3d')"/>
									<label for="dateType2">3일</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
									<label for="dateType3">1주</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType4" onclick="setSearchDate('2w')"/>
									<label for="dateType4">2주</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
									<label for="dateType5">1개월</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
									<label for="dateType6">3개월</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
									<label for="dateType7">6개월</label>
								</span>
							</li>
						</ul>
						
						<div class="clearfix">
							<!-- 시작일 -->
							<span class="dset">
								<input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" >
								<a href="#none" class="btncalendar dateclick">달력</a>
							</span>
							<span class="demi">~ &nbsp;&nbsp;&nbsp;</span>
							<!-- 종료일 -->
							<span class="dset">
								<input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" >
								<a href="#none" class="btncalendar dateclick">달력</a>
							</span>
							<button style="background: #BDCC94; color:white; padding: 4px;" id="dateSearch"><b>조회하기</b></button>
						</div>	
					</td>
				</tr>

			<tbody>
		</table>
				  
				<table id="example" class="display" style="width:auto">
			        <thead>
			            <tr>
							<th class="tableWriter">회원등급</th>
			                <th class="tableNo">결제번호</th>
							<th class="tableTitle">거래고유번호</th>
							<th class="tableTitle">결제금액</th>
							<th class="tableTitle">결제상세</th>
							<th class="tableTitle">결제상태</th>
							<th class="tableTitle">결제일</th>
			            </tr>
			        </thead>
			        <tbody id="listArea">
				        <c:if test="${empty allPayList}">
				        	조회된 결제 내역이 없습니다.
				        </c:if>
			        	<c:forEach var="p" items="${ allPayList }">
							<tr id="check" class="hide">
								<td align="center">${ p.orderStatus}</td>
								<td align="center">${ p.payNo}</td>
								<td align="center">${ p.imp_uid }</td>
								<td align="center" id="price" name="price">${ p.price }</td>
								<td align="center">
									<b>${ p.userName } <font id="tab" onclick="moreInfo()">▼</font></b><br>
									<ul id="toc-content">
										<li>YellowBridge후원</li>
										<li>${ p.tel } <li>
										<li>${ p.email }</li>
										<li>${ p.addr }</li>
									</ul>
								</td>
								<td align="center">${ p.status }</td>
								<td align="center" id="orderDate" name="orderDate">${ p.orderDate }</td>
							</tr>
						</c:forEach>
			        </tbody>
			    </table>
			    <br><br>
			</div>
		</div>
	</div>
	</div>
	<c:import url="../common/footer.jsp"/>
	<script type="text/javascript">
	   // 게시글 상세보기
		$(function(){
			$('#listArea td').on({'mouseenter':function(){
				$(this).parent().css({'background' : 'lightgray', 'cursor':'pointer'});					
			}, 'mouseout':function(){
				$(this).parent().css({'background' : 'none'});
			}});
			
			var sum = 0;

			$('#listArea #price').each(function() {
			    sum += parseInt(this.innerText);
			});

			document.getElementById('total').innerText = sum;
				  
		});
		
	   function moreInfo(){
		   $('#check').toggleClass("hide");
		   if($('#tab').text() == "▼"){
			   $('#tab').text("▲"); 
			   document.getElementById('toc-content').style.display = 'none';
			   
		   } else{
			   $('#tab').text("▼"); 
			   document.getElementById('toc-content').style.display = 'block';
		   }
		   
	   }
	   
	   
		 /* window.location.reload(); */
	   
		$('#dateSearch').on('click', function(){
			
			var searchStartDate = $('#searchStartDate').val();
			var searchEndDate = $('#searchEndDate').val();
			
			var date1 = new Date(searchStartDate);
			var date2 = new Date(searchEndDate);
			
			var arr = []; //배열선언
			
			$('#listArea #orderDate').each(function() {
				var searchDate = new Date(this.innerText);
				
				if(date1 < searchDate && searchDate <= date2){
					
					var parent = $(this).parent();
					arr.push(parent);

				}
				
			});
			
			var $table = $('#listArea');
			$table.html('');
			
			for(var i=0; i < arr.length; i++){
				$table.append(arr[i][i]);
				
			}
			
			
			//console.log(arr[0][0]);
			//console.log(searchStartDate);
		});
		
		</script>
		
	</script>
</body>
</html>