<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.hidden {
	visibility: hidden;
}

btn {
	padding: 10px;
}

.joinBtn_div {
	float: right;
}

#joinBtn {
	margin-top: 60px;
	height: 70px;
	width: 200px;
	border:3px solid var(--main-chocolate);
	background-color:white;
	color:var(--main-dark-chocolate);
}
#joinBtn:hover{
	background-color:var(--main-chocolate);
	color:white;
	border:none;
}

input:focus {
	border: 2px solid var(--main-chocolate);
}
.info_p{
	opacity:0.5;
}
</style>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/books5.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>회원가입</h2>
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
						<h4>회원가입</h4>
						<ul>
							<li><a href="login.do">로그인</a></li>
							<li><a href="join.do"
								style="color: var(--main-light-brown)">회원가입</a></li>


						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>회원가입</h2>
					</div>

					<div align="col-lg-9 col-md-7">
						<div class="checkout__form">
							<form id="joinFrm" method="POST">
								<div class="row">
									<div class="col-lg-8 col-md-6">
										<div class="row">
											<div class="col-lg-4">
												<div class="checkout__input">
													<p>
														아이디<span>*</span>
													</p>
													<input type="text" name="id" id="id" minlength="5" />
												</div>
											</div>
											
											<div class="col-lg-8">
												<div class="checkout__input">
													<p class="info_p">영문자 숫자 혼합 6자~12자를 입력해주세요.<span>* </span></p>
													<button type="button" id="idChk" class="site-btn site-btn2">
														중복 확인</button>
												</div>
											</div>
												
										</div>

										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														이름<span>*</span>
													</p>
													<input type="text" name="name" id="name" required />
												</div>
											</div>

											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														생년월일<span>*</span>
													</p>
													<input type="date" name="birth" id="birth"
														value="1990-01-01" required />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														비밀번호<span>*</span>
													</p>
													<input type="password" name="password" id="pwd" required />
												</div>
											</div>
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														비밀번호 확인<span>*</span>
													</p>
													<input type="password" name="pwdCheck" id="pwdCheck"
														required />
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														주소<span>*</span>
													</p>
													<input type="text" id="sample6_postcode" placeholder="우편번호"
														name="zipCode" />
												</div>
											</div>
											<div class="col-lg-4">
												<div class="checkout__input">
													<p class="hidden">우편번호</p>
													<button type="button" id="address_kakao" value="우편번호 찾기"
														class="site-btn site-btn2">우편번호 찾기</button>
													<br />
												</div>
											</div>
										</div>
										<div class="checkout__input">
											<input type="text" class="checkout__input__add"
												id="sample6_address" placeholder="도로명주소" name="address" />
											<input type="text" class="checkout__input__add"
												id="sample6_detailAddress" maxlength="20" placeholder="상세주소"
												name="addressdetail" />
										</div>

										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														이메일<span>*</span>
													</p>
													<input type="email" id="email" name="email" />
												</div>
											</div>

											<div class="col-lg-6">
												<div class="checkout__input">
													<p class="hidden">이메일</p>
													<button type="button" id="emailBtn"
														class="site-btn site-btn2">이메일 확인</button>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-lg-6">
												<div class="checkout__input">
													<p>
														연락처<span>*</span>
													</p>
													<input type="text" id="tel" name="tel"
														pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" />
												</div>
											</div>

											<div class="col-lg-6">
												<div class="checkout__input">
													<p class="hidden">연락처</p>
													<button type="button" id="telBtn"
														class="site-btn site-btn2">확인</button>
												</div>
											</div>
										</div>

										<div class="checkout__input__checkbox">
											<label for="acc"> 회원가입 하시겠습니까? <input type="checkbox"
												id="acc" /> <span class="checkmark"></span>
											</label>
										</div>

										<div class="row">
											<div class="col-lg-6"></div>
											<div class="col-lg-6">
												<button type="button" id="joinBtn"
													class="site-btn site-btn3">회원가입</button>
											</div>
										</div>

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function () {
    document
      .getElementById("address_kakao")
      .addEventListener("click", function () {
        //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
          oncomplete: function (data) {
            //선택시 입력값 세팅
            document.getElementById("sample6_postcode").value = data.zonecode;
            document.getElementById("sample6_address").value = data.roadAddress; // 주소 넣기
            document.querySelector("input[name=addressdetail]").focus(); //상세입력 포커싱
          },
        }).open();
      });
  };

 

 //아이디 체크
 
const idChkBtn = document.querySelector("#idChk");

const idChkFnc=()=>{
  const id = document.querySelector("#id").value;
  if(id!=""){
	  var idReg = /^[a-z]+[a-z0-9]{5,12}$/g;
      if( !idReg.test(id) ) {
          alert("아이디는 영문자로 시작하는 6~12자 영문자 또는 숫자이어야 합니다.");
          
    	  $("#id").val("");
    	  $("#id").focus();
          return;
      }else{
    	  
    $.ajax({
      url:"memberidChk.do",
      type:"post",
      data:{id:id},
      success:function(data){
        if(data=="T"){
           alert("사용 가능합니다")
           $("#idChk").prop("disabled", true);
           $("#id").attr("disabled", true);
           $("#idChk").css("border","1px solid var(--main-chocolate)");
           $("#idChk").css("background-color","white");
           $("#idChk").css("color","var(--main-chocolate)");
        }else{
          alert("이미 존재하는 아이디 입니다.")
        }
      },

    })
      }

	  
  }else{
	  alert("아이디를 입력해주세요.")
	 
	  $("#id").val("");
	  $("#id").focus();
	  
	  
  }
}

idChkBtn.addEventListener("click",idChkFnc);


//비밀번호 체크

 const pwdChk = document.querySelector("#pwdCheck");
 const pwd = document.querySelector("#pwd");



 function restart(){
		 pwd.value=""
		 pwdChk.value=""
		 pwd.focus();
 }
 
 

  //이메일 체크
  const emailBtn = document.getElementById("emailBtn");

  function emailChkFnc() {
    var text = document.getElementById("email").value;

    var regEmail =
      /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
    if (regEmail.test(text) === true) {
      alert("확인되었습니다");
      $("#emailBtn").prop("disabled", true);
      $("#email").attr("disabled", true);
      $("#emailBtn").css("border","1px solid var(--main-chocolate)");
      $("#emailBtn").css("background-color","white");
      $("#emailBtn").css("color","var(--main-chocolate)");
    } else {
      alert("이메일을 입력해주세요.");
    }
  }
  emailBtn.addEventListener("click", emailChkFnc);

  //연락처 특수문자

  function autoHypenTel(str) {
    str = str.replace(/[^0-9]/g, "");
    var tmp = "";

    if (str.substring(0, 2) == 02) {
      // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
      if (str.length < 3) {
        return str;
      } else if (str.length < 6) {
        tmp += str.substr(0, 2);
        tmp += "-";
        tmp += str.substr(2);
        return tmp;
      } else if (str.length < 10) {
        tmp += str.substr(0, 2);
        tmp += "-";
        tmp += str.substr(2, 3);
        tmp += "-";
        tmp += str.substr(5);
        return tmp;
      } else {
        tmp += str.substr(0, 2);
        tmp += "-";
        tmp += str.substr(2, 4);
        tmp += "-";
        tmp += str.substr(6, 4);
        return tmp;
      }
    } else {
      // 핸드폰 및 다른 지역 전화번호 일 경우
      if (str.length < 4) {
        return str;
      } else if (str.length < 7) {
        tmp += str.substr(0, 3);
        tmp += "-";
        tmp += str.substr(3);
        return tmp;
      } else if (str.length < 11) {
        tmp += str.substr(0, 3);
        tmp += "-";
        tmp += str.substr(3, 3);
        tmp += "-";
        tmp += str.substr(6);
        return tmp;
      } else {
        tmp += str.substr(0, 3);
        tmp += "-";
        tmp += str.substr(3, 4);
        tmp += "-";
        tmp += str.substr(7);
        return tmp;
      }
    }

    return str;
  }

  tel.onkeyup = function (event) {
    event = event || window.event;
    var _val = this.value.trim();
    this.value = autoHypenTel(_val);
  };

  //연락처 체크
  const telBtn = document.getElementById("telBtn");

  function telValidator() {
    var telVal = document.getElementById("tel").value;

    var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    if (regPhone.test(telVal) === true) {
      alert("확인되었습니다");

      $("#telBtn").prop("disabled", true);
      $("#tel").attr("disabled", true);
      $("#telBtn").css("border","1px solid var(--main-chocolate)");
      $("#telBtn").css("background-color","white");
      $("#telBtn").css("color","var(--main-chocolate)");
      
    } else {
      alert("핸드폰 번호를 확인 해주세요");
      tel.focus();
      tel.value = "";
    }
  }
  telBtn.addEventListener("click", telValidator);

  //keypress
  const id = document.querySelector("#id");
  function idEnter(){
	  if (event.keyCode == 13) idChkFnc();
  }
  
  id.addEventListener("keypress", idEnter);
  function emailEnter(event) {
    if (event.keyCode == 13) emailChkFnc();
  }

  email.addEventListener("keypress", emailEnter);

  function telEnter(event) {
    if (event.keyCode == 13) telValidator();
  }
  tel.addEventListener("keypress", telEnter);

  //회원정보 수정 ajax
  const joinBtn = document.getElementById("joinBtn");
  const userJoinAjax = () => {
    if( $("#idChk").is(":disabled")){
      $("#id").removeAttr("disabled");
    }else{
      alert("아이디 중복체크 해주세요.");
      $("#id").focus();
      return true;
    }
  
    if ($("#telBtn").is(":disabled")) {
      $("#tel").removeAttr("disabled");
    } else {
      alert("연락처를 확인해주세요.");
      $("#tel").focus();
      return true;
    }
   

if(pwd.value ==pwdChk.value){
  let newVal = pwd.value;
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
    // console.log("통과"); 
      // return true;
  
   }	

}else if(pwd.value==""||pwdChk.value==""){
  alert("비밀번호를 입력해주세요");
restart();
return true;

}else if(pwd.value!=pwdChk.value){
  alert("비밀번호가 일치하지 않습니다.")
  restart();
return true;
}

    if ($("#emailBtn").is(":disabled")) {
      $("#email").removeAttr("disabled");
    } else {
      alert("이메일을 확인해주세요.");
      $("#email").focus();
      return true;
    }
    if($('#name').val()==""){
    	alert("이름을 입력해주세요.");
        $("#name").focus();
        return true;
    }
    if ($("#acc").is(":checked") == false) {
      alert("수정 체크해주세요.");
      $("#acc").focus();
      return true;
    }

    

    $.ajax({
      url: "memberJoin.do",
      type: "post",
      data: $("#joinFrm").serialize(),
      success: function (data) {
        if (data == "T") {
          alert("회원가입이 완료되었습니다!");
          location.href="home.do"
          
        }
      },
    });
  };

  joinBtn.addEventListener("click", userJoinAjax); 
</script>
