<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정 페이지</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
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

#btn1, #btn2 {
	width: 8%;
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
	margin-top: 50px;
	margin-bottom: 80px;
	margin-right: 2px;
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

.button_div {
	margin-left: 120px;
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
							<form id="frm" method="post">
								<div align="center">
									<table border="1">
										<tr>
											<th width="250">NO</th>
											<td width="300">${qnaesUpdate.no }</td>
											<th width="250">작성일자</th>
											<td width="300">${qnaesUpdate.wdate }</td>
										</tr>

										<tr>
											<th>작성자</th>
											<td style="text-align: left;" colspan="3" width="150">${qnaesUpdate.id }</td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="3" width="100px"><input type="text"
												style="width: 540px; border: none; text-align: left;" id="title" name="title"
												value="${qnaesUpdate.title }"></td>
										</tr>

										<tr>
											<th>내용</th>
											<td colspan="5"><input
												style="height: 250px; width: 540px;; border: none; text-align: left; "
												type="text" id="content" name="content" size="68"
												value="${qnaesUpdate.content }"></td>
										</tr>

									</table>
								</div>
								<br>
								<div class="button_div">
									<div align="center">
										<button type="button" id="btn1">저장</button>
										&nbsp;&nbsp;&nbsp;
										<button type="button" id="btn2">취소</button>
									</div>
								</div>
								<div>
									<input type="hidden" id="no" name="no"
										value="${qnaesUpdate.no }"> <input type="hidden"
										id="id" name="id" value="${qnaesUpdate.id }"> <input
										type="hidden" id="wdate" name="wdate"
										value="${qnaesUpdate.wdate }">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			$(function() {
				$("#btn1").click(function() {
					frm.action = "qnaUpdate.do";
					frm.submit();
				})
				$("#btn2").click(function() {
					frm.action = "qnaList.do";
					frm.submit();
				});
			})
		</script>
	</section>
</body>
</html>