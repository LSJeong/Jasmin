<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HBook Read</title>
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

.button_div {
	margin-left: 110px;
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
						<div class="wrap" align="center"></div>
						<div align="center">
							<table>
								<tbody>
									<tr>
										<th width="160">NO</th>
										<td width="270">${hbooksRead.no }</td>
										<th width="200">조회수</th>
										<td width="270" colspan="3">${hbooksRead.cnt }</td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>${hbooksRead.hid }</td>
										<th>작성일자</th>
										<td>${hbooksRead.hwdate }</td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3" style="text-align: left">${hbooksRead.htitle }</td>

									</tr>
									<tr>
										<th>내용</th>
										<td colspan="3"><textarea style="border: none" rows="11" cols="100"
												readonly="readonly">${hbooksRead.hcontent }</textarea></td>
									</tr>

								</tbody>
							</table>
						</div>
						<c:if test="${hbooksRead.hid eq id }">
						<div class="button_div">
						<div align="center">
							<button type="button" id="button"
								onclick="hbookUpdateForm('${hbooksRead.no}')">수정</button>
							<button type="button"  id="button" onclick="hbookDelete('${hbooksRead.no}')">삭제</button>
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		<script>
			function hbookUpdateForm(str) {
				location.href = "hBookUpdateForm.do?no=" + str;
			}

			function hbookDelete(hbookNo) {
				$.ajax({
					url : "hBookDelete.do",
					type : "post",
					data : {
						no : hbookNo
					},
					dataType : "text",
					success : function() {
						alert("삭제 완료")
						location.href = "hBookList.do";
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