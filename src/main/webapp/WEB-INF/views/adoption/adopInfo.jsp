<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<title>게시판 리스트 출력</title>
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
	
	.selected{width:5%;}
	.tableNo{width: 5%;}
	.tableShelter{width: 20%;}
	.tableCo{width:40%;}
	.tableTime{width:15%;}
	.tableStatus{width:15%;}
	
	#listArea{padding: 5px;}
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
			            	<th class="selected"><input type="checkbox" name="selected" id="allSelected">
			                <th class="tableNo">NO.</th>
			                <th class="tableShelter">동물번호</th>
			                <th class="tableCo">신청내역</th>
			                <th class="tableStatus">상태</th>
			            </tr>
			        </thead>
			        <tbody id = "listArea">
			        	<c:forEach var="requestlist" items="${ requestlist }">
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">${requestlist.requestNo }</td>
			        		<td class="tableShelter">${requestlist.requestAnimalNo }</td>
			        		<td class="tableCo">${member.nickname }</td>
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