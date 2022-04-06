<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>anotice update</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">


.wrap {
	padding-top: 90px;
	padding-bottom: 300px;
	color: black;
}
.wrap2 {
	padding-top: 60px;
	padding-bottom: 200px;
	color: black;
}

#btn1, #btn2 {
	width: 4%;
	height: 26px;
	border: 0;
	outline: none;
	border-radius: 10px;
	padding-top: 3px;
	padding-bottom: 25px;
	background: #C3AED6;
	color: white;
	font-size: 16px;
	letter-spacing: 2px;
	margin-top: 30px;
	margin-bottom: 20px;
	margin-right: 2px;
}

table {

	border: 3px solid #FFCCD2;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #FFCCD2;
	padding: 8px;
	text-align: center;
	color: black;
}
</style>
</head>


<body>
	<div align="center">
		<div>
			<p style= "font-size: 35px; color: #C3AED6;font-weight: bold; margin-top:70px; margin-bottom: 60px ">공지사항 수정</p>
		</div>
	</div>
	<div>
		<form id="frm" method="post">
		<div align="center">
			<table border="1">
				<tr>
				<th width="180">NO</th>
				<td width="270">${anoticeUpdate.no }</td>
				<th>조회수</th>
				<td colspan="3">${anoticeUpdate.cnt }</td>
			</tr>
			<tr>
				<th width="180">작성자</th>
				<td width="270">${anoticeUpdate.name }</td>
				<th>작성일자</th>
				<td>${anoticeUpdate.wdate }</td>

			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3" width="100px"><input style="border: none; width: 540px" type="text" id="title"
					name="title" value="${anoticeUpdate.title }"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3"><input style="border: none; height: 250px; width: 820px"
					type="text" id="content" name="content" size="68"
					value="${anoticeUpdate.content }"></td>
			</tr>
			</table>
		</div>
		<br>
			<div align="center">
				<button type="button" id="btn1">저장</button>		
				&nbsp;&nbsp;&nbsp;
				<button type="button" id="btn2">취소</button>
			</div>
			
			<div>
				<input type="hidden" name="no" value="${anoticeUpdate.no}">
				<input type="hidden" name="cnt" value="${anoticeUpdate.cnt}">
				<input type="hidden" name="name" value="${anoticeUpdate.name}">
				<input type="hidden" name="wdate" value="${anoticeUpdate.wdate}">
			</div>
		</form>
	</div>	

	<script>
		$(function() {
			$("#btn1").click(function() {
				frm.action = "aNoticeUpdate.do";
				frm.submit();
		})
			$("#btn2").click(function() {
			frm.action = "aNoticeList.do";
			frm.submit();
		});
			
	})
	</script>
</body>
</html>