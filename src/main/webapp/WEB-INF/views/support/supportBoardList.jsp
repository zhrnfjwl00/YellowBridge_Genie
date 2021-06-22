<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
 <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  #example{text-align: center;}

 </style>

</head>
<body>
	<c:import url="../common/header.jsp"/>
	<div class="jumbotron text-center" style="margin-bottom:0">
	  <h1>게시판 리스트 출력</h1>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <div class="collapse navbar-collapse" id="collapsibleNavbar">
	    <ul class="navbar-nav">
	      <li class="nav-item">
	        <a class="nav-link" href="index">홈</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="board">게시판</a>
	      </li>
	    </ul>
	  </div>  
	</nav>
	
	<div class="container" style="margin-top:30px">
		<div class="row">
			<div class="col-sm-12">
		      <h2>게시판</h2>
			      <div id="searchArea" align="center">
			      
					<select id="searchCondition" name="searchCondition">
						<option>-------</option>
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					
					<input id="searchValue" type="search">
					<button onclick="searchBoard();">검색</button>
				  </div>
				  
				<table id="example" class="display" style="width:100%">
			        <thead>
			            <tr>
			                <th>NO.</th>
			                <th>제목</th>
			                <th>작성자</th>
			                <th>작성일</th>
			                <th>조회수</th>
			            </tr>
			        </thead>
			        <tbody id = "listArea">
			        	<tr>
			        		<td>1</td>
			        		<td>게시판 리스트 출력입니다.</td>
			        		<td>도대담</td>
			        		<td>21.06.12</td>
			        		<td>5</td>
			        		
			        	</tr>
			        	
			        </tbody>
			    </table>
				<button type="button" class="btn btn-primary" id = "writeBtn">글쓰기</button>
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
		});
		// 게시글 검색
		function searchBoard(){
			var searchCondition = $("#searchCondition").val();
			var searchValue = $("#searchValue").val();
			
			location.href="search.bo?searchCondition="+searchCondition+"&searchValue="+searchValue;
		}
		
	</script>
</body>
</html>