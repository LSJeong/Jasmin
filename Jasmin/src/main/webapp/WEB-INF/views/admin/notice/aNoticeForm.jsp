<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aNotice Form</title>
<style type="text/css">
* {
	text-align: center;
}
th, td {
	border: 1px solid #FFCCD2;
	padding: 8px;
	text-align: center;
	color: black;
}
.wrap {
	padding-top: 90px;
	padding-bottom: 300px;
	color: black; 
}

.title {
	font-size: 35px;
	padding-top: 20px;
	padding-bottom: 50px;
	color: #C3AED6;
	font-weight: bold;
}


table {

	border: 3px solid #FFCCD2;
	border-collapse: collapse;
	margin-left: 350px;
}

#button, #btn {
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
	margin-top: 40px;
	margin-bottom: 30px;
	margin-right: 5px;
}
</style>
</head>

<body>
		<div class="wrap" align="center">
		<div>
			<p class="title">공지사항 등록</p>
		</div>
		<div>
			<form id="frm" action="aNoticeResister.do" method="post">
				<table border="1">
					<tr>
						<th width="150">작성자</th>
						<td width="150">${name }</td> <!-- 세션 값에서 가져옴 -->
						<th width="150">작성일자</th>
						<td width="150"><input style="border: none" type="date" id="wdate" name="wdate">
						</td>
					</tr>
					<tr>
						<th>제 목</th>
						<td colspan="3"><input style="border: none" type="text" id="title" name="title" size="98"></td>
					</tr>
					<tr>
						<th>내 용</th>
						<td colspan="3"><textarea style="border: none" rows="11" cols="100" id="content" name="content"></textarea></td>
					</tr>
				</table>
				<br>
			</div>
			<input type="hidden" value="${name }">		
			<button type="submit" id="btn">저장</button>	&nbsp;&nbsp;&nbsp;
			<button type="button" id="button" onclick="location.href='aNoticeList.do'">취소</button>
		</form>
		</div>
</body>	
</html>