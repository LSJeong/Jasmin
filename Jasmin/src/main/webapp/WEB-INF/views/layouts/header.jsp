<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="preloder">
   <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
   <div class="humberger__menu__logo">
      <a href="#"><img src="resources/img/logo.png" alt=""></a>
   </div>
   <div class="humberger__menu__cart">
      <ul>
         <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
         <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
      </ul>
      <div class="header__cart__price">
         item: <span>$150.00</span>
      </div>
   </div>
   <div class="humberger__menu__widget">
      <div class="header__top__right__language">
         <img src="resources/img/language.png" alt="">
         <div>English</div>
         <span class="arrow_carrot-down"></span>
         <ul>
            <li><a href="#">Spanis</a></li>
            <li><a href="#">English</a></li>
         </ul>
      </div>
      <div class="header__top__right__auth">
         <a href="#"><i class="fa fa-user"></i> Login</a>
      </div>
   </div>
   <nav class="humberger__menu__nav mobile-menu">
      <ul>         
         <li><a href="allSearch.do">도서자료</a>
            <ul class="header__menu__dropdown">
               <li><a href="allSearch.do">통합검색</a></li>
               <li><a href="newbook.do">올해 신간도서</a></li>
               <li><a href="bestbook.do">베스트도서</a></li>
               <li><a href="chapter.do?bclass=100">주제별</a></li>
            </ul></li>
         <li><a href="noticeList.do">열린공간</a>
            <ul class="header__menu__dropdown">
               <li><a href="noticeList.do">공지사항</a></li>
               <li><a href="faqList.do">자주 하는 질문</a></li>
               <li><a href="qnaList.do">묻고 답하기</a></li>
               <li><a href="hBookList.do">희망 도서</a></li>
            </ul></li>
         <li><a href="location.do">이용안내</a>
            <ul class="header__menu__dropdown">
               <li><a href="location.do">도서관 위치</a></li>
               <li><a href="calendar.do">도서관 일정</a></li>
               <li><a href="rules.do">이용지침</a></li>
               <li><a href="tutorial.do">이용방법</a></li>
            </ul></li>
         <c:if test="${not empty id }">
            <li><a href="myInfo.do">나의 도서관</a>
               <ul class="header__menu__dropdown">
                  <li><a href="myInfo.do">기본정보</a></li>
                  <li><a href="loanStatusList.do">도서이용정보</a></li>
                  <li><a href="basketList.do">관심자료목록</a></li>
                  <li><a href="hopeBookList.do">나의신청정보</a></li>
                  <li><a href="bbsPostList.do">나의 게시글</a></li>
               </ul></li>
         </c:if>
         <li><a href="ahome.do">관리자</a></li>
      </ul>
   </nav>
   <div id="mobile-menu-wrap"></div>
   <div class="header__top__right__social">
      <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
         class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
      <a href="#"><i class="fa fa-pinterest-p"></i></a>
   </div>
   <div class="humberger__menu__contact">
      <ul>
         <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
         <li>Free Shipping for all Order of $99</li>
      </ul>
   </div>
</div>

<header class="header">

   <div class="container">
      <div class="row">
         <div class="col-lg-2">
            <div class="header__logo" style="width: 150px; height: 5px">
                <a href="home.do"><img src="resources/images/jasmin3.png" alt=""></a>
            </div>
         </div>
         <div class="col-lg-7">
            <nav class="header__menu">
               <ul>
                  <li><a href="allSearch.do">도서자료</a>
                     <ul class="header__menu__dropdown">
                        <li><a href="allSearch.do">통합검색</a></li>
                        <li><a href="newbook.do">올해 신간도서</a></li>
                        <li><a href="bestbook.do">베스트도서</a></li>
                        <li><a href="chapter.do?bclass=100">주제별</a></li>
                     </ul></li>
                  <li><a href="noticeList.do">열린공간</a>
                     <ul class="header__menu__dropdown">
                        <li><a href="noticeList.do">공지사항</a></li>
                        <li><a href="faqList.do">자주 하는 질문</a></li>
                        <li><a href="qnaList.do">묻고 답하기</a></li>
                        <li><a href="hBookList.do">희망 도서</a></li>
                     </ul></li>
                  <li><a href="location.do">이용안내</a>
                     <ul class="header__menu__dropdown">
                        <li><a href="location.do">도서관 위치</a></li>
                        <li><a href="calendar.do">도서관 일정</a></li>
                        <li><a href="rules.do">이용지침</a></li>
                        <li><a href="tutorial.do">이용방법</a></li>
                     </ul></li>
                  <c:if test="${not empty id }">
                     <li><a href="myInfo.do">나의 도서관</a>
                        <ul class="header__menu__dropdown">
                           <li><a href="myInfo.do">기본정보</a></li>
                           <li><a href="loanStatusList.do">도서이용정보</a></li>
                           <li><a href="basketList.do">관심자료목록</a></li>
                           <li><a href="hopeBookList.do">나의신청정보</a></li>
                           <li><a href="bbsPostList.do">나의 게시글</a></li>
                        </ul></li>
                  </c:if>
                  
               </ul>
            </nav>
         </div>
         <div class="col-lg-3">
            <div class="header__menu">
               <ul>
                  <li><c:if test="${not empty id }">
                        <a href="logout.do"><span>로그아웃</span></a>
                     </c:if> <c:if test="${empty id }">
                        <a href="login.do"><span>로그인</span></a>
                     </c:if></li>
                  <li><c:if test="${empty id }">
                     <a href="join.do">회원가입</a>
                  </c:if>
                  <c:if test="${author eq 'ADMIN' }">
                     <a href="ahome.do">관리자</a>
                  </c:if></li>                  
               </ul>
               
            </div>
         </div>
      </div>
      <div class="humberger__open">
         <i class="fa fa-bars"></i>
      </div>
   </div>
</header>