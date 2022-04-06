<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
button{
	float:right;
	margin-top:40px;
}
#deleteBtn{
	margin-top:30px;
	width:150px;
	height:50px;
}
#deleteBtn:hover{
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
input:focus{
	border:2px solid var(--main-chocolate);
}
.info_box{
	border:2px solid var(--main-chocolate);
	margin-bottom:50px;
	padding:25px;
	font-size:17px;
	border-radius:7px;
}
</style>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/books8.png">
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
						<h2>회원탈퇴</h2>
					</div>

						<div class="row info_box">
							<div class="col-lg-3"></div>							
							<div class="col-lg-6"><p>회원 탈퇴 시 탈퇴한 아이디는 재사용할 수 없으니 </p>
												  <p>신중히 탈퇴해주십시오.</p></div>
						</div>
					<div align="col-lg-9 col-md-7">
						<div class="checkout__form">
							<form id="frm" method="post">
								<div class="row">
									<div class="col-lg-8 col-md-6">
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														성명
													</p>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<input type="text" id="name" name="name" value="${member.name }" readonly />

												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														아이디 
													</p>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<input id="id" name="id" type="text" value="${member.id }" readonly
														required />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														비밀번호
													</p>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<input id="password" name="password" type="password"
														required />
												</div>
											</div>
										</div>





										<div class="checkout__input__checkbox">
											<div>
												<button type="button" id="deleteBtn"
													class="site-btn site-btn2">확인</button>
											</div>
										</div>
										
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
</section>


<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>
 const pwdChkBtn= document.querySelector("#pwdChkBtn");
 
 const pwd = document.querySelector("#password");


 function pwdChkFnc(){
	 var str = confirm("정말 탈퇴하시겠습니까?")
	 if(str){
		 if(pwd.value!="" && pwd.value =='${member.password}'){
				let pwdVal =pwd.value;
				 var num = pwdVal.search(/[0-9]/g);
				 var eng = pwdVal.search(/[a-z]/ig);
				 var spe = pwdVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

				 if(pwdVal.length < 8 || pwdVal.length > 20){

				  alert("8자리 ~ 20자리 이내로 입력해주세요.");
				  restart();
				  return false;
				 }else if(pwdVal.search(/\s/) != -1){
				  alert("비밀번호는 공백 없이 입력해주세요.");
				  restart();
				  return false;
				 }else if(num < 0 || eng < 0 || spe < 0 ){
				  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				  restart();
				  return false;
				 }else {
					// console.log("통과"); 
				    // return true;
					$.ajax({
						url:"memberDelete.do",
						type:"POST",
						data:$("#frm").serialize(),
						success:function(data){
							if(data=="T")
							alert("그동안 이용해주셔서 감사합니다.")
							frm.action="goodBye.do";
							frm.submit();
						}
					})
				 }	

		}else{
			alert("현재 비밀번호와 일치하지 않습니다")
			restart();
		} 
	 }else
		 return false;
	   
 }

 function restart(){
		 pwd.value=""
		 pwd.focus();
 }
 deleteBtn.addEventListener("click",pwdChkFnc);


 //pwdChk enter 처리
function pwdChkEnter(event){
	if(event.keyCode == 13){
		pwdChkFnc()
	}
}
 pwd.addEventListener("keypress",pwdChkEnter);
</script>