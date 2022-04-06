<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hbook form</title>
<style type="text/css">

.htitle {
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
	width: 7%;
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
	margin-right: 1px;
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
							<form id="frm" action="hBookResister.do" method="post">
								<table border="1">
									<tr>
										<th width="150">작성자</th>
										<td width="150">${id }</td>
										<!-- 세션 값에서 가져옴 -->
										<th width="150">작성일자</th>
										<td width="150"><input style="border: none" type="date" id="hwdate"
											name="hwdate"></td>
									</tr>
									<tr>
										<th>제 목</th>
										<td colspan="3"><input style="border: none"  type="text" id="htitle"
											name="htitle" size="98"></td>
									</tr>
									<tr>
										<th>내 용</th>
										<td colspan="3"><textarea style="border: none"	rows="11" cols="100" 
												id="hcontent" name="hcontent"></textarea></td>
									</tr>
								</table>
								<br>
						</div>
						<div align="center">
						<input type="hidden" value="${id }">
						<button type="submit" id="button" >저장</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" id="button"
							onclick="location.href='hBookList.do'">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>