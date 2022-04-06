<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice List</title>

<style type="text/css">
.title {
	font-size: 40px;
	padding-top: 30px;
	padding-bottom: 90px;
	color: #BB8760;
	font-weight: bold;
}

.table {
	text-align: center;
	padding-left: 120px;
	padding-right: 120px;
}

.section-title h2:after {
	position: absolute;
	left: 0;
	bottom: -15px;
	right: 0;
	height: 4px;
	width: 150px;
	background: var(--main-brown);
	content: "";
	margin: 0 auto;
}

.wrap {
	padding-top: 50px;
}
</style>
</head>

<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="https://www.spc.ox.ac.uk/sites/default/files/styles/banner_image/public/2019-08/library_banner_2.jpg?h=0d5e5955&itok=il_lGQCn">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>공지사항</h2>
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
							<h2>공지사항</h2>
						</div>
						<div class="wrap" align="center">

							<div>
								<table class="table">
									<tr>
										<th width="100">글번호</th>
										<th width="300">제 목</th>
										<th width="100">작성자</th>
										<th width="200">작성일자</th>
										<th width="100">조회수</th>
									</tr>

									<c:forEach items="${notices}" var="notice">
										<tr>
											<td onclick="noticeRead('${notice.no }')">${notice.no}</td>
											<td onclick="noticeRead('${notice.no }')">${notice.title }</td>
											<td onclick="noticeRead('${notice.no }')">${notice.name}</td>
											<td onclick="noticeRead('${notice.no }')">${notice.wdate}</td>
											<td onclick="noticeRead('${notice.no }')">${notice.cnt}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<br>

							<div>
								<form id="frm" action="noticeRead.do" method="post">
									<input type="hidden" id="no" name="no">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		function noticeRead(str) {
			frm.no.value = str;
			frm.submit();
		}
	</script>

</body>
</html>