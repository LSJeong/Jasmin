<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice List</title>
<style type="text/css">
* {
	text-align: center;
}

.wrap {
	border: 1px solid #C1AEEE;
	border-radius: 7px;
	padding-top: 40px;
	padding-bottom: 120px;
	padding-left: 60px;
	padding-right: 60px;
	margin-top: 120px;
	margin-bottom: 40px;
	margin-left: 220px;
	margin-right: 220px;
}

.title {
	font-size: 35px;
	padding-top: 20px;
	padding-bottom: 50px;
	color: #C3AED6;
	font-weight: bold;
}

.table {
	width: 900px;
	margin-left: 98px;
	padding-right: 80px;
}

#button {
	width: 5%;
	height: 26px;
	border: 0;
	outline: none;
	border-radius: 10px;
	background: linear-gradient(to left, #DADDFC, #FFCCD2);
	color: white;
	font-size: 16px;
	letter-spacing: 2px;
	margin-bottom: 300px;
}
</style>
</head>

<body>
	<div class="wrap" align="center">
		<div>
			<p class="title">공지사항</p>
		</div>
		<table class="table">
			<tr>
				<th width="70">글번호</th>
				<th width="300">제 목</th>
				<th width="100">작성자</th>
				<th width="150">작성일자</th>
				<th width="100">조회수</th>
			</tr>

			<c:forEach items="${anotices}" var="anotice">
				<tr
					onmouseover="this.style.background = 'linear-gradient(to left, 	#BEAEE2, #F7DBF0)';"
					onmouseleave="this.style.background='#FFFFFF';">
					<td onclick="anoticeRead('${anotice.no }')">${anotice.no}</td>
					<td onclick="anoticeRead('${anotice.no }')">${anotice.title }</td>
					<td onclick="anoticeRead('${anotice.no }')">${anotice.name}</td>
					<td onclick="anoticeRead('${anotice.no }')">${anotice.wdate}</td>
					<td onclick="anoticeRead('${anotice.no }')">${anotice.cnt}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<c:if test="${not empty id }">
		<div align="center">
			<button type="button" id="button"
				onclick="location.href='aNoticeForm.do'">글쓰기</button>
		</div>
	</c:if>

	<div>
		<form id="frm" action="aNoticeRead.do" method="post">
			<input type="hidden" id="no" name="no">
		</form>
	</div>

	<script>
		function anoticeRead(str) {
			frm.no.value = str;
			frm.submit();
		}
	</script>

</body>
</html>