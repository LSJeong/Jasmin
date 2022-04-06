<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>

</head>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/images/lib4.PNG">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>주제별</h2>
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
							<li><a href="newbook.do" >올해 신간도서</a></li>
							<li><a href="bestbook.do" >베스트도서</a></li>
							<li><a href="chapter.do?bclass=100" style="color: var(--main-light-brown);">주제별</a></li>
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
				<div class="product__discount">
					<div class="section-title product__discount__title" id="chaptertitle">						
						<h2>주제별</h2> 
												
					</div>
					
					<div class="row">
                            <div class="product__discount__slider owl-carousel">
                         
                            	<c:forEach items="${chpaterBestbooks }" var="chapterbestbook" varStatus="status">
	                                <div class="col-lg-4">
	                                    <div class="product__discount__item" >
	                                    	<c:if test="${not empty chapterbestbook.ppicture }">
		                                        <div class="product__discount__item__pic set-bg" data-setbg="/filePath/${chapterbestbook.ppicture }" onclick="location.href='detailbook.do?isbn=${chapterbestbook.isbn }'">
		                                            <div class="product__discount__percent">${status.count }위</div>
		                                            <ul class="product__item__pic__hover">
		                                                <li><a href="#"><i class="fa fa-heart"></i></a></li>                                                
		                                            </ul>
		                                        </div>
	                                        </c:if>
	                                        <div class="product__discount__item__text">
	                                            <span>${chapterbestbook.writer }</span>
	                                            <h5><strong>${chapterbestbook.title }</strong></h5>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:forEach>
                                            
                            </div>
                        </div>
				</div>
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5"></div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>
									<span>${fn:length(chapterbooks) }</span> Books found
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
				<c:forEach items="${chapterbooks }" var="chapterbook">
					<div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__item" >
	                        <c:if test="${not empty chapterbook.ppicture }">
	                        	<div class="product__item__pic set-bg" data-setbg="/filePath/${chapterbook.ppicture }" onclick="location.href='detailbook.do?isbn=${chapterbook.isbn }'">
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                </ul>
                            </div>
	                        </c:if>
	                        <c:if test="${empty chapterbook.ppicture }">
	                            <div class="product__item__pic set-bg" data-setbg="/filePath/1234.PNG" onclick="location.href='detailbook.do?isbn=${chapterbook.isbn }'">
	                                <ul class="product__item__pic__hover">
	                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                </ul>
	                            </div>
                            </c:if>
                            <div class="product__discount__item__text">
                                <span>${chapterbook.writer }</span>
                                <h5><strong>${chapterbook.title }</strong></h5>
                            </div>
                        </div>
                    </div>
				</c:forEach>
                </div>

				<div class="product__pagination">
					<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i class="fa fa-long-arrow-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	 var title;
	if(window.location.search.split("=")[1] == 100){
		title = "철학";
	}else if(window.location.search.split("=")[1] == 200){
		title = "종교";
	}else if(window.location.search.split("=")[1] == 300){
		title = "사회과학";
	}else if(window.location.search.split("=")[1] == 400){
		title = "자연과학";
	}else if(window.location.search.split("=")[1] == 500){
		title = "기술과학";
	}else if(window.location.search.split("=")[1] == 600){
		title = "예술";
	}else if(window.location.search.split("=")[1] == 700){
		title = "언어";
	}else if(window.location.search.split("=")[1] == 800){
		title = "문학";
	}else if(window.location.search.split("=")[1] == 900){
		title = "역사";
	}
	console.log(title);
	var h2 = $("<h2>");
	h2.html(" - "+title);
	$("#chaptertitle").append(h2);
</script>
