<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
img {
	width: 80px;
	height: 70px;
}

.menu{
	
	margin:40px 0px;
	margin-left:230px;
}
.menu>a{
	padding:0px 20px;
	color:var(--main-dark-chocolate);
	font-weight:600;
}
.menu>a:first-child,.menu>a:nth-child(2){
	border-right:1px solid var(--main-light-brown);
}


.menu>a:nth-child(2){
	font-size:18px;
	color:var(--main-brown);
}
table{
	margin-top:20px;
}


</style>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/images/mylibrary1.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>대출이력</h2>
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
						<h4>내 서재</h4>
						<ul>
							<li><a href="myInfo.do">기본정보</a></li>
							<li><a href="loanStatusList.do" style="color: var(--main-light-brown)">도서이용정보</a></li>
							<li><a href="basketList.do">관심자료목록</a></li>
							<li><a href="hopeBookList.do">나의신청정보</a></li>
							<li><a href="bbsPostList.do">나의 게시글</a></li>

						</ul>
					</div>
					<div class="sidebar">
						<div class="latest-product__text">
							<h4>${name }님의<br>맞춤도서</h4>
							<div class="latest-product__slider owl-carousel">
								<div class="latest-prdouct__slider__item">
							<c:forEach items="${recomendList }" var="recommend" begin="0" end="2" step="1">
									<a href="detailbook.do?isbn=${recommend.isbn }" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="/filePath/${recommend.ppicture }">
										</div>
										<div class="latest-product__item__text">
											<h6>${recommend.writer }</h6>
											<span>${recommend.title }</span>
										</div>
									</a> 
									
							</c:forEach>
									</div>
									<div class="latest-prdouct__slider__item">
								<c:forEach items="${recomendList }" var="recommend" begin="3" end="5" step="1">
									<a href="detailbook.do?isbn=${recommend.isbn }" class="latest-product__item">
										<div class="latest-product__item__pic">
											<img src="/filePath/${recommend.ppicture }">
										</div>
										<div class="latest-product__item__text">
											<h6>${recommend.writer }</h6>
											<span>${recommend.title }</span>
										</div>
									</a>
									</c:forEach>
								
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>대출현황</h2>
					</div>
					<div class="row">
					
					<div class="col-lg-7 menu">
						<a href="loanStatusList.do">이북도서</a>
						<a href='loanDeliveryStatusList.do'>배송도서</a>
						<a href='loanHistory.do'>대출이력</a>
					</div>
					
					</div>

					<div class="container">
						<div class="row">
							<div>대출 현황 ${fn:length(books) }건</div>
							<div class="col-lg-12">
								<div class="shoping__cart__table">
									<table>
										<thead>
											<tr>
												<th width=80px></th>
												<th width=200px>제목</th>
												<th width=150px>저자</th>
												<th width=150px>대출일자</th>
												<th width=150px>반납예정일</th>
												<th width=100px>연장</th>
												<th width=200px >처리상태</th>
												<th width=100px ></th>
												
												
												
				
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty books }">
												<c:forEach items="${books }" var="book" varStatus="status">
													<c:if test="${empty book.rdate && book.deliveryn eq 'Y'}">


														<tr onmouseover="this.style.background='#eae0d7'" onmouseout="this.style.background='white'">
															<td><img src="/filePath/${book.ppicture }"
																onclick="location.href='detailbook.do?isbn=${book.isbn }'">

															</td>
															<td onclick="location.href='detailbook.do?isbn=${book.isbn }'">${book.title }</td>
															<td onclick="location.href='detailbook.do?isbn=${book.isbn }'">${book.writer }</td>

															<td><c:set var="bstart"
																	value="${ fn:substring(book.bstart,0,10)}" />
																<h5 id="bStart">${bstart }</h5></td>
															<td><c:set var="bend"
																	value="${ fn:substring(book.bend,0,10)}" />
																<h5 id="bEnd">${bend }</h5></td>
															<c:if test="${book.deliverstate eq '배송완료'}">
																<td>${book.renewcnt }/1</td>
															</c:if>
																	<c:if test="${book.deliverstate ne '배송완료'}">
																<td></td>
															</c:if>
															<c:if test="${book.deliverstate eq '배송완료' }">
																<td><button id="returnBtn${status.count }"
																		class="site-btn site-btn3" onclick="returnAjaxFnc(${book.isbn})">수거</button></td>
																<td><button id="extensionBtn${status.count }"
																		class="site-btn site-btn3" onclick="extensionAjaxFnc(${book.isbn},${book.renewcnt })">연장</button></td>
															</c:if>
															<c:if test="${book.deliverstate ne '배송완료' }">
																<td>${book.deliverstate }</td>
															</c:if>

														</tr>
													</c:if>
												</c:forEach>
											</c:if>

											<c:if test="${empty books }">
												<tr>
													<td colspan="6"> <h5>${message }</h5></td>
												</tr>
											</c:if>

										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</section>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>
    //반납 ajax
    
    function returnAjaxFnc(isbn){
        var str = confirm("반납하시겠습니까?");
        if(str){
           
		$.ajax({
			url: "returnBook.do",
			dataType: "text",
			type : "post",
			data: {bisbn: isbn},
			success: function (data) {
				if(data == 'T'){
					alert('반납되었습니다!');
					location.reload();
				}else{
					alert('실패했습니다. 관리자에게 문의하세요.');
				}
			}
		});
        }
    }


  


   
    function extensionAjaxFnc(isbn,renewcnt){
  
       console.log(isbn,renewcnt)
         var str = confirm("연장하시겠습니까?");
        if(str){
            $.ajax({
                url:"extensionAjax.do",
                type:"POST",
                data:{id:'${id}',isbn:isbn,renewcnt:renewcnt},
                success:function(data){
                	console.log(data);
                	
                    if(data=="T"){
                        alert("일주일 연장되었습니다.");
                        location.href="loanStatusList.do";
                    }else if(data=="F"){
                    	alert("연장횟수 초과했습니다.")
                    }
                },error:function(error){
                	console.log(error)
                }
            })
        } 
    }
    
</script>