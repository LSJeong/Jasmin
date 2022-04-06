<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAList</title>
<style type="text/css">

.title {
	font-size: 40px;
	padding-top: 30px;
	padding-bottom: 90px;
	color: #BB8760;
	font-weight: bold;
}

.table {
	width: 900px;
	text-align: center;
	padding-left: 120px;
	padding-right: 120px;
}


.wrap {
	padding-top: 50px;
	padding-bottom: 500px;
}
</style>
</head>
<body>
	<div class="section-title product__discount__title">
		<p style="color: #AE8B59;font-weight: bold; font-size: 30px; text-align: center; margin-top: 120px;">묻고 답하기</p>
	</div>
	<div class="wrap" align="center">
		<div>
			<table class="table">
				<tr>
					<th width="70">글번호</th>
					<th align="center" width="300">제 목</th>
					<th width="100">작성자</th>
					<th width="100">답변상태</th>
					<th width="100">작성일자</th>
				</tr>

				<c:forEach items="${aqnaes}" var="aqna">
					<tr>
						<td align="center">${aqna.no}</td>
						<td onclick="aqnaRead('${aqna.no }')">${aqna.title }</td>
						<td align="center">${aqna.id}</td>
						<td align="center">${aqna.replyyn}</td>
						<td align="center">${aqna.wdate}</td>

					</tr>
				</c:forEach>
			</table>
		</div>
		<br>


		<div>
			<form id="frm" action="aQnaRead.do" method="post">
				<input type="hidden" id="no" name="no">
			</form>
		</div>
	</div>

	<script>
		function aqnaRead(str) {
			frm.no.value = str;
			frm.submit();
		}
	</script>
</body>
</html>