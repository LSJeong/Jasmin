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

.button_div{
	margin-left: 380px;
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
							<table>
								<tbody>
									<tr>
										<th width="180">작성자</th>
										<td width="270">${qnaReplyRead.id }</td>
										<th>작성일자</th>
										<td>${qnaReplyRead.wdate }</td>
								
									<tr>
										<td colspan="3"><textarea style="border: none" rows="7"
												cols="97" readonly="readonly">${qnaReplyRead.content }</textarea></td>

									</tr>
									
								</tbody>
							</table>
						</div>

						<div class="button_div">
							<button id="button" type="button"
								onclick="qnaReplyUpdateForm('${qnaReplyRead.replyno }')">수정</button>
							<button id="button" type="button"
								onclick="qnaReplyDelete('${qnaReplyRead.replyno }')">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			function qnaUpdateForm(str) {
				location.href = "qnaReplyUpdateForm.do?no=" + str;
			}

			function qnaReplyDelete(replyno) {
				console.log(replyno);
				$.ajax({
					url : "qnaReplyDelete.do",
					type : "post",
					data : {
						no : replyno
					},
					dataType : "text",
					success : function() {
						alert("삭제 완료")
						location.href = "qnaReplyList.do";
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