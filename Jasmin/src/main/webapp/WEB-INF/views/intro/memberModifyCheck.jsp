<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<style>
button{
	float:right;
}
input:focus{
	border:2px solid var(--main-chocolate);
}
#checkBtn:hover{
border:2px solid var(--main-chocolate);
	color:var(--main-chocolate);
	background-color:white;
}
li{
	cursor:pointer;
}
</style>
<section
  class="breadcrumb-section set-bg"
  data-setbg="resources/myinfoImg/books8.png"
>
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
              <li><a href="memberModifyCheck.do" style="color: var(--main-light-brown)">회원정보수정</a></li>
              <li><a onclick="alert('비밀번호 입력 후 이용 가능합니다')">비밀번호변경</a></li>
              <li><a onclick="alert('비밀번호 입력 후 이용 가능합니다')">회원탈퇴</a></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col-lg-9 col-md-7">
        <div class="product__discount">
          <div class="section-title product__discount__title">
            <h2>회원정보수정</h2>
          </div>

          <div align="col-lg-9 col-md-7">
            <div class="checkout__form">
              <form id="frm" method="post">
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
                          <input id="id" name="id" type="text" value="${id }" readonly />
                      
                        </div>
                      </div>
                    </div>
                    
                      <div class="row">
                      <div class="col-lg-6">
                        <div class="checkout__input">
                          <p>비밀번호</p>
                          
                        </div>
                      </div>
                      <div class="col-lg-6">
                        <div class="checkout__input">
                          <input id="password" name="password" type="password" />
                        </div>
                      </div>
                    </div>
                    

                 
                 

                    <div class="checkout__input__checkbox">
                      <div>
										<button type="button" id="checkBtn" class="site-btn site-btn2">확인</button>
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
 const inputEnter=document.getElementById("password");

 function enterSubmintFnc(eveent){
  if(event.keyCode ==13){
	  checkPwFnc();
  }
 }
 
 inputEnter.addEventListener("keypress",enterSubmintFnc);

  const checkBtn = document.getElementById("checkBtn");

  function checkPwFnc(){

    $.ajax({
      url:"memberModifyCheckPw.do",
      type:"POST",
      data:$("#frm").serialize(),
      success: function(data){
    	  result = data.trim();
        if(result=="T"){
          frm.action ="memberModify.do";
          frm.submit();
          
        }else{
          alert("비밀번호를 다시 입력해주세요");
          $("#password").val("");
          $("#password").focus();

        }
      },
      error:function(error){
    	  console.log(error)
      }

    })
    
  }
  checkBtn.addEventListener("click",checkPwFnc);
</script>