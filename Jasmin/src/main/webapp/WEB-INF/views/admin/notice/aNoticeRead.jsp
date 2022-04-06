<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aNotice Read</title>
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

#button {
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
	margin-right: 10px;
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
			<p style= "font-size: 35px; color: #C3AED6;font-weight: bold; margin-top:70px; margin-bottom: 60px ">공지사항</p>
		</div>
	</div>
	<div align="center">
		<table border="1">
			<tbody>
				<tr>
					<th width="180">NO</th>
					<td width="270">${anoticeRead.no }</td>
					<th>조회수</th>
					<td colspan="3">${anoticeRead.cnt }</td>
				</tr>
				<tr>
					<th width="180">작성자</th>
					<td width="270">${anoticeRead.name }</td>
					<th>작성일자</th>
					<td>${anoticeRead.wdate }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3" style="text-align: left;">${anoticeRead.title }</td>

				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea style="border: none" rows="11" cols="100"
							readonly="readonly">${anoticeRead.content }</textarea></td>
				</tr>

			</tbody>
		</table>
	</div>

	<div align="center">
		<button type="button" id="button" onclick="anoticeUpdateForm('${anoticeRead.no}')">수정</button>
		<button type="button" id="button" onclick="anoticeDelete('${anoticeRead.no}')">삭제</button>
	</div>
	
	<script>
	
	function anoticeUpdateForm(str) {
		location.href = "aNoticeUpdateForm.do?no=" + str;
	}
	
	function anoticeDelete(anoticeNo) {
		$.ajax({
			url : "aNoticeDelete.do",
			type : "post",
			data : {
				no : anoticeNo
			},
			dataType : "text",
			success : function() {
				alert("삭제 완료")
				location.href = "aNoticeList.do";
			},
			error : function() {
				alert("삭제 실패")
			}
		})
	}
	</script>

</body>
</html>