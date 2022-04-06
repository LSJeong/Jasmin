<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
.del_btn{
	float:right;
}
.list_total{
	margin-bottom:25px;
	opacity:0.8;
}
td{
	cursor:fointer;
}
</style>
<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/bbspost1.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>묻고답하기</h2>
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
							<li><a href="basketList.do">관심자료목록</a></li>
							<li><a href="hopeBookList.do">희망도서신청정보</a></li>
							<li><a href="bbsPostList.do" style="color: var(--main-light-brown)">나의 게시글</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>묻고답하기</h2>
					</div>

					<div class="container">
						<div class="row">
							<div class="list_total">나의 묻고 답하기 <strong> ${fn:length(qnaList) }</strong>건</div>
							<div class="col-lg-12">
								<div class="shoping__cart__table">
									<table>
										<thead>
											<tr>
												<th><input input type="checkbox" name="no" id="selectAll"></th>
												<th>글제목</th>
												<th>제목</th>
												<th>작성일자</th>
												<th>처리상태</th>

											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty qnaList }">
												<c:forEach items="${qnaList }" var="qna">


													<tr onmouseover="this.style.background='#eae0d7'" onmouseout="this.style.background='white'">
														<td>

															<h5>
																<input type="checkbox" name="no" value="${qna.no}">
															</h5>
														</td>
														<td onclick="location.href='qnaRead.do?no=${qna.no }'">

															<h5>${qna.no }</h5>
														</td>
														<td onclick="location.href='qnaRead.do?no=${qna.no }'">

															<h5>${qna.title }</h5>
														</td>

														<td onclick="location.href='qnaRead.do?no=${qna.no }'"><c:set var="qnadate"
																value="${ fn:substring(qna.wdate,0,10)}" />
															<h5>${qnadate }</h5></td>
															<c:if test="${qna.replyyn eq '답변완료'}">
														<td onclick="location.href='qnaRead.do?no=${qna.no }'">
															<h5>답변완료</h5>
														</td>
														</c:if>
														<c:if test="${qna.replyyn ne '답변완료' }">
														<td onclick="location.href='qnaRead.do?no=${qna.no }'">
															<h5>답변대기</h5>
														</td>
														</c:if>

													</tr>

												</c:forEach>
											</c:if>
											<c:if test="${empty qnaList }">
												<tr>
													<td colspan="6">해당 게시물이 없습니다</td>
												</tr>
											</c:if>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
						
						<div class="col-lg-2">
								<div class="shoping__cart__btns del_btn">
									<button  class="site-btn site-btn2" onclick="location.href='qnaForm.do'">등록</button>

								</div>
							</div>
							<div class="col-lg-5"></div>
						
							<div class="col-lg-4">
								<div class="shoping__cart__btns del_btn">
									<button  class="site-btn site-btn3" onclick="delCheckedItem()">삭제</button>

								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
</section>

<script>
function getCheckboxValue(){
	const query = 'input[name="no"]:checked';
	const selectEls = document.querySelectorAll(query);

	let result='';
	selectEls.forEach((el)=>{
		result+=el.value;
	})
	delCheckedItem(result);
}

//선택삭제
function delCheckedItem(){
	var str = confirm("해당 게시물을 삭제하시겠습니까?")
	if(str){
		const query = 'input[name="no"]:checked';
		const selectEls = document.querySelectorAll(query);

		let result= new Array();
		selectEls.forEach((el)=>{
			result.push(el.value);
		})
		console.log(result);
		$.ajax({
			url:"delBbsPost.do",
			type:"post",
			data:{"no":result},
			success:function(data){
				if(data=="T"){
					document.querySelectorAll("td>input[name=no]:checked").forEach(function(item){
						
						item.parentElement.parentElement.remove();
					})
					alert("해당 게시물을 삭제했습니다.")

	}

			}
		})
	}
}
</script>