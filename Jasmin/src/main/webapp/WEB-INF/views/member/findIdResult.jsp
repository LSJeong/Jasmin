<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.button {
	
	float: right;
}

#loginBtn:hover{
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
#pwBtn:hover{
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
.id_box{
	border:2px solid var(--main-chocolate);
	padding:40px;
	border-radius:8px;
}
.restart_login{
	margin-top:31px;
}

</style>


<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/books6.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>회원정보 찾기</h2>
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
						<h4>회원정보찾기</h4>
						<ul>
							<li><a href="findId.do" style="color: var(--main-light-brown)">아이디 찾기</a></li>
							<li><a href="findPw.do">비밀번호 찾기</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>아이디 찾기</h2>
					</div>

					<div align="col-lg-9 col-md-7">
						<div class="checkout__form">
							
								<div class="row id_box">
									<div class="col-lg-8 col-md-6">
									<h3>${member.name}님의 아이디는 <span class="margin_span"><strong> ${member.id } </strong>입니다.</span></h3>
	
									</div>
								

									</div>
									
										<div class="row restart_login">
										<div class="col-lg-3"></div>
										<div class="col-lg-5">
									<div class="checkout__input__checkbox  button">
											<div>
											<button type="submit" id="loginBtn"
													class="site-btn site-btn2" onclick="location.href='login.do'">로그인</button>
											
												
											</div>
										</div>
											<div>
												<button type="submit" id="pwBtn"
													class="site-btn site-btn2" onclick="location.href='findPw.do'">비밀번호 찾기</button>
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
