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
		<h1 style="color:#BDCC94;"><b>봉사 신청 조회</b></h1>
	</div>
	
	<div class="container" style="margin-top:30px">
		<div class="row">
			<div class="col-sm-12">
				<table id="serviceApplyBoardTable" class="display" style="width:100%">
			        <thead>
			            <tr>
			            	<th class="selected"><input type="checkbox" name="selected" id="allSelected">
			                <th class="tableNo">NO.</th>
			                <th class="tableShelter">보호소</th>
			                <th class="tableCo">신청내역</th>
			                <th class="tableTime">신청시각</th>
			                <th class="tableStatus">상태</th>
			            </tr>
			        </thead>
			        <tbody id = "listArea">
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        	<tr>
			            	<td class="selected"><input type="checkbox" name="selected" id="oneSelected"></td>
			        		<td class="tableNo">1</td>
			        		<td class="tableShelter">구미 사랑 보호소</td>
			        		<td class="tableCo">구미 사랑 보호소 봉사 (6월 5일)</td>
			        		<td class="tableTime">2021-06-21</td>
			        		<td class="tableStatus" style="color:red;">신청확정</td>
			        	</tr>
			        </tbody>
			    </table>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>
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
</body>
</html>