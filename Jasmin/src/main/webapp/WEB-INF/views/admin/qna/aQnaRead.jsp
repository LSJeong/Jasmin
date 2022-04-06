<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA Read</title>
<style type="text/css">
.title {
	font-size: 40px;
	padding-top: 30px;
	padding-bottom: 90px;
	color: #BB8760;
	font-weight: bold;
}

.section-title h2:after {
	position: absolute;
	left: 0;
	bottom: -15px;
	right: 0;
	height: 4px;
	width: 190px;
	background: var(--main-brown);
	content: "";
	margin: 0 auto;
}

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

#del, #btn {
	width: 5%;
	height: 26px;
	border: 0;
	outline: none;
	border-radius: 10px;
	padding-top: 3px;
	padding-bottom: 25px;
	background: #B4845F;
	color: white;
	font-size: 16px;
	letter-spacing: 2px;
	margin-top: 60px;
	margin-bottom: 20px;
	margin-right: 2px;
}

table {

	border: 3px solid #AE8B59;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #D7AC87;
	padding: 8px;
	text-align: center;
	color: black;
}

#areply{
	color: #AE8B59; font-weight: bold; margin-top: 60px; font-size: 20px
}

.replyLine{
	 align="center" 
	 border: solid 1px #C29F6D; width: 63%; margin-top: 20px; margin-bottom: 40px"
}

</style>
</head>

<body>
	<div align="center">
		<div>
			<h2 style="color: #AE8B59;font-weight: bold; ">QnA 상세보기</h2>
		</div>
	</div>
<div class="wrap" align="center">
		<table>
			<tbody>
				<tr>
					<th width="180">NO</th>
					<td width="270">${aqnaesRead.no }</td>
					<th>작성일자</th>
					<td>${aqnaesRead.wdate }</td>
				</tr>
				<tr>
					<th width="180">작성자</th>
					<td width="270">${aqnaesRead.id }</td>
					<th>답변상태</th>
					<td id="aqnastatus">${aqnaesRead.replyyn }</td>
				<tr>
					
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">${aqnaesRead.title }</td>

				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea style="border: none; text-align: left;" rows="11" cols="100"
							readonly="readonly">${aqnaesRead.content }</textarea></td>	
				</tr>
			</tbody>
		</table> 
		<c:if test="${not empty reply.content }">
			<div id="reply">
				<br>
				<p style="color: #AE8B59; font-weight: bold; margin-top: 60px; font-size: 20px">관리자 답변입니다.</p>
				<br>
				<div id="con">${reply.content }</div>
				<button id="del" onclick="delfunc()">삭제</button>
				<hr class="replyLine">
			</div>
		</c:if>
	
		<c:if test="${empty reply }">
		<div class="wrap2" align="center">
			<table border="1">
				<th><textarea id="input" style="border: none" rows="11"
						cols="122" name="content"></textarea> <br></th>
			</table>
			<button type="button" id="btn" onclick="btnEvent()">글쓰기</button>
		</div>
		</c:if>
	</div>

	<script>
		function btnEvent() {
			let input = document.getElementById("input");
			console.log(input.value);
		
			$.ajax({
				url : "qnaReplyResister.do",
				type : "post",
				data: {
					subject: input.value,
					no: '${aqnaesRead.no }'
				},
				dataType: "text",
				success: function(data) {
					alert('등록했습니다.');
					$(".wrap2").remove();
					
					div = $("<div>").attr("id","reply");
					br = $("<br>");
					p = $("<p>").attr("id", "areply").text("관리자답변입니다.");
					div2 = $("<div>").attr("id","con").html(input.value);
					button = $("<button>").attr("id","del").attr("onclick", "delfunc()").html("삭제")
					hr = $("<hr>").attr("class","replyLine");
					$(".wrap").append(div.append(br).append(p).append(div2).append(button).append(hr));
					
					$("#aqnastatus").html("답변완료");
				},	
				error: function() {
					alert('실패했습니다. 다시 시도하세요.');
				}
			});
		}
		
		
		function delfunc() {
			$.ajax({
				url : "qnaReplyDelete.do",
				type : "post",
				data: {
					no: '${aqnaesRead.no }'
				},
				dataType: "text",
				success: function(data) {
					alert('삭제했습니다.');
					$("#reply").remove();
					
					div = $("<div>").attr("class","wrap2").css("align","center");
					table = $("<table>");
					th = $("<th>");
					textarea = $("<textarea>").attr("id","input").attr("rows","11").attr("cols","122").attr("name","content")
					.css("border","none");
					br = $("<br>");
					button = $("<button>").attr("id","btn").attr("onclick","btnEvent()").html("글쓰기");
					
					$(".wrap").append(div.append(table.append(th.append(textarea).append(br))).append(button));
					$("#aqnastatus").html("대기중");
				},
				error: function() {
					alert('실패했습니다. 다시 시도하세요.');
				}
			});
		}
	</script>
</body>
</html>