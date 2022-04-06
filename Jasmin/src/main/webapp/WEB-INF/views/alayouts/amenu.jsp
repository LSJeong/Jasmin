<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-category"></li>     
            <li class="nav-item">
              <a class="nav-link" href="ahome.do">
                <span class="icon-bg"><i class="mdi mdi-chart-bar menu-icon"></i></span>
                <span class="menu-title">통 계</span>
              </a>              
            </li>        
            <li class="nav-item">
              <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                <span class="icon-bg"><i class="mdi mdi-crosshairs-gps menu-icon"></i></span>
                 <span class="menu-title">공지관리</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="ui-basic">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="aNoticeList.do">공지사항</a></li>
                  <li class="nav-item"> <a class="nav-link" href="aQnaList.do">묻고 답하기</a></li>
                </ul>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="amember.do">
                <span class="icon-bg"><i class="mdi mdi-contacts menu-icon"></i></span>
                <span class="menu-title">회원관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="arentlist.do">
                <span class="icon-bg"><i class="mdi mdi-format-list-bulleted menu-icon"></i></span>
                <span class="menu-title">대출관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="bookmanage.do">
                <span class="icon-bg"><i class="mdi mdi-format-list-bulleted menu-icon"></i></span>
                <span class="menu-title">도서관리</span>
              </a>
            </li>                                    
            <li class="nav-item">
              <a class="nav-link" href="calendarManage.do">
                <span class="icon-bg"><i class="mdi mdi-format-list-bulleted menu-icon"></i></span>
                <span class="menu-title">일정관리</span>
              </a>
              <br>
            </li>         
            <li class="nav-item sidebar-user-actions">
            <br>
              <div class="user-details">
                <div class="d-flex justify-content-between align-items-center">
                  <div>
                    <div class="d-flex align-items-center">
                      <div class="sidebar-profile-img">
                        <img src="resources/assets/images/faces/face28.png" alt="image">
                      </div>
                      <div class="sidebar-profile-text">
                        <p class="mb-1">관리자</p>
                      </div>
                    </div>
                  </div>                  
                </div>
              </div>
            </li>            
            <li class="nav-item sidebar-user-actions">
              <div class="sidebar-user-menu">
                <a href="home.do" class="nav-link"><i class="mdi mdi-logout menu-icon"></i>
                  <span class="menu-title">메인으로</span></a>
              </div>
              <div class="sidebar-user-menu">
                <a href="logout.do" class="nav-link"><i class="mdi mdi-logout menu-icon"></i>
                  <span class="menu-title">로그아웃</span></a>
              </div>
            </li>
          </ul>
        </nav>