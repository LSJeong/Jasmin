<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.user_info {
	border: 3px solid var(--main-brown);
	padding: 20px;
	border-radius: 15px;
}

.update_btn_div {
	margin-top: 20px;
	margin-bottom: 60px;
}

.info_box {
	margin-top: 40px;
	margin-bottom: 50px;
}

.checkout__input p {
	font-weight: 600;
	font-size: 17px;
	color: var(--main-dark-chocolate);
}

#updateBtn:hover {
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}


.info_box1 {
	border: 2px solid var(--main-brown);
	padding: 30px 0px;
	text-align: center;
	border-radius: 7px;
	font-weight: 600;
}

.info_box1>a {
	font-size: 23px;
	color: var(--main-light-brown);
}

.info_box1>a:hover {
	font-weight: 600;
	color: var(--main-brown);
	border-bottom: 3px solid var(--main-light-brown);
}
</style>

<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/myInfo2.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>회원정보수정</h2>
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
						<h4>내 서재</h4>
						<ul>
							<li><a href="myInfo.do"
								style="color: var(--main-light-brown)">기본정보</a>
							</li>
							<li><a href="loanStatusList.do">도서이용정보</a></li>
							<li><a href="basketList.do">관심자료목록</a></li>
							<li><a href="hopeBookList.do">나의신청정보</a></li>
							<li><a href="bbsPostList.do">나의 게시글</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>${member.name }님반갑습니다</h2>
					</div>

					<div align="col-lg-9 col-md-7">
						<div class="checkout__form">
							<div class="row user_info">
								<div class="col-lg-12 col-md-6">
									<div class="row">
										<div class="col-lg-3"
											style="border-right: 1px solid var(--main-light-brown)">
											<div class="checkout__input">
												<p>아이디</p>
											</div>
										</div>
										<div class="col-lg-1"></div>
										<div class="col-lg-6">
											<div class="checkout__input">${member.id }</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-3"
											style="border-right: 1px solid var(--main-light-brown)">
											<div class="checkout__input">
												<p>이름</p>
											</div>
										</div>
										<div class="col-lg-1"></div>
										<div class="col-lg-6">
											<div class="checkout__input">${member.name }</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-3"
											style="border-right: 1px solid var(--main-light-brown)">
											<div class="checkout__input">
												<p>회원가입일</p>
											</div>
										</div>
										<div class="col-lg-1"></div>
										<div class="col-lg-6">
											<div class="checkout__input">${member.joinDate }</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-3"
											style="border-right: 1px solid var(--main-light-brown)">
											<div class="checkout__input">
												<p>연락처</p>
											</div>
										</div>
										<div class="col-lg-1"></div>
										<div class="col-lg-6">
											<div class="checkout__input">${member.tel }</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-3"
											style="border-right: 1px solid var(--main-light-brown)">
											<div class="checkout__input">
												<p>이메일</p>
											</div>
										</div>
										<div class="col-lg-1"></div>
										<div class="col-lg-6">
											<div class="checkout__input">${member.email }</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-5"></div>
								<div class="col-lg-3 update_btn_div">
									<button id="updateBtn" class="site-btn site-btn2">
										개인정보 수정</button>
								</div>
							</div>
						</div>

						<div class="section-title product__discount__title">
							<h2>서비스 현황</h2>
						</div>
						<div class="row info_box ">
							<div class="col-lg-4">
								<div class="info_box1">
									이북 도서 대출 <br> 이용수 <a href="loanStatusList.do"><br>
										${rentEbookCnt }</a>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="info_box1">
									도서 배송 <br>이용수 <a href="loanDeliveryStatusList.do"><br>${rentDeliveryCnt }</a>
								</div>
							</div>
							<div class="col-lg-4">
								<div class="info_box1">
									관심<br> 도서수 <a href="basketList.do"><br>${rentDeliveryCnt }</a>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-lg-2"></div>
							<div class="col-lg-3">
								<div class="info_box1">
									희망 도서 <br>신청수 <a href="hopeBookList.do"><br>${rentHBCnt }</a>
								</div>
							</div>

							<div class="col-lg-3">
								<div class="info_box1">
									묻고 답하기글 <br>수 <a href="bbsPostList.do"> <br>${rentQnaCnt }</a>
								</div>
							</div>
							<div class="col-lg-2"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	const updateBtn = document.querySelector("#updateBtn");
	function updateFormFnc() {
		location.href = "memberModifyCheck.do";
	}
	updateBtn.addEventListener("click", updateFormFnc);
</script>
