<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<style>
.button_divs{
	margin-top:30px;
}
p>a{
	color:var(--main-chocolate);
}
p>a:hover{
	color:var(--main-chocolate);
	border-bottom:3px solid var(--main-chocolate);
}
</style>
<section
  class="breadcrumb-section set-bg"
  data-setbg="resources/myinfoImg/알라딘.gif"
>
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <div class="breadcrumb__text">
          <h2>회원탈퇴</h2>
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
						<h4>회원정보</h4>
						<ul>
							<li><a href="memberModifyCheck.do">회원정보수정</a></li>
							<li><a href="memberPwdModify.do">비밀번호변경</a></li>
							<li><a href="memberWithdraw.do" style="color: var(--main-light-brown)">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>탈퇴완료</h2>
					</div>

					<div align="col-lg-9 col-md-7">
						<div class="checkout__form">
							
								<div class="row">
									<div class="col-lg-8 col-md-6">
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														이용해주셔서 감사합니다.
													</p>

												</div>
											</div>
										
										</div>

										<div class="row">
											<div class="col-lg-12">
												<div class="checkout__input">
													<p>
														서비스를 다시 이용하시려면 <a href="join.do"><strong>회원가입</strong></a>을 통해 다시 이용 가능합니다.
													</p>

												</div>
											</div>
										</div>
										<div class="row button_divs">
											<div class="col-lg-3"></div>
											<div class="col-lg-4">
										
											
												<button type="button" id="mainBtn"
													class="site-btn site-btn2">메인으로 가기</button>
													</div>
													<div class="col-lg-5">
												<button type="button" id="joinBtn"
													class="site-btn site-btn3">회원가입 바로가기</button>
												</div>
											</div>
											</div>
										</div>
								</div>
										
									</div>
								</div>
							
						</div>
					</div>
				</div>
			
</section>

<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>
  function alert() {
    alert("로그인 후 이용할 수 있습니다");
  }
  
  const joinBtn = document.querySelector("#joinBtn");

  function joinFormFnc(){
	  location.href="join.do";
  }
  joinBtn.addEventListener("click",joinFormFnc);

  const mainBtn = document.querySelector("#mainBtn")

  function mainFnc(){
	  location.href="home.do";
  }
  mainBtn.addEventListener("click",mainFnc)
</script>
