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
 </style>

</head>
<body>
<div class="supportBoard">
	<c:import url="../common/header.jsp"/>
	<div style="text-align:center;" class="supportBoardtext">
		<h1 style="color:#BDCC94;"><b>후원금 결제 내역 조회</b></h1>
		<b style="color:#BDCC94;">총 결제 금액 : </b><h4 id="total"></h4>
	</div>
	<div class="container" style="margin-top:30px; text-align:center;" >
		<div class="row">
			<div class="col-sm-12">
			      <c:import url="../support/NewFile.jsp"/>
				  
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
			        <h2> ${datePi} </h2>
			        	<c:forEach var="p" items="${ datePi }">
							<tr>
							<c:if test="${p.userName eq loginUser.name}">
			        			<td align="center">${ p.orderStatus}</td>
								<td align="center">${ p.payNo}</td>
								<td align="center">${ p.imp_uid }</td>
								<td align="center" id="price" name="price">${ p.price }</td>
								<td align="center">
									<b>${ p.userName }</b><br>
									YellowBridge후원 <br>
									${ p.tel } <br>
									${ p.email } <br>
									${ p.addr } <br>
								</td>
								<td align="center">${ p.status }</td>
								<td align="center">${ p.orderDate }</td>
								</td>
			        		</c:if>
							</tr>
						</c:forEach>
						<c:if test="${empty datePi}">
			        	조회된 결제 내역이 없습니다.
			        </c:if>
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
		
		/* $('#dateSearch').on('click',function(){
			var searchStartDate = $("searchStartDate").val();
			var searchEndDate = $("searchEndDate").val();
			var userName = '${loginUser.name}';
			location.href="dateSearch.sup?searchStartDate=" + searchStartDate + "&searchEndDate=" + searchEndDate + "&userName=" + userName;
			
		}); */
	
	
	</script>
		
		
	</script>
</body>
</html>