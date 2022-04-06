<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		 $(document).ready(function(){
			setDate();
		})
		
		function setDate() {
			var date = new Date();
			var currentYear = date.getFullYear();
			
			$("#bestfilter").append("<select id='husa_year1' class='nice-select' onchange='yearbest()'>");
			for(var y=(currentYear); y>=(currentYear-10);y--){
				if(${selectyear} == y){
					$("#husa_year1").append('<option value="'+y+'">'+y+''+'</option>');
					$('select[id=husa_year1]').val(${selectyear}); 					
				}
				else
					$("#husa_year1").append('<option value="'+y+'">'+y+''+'</option>')
			}
			$('#husa_year1').append('</select>');
		}  
		
		function yearbest() {
			var bstart = $("#husa_year1").val();
			location.href = "bestbook.do?bstart="+ bstart;
			
		}
	</script>
	<style type="text/css">
		#husa_year1{
			float: right;
		}
	</style>
</head>

<section class="breadcrumb-section set-bg"
	data-setbg="resources/images/lib3.PNG">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>베스트도서</h2>
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
							<li><a href="bestbook.do" style="color: var(--main-light-brown);" >베스트도서</a></li>
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
						<h2>베스트도서</h2>
					</div>
				</div>
				<div class="filter__item" style="padding-top: 0; border-top: 0;">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>
									<span>${fn:length(bestbooks) }</span> Books found
								</h6>
							</div>
						</div>
						<div class="col-lg-4 col-md-3">
							<div class="filter__option" id="bestfilter">
								<%-- <select id='husa_year1' onchange='yearbest()'>
									<option value="2021" <c:if test="${selectyear eq 2021}">selected</c:if>>2021</option>
									<option value="2020" <c:if test="${selectyear eq 2020}">selected</c:if>>2020</option>
									<option value="2019" <c:if test="${selectyear eq 2019}">selected</c:if>>2019</option>
									<option value="2018" <c:if test="${selectyear eq 2018}">selected</c:if>>2018</option>
									<option value="2017" <c:if test="${selectyear eq 2017}">selected</c:if>>2017</option>									
								</select>  --%>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
				<c:forEach items="${bestbooks }" var="best" varStatus="status" >
					<div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="product__discount__item" >
                            <div class="product__discount__item__pic set-bg" data-setbg="/filePath/${best.ppicture }" onclick="location.href='detailbook.do?isbn=${best.isbn }'" >
                                <div class="product__discount__percent">${status.count }위</div>
                                <ul class="product__item__pic__hover">
                                    <li><a href="#"><i class="fa fa-heart"></i></a></li>                                                
                                </ul>                                        
                            </div>
                        
                            <div class="product__discount__item__text">
                                <span>${best.writer }</span>
                                <h5><strong>${best.title }</strong></h5>
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
