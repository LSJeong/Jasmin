<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<style>
#checkEmail{
	float:right;
}
#checkEmail:hover{
	border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
input:focus {
	border: 2px solid var(--main-chocolate);
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
              <form id="frm" method="post" action="findPwAuth.do">
                <div class="row">
                  <div class="col-lg-8 col-md-6">
                    <div class="row">
                      <div class="col-lg-6">
                        <div class="checkout__input">
                          <p>아이디</p>
                          
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="checkout__input">
                          <input id="id" name="id" type="text"  />
                      
                        </div>
                      </div>
                    </div>
                    
                    
                      <div class="row">
                      <div class="col-lg-6">
                        <div class="checkout__input">
                          <p>이메일</p>
                          
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="checkout__input">
                          <input id="email" name="email" type="email" />
                        </div>
                      </div>
                    </div>
                    

                 
                 

                    <div class="checkout__input__checkbox  button">
                      <div>
										<button type="button" id="checkEmail" class="site-btn site-btn2">확인</button>
									</div>
                    </div>
                  
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        </div>
       
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 const checkEmail = document.querySelector("#checkEmail");
 
  function checkAjaxFnc(){
  $.ajax({
    url:"emailCheck.do",
    type:"post",
    data:$("#frm").serialize(),
    success:function(data){
    	if(data=="D"){
    		alert("탈퇴한 회원입니다.")	
    	}
    	else if(data=="T"){
    		alert("인증번호를 발송했습니다.");
      		$.ajax({
      			url:"findPwEmail.do",
      			type:"post",
      			data:$("#frm").serialize(),
      			success:function(data){
      				frm.submit();
      			},
      			error:function(data){
      				console.log(data);
      			}
      			
      		})
    	}else{
    		alert("아이디 또는 이메일을 다시 확인해주세요.");
    		$("#id").val("");
    		$("#email").val("");
    		$("#id").focus();
    	}
    },
    error:function(){
      alert("실패!")
    }
    

  })
 }
 
 checkEmail.addEventListener("click",checkAjaxFnc) 
</script>              
               
      
</section>


