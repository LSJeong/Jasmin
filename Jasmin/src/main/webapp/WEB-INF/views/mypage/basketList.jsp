<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
img {
	width: 80px;
	height: 100px;
}
.del_btn{
	float:right;
}
.list_total{
	margin-bottom:25px;
	opacity:0.8;
}
</style>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/images/mylibrary3.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>관심도서</h2>
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
							<li><a href="loanStatusList.do">도서이용정보</a></li>
							<li><a href="basketList.do" style="color: var(--main-light-brown)">관심자료목록</a></li>
							<li><a href="hopeBookList.do">나의신청정보</a></li>
							<li><a href="bbsPostList.do">나의 게시글</a></li>

						</ul>
					</div>
						<div class="sidebar">
						<div class="latest-product__text">
						
							<h4>${name }님의<br>맞춤도서</h4>
							<div class="latest-product__slider owl-carousel">
								<div class="latest-prdouct__slider__item">
							<c:forEach items="${rLikeBookList }" var="recommend" begin="0" end="2" step="1">
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
								<c:forEach items="${rLikeBookList }" var="recommend" begin="3" end="5" step="1">
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
						<h2>관심도서목록</h2>
					</div>

					<div class="container">
						<div class="row">
						<div class="list_total">관심도서 <strong>${fn:length(books) }</strong>건</div>
							<div class="col-lg-12">
								<div class="shoping__cart__table">
									<table class=table>
										<thead>
											<tr>
												<th width="70px"><input type="checkbox" name="isbn" id="selectAll"></th>
												<th width="80px"></th>
												<th  width="280px">도서제목</th>
												<th width="150px">저자</th>
												<th>출판사</th>
												<th>대출현황</th>

											</tr>
										</thead>
										<tbody>
										<c:if test="${not empty books }">
											<c:forEach items="${books }" var="book" >


												<tr onmouseover="this.style.background='#eae0d7'" onmouseout="this.style.background='white'">
													<td><input type="checkbox" name="isbn" value="${book.isbn}" ></td>
													<td><img src="/filePath/${book.ppicture }"
														onclick="location.href='detailbook.do?isbn=${book.isbn }'">
													</td>
													<td>${book.title }</td>
													<td>

														${book.writer }
													</td>
													<td>

														${book.publisher }
													</td>

													<td>

														${book.brow }/${book.total }
													</td>
													<!-- <td><input type="hidden" id="isbn" name="isbn"></td> -->

												</tr>
											</c:forEach>
											</c:if>
											<c:if test="${empty books }">
												<tr>
													<td colspan="6">${message }</td>
												</tr>
											</c:if>
										</tbody>
									</table>
									
									<div class="del_btn">
										<button id="checkedItem" class="site-btn site-btn3" onclick="delCheckedItem()">삭제</button>
										
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
</section>
<script src="./resources/js/jquery-3.3.1.min.js"></script>
<script>
	
		var $selectAll = $("#selectAll");
		var $table = $(".table");
		var $tdCheckbox = $table.find("tbody input:checkbox")
		var tdCheckboxChecked = 0;

		//isbn
		// const isbn = document.querySelector("input[name='isbn']").value;

	//전체선택
	$(document).ready(function(){


		$selectAll.on("click",function(){
			$tdCheckbox.prop('checked',this.checked);
		})

		$tdCheckbox.on('change',function(e){
			tdCheckboxChecked = $table.find('tbody input:checkbox:checked').length;
			$selectAll.prop('checked', (tdCheckboxChecked === $tdCheckbox.length));
		})
	})
	//체크박스 값 가져오기
	function getCheckboxValue(){
		const query = 'input[name="isbn"]:checked';
		const selectEls = document.querySelectorAll(query);

		let result='';
		selectEls.forEach((el)=>{
			result+=el.value;
		})
		delCheckedItem(result);
	}

	//선택삭제
	function delCheckedItem(){
		var str = confirm("해당 도서를 관심목록에서 삭제하시겠습니까?")
		if(str){
			const query = 'td>input[name="isbn"]:checked';
			console.log(query)
			const selectEls = document.querySelectorAll(query);

			let result= new Array();
			selectEls.forEach((el)=>{
				result.push(el.value);
			})
			console.log(result);
			$.ajax({
				url:"delLikeBook.do",
				type:"post",
				data:{"isbn":result},
				success:function(data){
					if(data=="T"){
						document.querySelectorAll("td>input[name=isbn]:checked").forEach(function(item){
							
							item.parentElement.parentElement.remove();
						})
						alert("해당 도서를 관심목록에서 삭제했습니다.")

		}

				}
			})
		}
	}

	//전체 삭제
	function delAll(){
		
			
			var str = confirm("전체 삭제 하시겠습니까?")
			if(str){
				$(".table tr:not(:first)").remove();
			}
		
	}



	
	

</script>