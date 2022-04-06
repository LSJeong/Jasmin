<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hbook list</title>
<style type="text/css">

#button {
	width: 9%;
	height: 27px;
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
	text-align: center;
}

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
	width: 190px;
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
		data-setbg="https://wallpaperaccess.com/full/253322.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>희망도서</h2>
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
							<h2>희망도서</h2>
						</div>
						<div class="wrap" align="center">

							<div>
								<table class="table">
									<tr>
										<th width="70">글번호</th>
										<th width="300">제 목</th>
										<th width="100">작성자</th>
										<th width="150">작성일자</th>
										<th width="100">조회수</th>
									</tr>

									<c:forEach items="${hbooks}" var="book">
										<tr>
											<td align="center">${book.no}</td>
											<td onclick="bookRead('${book.no }')">${book.htitle }</td>
											<td onclick="bookRead('${book.no }')">${book.hid}</td>
											<td onclick="bookRead('${book.no }')">${book.hwdate}</td>
											<td onclick="bookRead('${book.no }')">${book.cnt}</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<br>

							<div>
								<c:if test="${not empty id }">
									<button type="button" id="button"
										onclick="location.href='hBookForm.do'">글쓰기</button>
								</c:if>
							</div>

							<div>
								<form id="frm" action="hBookRead.do" method="post">
									<input type="hidden" id="no" name="no">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			function bookRead(str) {
				frm.no.value = str;
				frm.submit();
			}
		</script>
</section>
</body>
</html>