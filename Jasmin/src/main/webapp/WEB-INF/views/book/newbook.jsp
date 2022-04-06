<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section class="breadcrumb-section set-bg"
	data-setbg="resources/images/lib.PNG">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>올해 신간도서</h2>
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
						<h4>도서자료</h4>
						<ul>
							<li><a href="allSearch.do">통합 검색</a></li>
							<li><a href="newbook.do" style="color: var(--main-light-brown);">올해 신간도서</a></li>
							<li><a href="bestbook.do" >베스트도서</a></li>
							<li><a href="chapter.do?bclass=100">주제별</a></li>
							<li><a href="chapter.do?bclass=100"> - 철학</a></li>
							<li><a href="chapter.do?bclass=200"> - 종교</a></li>
							<li><a href="chapter.do?bclass=300"> - 사회과학 </a></li>
							<li><a href="chapter.do?bclass=400"> - 자연과학</a></li>
							<li><a href="chapter.do?bclass=500"> - 기술과학</a></li>
							<li><a href="chapter.do?bclass=600"> - 예술</a></li>
							<li><a href="chapter.do?bclass=700"> - 언어</a></li>
							<li><a href="chapter.do?bclass=800"> - 문학</a></li>
							<li><a href="chapter.do?bclass=900"> - 역사</a></li>
						</ul>
					</div>
				
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount" style="padding-bottom: 20px">
					<div class="section-title product__discount__title">
						<h2>올해 신간도서</h2>
					</div>					
				</div>
				<div class="filter__item" style="padding-top: 0; border-top: 0;">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>
									<span>${fn:length(newbooklist) }</span> Books found
								</h6>
							</div>
						</div>
						<div class="col-lg-4 col-md-3">
							<div class="filter__option">
								<span class="icon_grid-2x2"></span> <span class="icon_ul"></span>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
				<c:forEach items="${newbooklist }" var="newbook">
					<div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item">
                        	<c:if test="${not empty newbook.ppicture }">
	                        	<div class="product__item__pic set-bg" data-setbg="/filePath/${newbook.ppicture }" onclick="location.href='detailbook.do?isbn=${newbook.isbn }'">
	                                <ul class="product__item__pic__hover">
	                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                </ul>
	                            </div>
                        	</c:if>
                	        <c:if test="${empty newbook.ppicture }">
	                        	<div class="product__item__pic set-bg" data-setbg="/filePath/1234.PNG" onclick="location.href='detailbook.do?isbn=${newbook.isbn }'">
	                                <ul class="product__item__pic__hover">
	                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                </ul>
	                            </div>
                        	</c:if>
                            <div class="product__discount__item__text">
                               <span>${newbook.writer }</span>
                               <h5><strong>${newbook.title }</strong></h5>
                           </div>
                        </div>
                    </div>
				</c:forEach>
                        
                       
                        
                    </div>

				<div class="product__pagination">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
						class="fa fa-long-arrow-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>
