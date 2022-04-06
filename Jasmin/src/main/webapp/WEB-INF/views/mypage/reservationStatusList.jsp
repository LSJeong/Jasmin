<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
 .myInfoBox{
 	border:1px solid black;
 }
 ul{
 	list-style:none;
 }
 .myState{
 	border:1px solid black;
 }
 .tabNav_list{
 	display:flex;
 }
 .tabNav_list{
 	border:1px solid black;
 }
 .innerText{
 	border:1px solid black;
 }
 .resultList_flex{
 	display:flex;
 }
 .boardFilter{
 	border-bottom:1px solid black;
 }

</style>
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">
                        <div class="sidebar__item">
                            <h4>내 서재</h4>
                            <ul>
                                <li><a href="myInfo.do">기본정보</a></li>
                                <li><a href="loanStatusList.do">도서이용정보</a></li>
                                <li><a href="basketList.do">관심자료목록</a></li>
                                <li><a href="hopeBookList.do">나의신청정보</a></li>
                                <li><a href="#">나의 게시글</a></li>
                                
                            </ul>
                        </div>
                    
                        <div class="sidebar__item">
                            <div class="latest-product__text">
                                <h4>Latest Products</h4>
                                <div class="latest-product__slider owl-carousel">
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="latest-prdouct__slider__item">
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-1.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-2.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                        <a href="#" class="latest-product__item">
                                            <div class="latest-product__item__pic">
                                                <img src="img/latest-product/lp-3.jpg" alt="">
                                            </div>
                                            <div class="latest-product__item__text">
                                                <h6>Crab Pool Security</h6>
                                                <span>$30.00</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>예약현황</h2>
                        </div>
                        <div class="row tabNav">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                   <ul class="tabNav_list">
                                   		<li class="choiced" style="min-width:185px">
                                   			<a href="loanStatusList.do">대출현황</a>
                                   		</li>
                                   </ul>
                                </div>
                                
                                  <div class="col-lg-4 col-md-6 col-sm-6">
                                   <ul class="tabNav_list">
                                   		<li class="choiced" style="min-width:185px">
                                   			<a href="reservationStatusList.do">예약현황</a>
                                   		</li>
                                   </ul>
                                </div>  
                                
                                  <div class="col-lg-4 col-md-6 col-sm-6">
                                   <ul class="tabNav_list">
                                   		<li class="choiced" style="min-width:185px">
                                   			<a href="loanStatusList.do">관심자료목록</a>
                                   		</li>
                                   </ul>
                                </div>    
                           
                        </div>
                    </div>
                    <div class="filter__item">
                 
                      <div class="product__discount">
                        <div class="boardFilter clearfix">
							<p class="count">예약현황건수 : <span class="themeFC">0</span>건</p>
						</div>
						
						<!-- 대출 목록 없을 경우 c:if-->
                       <div class="articleWrap">
							<ul class="article-list check">
								<li class="emptyNote">내역이 존재하지 않습니다.</li>
							</ul>
						</div>
						
						<!-- 대출 목록 있을 경우 c:forEach -->
					
					  
					<div class="articleWrap">
						<ul class="article-list">
							
									
										<li>
											<p class="title"><a href="#link" onclick="javascript:fnSearchResultDetail(1110854658,1110854660,'MO'); return false;">아몬드 : 큰글씨책. 1</a></p>
											<p class="info">
												<span>소장도서관 : 중앙도서관</span>
												<span>자료실 : [중앙]어르신열람실(제1문헌실내 비치)</span>
											</p>
											<p class="info">
												<span>예약일 : 2021.12.04</span>
												<span>예약만기일 :
													-
												</span>
												<span>예약순번 :1번째 (1명 예약)</span>
											</p>
											<p class="info">
												
														<span class="status">예약상태 : <em>예약중</em></span>
													
												
														
																<span class="status">대출상태 : <em>대출중</em></span>
															
														<span class="status">반납예정일 : <em>2021.12.15</em></span>
													
												
													<a href="#btn" onclick="javascript:fnLoanReservationCancelProc(1838595529); return false;" class="btn small themeBtn">예약취소</a>
												
											</p>
										</li>
									
								
						</ul>
					</div>
					<!-- 페이징 처리 -->
						<div class="pagingWrap">
						
							<p class="paging">
								<span class="current">1</span>


							</p>
						
					</div>
     
                </div>
            </div>
        </div>
    </section>