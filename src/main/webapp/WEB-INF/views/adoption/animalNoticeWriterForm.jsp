<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>YELLOW BRIDGE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/adoption.css">
<style type="text/css">
.board_request {
	width: 1100px;
	height: auto;
	margin: 40px auto 50px auto;
}

.board_request table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.board_request table thead, .board_request table tbody {
	border-top: 3px solid #95998A;
}

.board_request table thead+tbody {
	border-top: 0;
}

.board_request table thead th, .board_request table tbody th {
	background: res;
	border-bottom: 1px solid #ccc;
	font-family: 'NanumGothicWeb' !important;
	line-height: 40px;
	font-weight: normal;
	text-align: center;
}

.board_request table span {
	color: #95998A;
}

.board_request table span b {
	font-family: 'NanumGothicWebBold' !important;
	font-weight: normal;
	color: #444;
}

.board_request table thead th img {
	vertical-align: middle;
	margin-right: 5px;
}

.board_request table td {
	text-align: left;
	font-size: 16px;
	color: #444;
	line-height: 40px;
	background: #fff;
	border-bottom: 1px solid #ccc;
	padding: 10px;
}

.board_request table td button {
	background: #26579c;
	color: #fff;
	text-align: center;
	width: 112px;
	height: 35px;
	font-size: 14px;
	display: inline-block;
	vertical-align: middle;
	margin-bottom: 10px;
}

.board_request table td input[type="text"].textAreaSize {
	width: 800px;
}

.board_request table td input[type="text"] {
	width: 250px;
}

.board_request table td label {
	font-size: 16px;
	color: #444;
	margin-right: 15px;
	margin-left: 5px;
	display: inline-block;
	vertical-align: middle;
}

.board_request table td textarea {
	padding: 5px;
	font-size: 16px;
	color: #444;
	background: #fff !important;
}

.request_info {
	background: #fff;
	font-size: 16px;
	color: #666;
	line-height: 30px;
	border: 2px solid #ccc;
	padding: 20px;
	margin-bottom: 20px;
}

.request_info strong {
	font-family: 'NanumGothicWebBold' !important;
	font-weight: normal;
	color: #444;
}

.request_info span {
	color: #95998A;
}

.request_info u {
	text-decoration: none;
	border-bottom: 1px solid #666;
}

.btn_area {
	width: 1100px;
	height: auto;
	margin: 40px auto 50px auto;
	text-align: center;
}

#writeBtn {
	width: 10%;
	height: 40px;
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

.area {
	width: 100%;
	height: 150px;
}

</style>
</head>
<body>
	<c:import url="../admin/header.jsp" />
		<div class="area"></div>
	<div class="wrap_sub">
		<div class="rescue">
			<div class="menu_name">
				<h2>??????????????????</h2>
				<hr>
			</div>
			<!--?????????-->
			<div class="board_request">
				<form method="post" name="form" action="animalInsert.ado" enctype="multipart/form-data" accept-charset="utf-8">
					<table cellpadding="0" cellspacing="0" summary="?????????????????? ?????????">
						<caption>??????????????????</caption>
						<colgroup>
							<col width="25%">
							<col width="25%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="??????????????????"><span>??????</span></th>
								<td><input type="text" id="animalType" name="animalType" value=""></td>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="??????????????????"><span>??????</span></th>
								<td colspan="3">
									<input type="radio" class="animalGender" name="animalGender" id="animalGender1" value="G" checked> ??????&nbsp;&nbsp;
									<input type="radio" class="animalGender" name="animalGender" id="animalGender2" value="M"> ??????</td>
							</tr>
							<tr>
								<th scope="row"><span>??????</span></th>
								<td><input type="text" id="animalAge" name="animalAge"></td>
								<th scope="row"><span>??????</span></th>
								<td><input type="text" id="animalColor" name="animalColor"></td>
							</tr>
							<tr>
								<th scope="row"><span>?????????????????????</span></th>
								<td><input type="radio" id="animalTnr1" name="animalTnr" value="Y" checked> ??????&nbsp;&nbsp;
								<input type="radio" id="animalTnr2" name="animalTnr" value="N"> ?????????</td>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="??????????????????"><span>??????</span></th>
								<td><input type="text" id="animalCharacter" name="animalCharacter"></td>
							</tr>
							<tr>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="??????????????????"><span>??????</span></th>
								<td><input type="text" id="animalWeight" name="animalWeight"></td>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="??????????????????"><span>????????????</span></th>
								<td><input type="text" id="animalCondition" name="animalCondition"></td>
							</tr>
							<tr>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png"
									alt="??????????????????"><span>??????</span></th>
								<td colspan="3"><input type="text" id="animalFeature"
									name="animalFeature"></td>
							</tr>
						</tbody>
					</table>


					<table cellpadding="0" cellspacing="0" summary="?????????????????? ?????????">
						<caption>?????????????????? ?????????</caption>
						<colgroup>
							<col width="25%">
							<col width="75%">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span>?????????</span></th>
								<td><input type="date" id="rescueDate" name="rescueDate"></td>
							</tr>

							<tr>
								<th scope="row"><img
									src="<%=request.getContextPath()%>/resources/images/check.png"
									alt="??????????????????"><span>????????????</span></th>
								<td><input type="text" class="textAreaSize" id="rescueLocation"
									name="rescueLocation"></td>
							</tr>

							<tr>
								<th scope="row"><img src="<%=request.getContextPath()%>/resources/images/check.png" alt="??????????????????"><span>???????????????</span></th>
								<td>
								<input type="file" id="uploadFile" multiple="multiple" name="uploadFile"></td>
							</tr>
						</tbody>
					</table>

					<div class="btn_area">
						<button type="submit" id="writeBtn">????????????</button>
					</div>
					<!--E:btn_area-->
				</form>
			</div>
			<!--E:board_request-->
		</div>
		<!--E:wrap_sub-->
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>