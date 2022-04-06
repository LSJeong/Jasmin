<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>

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
	left: 30px;
	height: 4px;
	width: 240px;
	background: var(--main-brown);
	content: "";
	margin: 0 auto;
}


/* FAQ */
.faq {
	border-bottom: 0px solid #ddd;
	padding-top: 20px;
}

.faq .faqHeader {
	position: relative;
	zoom: 1
}

.faq .faqHeader .showAll {
	position: absolute;
	bottom: 0;
	right: 0;
	border: 0;
	padding: 0;
	overflow: visible;
	background: none;
	cursor: pointer
}

.faq .faqBody {
	margin: 0;
	padding: 0
}

.faq .faqBody .article {
	list-style: none
}

.faq .q a {
	display: block;
	text-align: left;
	padding: 0 0 0 35px;
	font-size: 18px;
	color: #000000;
	font-weight: bold;
	line-height: 27px;
	cursor: pointer;
	margin: 10px 0;
	!
	important
}

.faq .qtitle {
	color: #00A5FF;
	font-weight: bold;
	font-size: 23px;
}

.faq .a {
	display: block;
	text-align: left;
	padding: 0 0 0 35px;
	font-size: 16px;
	color: #000000;
	line-height: 22px;
	border-top: 1px solid #bdbdbd;
	margin: 5px 0 0 0;
}

.faq .atitle {
	color: #B90000;
	font-weight: bold;
	font-size: 23px;
}

</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js"></script>

</head>

<body>
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="https://www.tcd.cn/wp-content/uploads/2017/05/trinity-college-old-library-banner-1900x580_c.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>자주 묻는 질문</h2>
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
							<h2>&emsp;자주 하는 질문</h2>
						</div>
						<div class="faq">
							<div class="faqHeader">
								<!--button type="button" class="showAll">답변 모두 여닫기</button-->
							</div>
							<ul class="faqBody">
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>회원가입은
											어떻게 하나요?</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span>상단메뉴 > 회원가입 페이지에서 가능합니다.
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>예약이
											되지 않습니다.</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span> 불편을 드려 죄송합니다. &nbsp;
										관리자에게 문의해주세요.
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>대출/반납이
											안됩니다.</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span>대출/반납 오류는 "묻고 답하기"에 도서명 기재
										후 문의 부탁드립니다.
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>개인정보
											변경을 하려면 어떻게 해야하나요?</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span>개인정보는 도서관 홈페이지에서 로그인 후 내정보
										> 회원정보수정 페이지에서 직접 변경이 가능합니다.
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>희망
											도서 및 비도서 신청은 어떻게 하나요?</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span>홈페이지에서 로그인 하신 후, 열린공간 >
										희망도서 메뉴에서 신청하시면 됩니다.<br> &emsp;&ensp;희망도서 신청에서 구입확정까지 평균
										한달 정도의 기간이 소요되며,&nbsp;신청하신 도서가 해당 실에 도착하면 신청자에게 문자 메세지로
										알려드립니다.
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>도서는
											몇권까지 대여가능 한가요?</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span>개인당 최대 5권까지 가능합니다.
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>배송현황은
											어디서 확인 가능한가요?</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span>로그인 후 나의 도서관 > 대출목록 페이지에서
										확인 가능합니다.
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>대출도서를
											분실 또는 훼손했습니다.</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp;</span>대출도서를 분실 또는 훼손한 경우 동일 도서로
										변상하셔야 합니다.&nbsp;(단, 도서가 절판일 경우 변상당시를 기준으로 하여 정가 변상)
									</p>
								</li>
								<li class="article" id="a1">
									<p class="q">
										<a href="#a1"><span class="qtitle">Q.&nbsp;&nbsp;</span>도서를
											기증하고 싶습니다.</a>
									</p>
									<p class="a">
										<span class="atitle">A.&nbsp; </span> * 기증기간 : 연중(지속적 접수)<br>
										&emsp;&emsp;* 대상자료 : 도서 및 DVD<br> &emsp;&emsp;* 대상도서 및 기준<br>
										&emsp;&emsp;&emsp;&emsp;- 문학 및 교양도서 : 당해년도 기준 5년이내 출판도서<br>
										&emsp;&emsp;&emsp;&emsp;- 법률자료 : 당해년 저작물<br>
										&emsp;&emsp;&emsp;&emsp;- 컴퓨터 및 어학자료 : 당해년 기준 2년이내<br>
										&emsp;&emsp;&emsp;&emsp;- 기타 : 희귀자료 및 학술적 가치가 있는 자료, 도서관에
										소장가치가 있다고 판단되는 자료<br>
									</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		jQuery(function($) {
			// Frequently Asked Question
			var article = $('.faq>.faqBody>.article');
			article.addClass('hide');
			article.find('.a').hide();
			article.eq(0).removeClass('hide');
			article.eq(0).find('.a').show();
			$('.faq>.faqBody>.article>.q>a').click(function() {
				var myArticle = $(this).parents('.article:first');
				if (myArticle.hasClass('hide')) {
					article.addClass('hide').removeClass('show');
					article.find('.a').slideUp(100);
					myArticle.removeClass('hide').addClass('show');
					myArticle.find('.a').slideDown(100);
				} else {
					myArticle.removeClass('show').addClass('hide');
					myArticle.find('.a').slideUp(100);
				}
				return false;
			});
			$('.faq>.faqHeader>.showAll').click(function() {
				var hidden = $('.faq>.faqBody>.article.hide').length;
				if (hidden > 0) {
					article.removeClass('hide').addClass('show');
					article.find('.a').slideDown(100);
				} else {
					article.removeClass('show').addClass('hide');
					article.find('.a').slideUp(100);
				}
			});
		});
	</script>

</body>
</html>