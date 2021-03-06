<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
<title>YELLOW BRIDGE</title>
<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">

<style>
	#example{text-align: center;}
	#example tr th{padding: 10px; font-size: 18px; font-weight: bold;  border-bottom: 1px solid black;}
	#example tr td{padding: 7px; font-size: 16px;}
	.serviceBoard {
		width: 65%;
		margin: 0px auto;
	}
	.serviceBoardtext{
		margin-top: 150px;
		letter-spacing: -1px;
		text-align:center;
		
	}
	
	.row {
	position: relative;
	}
	
	.tableCheck{width: 5%;}
	.tableNo{width: 5%;}
	.tableTitle{width: 20%;}
	.tableRescueDate{width: 20%;}
	.tableRequestMember{width: 20%;}
	.tablerequestDate{width: 15%;}
	.tableState{width: 10%;}
	.btnDiv2{ margin-top: 5px; position: absolute; right: 5px;}
	
	.pagenation{align:center; }
	
	#writeBtn,#changeBtn{
    	background-color: #BDCC94;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	
	#updateBtn{
    	background-color: lightgray;
        border: 1px solid white;
        color: white;
        font-weight: bold;
        cursor: pointer;
        letter-spacing: -1px;
        word-break: keep-all;
        border-radius: 5px;
        text-decoration: none;
        font-size: 0.9375em;
	}
	.area{
	 width:100%;
	 height: 150px; 
	}
	
	.serviceBoard {
	margin-top: -150px;
}
	
</style>

</head>
<body>
<div class="serviceBoard">
      <c:import url="../admin/header.jsp"/>
      <div class="area">
</div>
	<div class="serviceBoardtext">
		<h1 style="color:#BDCC94;"><b>????????????/?????? ??????</b></h1>
	</div>
	
	<div>
	<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" data-bs-toggle="tab" href="admin_adoption.ado">??????????????????</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" data-bs-toggle="tab" href="admin_request.ado">??????????????????</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade active show" id="home">
 </div>
  
  
  <div class="container" style="margin-top:20px; text-align:center;">
		<div class="row">
					<table id="example" class="display" style="width: 100%; margin-top:50px;">
						<thead>
							<tr>
								<th class="tableCheck">??????</th>
								<th class="tableNo">NO.</th>
								<th class="tableTitle">?????????</th>
								<th class="tableRequestMember">???????????????</th>
								<th class="tablerequestDate">???????????????</th>
								<th class="tableState">????????????</th>
							</tr>
						</thead>
						<tbody id="listArea">
							<c:forEach var="animal" items="${ animallist }">
								<fmt:formatDate var="formatRegDate" value="${ animal.requestDate }" pattern="yyyy.MM.dd" />
								<tr>
									<td align="center" class="tableNo">
									
									<input type="checkbox" name="checkbox" value="${ animal.requestAnimalNo }">
									</td>
									<td align="center" class="tableNo">${ animal.requestNo }</td>
									<td align="center" class="tableNo">${ animal.requestAnimalType }</td>
									<td align="center" class="tableWriter">${ animal.requestMemberNickname }</td>
									<td align="center" class="tableWriter">${ formatRegDate }</td>
									<td align="center" class="tableState">${ animal.requestState }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="btnDiv2">
				
						<select id="selectbox" name="selectbox">
							  <option>???????????????</option>
							  <option value="????????????">????????????</option>
							  <option value="???????????????">???????????????</option>
							  <option value="????????????">????????????</option>
							  <option value="????????????">????????????</option>
							  <option value="????????????">????????????</option>
							</select>
							<button type="button" class="btn btn-primary" id="changeBtn">?????? ??????</button>
					</div>
				
				</div>
			</div>
					</div>
  
  
  
  
  </div>
  <div class="tab-pane fade" id="profile">
    <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
  </div>
  <div class="tab-pane fade" id="dropdown1">
    <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork.</p>
  </div>
	</div>
	
					<!-- ????????? -->
								<div id="pagingNav" class="pagenation">
									<c:if test="${ pi.currentPage <= 1 }">
										<a href="${ before }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_prev.png" alt="?????? ?????? ??????"></a> 
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="admin_request.ado">
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_prev.png" alt="?????? ?????? ??????"></a> 
									</c:if>
									
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
										<span class="select">${ p }</span> 
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="admin_request.ado">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<a href="${ pagination }">${ p }</a>
										</c:if>
									</c:forEach>
									
									
									<!-- [??????] -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<a href="${ after }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_nxt.png" alt="?????? ?????? ??????"></a>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="admin_request.ado">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url> 
										<a href="${ after }" class="img"><img src="<%=request.getContextPath()%>/resources/images/btn_nxt.png" alt="?????? ?????? ??????"></a>
									</c:if>
								</div>
								
								
								
									<!-- ?????????  ??? -->
	<script type="text/javascript">
		$('#updateBtn').on('click', function() {
			if ($('input[name=checkbox]:checked').length < 1) {
				alert('????????? ??????????????? ????????????.');
			} else {
				var checkbox = [];
				$('input[name=checkbox]:checked').each(function() {
					checkbox.push($(this).val());
				});

				$.ajax({
					url : 'admin_deleteNotice.ado',
					type : 'post',
					data : { checkbox : checkbox },
					success : function(data) {
						window.location.reload();
						alert('????????? ????????? ?????????????????????.');
						console.log('??????');
						
					},
					error : function() {
						console.log('??????????????? ??????????????????.');
					}
				});
			}
		});
		</script>
		<script>
		
		
		
		$('#changeBtn').on('click', function() {
			if ($('input[name=checkbox]:checked').length < 1) {
				alert('1??? ?????? ??????????????????.');
			} else {
				var checkbox = [];
				var selectbox = $("#selectbox option:selected").val();
				
				$('input[name=checkbox]:checked').each(function() {
					checkbox.push($(this).val());
				});

				$.ajax({
					url : 'admin_changeState.ado',
					type : 'post',
					data : { checkbox : checkbox, selectbox:selectbox},
					success : function(data) {
						alert('???????????? ????????? ?????????????????????.');
						window.location.reload();
						console.log('??????');
						
					},
					error : function() {
						alert('???????????? ????????????');
						console.log('???????????? ????????????');
					}
				});
			}
		});
	</script>
	<c:import url="../common/footer.jsp"/>
</body>
</html>