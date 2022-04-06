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
	padding-top: 50px;
}

#button {
	width: 12%;
	height: 26px;
	border: 0;
	outline: none;
	border-radius: 10px;
	padding-top: 3px;
	padding-bottom: 25px;
	background: #B4845F;
	color: white;
	font-size: 15px;
	letter-spacing: 2px;
	margin-top: 70px;
	margin-bottom: 80px;
	margin-right: 10px;

}

table {
	width: 900px;
	border: 3px solid #AE8B59;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #D7AC87;
	padding: 8px;
	text-align: center;
}

.button_div{
	margin-left: 380px;
}
</style>
</head>

<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="https://i.pinimg.com/originals/67/18/22/671822c2f63dd5f65d8fd15c9710420b.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>묻고 답하기</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>열린공간</h4>
							<ul>
								<li><a href="noticeList.do">공지사항</a></li>
								<li><a href="faqList.do">자주 하는 질문</a></li>
								<li><a href="qnaList.do">묻고 답하기</a></li>
								<li><a href="hBookList.do">희망 도서</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">
					<div class="product__discount">
						<div class="section-title product__discount__title">
							<h2>묻고 답하기</h2>
						</div>
						<div class="wrap" align="center">
							<table>
								<tbody>
									<tr>
										<th width="180">NO</th>
										<td width="270">${qnaesRead.no }</td>
										<th>작성일자</th>
										<td>${qnaesRead.wdate }</td>
									<tr>
										<th width="180">작성자</th>
										<td width="270">${qnaesRead.id }</td>
										<th>답변상태</th>
										<td>${qnaesRead.replyyn }</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3" style="text-align: left;">${qnaesRead.title }</td>

									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3"><textarea style="border: none; text-align: left;" rows="11"
												cols="100" readonly="readonly">${qnaesRead.content }</textarea></td>
									</tr>

								</tbody>
							</table>
						</div>
							<c:if test="${qnaesRead.id ne id}">
							<br><br><br>
							</c:if>
						<c:if test="${qnaesRead.id eq id}">
						<div class="button_div">
							<button id="button" type="button"
								onclick="qnaUpdateForm('${qnaesRead.no }')">수정</button>
							<button id="button" type="button"
								onclick="qnaDelete('${qnaesRead.no }')">삭제</button>
						</div>
						</c:if>
						<div>
							<c:if test="${not empty reply.content }">
						<hr align="left" style="border: solid 1px #C29F6D; width: 105%;">
						<br>
								<p style="color: #AE8B59;font-weight: bold; font-size: 20px ">관리자 답변입니다.</p>
								<br>
								${reply.content }
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			function qnaUpdateForm(str) {
				location.href = "qnaUpdateForm.do?no=" + str;
			}

			function qnaDelete(qnaNo) {
				console.log(qnaNo);
				$.ajax({
					url : "qnaDelete.do",
					type : "post",
					data : {
						no : qnaNo
					},
					dataType : "text",
					success : function() {
						alert("삭제 완료")
						location.href = "qnaList.do";
					},
					error : function() {
						alert("삭제 실패")
					}
				})
			}
		</script>
	</section>
</body>
</html>