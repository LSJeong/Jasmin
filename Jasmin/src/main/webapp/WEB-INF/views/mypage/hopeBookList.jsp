<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
.list_total{
	margin-bottom:25px;
	opacity:0.8;
}
.del_btn{
	float:right;
}

</style>

<section class="breadcrumb-section set-bg"
	data-setbg="resources/myinfoImg/basket2.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>희망도서신청현황</h2>
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
                            <li><a href="hopeBookList.do" style="color: var(--main-light-brown)">희망도서신청정보</a></li>
                            <li><a href="bbsPostList.do">나의 게시글</a></li>
                            
                        </ul>
					</div>
					
					
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="product__discount">
					<div class="section-title product__discount__title">
						<h2>희망도서신청현황</h2>
					</div>

				<div class="container">
            <div class="row">
            <div class="list_total">희망도서신청현황 <strong>${fn:length(hbookList) }</strong>건</div>
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th><input type="checkbox"
												id="acc" name="no" /> <span class="checkmark"></span></th>
                                    <th>번호</th>
                                    <th>글제목</th>
                                    <th>제목</th>
                                    <th>작성일자</th>
                                    <th>조회수</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty hbookList }">
                          <c:forEach items="${hbookList }" var="hbook" >
                           
                            
                                <tr>
                                 <td >
                                        
                                        <input type="checkbox" name="no" value="${hbook.no}"> 
                                    </td>
                                    <td >
                                        
                                        <h5>${hbook.no } </h5>
                                    </td>
                                    <td >
                                        
                                        <h5 onclick="location.href='hBookRead.do?no=${hbook.no }'">${hbook.htitle }</h5>
                                    </td>
                                    <td >
                                        
                                        <h5>${hbook.hcontent }</h5>
                                    </td>
                                     <td >
                                        <c:set var="hwdate"
																	value="${ fn:substring(hbook.hwdate,0,10)}" />
                                        <h5>${hwdate }</h5>
                                    </td>
                                     <td >
                                        
                                        <h5>${hbook.cnt }</h5>
                                    </td>
                                    
                                </tr>
                                
                                </c:forEach>
                                </c:if>
                                 <c:if test="${empty hbookList }">
                                 <tr><td colspan="6">${message }</td></tr>
                                 </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
            <div class="col-lg=2">
            	<div class="shoping__cart__btns del_btn">
                        <button id="checkedItem" class="site-btn site-btn2"  onclick="location.href='hBookForm.do'">등록</button>
                       
                    </div>
            </div>
            <div class="col-lg-6"></div>
                <div class="col-lg-4">
                    <div class="shoping__cart__btns del_btn">
                        <button id="checkedItem" class="site-btn site-btn3"  onclick="delCheckedItem()">삭제</button>
                       
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
			url:"delHopeBook.do",
			type:"post",
			data:{"no":result},
			success:function(data){
				if(data=="T"){
					document.querySelectorAll("input[name=no]:checked").forEach(function(item){
						
						item.parentElement.parentElement.remove();
					})
					alert("해당 게시물을 삭제했습니다.")

	}

			}
		})
	}
}

</script>