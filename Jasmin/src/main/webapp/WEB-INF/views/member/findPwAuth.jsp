<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<style>
#checkNum{
	float:right;
}
#checkNum:hover{
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
input:focus {
	border: 2px solid var(--main-chocolate);
}
.checkout__input>p{
	margin-top:10px;
}
</style>
<section
  class="breadcrumb-section set-bg"
  data-setbg="resources/myinfoImg/books6.png"
>
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
              <li><a href="findId.do">아이디 찾기</a></li>
              <li><a href="findPw.do" style="color: var(--main-light-brown)">비밀번호 찾기</a></li>
              
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-9 col-md-7">
        <div class="product__discount">
          <div class="section-title product__discount__title">
            <h2>비밀번호 찾기</h2>
          </div>

          <div align="col-lg-9 col-md-7">
            <div class="checkout__form">
              <form id="frm" method="post" action="inputNewPw.do">
                <div class="row">
                  <div class="col-lg-8 col-md-6">
                    <div class="row">
                      <div class="col-lg-3">
                        <div class="checkout__input">
                          <p>인증번호</p>
                          
                        </div>
                      </div>
                      <div class="col-lg-5">
                        <div class="checkout__input">
                        		
                          <input id="email_injeung" name="email_injeung" placeholder="인증번호를 입력하세요" type="text"  maxlength="6" />
                      
                        </div>
                      </div>
                      
                         <div class="col-lg-3">
                        <div class="checkout__input">
                        		
                          <button type="button" id="checkNum" class="site-btn site-btn2">확인</button>
                      
                        </div>
                      </div>
                    </div>
                    <input type="hidden" id="num" name="num" value="${num }">
                 

                    <div class="checkout__input__checkbox  button">
                      <div>
										
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
<script type="text/javascript">
const checkNum = document.querySelector("#checkNum");
function checkNumAjaxFnc(){
	const injeung=document.querySelector("#email_injeung").value;
  const num = document.querySelector("#num").value;
  if(injeung==num){
    alert("인증 완료되었습니다.");
    frm.submit();
  }else{
    alert("이메일 인증번호를 확인해주세요.")
    $("#email_injeung").val("");
    $("#num").val("");
    $("#email_injeung").focus();
  }

}

checkNum.addEventListener("click",checkNumAjaxFnc);
</script>              

