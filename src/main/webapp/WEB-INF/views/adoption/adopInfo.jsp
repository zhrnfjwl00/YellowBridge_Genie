<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>YELLOW BRIDGE</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
  	#serviceApplyBoardTable{text-align: center;}
  	#serviceApplyBoardTable tr th{padding: 10px; font-size: 18px; font-weight: bold; border-bottom: 1px solid black;}
  	#serviceApplyBoardTable tr td{padding: 7px; font-size: 16px; }
  	
	.serviceApplyBoard {
		width: 65%;
		margin: 0px auto;
	}
	.serviceApplyBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
	}
	
	.tableNo{width: 10%;}
	.animalNo{width: 10%;}
	.content{width:40%;}
	.tableDate{width:15%;}
	.tableStatus{width:15%;}
	
	#listArea{padding: 5px; align:center;}
</style>
</head>
<body>
<div class="serviceApplyBoard">

	<c:import url="../common/header.jsp"/>
	
	<div style="text-align:center;" class="serviceApplyBoardtext">
		<h1 style="color:#BDCC94;"><b>입양 신청 조회</b></h1>
	</div>
	
	<div class="container" style="margin-top:30px">
		<div class="row">
			<div class="col-sm-12">
				<table id="serviceApplyBoardTable" class="display" style="width:100%">
			        <thead>
			            <tr>
			                <th class="tableNo">NO.</th>
			                <th class="animalNo">동물번호</th>
			                <th class="content">신청내역</th>
			                <th class="tableDate">신청일</th>
			                <th class="tableStatus">상태</th>
			            </tr>
			        </thead>
			        <tbody id = "listArea">
			        	<c:forEach var="requestlist" items="${ requestlist }">
			        	<fmt:formatDate var="formatRegDate" value="${ requestlist.requestDate }" pattern="yyyy.MM.dd"/>
			        	<tr>
			        		<td class="tableNo">${requestlist.requestNo }</td>
			        		<td class="animalNo">${requestlist.requestAnimalNo }</td>
			        		<td class="content">${ requestlist.requestReason }</td>
			        		<td class="tableDate">${ formatRegDate }</td>
			        		<td class="tableStatus" style="color:red;">${requestlist.requestState }</td>
			        	</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript">
	   // 게시글 상세보기
		$(function(){
			$('#listArea td').on({'mouseenter':function(){
				$(this).parent().css({'background' : 'lightgray', 'cursor':'pointer'});					
			}, 'mouseout':function(){
				$(this).parent().css({'background' : 'none'});
			}});
		});
		
	</script>
	<c:import url="../common/footer.jsp"/>
</body>
</html>