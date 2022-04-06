<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<style>
.visual {
	position: relative
}

;
.visual button {
	position: absolute;
	z-index: 10;
	top: 50%;
	transform: translateY(-50%)
}

.visual button.slick-prev {
	left: 0px
}

.visual button.slick-next {
	right: 0px
}
</style>
</head>
<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-10"></div>
			<div class="img_box">
				<div class="col-lg-12 visual">
					<div class="hero__item set-bg">
						<div class="hero__item set-bg" data-setbg="resources/images/main2.jpg"></div>
					</div>
					<div class="hero__item set-bg">
						<div class="hero__item set-bg" data-setbg="resources/images/main3.jpg"></div>
					</div>
					<div class="hero__item set-bg">
						<div class="hero__item set-bg" data-setbg="resources/images/main4.jpg"></div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="mainSearchBtn.do" method="post">
							<div class="hero__search__categories">제목</div>
							<input type="text" name="title" placeholder="도서 제목을 입력하세요"
								required="required">
							<button type="submit" class="site-btn site-btn2">통합검색</button>

						</form>
					</div>
				</div>

			</div>
		</div>
	</div>


</section>
<!-- Hero Section End -->

<!-- Categories Section Begin -->
<section class="categories">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>사서 추천 도서</h2>
				</div>
			</div>
			<div class="categories__slider owl-carousel">
				<c:forEach items="${mainRecommBooks }" var="mainRecommBook">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="/filePath/${mainRecommBook.ppicture }"
							onclick="location.href='detailbook.do?isbn=${mainRecommBook.isbn }'"></div>
						<div class="latest-product__item__text" align="center">
							<h6>${mainRecommBook.writer }</h6>
							<span>${mainRecommBook.title }</span>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</section>
<!-- Categories Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container" id="maincontainer">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>주제별 도서</h2>
				</div>
				<div class="featured__controls">
					<ul>
						<li onclick="mainList()" class="active">All</li>
						<li onclick="mainList('100')">철학</li>
						<li onclick="mainList('200')">종교</li>
						<li onclick="mainList('600')">예술</li>
						<li onclick="mainList('700')">언어</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row featured__filter" id="mainList">
			<c:forEach items="${mainBookList }" var="mainBook" begin="0" end="7"
				step="1">
				<div class="col-lg-3 col-md-4 col-sm-6">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="/filePath/${mainBook.ppicture }"
							onclick="location.href='detailbook.do?isbn=${mainBook.isbn }'">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">${mainBook.writer }</a>
							</h6>
							<h5>${mainBook.title }</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="img/banner/banner-1.jpg" alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="img/banner/banner-2.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>TOP Like Books</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${mainLikeBooks }" var="mainLikeBook" begin="0"
								end="2" step="1">
								<a href="detailbook.do?isbn=${mainLikeBook.isbn}"
									class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/filePath/${mainLikeBook.ppicture }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${mainLikeBook.writer }</h6>
										<span>${mainLikeBook.title }</span>
									</div>
								</a>
							</c:forEach>
						</div>
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${mainLikeBooks }" var="mainLikeBook" begin="3"
								end="5" step="1">
								<a href="detailbook.do?isbn=${mainLikeBook.isbn}"
									class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/filePath/${mainLikeBook.ppicture }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${mainLikeBook.writer }</h6>
										<span>${mainLikeBook.title }</span>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>TOP Rated Books</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${mainBestBooks }" var="mainBestBook" begin="0"
								end="2" step="1">
								<a href="detailbook.do?isbn=${mainBestBook.isbn}"
									class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/filePath/${mainBestBook.ppicture }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${mainBestBook.writer }</h6>
										<span>${mainBestBook.title }</span>
									</div>
								</a>
							</c:forEach>
						</div>
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${mainBestBooks }" var="mainBestBook" begin="3"
								end="5" step="1">
								<a href="detailbook.do?isbn=${mainBestBook.isbn}"
									class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/filePath/${mainBestBook.ppicture }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${mainBestBook.writer }</h6>
										<span>${mainBestBook.title }</span>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>TOP Review Books</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${mainReviewBooks }" var="mainReviewBook"
								begin="0" end="2" step="1">
								<a href="detailbook.do?isbn=${mainReviewBook.isbn}"
									class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/filePath/${mainReviewBook.ppicture }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${mainReviewBook.writer }</h6>
										<span>${mainReviewBook.title }</span>
									</div>
								</a>
							</c:forEach>
						</div>
						<div class="latest-prdouct__slider__item">
							<c:forEach items="${mainReviewBooks }" var="mainReviewBook"
								begin="3" end="5" step="1">
								<a href="detailbook.do?isbn=${mainReviewBook.isbn}"
									class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/filePath/${mainReviewBook.ppicture }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${mainReviewBook.writer }</h6>
										<span>${mainReviewBook.title }</span>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Latest Product Section End -->



<script>
	$('.visual').slick({
		slide : 'div', //슬라이드 되어야 할 태그 ex) div, li 
		infinite : true,
		slidesToScroll : 1, //스크롤 한번에 움직일 컨텐츠 개수
		arrows : false, // 옆으로 이동하는 화살표 표시 여부

		autoplay : true, // 자동 스크롤 사용 여부
		autoplaySpeed : 3000, // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true, // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,// 세로 방향 슬라이드 옵션

	});

	function mainList(bclass) {
		$("#mainList").remove();

		var div1 = $("<div>").attr("id", "mainList").attr("class",
				"row featured_filter");

		$("#maincontainer").append(div1);

		$.ajax({
			url : "mainBookList.do",
			data : {
				bclass : bclass
			},
			dataType : "json",
			type : "post",
			success : function(result) {
				console.dir(result);
				if (result.length >= 1) {
					result.forEach(function(book, index) {
						var div2 = $("<div>").attr("class",
								"col-lg-3 col-md-4 col-sm-6");
						var div3 = $("<div>").attr("class", "featured__item");
						var div4 = $("<div>").attr("data-setbg",
								"/filePath/" + book.ppicture).attr("class",
								"featured__item__pic set-bg").attr(
								"onclick",
								"location.href='detailbook.do?isbn="
										+ book.isbn + "'").css(
								"background-image",
								"url(/filePath/" + book.ppicture + ")");
						var ul = $("<ul>").attr("class",
								"featured__item__pic__hover");
						var li = $("<li>");
						var a = $("<a>");
						var i = $("<i>").attr("class", "fa fa-heart");

						div4.append(ul.append(li.append(a.append(i))));

						var div5 = $("<div>").attr("class",
								"featured__item__text");
						var h6 = $("<h6>");
						var a2 = $("<a>").text(book.writer);
						div5.append(h6.append(a2));

						var h5 = $("<h5>").text(book.title);
						div5.append(h5);

						div2.append(div3.append(div4).append(div5));
						div1.append(div2);

					})
				}
			}
		});
	}
</script>