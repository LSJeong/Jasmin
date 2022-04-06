<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#pwdChkBtn{
	float:right;
}
#pwdChkBtn:hover{
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
input:focus {
	border: 2px solid var(--main-chocolate);
}
</style>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/books6.png">
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
						<h4>회원정보찾기</h4>
            <ul>
              <li><a href="findId.do">아이디 찾기</a></li>
              <li><a href="findPw.do" style="color: var(--main-light-brown)">비밀번호 찾기</a></li>
              
            </ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>비밀번호 변경</h2>
					</div>

					<div align="col-lg-9 col-md-7">
						<div class="checkout__form">
							<form id="pwdFrm" method="post">
								<div class="row">
									<div class="col-lg-8 col-md-6">
									

										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														새 비밀번호<span>*</span>
													</p>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<input id="newpassword" name="password" type="password"
														required />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														새 비밀번호 확인<span>*</span>
													</p>

												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<input id="passwordChk" name="passwordChk" type="password"
														required />
												</div>
											</div>
										</div>





										<div class="checkout__input__checkbox">
											<div>
												<button type="button" id="pwdChkBtn"
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
 const pwdChk = document.querySelector("#passwordChk");

 const newPwd = document.querySelector("#newpassword");

 function pwdChkFnc(){
	 if(newPwd.value!=""&&pwdChk.value){

		if(newPwd.value!=pwdChk.value){
			alert("새 비밀번호와 새 비밀번호 확인이 다릅니다.")
			restart();
		 }else if(newPwd.value==pwdChk.value){
				let newVal = newPwd.value;
				 var num = newVal.search(/[0-9]/g);
				 var eng = newVal.search(/[a-z]/ig);
				 var spe = newVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

				 if(newVal.length < 8 || newVal.length > 20){

				  alert("8자리 ~ 20자리 이내로 입력해주세요.");
				  restart();
				  return false;
				 }else if(newVal.search(/\s/) != -1){
				  alert("비밀번호는 공백 없이 입력해주세요.");
				  restart();
				  return false;
				 }else if(num < 0 || eng < 0 || spe < 0 ){
				  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
				  restart();
				  return false;
				 }else {
					
					let password =newPwd.value;
					console.log(password);
					 $.ajax({
						url:"newPwdUpdate.do",
						type:"POST",
						data:{password:password},
						success:function(data){
							if(data=="T")
							alert("비밀번호를 수정했습니다")
							pwdFrm.action="login.do";
							pwdFrm.submit();
						}
					})  
				 }	

		}
			 
 
		 
	 }else{
		 alert("비밀번호를 제대로 입력하지 않았습니다. 다시 입력해주세요.")
	     restart();
	 }
 }

 function restart(){
		
		 newPwd.value=""
		 pwdChk.value=""
		 newPwd.focus();
 }
 pwdChkBtn.addEventListener("click",pwdChkFnc);


 //pwdChk enter 처리
function pwdChkEnter(event){
	if(event.keyCode == 13){
		pwdChkFnc()
	}
}
 pwdChk.addEventListener("keypress",pwdChkEnter);
</script>