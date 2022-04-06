<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user QnA 등록</title>
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
	margin-top: 70px;
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
						<div class="wrap" align="center"></div>
						<div align="center">

							<div>
								<form id="frm" action="qnaResister.do" method="post">
									<div align="center">
										<table border="1">
											<tr>
												<th width="180">작성자</th>
												<td width="200">${id }</td>
												<th width="180">작성일자</th>
												<td width="180"><input style="border: none" type="date"
													id="wdate" name="wdate"></td>
											</tr>
											<tr>
												<th>제 목</th>
												<td colspan="3"><input style="border: none" type="text"
													id="title" name="title" size="98"></td>
											</tr>
											<tr>
												<th>내 용</th>
												<td colspan="3"><textarea style="border: none"
														rows="11" cols="100" id="content" name="content"></textarea></td>
											</tr>
										</table>
										<br>
									</div>
									<input type="hidden" value="${id }">
									<button type="submit" id="button">저장</button>
									&nbsp;&nbsp;&nbsp;
									<button type="button" id="button"
										onclick="location.href='qnaList.do'">취소</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>