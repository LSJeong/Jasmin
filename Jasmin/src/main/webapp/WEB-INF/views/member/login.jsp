<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>

.findInfo{
	float:right;
	margin-top:40px;
}
#loginBtn{
	margin-top:30px;
	width:200px;
	height:50px;
	font-size:20px;
	padding:20px;
	padding-bottom:50px;
	
}
#loginBtn:hover{
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
#loginBtn>i{
	margin-right:10px;
}
#loginBtn i:last-child{display:none}
#loginBtn:hover i:first-child{display:none}
#loginBtn:hover i:last-child{display:inline-block}
.findInfo>a{
	
	font-weight:bold;
	font-size:17px;
	color:var(--main-light-brown);
	padding:0px 10px;
}
.findInfo>a:first-child{
	border-right:2px solid var(--main-light-brown);
}
.findInfo>a:first-child:hover{
	color:var(--main-chocolate);
	font-weight:bold;
}
.findInfo>a:last-child:hover{
	color:var(--main-chocolate);
	font-weight:bold;
}
input:focus{
	border:2px solid var(--main-chocolate);
}
</style>

<script src="https://kit.fontawesome.com/8b5d6c8559.js" crossorigin="anonymous"></script>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/books4.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>로그인</h2>
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
						<h4>로그인</h4>
						<ul>
							<li><a href="login.do" style="color: var(--main-light-brown)">로그인</a></li>
							<li><a href="join.do">회원가입</a></li>
						
							

						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>로그인</h2>
					</div>

					<div align="col-lg-9 col-md-7">
						<div class="checkout__form">
							<form id="frm" method="post">
								<div class="row">
									<div class="col-lg-8 col-md-6">
										<div class="row">
											<div class="col-lg-3">
												<div class="checkout__input">
													<p>아이디</p>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<input id="id" name="id" type="text" />

												</div>
											</div>
												<div class="col-lg-3">
												<button type="button"  id="loginBtn"
													class="site-btn site-btn2" onclick="login()"><i class="fas fa-lock"></i><i class="fas fa-unlock"></i>로그인</button>
											
										
											</div>
										</div>

										<div class="row">
											<div class="col-lg-3">
												<div class="checkout__input">
													<p>비밀번호</p>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<input id="passwordBox" name="password" type="password" />
												</div>
											</div>
										</div>



				
										<div class="findInfo">
											<a href="findId.do">아이디 찾기</a> <a href="findPw.do">비밀번호 찾기</a>
										</div>
										<div class="row">
										<div class="col-lg-6"></div>
										
										
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
const pwd = document.querySelector("#passwordBox");


	function login(){
		if(pwd.value!=""){
	   let newVal = pwd.value;
		var num = newVal.search(/[0-9]/g);
		var eng = newVal.search(/[a-z]/ig);
		var spe = newVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if(newVal.length < 8 || newVal.length > 20){

		 alert("8자리 ~ 20자리 이내로 입력해주세요.");
		pwd.value="";
		pwd.focus();
		 return false;
		}else if(newVal.search(/\s/) != -1){
		 alert("비밀번호는 공백 없이 입력해주세요.");
		 pwd.value="";
		pwd.focus();
		 return false;
		}else if(num < 0 || eng < 0 || spe < 0 ){
		 alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
		 pwd.value="";
		pwd.focus();
		 return false;
		}else {
		   // console.log("통과"); 
		   // return true;
		   $.ajax({
			url:"loginCheck.do",
			type:"POST",
			data:$("#frm").serialize(),
			success: function(data){
				
					console.log(data)
				 if(data=="T"){
				 	location.href="home.do";
				 }else if(data=="D"){
					 alert("탈퇴한 회원입니다")
				 }
				 
				 else{
				 	alert("아이디 또는 비밀번호를 확인해주세요")
					 $("#loginBox").val("")
				$("#passwordBox").val("")
				$("#loginBox").focus();
				 }
			},
			error:function(reject){
				console.log(reject)
			}
		})
		}	


}
	
		
	}

	const passwordBox = document.querySelector("#passwordBox")


	function loginEnter(){
		if(event.keyCode==13){
			login();
		}
	}
	passwordBox.addEventListener("keypress",loginEnter);
	function join(){
		var str = confirm("회원가입 하시겠습니까?")
		if(str){
			location.href="join.do";
		}
	}
	
	function findId(){
		
	}
</script>